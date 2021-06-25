package com.company.bbs.service.email;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.controller.email.EmailController;
import com.company.bbs.dao.email.EmailDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.MailSendUtils;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.email.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {

	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Inject
	EmailDao dao;
	Criteria criteria;
	
	@Autowired
	JavaMailSenderImpl mailSender;

	// 암호화 설정
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 글목록
	@Override
	public List<EmailVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 글저장
	@Transactional
	@Override
	public void insert(EmailVO emailVO) throws Exception {

		// for(int i=1; i <=200; i++) {
		int email_idx = emailVO.getEmail_idx();
		String pass = emailVO.getPass();
		String del = emailVO.getDel();

		// 비밀번호 암호화
		String pwdBycrypt = passwordEncoder.encode(pass);

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);

		// 치환함수 적용
		// content = content.replace(" ", "&nbsp;");
		// content = content.replace("<", "&lt;");
		// content = content.replace(">", "&gt;");
		// content = content.replace("\n", "<br>");

		// 긴글입력
		// StringReader scontent = new StringReader(content);

		int number = getCount(criteria);

		if (number != 0) {
			number = getMaxNum() + 1;
		} else {
			number = 1;
		}

		del = "N";

		emailVO.setEmail_idx(number);
		emailVO.setPass(pwdBycrypt);
		emailVO.setCipp(cipp);
		emailVO.setRegdate(regdate);
		emailVO.setDel(del);

		dao.insert(emailVO);
		// }

		fileinsert(emailVO);
		
		sendMail(emailVO);
	}

	// 첨부파일 처리
	@Transactional
	@Override
	public void fileinsert(EmailVO emailVO) throws Exception {
		AttachVO attachVO = new AttachVO();
		MultipartFile[] attach = emailVO.getAttach(); // 첨부파일 배열

		if (attach == null)
			return; // 첨부파일이 없으면 종료

		// 첨부파일 db저장처리
		for (MultipartFile file : attach) {

			if (file != null && file.getOriginalFilename() != null && file.getSize() != 0) {

				logger.info("------------- file start -------------");
				logger.info("fileName : " + file.getOriginalFilename());
				logger.info("fileSize : " + file.getSize());
				logger.info("contentType : " + file.getContentType());
				logger.info("server FileName : " + file.getName());
				logger.info("-------------- file end --------------\n");

				// UploadFileUtils 사용하여 저장
				String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				attachVO.setFile_name(file.getOriginalFilename());
				attachVO.setFile_hash_name(savedName);
				attachVO.setFile_size(file.getSize());
				attachVO.setFile_type(file.getContentType());

				// 파일확장자
				String fileName = file.getOriginalFilename();
				int index = fileName.lastIndexOf(".");
				String fileExt = fileName.substring(index + 1);

				attachVO.setFile_ext(fileExt);
				attachVO.setRegdate(emailVO.getRegdate());
				attachVO.setDel(emailVO.getDel());
				attachVO.setEmail_idx(emailVO.getEmail_idx());
			}

			dao.insert(attachVO);
		}

		// 첨부파일 등록 후 board테이블 filecnt(파일갯수) 업데이트
		dao.getAttachCount(attachVO.getEmail_idx());
	}

	// 메일발송 유틸사용
	@Transactional
	@Override
	public String sendMail(EmailVO emailVO) throws Exception {
		MailSendUtils mailSendUtils = new MailSendUtils(mailSender);
		return mailSendUtils.sendMailing(emailVO);
	}

	// 글보기
	@Override
	public EmailVO getView(int email_idx) throws Exception {
		return dao.getView(email_idx);
	}

	// 글수정
	@Override
	public void update(EmailVO emailVO) throws Exception {

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		emailVO.setCipp(cipp);

		dao.update(emailVO);
	}

	// 글삭제
	@Transactional // 추가
	@Override
	public void delete(int email_idx) throws Exception {
		dao.delete(email_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int email_idx) throws Exception {
		dao.increaseCnt(email_idx);
	}

	// 글이전값
	@Override
	public EmailVO getPrevNum(int email_idx) throws Exception {
		return dao.getPrevNum(email_idx);
	}

	// 글다음값
	@Override
	public EmailVO getNextNum(int email_idx) throws Exception {
		return dao.getNextNum(email_idx);
	}

	// 글최고값
	@Override
	public int getMaxNum() throws Exception {
		return dao.getMaxNum();
	}

	// 글갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return dao.getCount(criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int email_idx) throws Exception {
		return dao.getPassword(email_idx);
	}

	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return dao.getCategory();
	}

	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return dao.getCategoryList(idx);
	}

	// 첨부파일목록
	@Override
	public List<Object> getFileList(int email_idx) throws Exception {
		return dao.getFileList(email_idx);
	}

	// 첨부파일삭제
	@Transactional
	@Override
	public void attachDelete(int file_idx) throws Exception {
		dao.attachDelete(file_idx);
	}

	// 코멘트갯수
	@Override
	public void getCommentCount(int email_idx) throws Exception {
		dao.getCommentCount(email_idx);
	}

	// 메일발송
	/*
	@Override
	public String sendMail(EmailVO emailVO) throws Exception {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				helper.setFrom(emailVO.getSendemail());
				helper.setTo(emailVO.getToemail());
				helper.setSubject(emailVO.getTitle());
				helper.setText(emailVO.getContent(), true);
			}
		};

		mailSender.send(preparator);

		return "result";
	}
	*/

}

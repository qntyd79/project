package com.company.bbs.service.email;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.company.bbs.dao.email.EmailDao;
import com.company.bbs.dto.email.EmailDto;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.MailSendUtils;

@Service
public class EmailServiceImpl implements EmailService {

	@Inject
	EmailDao dao;
	Criteria criteria;

	@Inject
	private JavaMailSenderImpl mailSender;
	
	// 메일발송 유틸사용
	@Override
	public String sendMailTest(EmailDto dto) throws Exception {		
		MailSendUtils mailSendUtils = new MailSendUtils(mailSender);		
		return mailSendUtils.sendMessage(dto);
	}
	
	// 글목록
	@Override
	public List<EmailDto> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 공지글목록
	@Override
	public List<EmailDto> getNoticeList(Criteria criteria) throws Exception {
		return dao.getNoticeList(criteria);
	}

	// 글저장
	@SuppressWarnings("unused")
	@Override
	public void insert(EmailDto dto) throws Exception {

		int email_idx = dto.getEmail_idx();
		String title = dto.getTitle();
		String content = dto.getContent();
		String del = dto.getDel();

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);

		int number = getCount(criteria);

		if (number != 0) {
			number = getMaxNum() + 1;
		} else {
			number = 1;
		}

		del = "N";
		dto.setEmail_idx(number);
		dto.setCipp(cipp);
		dto.setRegdate(regdate);
		dto.setDel(del);
		dto.setContent(content);

		dao.insert(dto);
	}

	// 답글업데이트
	@Override
	public void getReply(EmailDto dto) throws Exception {
		dao.getReply(dto);
	}

	// 글보기
	@Override
	public EmailDto getView(int email_idx) throws Exception {
		return dao.getView(email_idx);
	}

	// 글수정
	@Override
	public void update(EmailDto dto) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		dto.setCipp(cipp);
		dao.update(dto);
	}

	// 글삭제
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
	public EmailDto getPrevNum(int email_idx) throws Exception {
		return dao.getPrevNum(email_idx);
	}

	// 글다음값
	@Override
	public EmailDto getNextNum(int email_idx) throws Exception {
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

	// 공지글갯수
	@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return dao.getNoticeCount(criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int email_idx) throws Exception {
		return dao.getPassword(email_idx);
	}	
	
	// 메일발송
	@Override
	public String sendMail(EmailDto dto) throws Exception {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				helper.setFrom(dto.getSendemail());
				helper.setTo(dto.getToemail());
				helper.setSubject(dto.getTitle());
				helper.setText(dto.getContent(), true);
			}
		};

		mailSender.send(preparator);

		return "result";
	}
	
}

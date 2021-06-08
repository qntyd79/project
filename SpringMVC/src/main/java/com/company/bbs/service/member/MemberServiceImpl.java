package com.company.bbs.service.member;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.controller.board.BoardController;
import com.company.bbs.dao.member.MemberDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	MemberDao dao;
	Criteria criteria;

	// 암호화 설정
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 글목록
	@Override
	public List<MemberVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 글저장
	@Transactional
	@Override
	public void insert(MemberVO memberVO) throws Exception {

		// for(int i=1; i <=200; i++) {
		@SuppressWarnings("unused")
		int member_idx = memberVO.getMember_idx();
		String userid = memberVO.getUserid();
		String pass = memberVO.getPass();
		String pass_ask = memberVO.getPass_ask();
		String pass_account = memberVO.getPass_account();
		String name = memberVO.getName();
		String nickname = memberVO.getNickname();
		String email = memberVO.getEmail();
		String email2 = memberVO.getEmail2();
		String homepage = memberVO.getHomepage();
		String zipcode = memberVO.getZipcode();
		String address = memberVO.getAddress();
		String detailaddress = memberVO.getDetailaddress();
		String extraaddress = memberVO.getExtraaddress();
		String phone = memberVO.getPhone();
		String hphone = memberVO.getHphone();
		String job = memberVO.getJob();
		String message = memberVO.getMessage();
		String etc = memberVO.getEtc();
		int mail_check = memberVO.getMail_check();
		int category_idx = memberVO.getCategory_idx();
		int level = 10;
		int point = 100;
		int approval = 0;
		int login_cnt = 0;
		int user_leave = 1;
		String del = memberVO.getDel();
		del = "N";

		// 비밀번호 암호화
		String pwdBycrypt = passwordEncoder.encode(pass);

		// 로그인아이피
		String login_ip = InetAddress.getLocalHost().getHostAddress();

		String login_last = InetAddress.getLocalHost().getHostAddress();

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);
		String join_date = formatter.format(currentTime);

		int number = getCount(criteria);

		if (number != 0) {
			number = getMaxNum() + 1;
		} else {
			number = 1;
		}

		memberVO.setUserid(userid);
		memberVO.setPass(pass);
		memberVO.setPass_ask(pass_ask);
		memberVO.setPass_account(pass_account);
		memberVO.setName(name);
		memberVO.setNickname(nickname);
		memberVO.setEmail(email);
		memberVO.setHomepage(homepage);
		memberVO.setZipcode(zipcode);
		memberVO.setDetailaddress(detailaddress);
		memberVO.setExtraaddress(extraaddress);
		memberVO.setPhone(phone);
		memberVO.setHphone(hphone);
		memberVO.setJob(job);
		memberVO.setMessage(message);
		memberVO.setEtc(etc);
		memberVO.setMail_check(mail_check);
		memberVO.setLevel(level);
		memberVO.setPoint(point);
		memberVO.setApproval(approval);
		memberVO.setJoin_date(join_date);
		memberVO.setLogin_last(login_last);
		memberVO.setLogin_cnt(login_cnt);
		memberVO.setLogin_ip(login_ip);
		memberVO.setUser_leave(user_leave);
		memberVO.setCipp(cipp);
		memberVO.setRegdate(regdate);
		memberVO.setCategory_idx(category_idx);
		memberVO.setDel(del);

		// memberVO.setTitle(i + "번쨰 제목입니다.");

		dao.insert(memberVO);
		// }

		// 첨부파일 처리
		AttachVO attachVO = new AttachVO();
		MultipartFile[] attach = memberVO.getAttach(); // 첨부파일 배열

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
				attachVO.setRegdate(memberVO.getRegdate());
				attachVO.setDel(memberVO.getDel());
				attachVO.setMember_idx(memberVO.getMember_idx());
			}

			dao.insert(attachVO);
		}

		// 첨부파일 등록 후 board테이블 filecnt(파일갯수) 업데이트
		// dao.getAttachCount(attachVO.getMember_idx());
	}

	/*
	 * // 답글업데이트
	 * 
	 * @Override public void getReply(MembermemberVO memberVO) throws Exception {
	 * dao.getReply(memberVO); }
	 */

	// 글보기
	@Override
	public MemberVO getView(int member_idx) throws Exception {

		return dao.getView(member_idx);
	}

	// 글수정
	@Override
	public void update(MemberVO memberVO) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		memberVO.setCipp(cipp);

		dao.update(memberVO);
	}

	// 글삭제
	@Override
	public void delete(int member_idx) throws Exception {
		dao.delete(member_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int member_idx) throws Exception {
		dao.increaseCnt(member_idx);
	}

	// 글이전값
	@Override
	public MemberVO getPrevNum(int member_idx) throws Exception {
		return dao.getPrevNum(member_idx);
	}

	// 글다음값
	@Override
	public MemberVO getNextNum(int member_idx) throws Exception {
		return dao.getNextNum(member_idx);
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

	/*
	 * // 공지글갯수
	 * 
	 * @Override public int getNoticeCount(Criteria criteria) throws Exception {
	 * return dao.getNoticeCount(criteria); }
	 */

	// 글비밀번호리턴
	@Override
	public String getPassword(int member_idx) throws Exception {
		return dao.getPassword(member_idx);
	}

	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return dao.getCategoryList(idx);
	}

	@Override
	public List<Object> getCategory() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> getFileList(int member_idx) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void attachDelete(int file_idx) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getCommentCount(int member_idx) throws Exception {
		// TODO Auto-generated method stub
		
	}

}

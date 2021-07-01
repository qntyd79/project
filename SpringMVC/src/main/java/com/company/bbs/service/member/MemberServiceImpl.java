package com.company.bbs.service.member;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
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
import com.company.bbs.vo.board.BoardVO;
import com.company.bbs.vo.member.MemberVO;
import com.company.bbs.vo.email.EmailVO;

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

	// 회원목록
	@Override
	public List<MemberVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 회원저장
	@Transactional
	@Override
	public void insert(MemberVO memberVO) throws Exception {

		// for(int i=1; i <=200; i++) {
		int member_idx = memberVO.getMember_idx();
		String pass = memberVO.getPass();
		int level = 10;
		int point = 100;
		int approval = 0;
		int login_cnt = 0;
		int user_leave = 1;

		// 비밀번호 암호화
		String pwdBycrypt = passwordEncoder.encode(pass);

		// 로그인아이피
		String login_ip = InetAddress.getLocalHost().getHostAddress();

		// 마지막로그인아이피
		String login_last = InetAddress.getLocalHost().getHostAddress();

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);
		String join_date = formatter.format(currentTime);

		String del = memberVO.getDel();
		del = "N";

		int number = getCount(criteria);

		if (number != 0) {
			number = getMaxNum() + 1;
		} else {
			number = 1;
		}

		memberVO.setMember_idx(number);
		memberVO.setPass(pwdBycrypt);
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
		memberVO.setDel(del);

		// memberVO.setTitle(i + "번쨰 제목입니다.");

		dao.insert(memberVO);
		// }
		fileinsert(memberVO);
	}

	// 첨부파일 처리
	@Transactional
	@Override
	public void fileinsert(MemberVO memberVO) throws Exception {
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

	// 회원보기
	@Override
	public MemberVO getView(int member_idx) throws Exception {
		return dao.getView(member_idx);
	}

	// 회원수정
	@Override
	public void update(MemberVO memberVO) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		memberVO.setCipp(cipp);

		dao.update(memberVO);
	}

	// 회원삭제
	@Override
	public void delete(int member_idx) throws Exception {
		dao.delete(member_idx);
	}

	// 회원조회수
	@Override
	public void increaseCnt(int member_idx) throws Exception {
		dao.increaseCnt(member_idx);
	}

	// 회원이전값
	@Override
	public MemberVO getPrevNum(int member_idx) throws Exception {
		return dao.getPrevNum(member_idx);
	}

	// 회원다음값
	@Override
	public MemberVO getNextNum(int member_idx) throws Exception {
		return dao.getNextNum(member_idx);
	}

	// 회원최고값
	@Override
	public int getMaxNum() throws Exception {
		return dao.getMaxNum();
	}

	// 회원갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return dao.getCount(criteria);
	}

	// 회원비밀번호리턴
	@Override
	public String getPassword(int member_idx) throws Exception {
		return dao.getPassword(member_idx);
	}

	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return dao.getCategory();
	}

	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int kind) throws Exception {
		return dao.getCategoryList(kind);
	}

	// 첨부파일목록
	@Override
	public List<Object> getFileList(int member_idx) throws Exception {
		return dao.getFileList(member_idx);
	}

	// 첨부파일삭제
	@Override
	public void attachDelete(int file_idx) throws Exception {
		dao.attachDelete(file_idx);
	}

	// 코멘트갯수
	@Override
	public void getCommentCount(int member_idx) throws Exception {

	}

	// 회원로그인
	@Override
	public boolean loginCheck(MemberVO memberVO, HttpSession session) throws Exception {
		
		boolean result = dao.loginCheck(memberVO);
		
		if (result) {
			MemberVO memberVO2 = getViewMember(memberVO);
			
			session.setAttribute("userid", memberVO2.getUserid());
			session.setAttribute("name", memberVO2.getName());
		}
		return result;
	}

	// 회원로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		// session.removeAttribute("userid"); 세션변수 개별삭제
		session.invalidate(); // 세션정보 초기화
	}
	
	// 회원보기
	@Override
	public MemberVO getViewMember(MemberVO memberVO) throws Exception {
		return dao.getViewMember(memberVO);
	}

	@Override
	public String getLoginPassword(String userid) throws Exception {
		return dao.getLoginPassword(userid);
	}
	
	// 아이디중복확인
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		int result = dao.idCheck(memberVO);
		System.out.println(result);
		return result;
	}

}

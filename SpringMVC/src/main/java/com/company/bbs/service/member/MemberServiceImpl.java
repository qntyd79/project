package com.company.bbs.service.member;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.company.bbs.dao.member.MemberDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.member.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDao dao;
	Criteria criteria;

	// 글목록
	@Override
	public List<MemberVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}
	
	/*// 공지글목록
	@Override
	public List<MemberDto> getNoticeList(Criteria criteria) throws Exception {
		return dao.getNoticeList(criteria);
	}*/

	// 글저장
	@Override
	public void insert(MemberVO dto) throws Exception {

		// for(int i=1; i <=200; i++) {
		@SuppressWarnings("unused")
		int member_idx = dto.getMember_idx();
		String userid = dto.getUserid();
		String pass = dto.getPass();
		String pass_ask = dto.getPass_ask();
		String pass_account = dto.getPass_account();
		String name = dto.getName();
		String nickname = dto.getNickname();
		String email = dto.getEmail();
		String email2 = dto.getEmail2();
		String homepage = dto.getHomepage();
		String zipcode = dto.getZipcode();
		String address = dto.getAddress();
		String detailaddress = dto.getDetailaddress();
		String extraaddress = dto.getExtraaddress();
		String phone = dto.getPhone();
		String hphone = dto.getHphone();
		String job = dto.getJob();
		String attach = dto.getAttach();
		String message = dto.getMessage();
		String etc = dto.getEtc();
		int mail_check = dto.getMail_check();
		int category_idx = dto.getCategory_idx();
		int level = 10;
		int point = 100;
		int approval = 0;		
		int login_cnt = 0;
		int user_leave = 1;	
		String del = dto.getDel();
		del = "N";
		
		// 이메일
		//String emailJoin = dto.toStringEmail(email, email2);		
		// 전화번호
		//String phoneJoin = dto.toStringPhone(phone, phone2, phone3);		
		//String hphoneJoin = dto.toStringPhone(hphone, hphone2, hphone3);		
				
		// 로그인아이피		
		String login_ip = InetAddress.getLocalHost().getHostAddress();
				
		String login_last = InetAddress.getLocalHost().getHostAddress();
		
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);
		String join_date = formatter.format(currentTime);		
		
		//int number = getCount(criteria);		

		dto.setUserid(userid);
		dto.setPass(pass);
		dto.setPass_ask(pass_ask);
		dto.setPass_account(pass_account);
		dto.setName(name);
		dto.setNickname(nickname);
		dto.setEmail(email);
		dto.setHomepage(homepage);
		dto.setZipcode(zipcode);
		dto.setDetailaddress(detailaddress);
		dto.setExtraaddress(extraaddress);
		dto.setPhone(phone);
		dto.setHphone(hphone);
		dto.setJob(job);
		dto.setAttach(attach);
		dto.setMessage(message);
		dto.setEtc(etc);
		dto.setMail_check(mail_check);
		dto.setLevel(level);
		dto.setPoint(point);
		dto.setApproval(approval);
		dto.setJoin_date(join_date);
		dto.setLogin_last(login_last);
		dto.setLogin_cnt(login_cnt);
		dto.setLogin_ip(login_ip);
		dto.setUser_leave(user_leave);	
		dto.setCipp(cipp);
		dto.setRegdate(regdate);
		dto.setCategory_idx(category_idx);
		dto.setDel(del);
		
		// dto.setTitle(i + "번쨰 제목입니다.");

		dao.insert(dto);
		// }
	}

	/*// 답글업데이트
	@Override
	public void getReply(MemberDto dto) throws Exception {
		dao.getReply(dto);
	}*/

	// 글보기
	@Override
	public MemberVO getView(int member_idx) throws Exception {				
		
		return dao.getView(member_idx);
	}

	// 글수정
	@Override
	public void update(MemberVO dto) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		
		dto.setCipp(cipp);
		
		dao.update(dto);
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

	/*// 공지글갯수
	@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return dao.getNoticeCount(criteria);
	}*/

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

}

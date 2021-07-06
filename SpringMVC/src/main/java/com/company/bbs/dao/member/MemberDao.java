package com.company.bbs.dao.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.member.MemberVO;

public interface MemberDao {

	// 회원목록
	public List<MemberVO> getList(Criteria criteria) throws Exception;

	// 회원저장
	public void insert(MemberVO dto) throws Exception;

	// 회원보기
	public MemberVO getView(int member_idx) throws Exception;

	// 회원수정
	public void update(MemberVO dto) throws Exception;

	// 회원삭제
	public void delete(int member_idx) throws Exception;

	// 회원조회수
	public void increaseCnt(int member_idx) throws Exception;

	// 회원이전값
	public MemberVO getPrevNum(int member_idx) throws Exception;

	// 회원다음값
	public MemberVO getNextNum(int member_idx) throws Exception;

	// 회원최고값
	public int getMaxNum() throws Exception;

	// 회원갯수
	public int getCount(Criteria criteria) throws Exception;

	// 회원비밀번호리턴
	public String getPassword(int member_idx) throws Exception;

	// 카테고리명
	public List<Object> getCategory() throws Exception;

	// 카테고리목록
	public List<Object> getCategoryList(int idx) throws Exception;

	// 이메일중복확인
	public MemberVO getEmailCheck(String str) throws Exception;

	// 첨부파일 저장
	public void insert(AttachVO attachVO) throws Exception;

	// 첨부파일갯수
	public void getAttachCount(int member_idx) throws Exception;

	// 첨부파일목록
	public List<Object> getFileList(int member_idx) throws Exception;

	// 첨부파일삭제
	public void attachDelete(int file_idx) throws Exception;

	// 회원로그인
	public boolean loginCheck(MemberVO memberVO) throws Exception;

	// 회원로그아읏
	public void logout(HttpSession session) throws Exception;

	// 회원로그인정보
	public MemberVO getViewMember(MemberVO memberVO)throws Exception;

	public String getLoginPassword(String userid) throws Exception;
	
	// 아이디중복체크
	public int idCheck(MemberVO memberVO) throws Exception;

	public List<MemberVO> getExcelList() throws Exception;

}
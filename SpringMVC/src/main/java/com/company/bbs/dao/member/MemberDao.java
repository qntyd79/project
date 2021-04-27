package com.company.bbs.dao.member;

import java.util.List;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.member.MemberVO;

public interface MemberDao {

	// 글목록
	public List<MemberVO> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	/*public List<MemberDto> getNoticeList(Criteria criteria) throws Exception;*/

	// 글저장 
	public void insert(MemberVO dto) throws Exception;
	
	// 답글업데이트 
	/*public void getReply(MemberDto dto) throws Exception;*/
	
	// 글보기
	public MemberVO getView(int member_idx) throws Exception;

	// 글수정
	public void update(MemberVO dto) throws Exception;

	// 글삭제
	public void delete(int member_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int member_idx) throws Exception;

	// 글이전값
	public MemberVO getPrevNum(int member_idx) throws Exception;

	// 글다음값
	public MemberVO getNextNum(int member_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	/*public int getNoticeCount(Criteria criteria) throws Exception;
*/
	// 글비밀번호리턴
	public String getPassword(int member_idx) throws Exception;
	
	// 카테고리목록
	public List<Object> getCategoryList(int idx) throws Exception;
	
	// 이메일중복확인  
	public MemberVO getEmailCheck(String str) throws Exception;
			
	
}
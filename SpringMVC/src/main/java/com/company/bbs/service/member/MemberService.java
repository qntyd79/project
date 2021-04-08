package com.company.bbs.service.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.bbs.dto.member.MemberDto;
import com.company.bbs.utill.Criteria;

@Service
public interface MemberService {

	// 글목록
	public List<MemberDto> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	/*public List<MemberDto> getNoticeList(Criteria criteria) throws Exception;*/
	
	// 글저장 
	public void insert(MemberDto dto) throws Exception;
	
	// 답글업데이트 
	/* public void getReply(MemberDto dto) throws Exception; */

	// 글보기
	public MemberDto getView(int member_idx) throws Exception;

	// 글수정
	public void update(MemberDto dto) throws Exception;

	// 글삭제
	public void delete(int member_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int member_idx) throws Exception;

	// 글이전값
	public MemberDto getPrevNum(int member_idx) throws Exception;

	// 글다음값
	public MemberDto getNextNum(int member_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	/*public int getNoticeCount(Criteria criteria) throws Exception;*/

	// 글비밀번호리턴
	public String getPassword(int member_idx) throws Exception;
	
	// 카테고리목록
	public List<Object> getCategoryList(int idx) throws Exception;

}
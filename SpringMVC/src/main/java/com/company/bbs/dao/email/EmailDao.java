package com.company.bbs.dao.email;

import java.util.List;

import com.company.bbs.dto.email.EmailDto;
import com.company.bbs.utill.Criteria;

public interface EmailDao {

	// 글목록
	public List<EmailDto> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	public List<EmailDto> getNoticeList(Criteria criteria) throws Exception;

	// 글저장 
	public void insert(EmailDto dto) throws Exception;
	
	// 답글업데이트 
	public void getReply(EmailDto dto) throws Exception;

	// 글보기
	public EmailDto getView(int email_idx) throws Exception;

	// 글수정
	public void update(EmailDto dto) throws Exception;

	// 글삭제
	public void delete(int email_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int email_idx) throws Exception;

	// 글이전값
	public EmailDto getPrevNum(int email_idx) throws Exception;

	// 글다음값
	public EmailDto getNextNum(int email_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	public int getNoticeCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴
	public String getPassword(int email_idx) throws Exception;
	
}

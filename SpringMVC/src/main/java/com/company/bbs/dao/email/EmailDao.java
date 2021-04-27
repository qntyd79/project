package com.company.bbs.dao.email;

import java.util.List;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.email.EmailVO;

public interface EmailDao {

	// 글목록
	public List<EmailVO> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	public List<EmailVO> getNoticeList(Criteria criteria) throws Exception;

	// 글저장 
	public void insert(EmailVO dto) throws Exception;
	
	// 답글업데이트 
	public void getReply(EmailVO dto) throws Exception;

	// 글보기
	public EmailVO getView(int email_idx) throws Exception;

	// 글수정
	public void update(EmailVO dto) throws Exception;

	// 글삭제
	public void delete(int email_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int email_idx) throws Exception;

	// 글이전값
	public EmailVO getPrevNum(int email_idx) throws Exception;

	// 글다음값
	public EmailVO getNextNum(int email_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	public int getNoticeCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴
	public String getPassword(int email_idx) throws Exception;
	
}

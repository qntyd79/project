package com.company.bbs.dao.attach;

import java.util.List;

import com.company.bbs.dto.attach.AttachDto;
import com.company.bbs.utill.Criteria;

public interface AttachDao {
	
	// 글목록
	public List<AttachDto> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	// public List<AttachDto> getNoticeList(Criteria criteria) throws Exception;

	// 글저장 
	public void insert(AttachDto dto) throws Exception;
	
	// 답글업데이트 
	public void getReply(AttachDto dto) throws Exception;

	// 글보기
	public AttachDto getView(int file_idx) throws Exception;

	// 글수정
	public void update(AttachDto dto) throws Exception;

	// 글삭제
	public void delete(int file_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int file_idx) throws Exception;

	// 글이전값
	public AttachDto getPrevNum(int file_idx) throws Exception;

	// 글다음값
	public AttachDto getNextNum(int file_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	// public int getNoticeCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴
	public String getPassword(int file_idx) throws Exception;
	
	// 카테고리목록
	public List<Object> getCategoryList() throws Exception;
	
}

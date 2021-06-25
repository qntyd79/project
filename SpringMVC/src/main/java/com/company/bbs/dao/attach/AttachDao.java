package com.company.bbs.dao.attach;

import java.util.List;

import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.utill.Criteria;

public interface AttachDao {
	
	// 글목록
	public List<AttachVO> getList(Criteria criteria) throws Exception;
	
	// 파일목록
	public List<AttachVO> getFileList(int board_idx) throws Exception;

	// 글작성
	public void insert(AttachVO attachVO) throws Exception;
		
	// 글보기
	public AttachVO getView(int file_idx) throws Exception;

	// 글수정
	public void update(AttachVO attachVO) throws Exception;

	// 글삭제
	public void delete(int file_idx) throws Exception; 

	// 글조회수
	public void increaseCnt(int file_idx) throws Exception;

	// 글이전값 
	public AttachVO getPrevNum(int file_idx) throws Exception;

	// 글다음값
	public AttachVO getNextNum(int file_idx) throws Exception;

	// 글최고값 
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴
	public String getPassword(int file_idx) throws Exception;
		
	// 카테고리명
	public List<Object> getCategory() throws Exception;
		
	// 카테고리목록
	public List<Object> getCategoryList(int kind) throws Exception;
	
	// 첨부파일갯수
	public int getFileCount(Criteria criteria) throws Exception;
	
}

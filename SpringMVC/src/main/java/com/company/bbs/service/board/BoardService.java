package com.company.bbs.service.board;

import java.util.List;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.board.BoardVO;

public interface BoardService {

	// 글목록
	public List<BoardVO> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	public List<BoardVO> getNoticeList(Criteria criteria) throws Exception;

	// 글작성
	public void insert(BoardVO boardVO) throws Exception;
	
	// 답글업데이트
	public void getReply(BoardVO boardVO) throws Exception;

	// 글보기
	public BoardVO getView(int board_idx) throws Exception;

	// 글수정
	public void update(BoardVO boardVO) throws Exception;

	// 글삭제
	public void delete(int board_idx) throws Exception; 

	// 글조회수
	public void increaseCnt(int board_idx) throws Exception;

	// 글이전값 
	public BoardVO getPrevNum(int board_idx) throws Exception;

	// 글다음값
	public BoardVO getNextNum(int board_idx) throws Exception;

	// 글최고값 
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	public int getNoticeCount(Criteria criteria) throws Exception;	
	
	// 글비밀번호리턴
	public String getPassword(int board_idx) throws Exception;
	
	// 카테고리명
	public List<Object> getCategory() throws Exception;
	
	// 카테고리목록
	public List<Object> getCategoryList() throws Exception;		
	
	// 첨부파일조회 
	public List<Object> getFileList(int board_idx) throws Exception;
	
	// 첨부파일개별삭제
	public void attachDelete(int file_idx) throws Exception;
	
	// 첨부파일등록
	public void fileinsert(BoardVO boardVO) throws Exception;
	
	// 첨부파일갯수
	public int getAttachCount(int board_idx) throws Exception;
	
	// 코멘트갯수 
	public void getCommentCount(int board_idx)throws Exception;

	// 코멘트갯수 
	public void updateCommentCount(int board_idx) throws Exception;	
	
	// 첨부파일목록삭제
	public List<Object> attachDeleteList(int board_idx) throws Exception;
}

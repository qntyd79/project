package com.company.bbs.dao.board;

import java.util.List;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.board.BoardVO;

public interface BoardDao {

	// 글목록
	public List<BoardVO> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	public List<BoardVO> getNoticeList(Criteria criteria) throws Exception;

	// 글저장 
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
	public List<Object> getCategoryList(int idx) throws Exception;

}

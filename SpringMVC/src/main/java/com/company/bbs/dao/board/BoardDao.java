package com.company.bbs.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;

public interface BoardDao {

	// 게시판 글목록
	public List<BoardVO> getList(Criteria criteria) throws Exception;

	// 게시판 공지글목록
	public List<BoardVO> getNoticeList(Criteria criteria) throws Exception;

	// 게시판 글저장
	public void insert(BoardVO boardVO) throws Exception;

	// 게시판 글수정
	public void update(BoardVO boardVO) throws Exception;

	// 게시판 글삭제
	public void delete(int board_idx) throws Exception;

	// 게시판 답글저장
	public void getReply(BoardVO boardVO) throws Exception;

	// 게시판 글보기
	public BoardVO getView(int board_idx) throws Exception;

	// 게시판 글조회수
	public void increaseCnt(int board_idx) throws Exception;

	// 게시판 글이전값
	public BoardVO getPrevNum(int board_idx) throws Exception;

	// 게시판 글다음값
	public BoardVO getNextNum(int board_idx) throws Exception;

	// 게시판 글최고값
	public int getMaxNum() throws Exception;

	// 게시판 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 게시판 공지글갯수
	public int getNoticeCount(Criteria criteria) throws Exception;

	// 게시판 글비밀번호리턴
	public String getPassword(int board_idx) throws Exception;

	// 코멘트갯수
	public void getCommentCount(int board_idx) throws Exception;

	// 코멘트갯수 업데이트
	public void updateCommentCnt(int board_idx, int amount) throws Exception;

	// 카테고리목록
	public List<Object> getCategory() throws Exception;

	// 첨부파일목록
	public List<Object> getFileList(int board_idx) throws Exception;

	// 첨부파일등록
	public void fileinsert(AttachVO attachVO) throws Exception;

	// 첨부파일갯수
	public int getAttachCount(int board_idx) throws Exception;

	// 첨부파일개별삭제
	public void attachDelete(int file_idx) throws Exception;

	// 첨부파일목록삭제
	public List<Object> attachDeleteList(int board_idx) throws Exception;

	// 첨부파일가져오기
	public List<Object> getFile_idx(List<Object> board_idx) throws Exception;

	// 첨부파일갯수 업데이트
	public void updateAttachCnt(int board_idx, int amount) throws Exception;

}

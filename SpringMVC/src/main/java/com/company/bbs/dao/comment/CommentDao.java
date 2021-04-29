package com.company.bbs.dao.comment;

import java.util.List;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.comment.CommentVO;

public interface CommentDao {

	// 글목록
	public List<CommentVO> getLista(int board_idx, Criteria criteria) throws Exception;
	
	// 글목록
	public List<CommentVO> getList(Criteria criteria) throws Exception;

	// 글저장
	public void insert(CommentVO commentVO) throws Exception;

	// 답글업데이트
	public void getReply(CommentVO commentVO) throws Exception;

	// 글보기
	public CommentVO getView(int comment_idx) throws Exception;

	// 글수정
	public void update(CommentVO commentVO) throws Exception;

	// 글삭제
	public void delete(int comment_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int comment_idx) throws Exception;

	// 글이전값
	public CommentVO getPrevNum(int comment_idx) throws Exception;

	// 글다음값
	public CommentVO getNextNum(int comment_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴
	public String getPassword(int comment_idx) throws Exception;

	// 댓글갯수
	public int getCommentCount(int board_idx) throws Exception;

}

package com.company.bbs.dao.comment;

import java.util.List;

import com.company.bbs.dto.comment.CommentDto;
import com.company.bbs.utill.Criteria;

public interface CommentDao {

	// 글목록
	public List<CommentDto> getLista(int board_idx, Criteria criteria) throws Exception;
	
	// 글목록
	public List<CommentDto> getList(Criteria criteria) throws Exception;

	// 공지글목록
	/*public List<CommentDto> getNoticeList(Criteria criteria) throws Exception;*/

	// 글저장
	public void insert(CommentDto dto) throws Exception;

	// 답글업데이트
	public void getReply(CommentDto dto) throws Exception;

	// 글보기
	public CommentDto getView(int comment_idx) throws Exception;

	// 글수정
	public void update(CommentDto dto) throws Exception;

	// 글삭제
	public void delete(int comment_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int comment_idx) throws Exception;

	// 글이전값
	public CommentDto getPrevNum(int comment_idx) throws Exception;

	// 글다음값
	public CommentDto getNextNum(int comment_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	/*public int getNoticeCount(Criteria criteria) throws Exception;*/

	// 글비밀번호리턴
	public String getPassword(int comment_idx) throws Exception;

	// 카테고리목록
	public List<Object> getCategoryList() throws Exception;
	
	// 댓글갯수
	public int getCommentCount(int board_idx) throws Exception;

}

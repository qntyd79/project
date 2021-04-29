package com.company.bbs.dao.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.comment.CommentVO;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Inject
	SqlSession sqlSession;

	// 글목록
	@Override
	public List<CommentVO> getLista(int board_idx, Criteria criteria) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_idx", board_idx);
		map.put("criteria", criteria);

		return sqlSession.selectList("comment.getLista", map);
	}
	
	// 글목록
	public List<CommentVO> getList(Criteria criteria) throws Exception {
		return sqlSession.selectList("comment.getList", criteria);
	}

	// 글저장
	@Override
	public void insert(CommentVO commentVO) throws Exception {
		sqlSession.insert("comment.insert", commentVO);
	}

	// 답글업데이트
	@Override
	public void getReply(CommentVO commentVO) throws Exception {
		sqlSession.update("comment.getReply", commentVO);
	}

	// 글보기
	@Override
	public CommentVO getView(int comment_idx) throws Exception {
		return sqlSession.selectOne("comment.getView", comment_idx);
	}

	// 글수정
	@Override
	public void update(CommentVO commentVO) throws Exception {
		sqlSession.update("comment.update", commentVO);
	}

	// 글삭제
	@Override
	public void delete(int comment_idx) throws Exception {
		sqlSession.update("comment.delete", comment_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int comment_idx) throws Exception {
		sqlSession.update("comment.increaseCnt", comment_idx);
	}

	// 글이전값
	@Override
	public CommentVO getPrevNum(int comment_idx) throws Exception {
		return sqlSession.selectOne("comment.getPrevNum", comment_idx);
	}

	// 글다음값
	@Override
	public CommentVO getNextNum(int comment_idx) throws Exception {
		return sqlSession.selectOne("comment.getNextNum", comment_idx);
	}

	// 글최고값
	@Override
	public int getMaxNum() throws Exception {
		return sqlSession.selectOne("comment.getMaxNum");
	}

	// 글갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("comment.getCount", criteria);
	}

	// 공지글갯수
	/*@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("comment.getNoticeCount", criteria);
	}*/

	// 글비밀번호리턴
	@Override
	public String getPassword(int comment_idx) throws Exception {
		return sqlSession.selectOne("comment.getPassword", comment_idx);
	}

	// 댓글갯수
	@Override
	public int getCommentCount(int board_idx) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_idx", board_idx);
		
		return sqlSession.selectOne("comment.getCommentCount", map);
	}

}

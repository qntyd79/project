package com.company.bbs.dao.board;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Inject
	SqlSession sqlSession;
	
	// 글목록
	@Override
	public List<BoardVO> getList(Criteria criteria) throws Exception {
		return sqlSession.selectList("board.getList", criteria);
	}
	
	// 공지글목록
	@Override
	public List<BoardVO> getNoticeList(Criteria criteria) throws Exception {
		return sqlSession.selectList("board.getNoticeList", criteria);
	}
	
	// 글저장 
	@Override
	public void insert(BoardVO boardVO) throws Exception {
		sqlSession.insert("board.insert", boardVO);
	}
	
	// 답글업데이트
	@Override
	public void getReply(BoardVO boardVO) throws Exception {
		sqlSession.update("board.getReply", boardVO);
	}
	
	// 글보기
	@Override
	public BoardVO getView(int board_idx) throws Exception {
		return sqlSession.selectOne("board.getView", board_idx);
	}

	// 글수정 
	@Override
	public void update(BoardVO boardVO) throws Exception {
		sqlSession.update("board.update", boardVO);
	}
	
	// 글삭제
	@Override
	public void delete(int board_idx) throws Exception {
		sqlSession.update("board.delete", board_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int board_idx) throws Exception {
		sqlSession.update("board.increaseCnt", board_idx);
	}

	// 글이전값
	@Override
	public BoardVO getPrevNum(int board_idx) throws Exception {
		return sqlSession.selectOne("board.getPrevNum", board_idx);
	}

	// 글다음값 
	@Override
	public BoardVO getNextNum(int board_idx) throws Exception {
		return sqlSession.selectOne("board.getNextNum", board_idx);
	}

	// 글최고값
	@Override
	public int getMaxNum() throws Exception {
		return sqlSession.selectOne("board.getMaxNum");
	}

	// 글갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("board.getCount", criteria);
	}

	// 공지글갯수 
	@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("board.getNoticeCount", criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int board_idx) throws Exception {
		return sqlSession.selectOne("board.getPassword", board_idx);
	}
	
	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return sqlSession.selectList("board.getCategory");
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return sqlSession.selectList("board.getCategoryList", idx);
	}
	
	// 첨부파일 저장
	@Override
	public void insert(AttachVO attachVO) throws Exception {
		sqlSession.insert("board.attachInsert", attachVO);
	}
		
	// 첨부파일갯수 
	@Override
	public void getAttachCount(int board_idx) throws Exception {
		sqlSession.selectOne("board.getAttachCount", board_idx);
	}
	
	// 첨부파일목록 
	@Override
	public List<Object> getFileList(int board_idx) throws Exception {
		return sqlSession.selectList("board.getFileList", board_idx);
	}
	
	// 첨부파일삭제
	@Override
	public void attachDelete(int file_idx) throws Exception {
		sqlSession.selectOne("board.attachDelete", file_idx);		
	}
	
	// 코멘트갯수 
	@Override
	public void getCommentCount(int board_idx) throws Exception {
		sqlSession.selectOne("board.getCommentCount", board_idx);
	}

}

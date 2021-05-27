package com.company.bbs.dao.attach;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.utill.Criteria;

@Repository
public class AttachDaoImpl implements AttachDao {

	@Inject
	SqlSession sqlSession;

	// 글목록
	@Override
	public List<AttachVO> getList(Criteria criteria) throws Exception {
		return sqlSession.selectList("attach.getList", criteria);
	}
	
	// 글목록
	@Override
	public List<AttachVO> getFileList(int board_idx) throws Exception {
		return sqlSession.selectList("attach.getFileList", board_idx);
	}
		
	
	// 글저장 
	@Override
	public void insert(AttachVO attachVO) throws Exception {
		sqlSession.insert("attach.insert", attachVO);
	}
			
	// 글보기
	@Override
	public AttachVO getView(int file_idx) throws Exception {
		return sqlSession.selectOne("attach.getView", file_idx);
	}

	// 글수정 
	@Override
	public void update(AttachVO attachVO) throws Exception {
		sqlSession.update("attach.update", attachVO);
	}
		
	// 글삭제
	@Override
	public void delete(int file_idx) throws Exception {
		sqlSession.update("attach.delete", file_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int file_idx) throws Exception {
		sqlSession.update("attach.increaseCnt", file_idx);
	}

	// 글이전값
	@Override
	public AttachVO getPrevNum(int file_idx) throws Exception {
		return sqlSession.selectOne("attach.getPrevNum", file_idx);
	}

	// 글다음값 
	@Override
	public AttachVO getNextNum(int file_idx) throws Exception {
		return sqlSession.selectOne("attach.getNextNum", file_idx);
	}

	// 글최고값
	@Override
	public int getMaxNum() throws Exception {
		return sqlSession.selectOne("attach.getMaxNum");
	}

	// 글갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("attach.getCount", criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int file_idx) throws Exception {
		return sqlSession.selectOne("attach.getPassword", file_idx);
	}
		
	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return sqlSession.selectList("attach.getCategory");
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return sqlSession.selectList("attach.getCategoryList", idx);
	}
	
	// 첨부파일갯수 
	@Override
	public int getFileCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("attach.getFileCount", criteria);
	}

}

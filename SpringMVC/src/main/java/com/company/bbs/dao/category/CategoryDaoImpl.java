package com.company.bbs.dao.category;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.category.CategoryVO;

@Repository
public class CategoryDaoImpl implements CategoryDao {

	@Inject
	SqlSession sqlSession;
	
	// 글목록 
	@Override
	public List<CategoryVO> getList(Criteria criteria) throws Exception {
		
		return sqlSession.selectList("category.getList", criteria);
	}
	
	// 공지글목록
	/*@Override
	public List<CategorycategoryVO> getNoticeList(Criteria criteria) throws Exception {
		return sqlSession.selectList("board.getNoticeList", criteria);
	}*/
	
	// 글저장 
	@Override
	public void insert(CategoryVO categoryVO) throws Exception {
		sqlSession.insert("category.insert", categoryVO);
	}
	
	// 답글업데이트 
	@Override
	public void getReply(CategoryVO categoryVO) throws Exception {
		sqlSession.update("category.getReply", categoryVO);
	}
	
	// 글보기 
	@Override
	public CategoryVO getView(int category_idx) throws Exception {
		return sqlSession.selectOne("category.getView", category_idx);
	}
	
	// 글수정 
	@Override
	public void update(CategoryVO categoryVO) throws Exception {
		sqlSession.update("category.update", categoryVO);
	}
	
	// 글삭제 
	@Override
	public void delete(int category_idx) throws Exception {
		sqlSession.update("category.delete", category_idx);
	}

	// 글조회수 
	@Override
	public void increaseCnt(int category_idx) throws Exception {
		sqlSession.update("category.increaseCnt", category_idx);
	}
 
	// 글이전값 
	@Override
	public CategoryVO getPrevNum(int category_idx) throws Exception {
		return sqlSession.selectOne("category.getPrevNum", category_idx);
	}

	// 글다음값 
	@Override
	public CategoryVO getNextNum(int category_idx) throws Exception {
		return sqlSession.selectOne("category.getNextNum", category_idx);
	}

	// 글최고값 
	@Override
	public int getMaxNum() throws Exception {
		return sqlSession.selectOne("category.getMaxNum");
	}

	// 글갯수 
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("category.getCount", criteria);
	}
	
	// 공지글갯수 
	/*@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("category.getNoticeCount", criteria);
	}*/
	
	// 글비밀번호리턴 
	@Override
	public String getPassword(int category_idx) throws Exception {
		return sqlSession.selectOne("category.getPassword", category_idx);
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int kind) throws Exception {
		return sqlSession.selectList("category.getCategoryList", kind);
	}
	
}

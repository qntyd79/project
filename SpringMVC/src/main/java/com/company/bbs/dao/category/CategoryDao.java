package com.company.bbs.dao.category;

import java.util.List;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.category.CategoryVO;

public interface CategoryDao {

	// 글목록
	public List<CategoryVO> getList(Criteria criteria) throws Exception;
	
	// 공지글목록
	// public List<CategoryDto> getNoticeList(Criteria criteria) throws Exception;

	// 글저장 
	public void insert(CategoryVO categoryVO) throws Exception;
	
	// 답글업데이트 
	public void getReply(CategoryVO categoryVO) throws Exception;

	// 글보기
	public CategoryVO getView(int comment_idx) throws Exception;

	// 글수정
	public void update(CategoryVO categoryVO) throws Exception;

	// 글삭제
	public void delete(int comment_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int comment_idx) throws Exception;

	// 글이전값 
	public CategoryVO getPrevNum(int comment_idx) throws Exception;

	// 글다음값 
	public CategoryVO getNextNum(int comment_idx) throws Exception;

	// 글최고값 
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 공지글갯수
	// public int getNoticeCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴 
	public String getPassword(int comment_idx) throws Exception;

	// 카테고리목록
	public List<Object> getCategoryList(int kind) throws Exception;

}

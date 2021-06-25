package com.company.bbs.dao.email;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.email.EmailVO;

@Repository
public class EmailDaoImpl implements EmailDao {

	@Inject
	SqlSession sqlSession;
	
	// 글목록
	@Override
	public List<EmailVO> getList(Criteria criteria) throws Exception {
		return sqlSession.selectList("email.getList", criteria);
	}
		
	// 글저장 
	@Override
	public void insert(EmailVO emailVO) throws Exception {
		sqlSession.insert("email.insert", emailVO);
	}
	
	// 글보기
	@Override
	public EmailVO getView(int email_idx) throws Exception {
		return sqlSession.selectOne("email.getView", email_idx);
	}

	// 글수정 
	@Override
	public void update(EmailVO emailVO) throws Exception {
		sqlSession.update("email.update", emailVO);
	}
	
	// 글삭제
	@Override
	public void delete(int email_idx) throws Exception {
		sqlSession.update("email.delete", email_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int email_idx) throws Exception {
		sqlSession.update("email.increaseCnt", email_idx);
	}

	// 글이전값
	@Override
	public EmailVO getPrevNum(int email_idx) throws Exception {
		return sqlSession.selectOne("email.getPrevNum", email_idx);
	}

	// 글다음값 
	@Override
	public EmailVO getNextNum(int email_idx) throws Exception {
		return sqlSession.selectOne("email.getNextNum", email_idx);
	}

	// 글최고값
	@Override
	public int getMaxNum() throws Exception {
		return sqlSession.selectOne("email.getMaxNum");
	}

	// 글갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("email.getCount", criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int email_idx) throws Exception {
		return sqlSession.selectOne("email.getPassword", email_idx);
	}
	
	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return sqlSession.selectList("email.getCategory");
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return sqlSession.selectList("email.getCategoryList", idx);
	}
	
	// 첨부파일 저장
	@Override
	public void insert(AttachVO attachVO) throws Exception {
		sqlSession.insert("email.attachInsert", attachVO);
	}
		
	// 첨부파일갯수 
	@Override
	public void getAttachCount(int email_idx) throws Exception {
		sqlSession.selectOne("email.getAttachCount", email_idx);
	}
	
	// 첨부파일목록 
	@Override
	public List<Object> getFileList(int email_idx) throws Exception {
		return sqlSession.selectList("email.getFileList", email_idx);
	}
	
	// 첨부파일삭제
	@Override
	public void attachDelete(int file_idx) throws Exception {
		sqlSession.selectOne("email.attachDelete", file_idx);		
	}
	
	// 코멘트갯수 
	@Override
	public void getCommentCount(int email_idx) throws Exception {
		sqlSession.selectOne("email.getCommentCount", email_idx);
	}

}

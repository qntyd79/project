package com.company.bbs.dao.email;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.utill.Criteria;
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
	
	// 공지글목록
	@Override
	public List<EmailVO> getNoticeList(Criteria criteria) throws Exception {
		return sqlSession.selectList("email.getNoticeList", criteria);
	}
	
	// 글저장 
	@Override
	public void insert(EmailVO dto) throws Exception {
		sqlSession.insert("email.insert", dto);
	}
	
	// 답글업데이트
	@Override
	public void getReply(EmailVO dto) throws Exception {
		sqlSession.update("email.getReply", dto);
	}
	
	// 글보기
	@Override
	public EmailVO getView(int email_idx) throws Exception {
		return sqlSession.selectOne("email.getView", email_idx);
	}

	// 글수정 
	@Override
	public void update(EmailVO dto) throws Exception {
		sqlSession.update("email.update", dto);
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

	// 공지글갯수 
	@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("email.getNoticeCount", criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int email_idx) throws Exception {
		return sqlSession.selectOne("email.getPassword", email_idx);
	}

}

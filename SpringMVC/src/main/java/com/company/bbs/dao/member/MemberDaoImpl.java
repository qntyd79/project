package com.company.bbs.dao.member;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.dto.member.MemberDto;
import com.company.bbs.utill.Criteria;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject
	SqlSession sqlSession;
	
	// 글목록
	@Override
	public List<MemberDto> getList(Criteria criteria) throws Exception {
		return sqlSession.selectList("member.getList", criteria);
	}
	
	/*// 공지글목록
	@Override
	public List<MemberDto> getNoticeList(Criteria criteria) throws Exception {
		return sqlSession.selectList("member.getNoticeList", criteria);
	}*/
	
	// 글저장 
	@Override
	public void insert(MemberDto dto) throws Exception {
		sqlSession.insert("member.insert", dto);
	}
	
	// 답글업데이트
	/*@Override
	public void getReply(MemberDto dto) throws Exception {
		sqlSession.update("member.getReply", dto);
	}*/
	
	// 글보기
	@Override
	public MemberDto getView(int member_idx) throws Exception {
		return sqlSession.selectOne("member.getView", member_idx);
	}

	// 글수정 
	@Override
	public void update(MemberDto dto) throws Exception {
		sqlSession.update("member.update", dto);
	}
	
	// 글삭제
	@Override
	public void delete(int member_idx) throws Exception {
		sqlSession.update("member.delete", member_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int member_idx) throws Exception {
		sqlSession.update("member.increaseCnt", member_idx);
	}

	// 글이전값
	@Override
	public MemberDto getPrevNum(int member_idx) throws Exception {
		return sqlSession.selectOne("member.getPrevNum", member_idx);
	}

	// 글다음값 
	@Override
	public MemberDto getNextNum(int member_idx) throws Exception {
		return sqlSession.selectOne("member.getNextNum", member_idx);
	}

	// 글최고값
	@Override
	public int getMaxNum() throws Exception {
		return sqlSession.selectOne("member.getMaxNum");
	}

	// 글갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("member.getCount", criteria);
	}

	// 공지글갯수 
	/*@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return sqlSession.selectOne("member.getNoticeCount", criteria);
	}*/

	// 글비밀번호리턴
	@Override
	public String getPassword(int member_idx) throws Exception {
		return sqlSession.selectOne("member.getPassword", member_idx);
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return sqlSession.selectList("member.getCategoryList", idx);
	}

	@Override
	public MemberDto getEmailCheck(String str) throws Exception {
		return sqlSession.selectOne("member.getEmailCheck", str);
	}
	
}

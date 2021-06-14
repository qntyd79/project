package com.company.bbs.dao.member;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.member.MemberVO;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Inject
	SqlSession sqlSession;

	// 글목록
	@Override
	public List<MemberVO> getList(Criteria criteria) throws Exception {
		return sqlSession.selectList("member.getList", criteria);
	}

	// 글저장
	@Override
	public void insert(MemberVO dto) throws Exception {
		sqlSession.insert("member.insert", dto);
	}

	// 글보기
	@Override
	public MemberVO getView(int member_idx) throws Exception {
		return sqlSession.selectOne("member.getView", member_idx);
	}

	// 글수정
	@Override
	public void update(MemberVO dto) throws Exception {
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
	public MemberVO getPrevNum(int member_idx) throws Exception {
		return sqlSession.selectOne("member.getPrevNum", member_idx);
	}

	// 글다음값
	@Override
	public MemberVO getNextNum(int member_idx) throws Exception {
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

	// 글비밀번호리턴
	@Override
	public String getPassword(int member_idx) throws Exception {
		return sqlSession.selectOne("member.getPassword", member_idx);
	}
	
	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return sqlSession.selectList("member.getCategory");
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return sqlSession.selectList("member.getCategoryList", idx);
	}

	@Override
	public MemberVO getEmailCheck(String str) throws Exception {
		return sqlSession.selectOne("member.getEmailCheck", str);
	}

	// 첨부파일 저장
	@Override
	public void insert(AttachVO attachVO) throws Exception {
		sqlSession.insert("member.attachInsert", attachVO);
	}

	// 첨부파일갯수
	@Override
	public void getAttachCount(int board_idx) throws Exception {
		sqlSession.selectOne("member.getAttachCount", board_idx);
	}

	// 첨부파일목록
	@Override
	public List<Object> getFileList(int board_idx) throws Exception {
		return sqlSession.selectList("member.getFileList", board_idx);
	}

	// 첨부파일삭제
	@Override
	public void attachDelete(int file_idx) throws Exception {
		sqlSession.selectOne("member.attachDelete", file_idx);
	}



}

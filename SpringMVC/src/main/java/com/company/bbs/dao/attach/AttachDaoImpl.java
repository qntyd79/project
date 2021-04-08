package com.company.bbs.dao.attach;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.bbs.dto.attach.AttachDto;
import com.company.bbs.utill.Criteria;

@Repository
public class AttachDaoImpl implements AttachDao {

	@Inject
	SqlSession sqlSession;

	// 글목
	@Override
	public List<AttachDto> getList(Criteria criteria) throws Exception {
		return sqlSession.selectList("attach.getList", criteria);
	}

	// 공지글목록
//	@Override
//	public List<AttachDto> getNoticeList(Criteria criteria) throws Exception {
//		return sqlSession.selectList("board.getNoticeList", criteria);
//	}

	// 글저장
	@Override
	public void insert(AttachDto dto) throws Exception {
		sqlSession.insert("attach.insert", dto);
	}

	// 답글업데이트
	@Override
	public void getReply(AttachDto dto) throws Exception {
		sqlSession.update("attach.getReply", dto);
	}

	// 글보기
	@Override
	public AttachDto getView(int file_idx) throws Exception {
		return sqlSession.selectOne("attach.getView", file_idx);
	}

	// 글수정
	@Override
	public void update(AttachDto dto) throws Exception {
		sqlSession.update("attach.update", dto);
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
	public AttachDto getPrevNum(int file_idx) throws Exception {
		return sqlSession.selectOne("attach.getPrevNum", file_idx);
	}

	// 글다음값
	@Override
	public AttachDto getNextNum(int file_idx) throws Exception {
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

	// 공지글갯수
//	@Override
//	public int getNoticeCount(Criteria criteria) throws Exception {
//		return sqlSession.selectOne("attach.getNoticeCount", criteria);
//	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int file_idx) throws Exception {
		return sqlSession.selectOne("attach.getPassword", file_idx);
	}

	@Override
	public List<Object> getCategoryList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

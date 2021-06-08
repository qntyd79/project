package com.company.bbs.service.member;

import java.util.List;

import org.springframework.stereotype.Service;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.member.MemberVO;

@Service
public interface MemberService {

	// 글목록
	public List<MemberVO> getList(Criteria criteria) throws Exception;

	// 글저장
	public void insert(MemberVO dto) throws Exception;

	// 글보기
	public MemberVO getView(int member_idx) throws Exception;

	// 글수정
	public void update(MemberVO dto) throws Exception;

	// 글삭제
	public void delete(int member_idx) throws Exception;

	// 글조회수
	public void increaseCnt(int member_idx) throws Exception;

	// 글이전값
	public MemberVO getPrevNum(int member_idx) throws Exception;

	// 글다음값
	public MemberVO getNextNum(int member_idx) throws Exception;

	// 글최고값
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴
	public String getPassword(int member_idx) throws Exception;

	// 카테고리명
	public List<Object> getCategory() throws Exception;

	// 카테고리목록
	public List<Object> getCategoryList(int idx) throws Exception;

	// 첨부파일조회
	public List<Object> getFileList(int member_idx) throws Exception;

	// 첨부파일삭제
	public void attachDelete(int file_idx) throws Exception;

	// 코멘트갯수
	public void getCommentCount(int member_idx) throws Exception;

}
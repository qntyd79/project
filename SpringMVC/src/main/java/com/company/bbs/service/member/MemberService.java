package com.company.bbs.service.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.email.EmailVO;
import com.company.bbs.vo.member.MemberVO;

@Service
public interface MemberService {

	// 회원목록
	public List<MemberVO> getList(Criteria criteria) throws Exception;

	// 회원저장
	public void insert(MemberVO memberVO) throws Exception;

	// 회원보기
	public MemberVO getView(int member_idx) throws Exception;

	// 회원수정
	public void update(MemberVO memberVO) throws Exception;

	// 회원삭제
	public void delete(int member_idx) throws Exception;

	// 회원조회수
	public void increaseCnt(int member_idx) throws Exception;

	// 회원이전값
	public MemberVO getPrevNum(int member_idx) throws Exception;

	// 회원다음값
	public MemberVO getNextNum(int member_idx) throws Exception;

	// 회원최고값
	public int getMaxNum() throws Exception;

	// 회원갯수
	public int getCount(Criteria criteria) throws Exception;

	// 회원비밀번호리턴
	public String getPassword(int member_idx) throws Exception;

	// 카테고리명
	public List<Object> getCategory() throws Exception;

	// 카테고리목록
	public List<Object> getCategoryList(int kind) throws Exception;

	// 첨부파일조회
	public List<Object> getFileList(int member_idx) throws Exception;

	// 첨부파일삭제
	public void attachDelete(int file_idx) throws Exception;

	// 코멘트갯수
	public void getCommentCount(int member_idx) throws Exception;
	
	// 첨부파일등록
	public void fileinsert(MemberVO memberVO) throws Exception;
	
	// 회원로그인
	public boolean loginCheck(MemberVO memberVO, HttpSession session) throws Exception;
	
	// 회원로그아읏 
	public void logout(HttpSession session) throws Exception;
	
	// 회원로그인정보
	public MemberVO getViewMember(MemberVO memberVO) throws Exception;
		
	// 로그인비밀번호리턴 
	public String getLoginPassword(String userid) throws Exception;
	
	// 아이디중복확인
	public int idCheck(MemberVO memberVO) throws Exception;
	
	// 엑셀파일 목록
	public List<MemberVO> getExcelList() throws Exception;
	
	// 엑셀파일 다운로드
	public SXSSFWorkbook excelFileDownloadProcess(List<MemberVO> list) throws Exception;
	
	// 엑셀파일 업로드
	public List<MemberVO> excelFilUploadProcess(MultipartFile attach) throws Exception;
	
	// 아이디찾기
	public MemberVO idSearch(MemberVO memberVO) throws Exception;
	
	// 비밀번호찾기
	public MemberVO passSearch(MemberVO memberVO) throws Exception;
	
	// 비밀번호확인
	public MemberVO passChangeCheck(MemberVO memberVO) throws Exception;
	
	// 임시비밀번호 업데이트
	public int updatePass(MemberVO memberVO) throws Exception;
	
	// 카카오계정 로그인
	public String getReturnAccessToken(String code) throws Exception;
	
	// 카카오계정 사용자정보 가져오기
	public HashMap<String, Object> getUserInfo(String access_token) throws Exception;
	
	// 카카오계쩡 로그아웃
	public void getLogout(String access_token) throws Exception;
	

}
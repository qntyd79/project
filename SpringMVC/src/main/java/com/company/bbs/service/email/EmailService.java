package com.company.bbs.service.email;

import java.util.List;

import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.email.EmailVO;

public interface EmailService {

	// 글목록
	public List<EmailVO> getList(Criteria criteria) throws Exception;
	
	// 글작성
	public void insert(EmailVO emailVO) throws Exception;
	
	// 글보기
	public EmailVO getView(int email_idx) throws Exception;

	// 글수정
	public void update(EmailVO emailVO) throws Exception;

	// 글삭제
	public void delete(int email_idx) throws Exception; 

	// 글이전값 
	public EmailVO getPrevNum(int email_idx) throws Exception;

	// 글다음값
	public EmailVO getNextNum(int email_idx) throws Exception;

	// 글최고값 
	public int getMaxNum() throws Exception;

	// 글갯수
	public int getCount(Criteria criteria) throws Exception;

	// 글비밀번호리턴
	public String getPassword(int email_idx) throws Exception;
	
	// 카테고리명
	public List<Object> getCategory() throws Exception;
	
	// 카테고리목록
	public List<Object> getCategoryList(int kind) throws Exception;		
	
	// 첨부파일조회 
	public List<Object> getFileList(int email_idx) throws Exception;
	
	// 첨부파일삭제
	public void attachDelete(int file_idx) throws Exception;
	
	// 코멘트갯수 
	public void getCommentCount(int email_idx) throws Exception;
	
	// 메일발송
	public String sendMail(EmailVO emailVO, String uploadPath) throws Exception;

	// 첨부파일등록
	public void fileinsert(EmailVO emailVO) throws Exception;

	public List<Object> getMailFileList(int email_idx) throws Exception;

}

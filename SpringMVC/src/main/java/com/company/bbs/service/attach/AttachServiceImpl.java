package com.company.bbs.service.attach;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.bbs.dao.attach.AttachDao;
import com.company.bbs.dao.board.BoardDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.attach.AttachVO;

@Service
public class AttachServiceImpl implements AttachService {
	
	@Inject
	AttachDao dao;
	Criteria criteria;	
	
	@Inject
	BoardDao bdao;
	
	// 암호화 설정 
	@Autowired
    BCryptPasswordEncoder passwordEncoder;
	
	// 글목록
	@Override
	public List<AttachVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}
	
	// 파일목록
	@Override
	public List<AttachVO> getFileList(int board_idx) throws Exception {
		return dao.getFileList(board_idx);
	}

	// 글저장
	@Transactional
	@Override
	public void insert(AttachVO attachVO) throws Exception {

		//for(int i=1; i <=200; i++) {
		//int file_idx = attachVO.getFile_idx();		
		//String title = attachVO.getTitle();
		//String content = attachVO.getContent();
		String del = attachVO.getDel(); 
		//String pass = attachVO.getPass();
		
		// 비밀번호 암호화 
		//String pwdBycrypt = passwordEncoder.encode(pass);
		
		// 접속아이피
		//String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);		
	
		int number = getCount(criteria);
		
		if (number != 0) {
			number = getMaxNum() + 1;	
		} else {
			number = 1;
		}
		
		del = "N";
		
		attachVO.setFile_idx(number);
		//attachVO.setCipp(cipp);
		attachVO.setRegdate(regdate);
		attachVO.setDel(del);
		//attachVO.setContent(content);
		//attachVO.setPass(pwdBycrypt);
		
		dao.insert(attachVO);
		
		// 게시물 파일 수량 업데이트 		
		bdao.updateAttachCnt(attachVO.getBoard_idx(), 1);
		//}
	}
	
	// 글보기 
	@Override
	public AttachVO getView(int file_idx) throws Exception {				
		return dao.getView(file_idx);
	}

	// 글수정
	@Override
	public void update(AttachVO attachVO) throws Exception {		
		dao.update(attachVO);
	}

	// 글삭제 
	@Transactional
	@Override
	public void delete(int file_idx) throws Exception {
		dao.delete(file_idx);		
		// 게시물 파일 수량 업데이트 	
		//int board_idx = dao.getBoard_idx(file_idx);	
		bdao.updateAttachCnt(file_idx, -1);
	}

	// 글조회수 
	@Override
	public void increaseCnt(int file_idx) throws Exception {
		dao.increaseCnt(file_idx);
	}

	// 글이전값
	@Override
	public AttachVO getPrevNum(int file_idx) throws Exception {
		return dao.getPrevNum(file_idx);
	}

	// 글다음값 
	@Override
	public AttachVO getNextNum(int file_idx) throws Exception {
		return dao.getNextNum(file_idx);
	}

	// 글최고값 
	@Override
	public int getMaxNum() throws Exception {
		return dao.getMaxNum();
	}

	// 글갯수 
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return dao.getCount(criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int file_idx) throws Exception {
		return dao.getPassword(file_idx);
	}
	
	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return dao.getCategory();
	}
	
	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int kind) throws Exception {
		return dao.getCategoryList(kind);
	}
	
	// 첨부파일갯수 
	@Override
	public int getFileCount(Criteria criteria) throws Exception {
		return dao.getFileCount(criteria);
	}
	

}

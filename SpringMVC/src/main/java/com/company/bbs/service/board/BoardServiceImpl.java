package com.company.bbs.service.board;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.controller.board.BoardController;
import com.company.bbs.dao.board.BoardDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardDao dao;
	Criteria criteria;

	// 암호화 설정
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Resource(name = "uploadPath") 
	private String uploadPath;	
	
	// 글목록
	@Override
	public List<BoardVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 공지글목록
	@Override
	public List<BoardVO> getNoticeList(Criteria criteria) throws Exception {
		return dao.getNoticeList(criteria);
	}

	// 글저장
	@Transactional
	@Override
	public void insert(BoardVO boardVO) throws Exception {

		// for(int i=1; i <=200; i++) {
		int board_idx = boardVO.getBoard_idx();
		String title = boardVO.getTitle();
		String content = boardVO.getContent();
		int parent = boardVO.getParent();
		int depth = boardVO.getDepth();
		int sortno = boardVO.getSortno();
		String del = boardVO.getDel();
		String pass = boardVO.getPass();

		// 비밀번호 암호화
		String pwdBycrypt = passwordEncoder.encode(pass);

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);

		// 치환함수 적용
		// content = content.replace(" ", "&nbsp;");
		// content = content.replace("<", "&lt;");
		// content = content.replace(">", "&gt;");
		// content = content.replace("\n", "<br>");

		// 긴글입력
		// StringReader scontent = new StringReader(content);

		int number = getCount(criteria);

		if (number != 0) {
			number = getMaxNum() + 1;
		} else {
			number = 1;
		}

		// 답글일경우
		if (board_idx != 0) {
			getReply(boardVO);
			depth = depth + 1;
			sortno = sortno + 1;
			del = "N";
		} else { // 새글일경우
			parent = number;
			depth = 0;
			sortno = 0;
			del = "N";
		}

		boardVO.setBoard_idx(number);
		boardVO.setParent(parent);
		boardVO.setDepth(depth);
		boardVO.setSortno(sortno);
		boardVO.setCipp(cipp);
		boardVO.setRegdate(regdate);
		boardVO.setDel(del);
		boardVO.setContent(content);
		boardVO.setPass(pwdBycrypt);

		dao.insert(boardVO);
		// }

		// 첨부파일 처리
		AttachVO attachVO = new AttachVO();
		MultipartFile[] attach = boardVO.getAttach(); // 첨부파일 배열
		
		if (attach == null)
			return; // 첨부파일이 없으면 종료

		// 첨부파일 db저장처리
		for (MultipartFile file : attach) {

			if (file != null && file.getOriginalFilename() != null && file.getSize() != 0) {

				logger.info("------------- file start -------------");
				logger.info("fileName : " + file.getOriginalFilename());
				logger.info("fileSize : " + file.getSize());
				logger.info("contentType : " + file.getContentType());
				logger.info("server FileName : " + file.getName());
				logger.info("-------------- file end --------------\n");

				// UploadFileUtils 사용하여 저장
				String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				attachVO.setFile_name(file.getOriginalFilename());
				attachVO.setFile_hash_name(savedName);
				attachVO.setFile_size(file.getSize());
				attachVO.setFile_type(file.getContentType());

				// 파일확장자
				String fileName = file.getOriginalFilename();
				int index = fileName.lastIndexOf(".");
				String fileExt = fileName.substring(index + 1);
				
				attachVO.setFile_ext(fileExt);
				attachVO.setRegdate(boardVO.getRegdate());
				attachVO.setDel(boardVO.getDel());
				attachVO.setBoard_idx(boardVO.getBoard_idx());
			}

			dao.insert(attachVO);
		}	
		
		// 첨부파일 등록 후 board테이블 filecnt(파일갯수) 업데이트
		dao.getAttachCount(attachVO.getBoard_idx());
	}

	// 답글업데이트
	@Override
	public void getReply(BoardVO boardVO) throws Exception {
		dao.getReply(boardVO);
	}

	// 글보기
	@Override
	public BoardVO getView(int board_idx) throws Exception {
		return dao.getView(board_idx);
	}

	// 글수정
	@Override
	public void update(BoardVO boardVO) throws Exception {

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		boardVO.setCipp(cipp);

		dao.update(boardVO);
	}

	// 글삭제
	@Transactional  //추가
	@Override
	public void delete(int board_idx) throws Exception {
		dao.delete(board_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int board_idx) throws Exception {
		dao.increaseCnt(board_idx);
	}

	// 글이전값
	@Override
	public BoardVO getPrevNum(int board_idx) throws Exception {
		return dao.getPrevNum(board_idx);
	}

	// 글다음값
	@Override
	public BoardVO getNextNum(int board_idx) throws Exception {
		return dao.getNextNum(board_idx);
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

	// 공지글갯수
	@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return dao.getNoticeCount(criteria);
	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int board_idx) throws Exception {
		return dao.getPassword(board_idx);
	}

	// 카테고리명
	@Override
	public List<Object> getCategory() throws Exception {
		return dao.getCategory();
	}

	// 카테고리목록
	@Override
	public List<Object> getCategoryList(int idx) throws Exception {
		return dao.getCategoryList(idx);
	}
		
	// 첨부파일목록
	@Override
	public List<Object> getFileList(int board_idx) throws Exception {
		return dao.getFileList(board_idx);
	}
	
	// 첨부파일삭제 
	@Transactional 
	@Override
	public void attachDelete(int file_idx) throws Exception {		
		dao.attachDelete(file_idx);
	}

}

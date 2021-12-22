package com.company.bbs.service.comment;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.bbs.dao.board.BoardDao;
import com.company.bbs.dao.comment.CommentDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.comment.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	CommentDao dao;
	Criteria criteria;
	
	@Inject
	BoardDao bdao;
	
	// 암호화 설정 
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 글목록
	@Override
	public List<CommentVO> getLista(int board_idx, Criteria criteria) throws Exception {
		return dao.getLista(board_idx, criteria);
	}
	
	// 글목록
	public List<CommentVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 글저장
	@Transactional
	@Override
	public void insert(CommentVO commentVO) throws Exception {

		// for(int i=1; i <=200; i++) {
		int comment_idx = commentVO.getComment_idx();
		String content = commentVO.getContent();
		int parent = commentVO.getParent();
		int depth = commentVO.getDepth();
		int sortno = commentVO.getSortno();
		String del = commentVO.getDel();
		int board_idx = commentVO.getBoard_idx();
		
		String pass = commentVO.getPass();
		// int number = 0;
		
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
		if (comment_idx != 0) {
			getReply(commentVO);
			depth = depth + 1;
			sortno = sortno + 1;
			del = "N";
			board_idx = dao.getBoard_idx(comment_idx);
		} else { // 새글일경우
			parent = number;
			depth = 0;
			sortno = 0;
			del = "N";
		}

		commentVO.setComment_idx(number);
		commentVO.setParent(parent);
		commentVO.setDepth(depth);
		commentVO.setSortno(sortno);
		commentVO.setCipp(cipp);
		commentVO.setRegdate(regdate);
		commentVO.setDel(del);
		commentVO.setContent(content);
		commentVO.setPass(pwdBycrypt);
		commentVO.setBoard_idx(board_idx);
		// dto.setTitle(i + "번쨰 제목입니다.");

		dao.insert(commentVO);
		
		// 게시물 댓글 수량 업데이트 		
		bdao.updateCommentCnt(commentVO.getBoard_idx(), 1);
		// }
	}

	// 답글업데이트
	@Override
	public void getReply(CommentVO commentVO) throws Exception {
		dao.getReply(commentVO);
	}

	// 글보기
	@Override
	public CommentVO getView(int comment_idx) throws Exception {
		return dao.getView(comment_idx);
	}

	// 글수정
	@Override
	public void update(CommentVO commentVO) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		commentVO.setCipp(cipp);
		
		dao.update(commentVO);
	}

	// 글삭제
	@Transactional
	@Override
	public void delete(int comment_idx) throws Exception {	
		
		int board_idx = dao.getBoard_idx(comment_idx);
		dao.delete(comment_idx);		
		// 게시물 댓글 수량 업데이트 
		bdao.updateCommentCnt(board_idx, -1);
	}

	// 글조회수
	@Override
	public void increaseCnt(int comment_idx) throws Exception {
		dao.increaseCnt(comment_idx);
	}

	// 글이전값
	@Override
	public CommentVO getPrevNum(int comment_idx) throws Exception {
		return dao.getPrevNum(comment_idx);
	}

	// 글다음값
	@Override
	public CommentVO getNextNum(int comment_idx) throws Exception {
		return dao.getNextNum(comment_idx);
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
	public String getPassword(int comment_idx) throws Exception {
		return dao.getPassword(comment_idx);
	}

	// 댓글갯수
	@Override
	public int getCommentCount(int board_idx) throws Exception {
		return dao.getCommentCount(board_idx);
	}
	
}

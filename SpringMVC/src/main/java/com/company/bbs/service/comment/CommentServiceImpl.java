package com.company.bbs.service.comment;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.bbs.dao.comment.CommentDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.comment.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	CommentDao dao;
	Criteria criteria;

	// 글목록
	@Override
	public List<CommentVO> getLista(int board_idx, Criteria criteria) throws Exception {
		return dao.getLista(board_idx, criteria);
	}
	
	// 글목록
	public List<CommentVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 공지글목록
	/*@Override
	public List<CommentDto> getNoticeList(Criteria criteria) throws Exception {
		return dao.getNoticeList(criteria);
	}*/

	// 글저장
	@Override
	public void insert(CommentVO dto) throws Exception {

		// for(int i=1; i <=200; i++) {
		int comment_idx = dto.getComment_idx();
		String content = dto.getContent();
		int parent = dto.getParent();
		int depth = dto.getDepth();
		int sortno = dto.getSortno();
		String del = dto.getDel();
		int board_idx = dto.getBoard_idx();
		// int number = 0;

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
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
			getReply(dto);
			depth = depth + 1;
			sortno = sortno + 1;
			del = "N";
		} else { // 새글일경우
			parent = number;
			depth = 0;
			sortno = 0;
			del = "N";
		}

		dto.setComment_idx(number);
		dto.setParent(parent);
		dto.setDepth(depth);
		dto.setSortno(sortno);
		dto.setCipp(cipp);
		dto.setRegdate(regdate);
		dto.setDel(del);
		dto.setContent(content);
		dto.setBoard_idx(board_idx);
		// dto.setTitle(i + "번쨰 제목입니다.");

		dao.insert(dto);
		// }
	}

	// 답글업데이트
	@Override
	public void getReply(CommentVO dto) throws Exception {
		dao.getReply(dto);
	}

	// 글보기
	@Override
	public CommentVO getView(int comment_idx) throws Exception {
		return dao.getView(comment_idx);
	}

	// 글수정
	@Override
	public void update(CommentVO dto) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		dto.setCipp(cipp);
		dao.update(dto);
	}

	// 글삭제
	@Override
	public void delete(int comment_idx) throws Exception {
		dao.delete(comment_idx);
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

	// 공지글갯수
	/*@Override
	public int getNoticeCount(Criteria criteria) throws Exception {
		return dao.getNoticeCount(criteria);
	}*/

	// 글비밀번호리턴
	@Override
	public String getPassword(int comment_idx) throws Exception {
		return dao.getPassword(comment_idx);
	}

	// 카테고리목록
	@Override
	public List<Object> getCategoryList() throws Exception {
		return dao.getCategoryList();
	}

	// 댓글갯수
	@Override
	public int getCommentCount(int board_idx) throws Exception {
		return dao.getCommentCount(board_idx);
	}
	
}

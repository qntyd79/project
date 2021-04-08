package com.company.bbs.service.attach;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.bbs.dao.attach.AttachDao;
import com.company.bbs.dto.attach.AttachDto;
import com.company.bbs.utill.Criteria;

@Service
public class AttachServiceImpl implements AttachService {

	@Inject
	AttachDao dao;
	Criteria criteria;

	// 글목록
	@Override
	public List<AttachDto> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 공지글목록
//	@Override
//	public List<AttachDto> getNoticeList(Criteria criteria) throws Exception {
//		return dao.getNoticeList(criteria);
//	}

	// 글저장
	@Override
	public void insert(AttachDto dto) throws Exception {

		// for(int i=1; i <=1000; i++) {
		int file_idx = dto.getFile_idx();
		@SuppressWarnings("unused")
		String title = dto.getTitle();
		String del = dto.getDel();
		// int number = 0;

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);

		// 치환함수 적용
		// CommonFunction cf = new CommonFunction();
		// content = cf.getReplace(content);
		// content = content.replace(" ","&nbsp;&nbsp;");
		// content = content.replace("<", "&lt;").replace(">", "&gt;");
		// content = content.replace("<p>","").replace("</p>", "");
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
		if (file_idx != 0) {
			getReply(dto);
			del = "N";
		} else { // 새글일경우
			del = "N";
		}

		dto.setFile_idx(number);
		dto.setCipp(cipp);
		dto.setRegdate(regdate);
		dto.setDel(del);
		// dto.setTitle(i + "번쨰 제목입니다.");

		dao.insert(dto);
		// }
	}

	// 답글업데이트
	@Override
	public void getReply(AttachDto dto) throws Exception {
		dao.getReply(dto);
	}

	// 글보기
	@Override
	public AttachDto getView(int file_idx) throws Exception {
		return dao.getView(file_idx);
	}

	// 글수정
	@Override
	public void update(AttachDto dto) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();
		dto.setCipp(cipp);
		dao.update(dto);
	}

	// 글삭제
	@Override
	public void delete(int file_idx) throws Exception {
		dao.delete(file_idx);
	}

	// 글조회수
	@Override
	public void increaseCnt(int file_idx) throws Exception {
		dao.increaseCnt(file_idx);
	}

	// 글이전값
	@Override
	public AttachDto getPrevNum(int file_idx) throws Exception {
		return dao.getPrevNum(file_idx);
	}

	// 글다음값
	@Override
	public AttachDto getNextNum(int file_idx) throws Exception {
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

	// 공지글갯수
//	@Override
//	public int getNoticeCount(Criteria criteria) throws Exception {
//		return dao.getNoticeCount(criteria);
//	}

	// 글비밀번호리턴
	@Override
	public String getPassword(int file_idx) throws Exception {
		return dao.getPassword(file_idx);
	}

	// 카테고리목록
	@Override
	public List<Object> getCategoryList() throws Exception {
		return dao.getCategoryList();
	}
	
}

package com.company.bbs.service.member;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.controller.member.MemberController;
import com.company.bbs.dao.member.MemberDao;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.MailSendUtils;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;
import com.company.bbs.vo.email.EmailVO;
import com.company.bbs.vo.member.MemberVO;

@SuppressWarnings("unused")
@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberDao dao;
	Criteria criteria;

	// 암호화 설정
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	JavaMailSenderImpl mailSender;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// https://myjamong.tistory.com/115?category=835076
	// https://velog.io/@ieed0205/POI
	public SXSSFWorkbook makeExcelWorkbook(List<MemberVO> list) {

		// 비밀번호설정
		// final String password = "1234";

		// EncryptionInfo encryptionInfo = new EncryptionInfo(EncryptionMode.agile);
		// Encryptor encryptor = encryptionInfo.getEncryptor();
		// encryptor.confirmPassword(password);

		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("회원목록");

		// 행,열
		Row row = null;
		Cell cell = null;
		int rowIdx = 0;
		int cellIdx = 0;

		String[] title = { "번호", "회원아이디", "비밀번호", "비밀번호 분실시 질문", "답변", "이름", "닉네임", "이메일", "홈페이지", "우편번호", "주소", "상세주소",
				"여분주소", "전화번호", "휴대폰번호", "직업", "로그인아이피", "삭제여부", "분류" };

		// 타이틀 출력
		row = sheet.createRow(rowIdx++);

		for (int i = 0; i < title.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(title[i]);
			cell.setCellStyle(cellStyle(workbook, "title"));
		}

		// 데이터 출력
		for (MemberVO memberVO : list) {
			row = sheet.createRow(rowIdx++); // row : 데이터의 다음 행 생성.
			cell = row.createCell(cellIdx++); // cell : 데이터의 다음 열 생성.

			cell.setCellValue(memberVO.getMember_idx()); // value : 값 저장
			cell.setCellStyle(cellStyle(workbook, "data")); // style : 셀 스타일 설정"
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getUserid());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getPass());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getPass_ask());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getPass_account());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getName());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getNickname());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getEmail());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getHomepage());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getZipcode());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getAddress());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getDetailaddress());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getExtraaddress());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getPhone());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getHphone());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getJob());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getLogin_ip());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getDel());
			cell.setCellStyle(cellStyle(workbook, "data"));
			cell = row.createCell(cellIdx++);

			cell.setCellValue(memberVO.getCategory_idx());
			cell.setCellStyle(cellStyle(workbook, "data"));

			cellIdx = 0;
		}

		// 기본설정
		sheet.setDefaultColumnWidth(7); // sheet 전체 기본 너비설정

		// CellStyle 정렬 Alignment
		CellStyle mergeRowStyle1 = workbook.createCellStyle();
		mergeRowStyle1.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle1.setVerticalAlignment(VerticalAlignment.CENTER);

		// CellStyle 테두리 Border
		mergeRowStyle1.setBorderTop(BorderStyle.THICK);
		mergeRowStyle1.setBorderLeft(BorderStyle.MEDIUM_DASH_DOT_DOT);

		// CellStyle 배경색 ForegroundColor
		mergeRowStyle1.setFillForegroundColor(IndexedColors.AQUA.getIndex());
		mergeRowStyle1.setFillPattern(FillPatternType.BRICKS);

		// Cell Font 폰트 설정
		Font headerFont = workbook.createFont();
		headerFont.setFontName("나눔고딕");
		headerFont.setFontHeight((short) 260);
		headerFont.setColor(IndexedColors.GREEN.getIndex());
		headerFont.setBold(true);

		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.LEFT);
		headerStyle.setVerticalAlignment(VerticalAlignment.BOTTOM);
		headerStyle.setBorderLeft(BorderStyle.DASH_DOT);
		headerStyle.setBorderBottom(BorderStyle.MEDIUM);
		headerStyle.setBorderRight(BorderStyle.MEDIUM_DASH_DOT);
		headerStyle.setFont(headerFont);

		CellStyle bodyStyle = workbook.createCellStyle();
		bodyStyle.setAlignment(HorizontalAlignment.CENTER);
		bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);

		/*
		 * // 타이틀 출력 Row headerRow = sheet.createRow(0);
		 * 
		 * headerCell = headerRow.createCell(0); headerCell.setCellValue("번호");
		 * 
		 * // 데이터 출력 Row bodyRow = null; Cell bodyCell = null;
		 * 
		 * for (int i = 0; i < list.size(); i++) {
		 * 
		 * MemberVO fruit = list.get(i);
		 * 
		 * bodyRow = sheet.createRow(i + 1); bodyCell = bodyRow.createCell(0);
		 * bodyCell.setCellValue(i + 1); bodyCell = bodyRow.createCell(1); }
		 */

		// 시트 열 너비 설정
		// setColumWidth(해당 열, 폭)
		for (int i = 0; i < title.length; i++) {
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + (short) 2000);
		}

		return workbook;
	}

	// 셀 스타일 설정하는 함수
	public static CellStyle cellStyle(SXSSFWorkbook workbook, String kind) {

		CellStyle cs = workbook.createCellStyle(); // 셀
		Font f = workbook.createFont(); // 폰트

		// 중앙정렬
		cs.setAlignment(HorizontalAlignment.CENTER);

		// 테두리
		cs.setBorderBottom(BorderStyle.THIN);
		cs.setBorderLeft(BorderStyle.THIN);
		cs.setBorderRight(BorderStyle.THIN);
		cs.setBorderTop(BorderStyle.THIN);

		// 조건문을 이용하여 key값에 따른 스타일을 정해줄 수도 있다.
		// kind : 매개변수("title" or "data")
		if ("title".equals(kind)) {
			cs.setFillForegroundColor(IndexedColors.LIME.getIndex());
			cs.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			f.setFontHeightInPoints((short) 11);
			f.setBold(true);
			f.setFontName("맑은 고딕");
			cs.setFont(f);
		} else if ("data".equals(kind)) {
			f.setFontHeightInPoints((short) 11);
			f.setFontName("맑은 고딕");
			cs.setFont(f);
		} else if ("dataRight".equals(kind)) {
			// 데이터 우측정렬
			f.setFontHeightInPoints((short) 11);
			f.setFontName("맑은 고딕");
			cs.setFont(f);
			cs.setAlignment(HorizontalAlignment.RIGHT);
		} else if ("dataLeft".equals(kind)) {
			// 데이터 좌측정렬
			f.setFontHeightInPoints((short) 11);
			f.setFontName("맑은 고딕");
			cs.setFont(f);
			cs.setAlignment(HorizontalAlignment.LEFT);
		}

		return cs;
	}

	public SXSSFWorkbook excelFileDownloadProcess(List<MemberVO> list) {
		return this.makeExcelWorkbook(list);
	}

	// 엑셀업로드 https://myjamong.tistory.com/111
	@Override
	public List<MemberVO> excelFilUploadProcess(MultipartFile attach) throws Exception {

		logger.info("엑셀파일 업로드");

		// 첨부파일 db저장처리

		if (attach != null && attach.getOriginalFilename() != null && attach.getSize() != 0) {

			logger.info("------------- file start -------------");
			logger.info("fileName : " + attach.getOriginalFilename());
			logger.info("fileSize : " + attach.getSize());
			logger.info("contentType : " + attach.getContentType());
			logger.info("server FileName : " + attach.getName());
			logger.info("-------------- file end --------------\n");

			// UploadFileUtils 사용하여 저장
			String savedName = UploadFileUtils.uploadFile(uploadPath, attach.getOriginalFilename(), attach.getBytes());
		}

		// https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=hyoun1202&logNo=220245067954
		String finalFilePath = uploadPath + "/" + attach.getOriginalFilename();

		System.out.println("finalFilePath : " + finalFilePath);

		File destFile = new File(finalFilePath);

		try {
			attach.transferTo(destFile);
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		}

		InputStream file = new FileInputStream(finalFilePath);
		@SuppressWarnings("resource")
		XSSFWorkbook workbook = new XSSFWorkbook(file);

		Sheet worksheet = workbook.getSheetAt(0);

		List<MemberVO> list = new ArrayList<MemberVO>();

		try {
			for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) {

				Row row = worksheet.getRow(i);

				MemberVO memberVO = new MemberVO();

				// 행이 존재하기 않으면 패스
				if (null == row) {
					continue;
				}

				// getNumericCellValue()> : 실수 데이터 가져오기
				// getStringCellValue() : 문자열 데이터 가져오기
				// getBooleanCellValue() : 논리 데이터 가져오기

				Cell cell = row.getCell(1);
				if (null != cell)
					memberVO.setUserid(cell.getStringCellValue());

				cell = row.getCell(2);
				if (null != cell)
					memberVO.setPass(cell.getStringCellValue());

				cell = row.getCell(3);
				if (null != cell)
					memberVO.setPass_ask(cell.getStringCellValue());

				cell = row.getCell(4);
				if (null != cell)
					memberVO.setPass_account(cell.getStringCellValue());

				cell = row.getCell(5);
				if (null != cell)
					memberVO.setName(cell.getStringCellValue());

				cell = row.getCell(6);
				if (null != cell)
					memberVO.setNickname(cell.getStringCellValue());

				cell = row.getCell(7);
				if (null != cell)
					memberVO.setEmail(cell.getStringCellValue());

				cell = row.getCell(8);
				if (null != cell)
					memberVO.setHomepage(cell.getStringCellValue());

				cell = row.getCell(9);
				if (null != cell)
					memberVO.setZipcode(cell.getStringCellValue());

				cell = row.getCell(10);
				if (null != cell)
					memberVO.setAddress(cell.getStringCellValue());

				cell = row.getCell(11);
				if (null != cell)
					memberVO.setDetailaddress(cell.getStringCellValue());

				cell = row.getCell(12);
				if (null != cell)
					memberVO.setExtraaddress(cell.getStringCellValue());

				cell = row.getCell(13);
				if (null != cell)
					memberVO.setPhone(cell.getStringCellValue());

				cell = row.getCell(14);
				if (null != cell)
					memberVO.setHphone(cell.getStringCellValue());

				cell = row.getCell(15);
				if (null != cell)
					memberVO.setJob(cell.getStringCellValue());

				cell = row.getCell(16);
				if (null != cell)
					memberVO.setLogin_ip(cell.getStringCellValue());

				cell = row.getCell(17);
				if (null != cell)
					memberVO.setDel(cell.getStringCellValue());

				cell = row.getCell(18);
				if (null != cell)
					memberVO.setCategory_idx((int) cell.getNumericCellValue());

				list.add(memberVO);

				dao.insert(memberVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		destFile.delete();

		return list;
	}

	// 회원목록
	@Override
	public List<MemberVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// 회원저장
	@Transactional
	@Override
	public void insert(MemberVO memberVO) throws Exception {

		// for(int i=1; i <=200; i++) {
		int member_idx = memberVO.getMember_idx();
		String pass = memberVO.getPass();
		int level = 10;
		int point = 100;
		int approval = 0; // 승인:1 비승인:0
		int login_cnt = 0;
		int user_leave = 0; // 탈퇴:1 비탈퇴:0

		// 비밀번호 암호화
		String pwdBycrypt = passwordEncoder.encode(pass);

		// 로그인아이피
		String login_ip = InetAddress.getLocalHost().getHostAddress();

		// 마지막로그인아이피
		String login_last = InetAddress.getLocalHost().getHostAddress();

		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// 날짜변수
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date currentTime = new Date();
		String regdate = formatter.format(currentTime);
		String join_date = formatter.format(currentTime);

		String del = memberVO.getDel();
		del = "N";

		int number = getCount(criteria);

		if (number != 0) {
			number = getMaxNum() + 1;
		} else {
			number = 1;
		}

		memberVO.setMember_idx(number);
		memberVO.setPass(pwdBycrypt);
		memberVO.setLevel(level);
		memberVO.setPoint(point);
		memberVO.setApproval(approval);
		memberVO.setJoin_date(join_date);
		memberVO.setLogin_last(login_last);
		memberVO.setLogin_cnt(login_cnt);
		memberVO.setLogin_ip(login_ip);
		memberVO.setUser_leave(user_leave);
		memberVO.setCipp(cipp);
		memberVO.setRegdate(regdate);
		memberVO.setDel(del);

		// memberVO.setTitle(i + "번쨰 제목입니다.");

		dao.insert(memberVO);
		// }
		fileinsert(memberVO);
	}

	// 첨부파일 처리
	@Transactional
	@Override
	public void fileinsert(MemberVO memberVO) throws Exception {

		AttachVO attachVO = new AttachVO();

		MultipartFile[] attach = memberVO.getAttach(); // 첨부파일 배열

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
				attachVO.setRegdate(memberVO.getRegdate());
				attachVO.setDel(memberVO.getDel());
				attachVO.setMember_idx(memberVO.getMember_idx());
			}

			dao.insert(attachVO);
		}

		// 첨부파일 등록 후 board테이블 filecnt(파일갯수) 업데이트
		// dao.getAttachCount(attachVO.getMember_idx());
	}

	// 회원보기
	@Override
	public MemberVO getView(int member_idx) throws Exception {
		return dao.getView(member_idx);
	}

	// 회원수정
	@Override
	public void update(MemberVO memberVO) throws Exception {
		// 접속아이피
		String cipp = InetAddress.getLocalHost().getHostAddress();

		memberVO.setCipp(cipp);

		dao.update(memberVO);
	}

	// 회원삭제
	@Override
	public void delete(int member_idx) throws Exception {
		dao.delete(member_idx);
	}

	// 회원조회수
	@Override
	public void increaseCnt(int member_idx) throws Exception {
		dao.increaseCnt(member_idx);
	}

	// 회원이전값
	@Override
	public MemberVO getPrevNum(int member_idx) throws Exception {
		return dao.getPrevNum(member_idx);
	}

	// 회원다음값
	@Override
	public MemberVO getNextNum(int member_idx) throws Exception {
		return dao.getNextNum(member_idx);
	}

	// 회원최고값
	@Override
	public int getMaxNum() throws Exception {
		return dao.getMaxNum();
	}

	// 회원갯수
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return dao.getCount(criteria);
	}

	// 회원비밀번호리턴
	@Override
	public String getPassword(int member_idx) throws Exception {
		return dao.getPassword(member_idx);
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

	// 첨부파일목록
	@Override
	public List<Object> getFileList(int member_idx) throws Exception {
		return dao.getFileList(member_idx);
	}

	// 첨부파일삭제
	@Override
	public void attachDelete(int file_idx) throws Exception {
		dao.attachDelete(file_idx);
	}

	// 코멘트갯수
	@Override
	public void getCommentCount(int member_idx) throws Exception {

	}

	// 회원로그인
	@Override
	public boolean loginCheck(MemberVO memberVO, HttpSession session) throws Exception {

		boolean result = dao.loginCheck(memberVO);

		if (result) {
			MemberVO memberVO2 = getViewMember(memberVO);

			// 세션 유지시간 설정(초단위) 60초 유지
			session.setMaxInactiveInterval(1 * 300);

			// 세션저장
			session.setAttribute("isAdmin", memberVO2);

			BoardVO boardVO = new BoardVO();

			boardVO.setUserid(memberVO2.getUserid());
			boardVO.setName(memberVO2.getName());
			boardVO.setEmail(memberVO2.getEmail());
			boardVO.setHomepage(memberVO2.getHomepage());

			session.setAttribute("boardVO", boardVO);
		}

		return result;
	}

	// 회원로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {

		// 세션삭제
		// session.removeAttribute("userid"); 세션변수 개별삭제

		// 세션정보 초기화
		session.invalidate();
	}

	// 회원보기
	@Override
	public MemberVO getViewMember(MemberVO memberVO) throws Exception {
		return dao.getViewMember(memberVO);
	}

	@Override
	public String getLoginPassword(String userid) throws Exception {
		return dao.getLoginPassword(userid);
	}

	// 아이디중복확인
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		int result = dao.idCheck(memberVO);
		return result;
	}

	// 엑셀목록
	@Override
	public List<MemberVO> getExcelList() throws Exception {
		return dao.getExcelList();
	}

	// 아이디찾기
	@Override
	public MemberVO idSearch(MemberVO memberVO) throws Exception {
		return dao.idSearch(memberVO);
	}

	// 비밀번호찾기
	@Override
	public MemberVO passSearch(MemberVO memberVO) throws Exception {

		// 이메일 임시비밀번호 발송
		MailSendUtils mailSendUtils = new MailSendUtils(mailSender);

		// 임시비밀번호 생성
		memberVO.setPass(randomPw());

		// 비밀번호 변경 메일 발송
		EmailVO emailVO = new EmailVO();

		String content = "";
		content += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		content += "<h3 style='color: blue;'>";
		content += memberVO.getUserid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
		content += "<p>임시 비밀번호 : ";
		content += memberVO.getPass() + "</p></div>";

		emailVO.setTitle("노라조 임시 비밀번호 입니다.");
		emailVO.setToemail(memberVO.getEmail());
		emailVO.setSendemail("ojh@engit.com");
		emailVO.setContent(content);

		mailSendUtils.sendMailing(emailVO, uploadPath);

		// 비밀번호 암호화
		String pass = memberVO.getPass();
		String pwdBycrypt = passwordEncoder.encode(pass);

		memberVO.setPass(pwdBycrypt);

		// 비밀번호 변경
		dao.updatePass(memberVO);

		return dao.passSearch(memberVO);
	}

	// 임시 비빌번호 랜덤생성 출처: https://bbaksae.tistory.com/5 [QRD]
	public static String randomPw() {
		char pwCollectionSpCha[] = new char[] { '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };
		char pwCollectionNum[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', };
		char pwCollectionAll[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
				'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };
		
		return getRandPw(1, pwCollectionSpCha) + getRandPw(8, pwCollectionAll) + getRandPw(1, pwCollectionNum);
	}

	public static String getRandPw(int size, char[] pwCollection) {
		String ranPw = "";
		for (int i = 0; i < size; i++) {
			int selectRandomPw = (int) (Math.random() * (pwCollection.length));
			ranPw += pwCollection[selectRandomPw];
		}
		
		return ranPw;
	}

}

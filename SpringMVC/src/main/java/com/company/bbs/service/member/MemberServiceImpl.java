package com.company.bbs.service.member;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.company.bbs.utill.FileReadUtils;
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

	// ????????? ??????
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	// ???????????? ??????
	@Autowired
	JavaMailSenderImpl mailSender;

	// ???????????? ???????????? ??????
	@Resource(name = "uploadPath")
	private String uploadPath;

	// https://myjamong.tistory.com/115?category=835076
	// https://velog.io/@ieed0205/POI
	public SXSSFWorkbook makeExcelWorkbook(List<MemberVO> list) {

		// ??????????????????
		// final String password = "1234";

		// EncryptionInfo encryptionInfo = new EncryptionInfo(EncryptionMode.agile);
		// Encryptor encryptor = encryptionInfo.getEncryptor();
		// encryptor.confirmPassword(password);

		SXSSFWorkbook workbook = new SXSSFWorkbook();

		// ?????? ??????
		SXSSFSheet sheet = workbook.createSheet("????????????");

		// ???,???
		Row row = null;
		Cell cell = null;
		int rowIdx = 0;
		int cellIdx = 0;

		String[] title = { "??????", "???????????????", "????????????", "???????????? ????????? ??????", "??????", "??????", "?????????", "?????????", "????????????", "????????????", "??????", "????????????",
				"????????????", "????????????", "???????????????", "??????", "??????????????????", "????????????", "??????" };

		// ????????? ??????
		row = sheet.createRow(rowIdx++);

		for (int i = 0; i < title.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(title[i]);
			cell.setCellStyle(cellStyle(workbook, "title"));
		}

		// ????????? ??????
		for (MemberVO memberVO : list) {
			row = sheet.createRow(rowIdx++); // row : ???????????? ?????? ??? ??????.
			cell = row.createCell(cellIdx++); // cell : ???????????? ?????? ??? ??????.

			cell.setCellValue(memberVO.getMember_idx()); // value : ??? ??????
			cell.setCellStyle(cellStyle(workbook, "data")); // style : ??? ????????? ??????"
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

		// ????????????
		sheet.setDefaultColumnWidth(7); // sheet ?????? ?????? ????????????

		// CellStyle ?????? Alignment
		CellStyle mergeRowStyle1 = workbook.createCellStyle();
		mergeRowStyle1.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle1.setVerticalAlignment(VerticalAlignment.CENTER);

		// CellStyle ????????? Border
		mergeRowStyle1.setBorderTop(BorderStyle.THICK);
		mergeRowStyle1.setBorderLeft(BorderStyle.MEDIUM_DASH_DOT_DOT);

		// CellStyle ????????? ForegroundColor
		mergeRowStyle1.setFillForegroundColor(IndexedColors.AQUA.getIndex());
		mergeRowStyle1.setFillPattern(FillPatternType.BRICKS);

		// Cell Font ?????? ??????
		Font headerFont = workbook.createFont();
		headerFont.setFontName("????????????");
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

		// ?????? ??? ?????? ??????
		// setColumWidth(?????? ???, ???)
		for (int i = 0; i < title.length; i++) {
			sheet.setColumnWidth(i, (sheet.getColumnWidth(i)) + (short) 2000);
		}

		return workbook;
	}

	// ??? ????????? ???????????? ??????
	public static CellStyle cellStyle(SXSSFWorkbook workbook, String kind) {

		CellStyle cs = workbook.createCellStyle(); // ???
		Font f = workbook.createFont(); // ??????

		// ????????????
		cs.setAlignment(HorizontalAlignment.CENTER);

		// ?????????
		cs.setBorderBottom(BorderStyle.THIN);
		cs.setBorderLeft(BorderStyle.THIN);
		cs.setBorderRight(BorderStyle.THIN);
		cs.setBorderTop(BorderStyle.THIN);

		// ???????????? ???????????? key?????? ?????? ???????????? ????????? ?????? ??????.
		// kind : ????????????("title" or "data")
		if ("title".equals(kind)) {
			cs.setFillForegroundColor(IndexedColors.LIME.getIndex());
			cs.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			f.setFontHeightInPoints((short) 11);
			f.setBold(true);
			f.setFontName("?????? ??????");
			cs.setFont(f);
		} else if ("data".equals(kind)) {
			f.setFontHeightInPoints((short) 11);
			f.setFontName("?????? ??????");
			cs.setFont(f);
		} else if ("dataRight".equals(kind)) {
			// ????????? ????????????
			f.setFontHeightInPoints((short) 11);
			f.setFontName("?????? ??????");
			cs.setFont(f);
			cs.setAlignment(HorizontalAlignment.RIGHT);
		} else if ("dataLeft".equals(kind)) {
			// ????????? ????????????
			f.setFontHeightInPoints((short) 11);
			f.setFontName("?????? ??????");
			cs.setFont(f);
			cs.setAlignment(HorizontalAlignment.LEFT);
		}

		return cs;
	}

	public SXSSFWorkbook excelFileDownloadProcess(List<MemberVO> list) {
		return this.makeExcelWorkbook(list);
	}

	// ??????????????? https://myjamong.tistory.com/111
	@Override
	public List<MemberVO> excelFilUploadProcess(MultipartFile attach) throws Exception {

		logger.info("???????????? ?????????");

		// ???????????? db????????????

		if (attach != null && attach.getOriginalFilename() != null && attach.getSize() != 0) {

			logger.info("------------- file start -------------");
			logger.info("fileName : " + attach.getOriginalFilename());
			logger.info("fileSize : " + attach.getSize());
			logger.info("contentType : " + attach.getContentType());
			logger.info("server FileName : " + attach.getName());
			logger.info("-------------- file end --------------\n");

			// UploadFileUtils ???????????? ??????
			String savedName = UploadFileUtils.uploadFile(uploadPath, attach.getOriginalFilename(), attach.getBytes());
		}

		// https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=hyoun1202&logNo=220245067954
		String finalFilePath = uploadPath + "/" + attach.getOriginalFilename();

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

				// ?????? ???????????? ????????? ??????
				if (null == row) {
					continue;
				}

				// getNumericCellValue()> : ?????? ????????? ????????????
				// getStringCellValue() : ????????? ????????? ????????????
				// getBooleanCellValue() : ?????? ????????? ????????????

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

				// ??????????????? ????????? ?????? DB?????????????????? ??????
				insert(memberVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		destFile.delete();

		return list;
	}

	// ????????????
	@Override
	public List<MemberVO> getList(Criteria criteria) throws Exception {
		return dao.getList(criteria);
	}

	// ????????????
	@Transactional
	@Override
	public void insert(MemberVO memberVO) throws Exception {

		int member_idx = memberVO.getMember_idx();
		String pass = memberVO.getPass();
		int level = 10; // ???????????? ?????????1, ?????????9, ????????????10
		int point = 100;
		int approval = 0; // ??????:1 ?????????:0
		int login_cnt = 0;
		int user_leave = 0; // ??????:1 ?????????:0
		int category_idx = 2;

		// ???????????? ?????????
		String pwdBycrypt = passwordEncoder.encode(pass);

		// ??????????????????
		String login_ip = InetAddress.getLocalHost().getHostAddress();

		// ???????????????????????????
		String login_last = InetAddress.getLocalHost().getHostAddress();

		// ???????????????
		String cipp = InetAddress.getLocalHost().getHostAddress();

		// ????????????
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
		memberVO.setCategory_idx(category_idx);
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

		dao.insert(memberVO);

		// ????????????????????????????????????
		fileinsert(memberVO);
	}

	// ???????????? ??????
	@Transactional
	@Override
	public void fileinsert(MemberVO memberVO) throws Exception {

		AttachVO attachVO = new AttachVO();

		MultipartFile[] attach = memberVO.getAttach(); // ???????????? ??????

		if (attach == null)
			return; // ??????????????? ????????? ??????

		// ???????????? db????????????
		for (MultipartFile file : attach) {

			if (file != null && file.getOriginalFilename() != null && file.getSize() != 0) {

				logger.info("------------- file start -------------");
				logger.info("fileName : " + file.getOriginalFilename());
				logger.info("fileSize : " + file.getSize());
				logger.info("contentType : " + file.getContentType());
				logger.info("server FileName : " + file.getName());
				logger.info("-------------- file end --------------\n");

				// UploadFileUtils ???????????? ??????
				String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				attachVO.setFile_name(file.getOriginalFilename());
				attachVO.setFile_hash_name(savedName);
				attachVO.setFile_size(file.getSize());
				attachVO.setFile_type(file.getContentType());

				// ???????????????
				String fileName = file.getOriginalFilename();
				int index = fileName.lastIndexOf(".");
				String fileExt = fileName.substring(index + 1);

				attachVO.setFile_ext(fileExt);
				attachVO.setRegdate(memberVO.getRegdate());
				attachVO.setDel(memberVO.getDel());
				attachVO.setMember_idx(memberVO.getMember_idx());
				
				logger.info("??????????????? member-idx : " + memberVO.getMember_idx());
			}

			dao.insert(attachVO);
		}
		// ???????????? ?????? ??? board????????? filecnt(????????????) ????????????
		// dao.getAttachCount(attachVO.getMember_idx());
	}

	// ????????????
	@Override
	public MemberVO getView(int member_idx) throws Exception {
		return dao.getView(member_idx);
	}

	// ????????????
	@Override
	public void update(MemberVO memberVO) throws Exception {
		// ???????????????
		String cipp = InetAddress.getLocalHost().getHostAddress();

		memberVO.setCipp(cipp);

		dao.update(memberVO);
	}

	// ????????????
	@Override
	public void delete(int member_idx) throws Exception {
		dao.delete(member_idx);
	}

	// ???????????????
	@Override
	public void increaseCnt(int member_idx) throws Exception {
		dao.increaseCnt(member_idx);
	}

	// ???????????????
	@Override
	public MemberVO getPrevNum(int member_idx) throws Exception {
		return dao.getPrevNum(member_idx);
	}

	// ???????????????
	@Override
	public MemberVO getNextNum(int member_idx) throws Exception {
		return dao.getNextNum(member_idx);
	}

	// ???????????????
	@Override
	public int getMaxNum() throws Exception {
		return dao.getMaxNum();
	}

	// ????????????
	@Override
	public int getCount(Criteria criteria) throws Exception {
		return dao.getCount(criteria);
	}

	// ????????????????????????
	@Override
	public String getPassword(int member_idx) throws Exception {
		return dao.getPassword(member_idx);
	}

	// ???????????????
	@Override
	public List<Object> getCategory() throws Exception {
		return dao.getCategory();
	}

	// ??????????????????
	@Override
	public List<Object> getCategoryList(int kind) throws Exception {
		return dao.getCategoryList(kind);
	}

	// ??????????????????
	@Override
	public List<Object> getFileList(int member_idx) throws Exception {
		return dao.getFileList(member_idx);
	}

	// ??????????????????
	@Override
	public void attachDelete(int file_idx) throws Exception {
		dao.attachDelete(file_idx);
	}

	// ???????????????
	@Override
	public void getCommentCount(int member_idx) throws Exception {

	}

	// ???????????????
	@Override
	public boolean loginCheck(MemberVO memberVO, HttpSession session) throws Exception {

		boolean result = dao.loginCheck(memberVO);

		if (result) {
			MemberVO memberVO2 = getViewMember(memberVO);
			System.out.println("memberVO2 :" + memberVO2);

			// ?????? ???????????? ??????(?????????) 60??? ??????
			session.setMaxInactiveInterval(1 * 300);

			// ????????????
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

	// ??????????????????
	@Override
	public void logout(HttpSession session) throws Exception {

		// ????????????
		// session.removeAttribute("userid"); ???????????? ????????????

		// ???????????? ?????????
		session.invalidate();
	}

	// ????????????
	@Override
	public MemberVO getViewMember(MemberVO memberVO) throws Exception {
		return dao.getViewMember(memberVO);
	}

	@Override
	public String getLoginPassword(String email) throws Exception {
		return dao.getLoginPassword(email);
	}

	// ?????????????????????
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		int result = dao.idCheck(memberVO);
		return result;
	}

	// ????????????
	@Override
	public List<MemberVO> getExcelList() throws Exception {
		return dao.getExcelList();
	}

	// ???????????????
	@Override
	public MemberVO idSearch(MemberVO memberVO) throws Exception {
		return dao.idSearch(memberVO);
	}

	// ??????????????????
	@Override
	public MemberVO passSearch(MemberVO memberVO) throws Exception {

		// ????????? ?????????????????? ??????
		MailSendUtils mailSendUtils = new MailSendUtils(mailSender);

		// ?????????????????? ??????
		memberVO.setPass(randomPw());

		// ???????????? ?????? ?????? ??????
		EmailVO emailVO = new EmailVO();

		String content = "";
		/*
		 * content +=
		 * "<div align='center' style='border:1px solid black; font-family:verdana'>";
		 * content += "<h3 style='color: blue;'>"; content += memberVO.getUserid() +
		 * "?????? ?????? ???????????? ?????????. ??????????????? ???????????? ???????????????.</h3>"; content += "<p>?????? ???????????? : "; content
		 * += memberVO.getPass() + "</p></div>";
		 */

		emailVO.setTitle("????????? ?????? ???????????? ?????????.");
		emailVO.setToemail(memberVO.getEmail());
		emailVO.setSendemail("ojh@engit.com");
		// emailVO.setContent(content);

		HashMap<String, String> mailParamMap = new HashMap<String, String>();

		mailParamMap.put("title", "?????? ???????????? ?????? ???????????????.");
		mailParamMap.put("userid", memberVO.getUserid());
		mailParamMap.put("pass", memberVO.getPass());
		mailParamMap.put("content", content);

		// ????????? ????????????
		FileReadUtils fileReadUtils = new FileReadUtils();

		String filename = "/Users/ojeonghwan/git/project/SpringMVC/src/main/webapp/resources/template/"
				+ "emailtemplate1.html";

		String templateString = fileReadUtils.readFile(filename);

		String mailContents = fileReadUtils.changeContents(mailParamMap, templateString);

		emailVO.setContent(mailContents);
		mailSendUtils.sendMailing(emailVO, uploadPath);

		// ???????????? ?????????
		String pass = memberVO.getPass();
		String pwdBycrypt = passwordEncoder.encode(pass);

		memberVO.setPass(pwdBycrypt);

		// ???????????? ??????
		dao.updatePass(memberVO);

		return dao.passSearch(memberVO);
	}

	// ?????? ???????????? ???????????? ??????: https://bbaksae.tistory.com/5 [QRD]
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

	// ???????????? ??????
	@Override
	public MemberVO passChangeCheck(MemberVO memberVO) throws Exception {
		return dao.passChangeCheck(memberVO);
	}

	// ?????????????????? ????????????
	@Override
	public int updatePass(MemberVO memberVO) throws Exception {

		// ?????? ???????????? ?????????
		String pass = memberVO.getPass();
		String pwdBycrypt = passwordEncoder.encode(pass);

		memberVO.setPass(pwdBycrypt);

		int result = dao.updatePass(memberVO);

		return result;
	}

	

}

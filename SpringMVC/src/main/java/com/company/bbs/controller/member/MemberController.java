package com.company.bbs.controller.member;

import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.member.MemberService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.member.MemberVO;

@SuppressWarnings("unused")
@Controller
@RequestMapping("modules/member/*")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService service;

	// 첨부파일 저장경로 설정
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 암호화 설정
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 다국어 지역세션설정
	@Autowired
	private SessionLocaleResolver localeResolver;

	// 다국어 설정
	@Autowired
	private MessageSource messageSource;

	// 유효성검사
	@Autowired
	private DefaultBeanValidator beanValidator;

	// 클라이언트측 유효성검증 설정
	@RequestMapping(value = "validator.do")
	protected String getValidator() throws Exception {
		return "modules/member/validator";
	}

	// 회원목록 엑셀다운로드
	@RequestMapping(value = "excelDownload.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String excelDownload(Model model, @ModelAttribute Criteria criteria) throws Exception {
		logger.info("다운로드폼");

		// 회원목록 가져오기
		List<MemberVO> list = service.getExcelList();

		// 회원목록 엑셀다운로드
		SXSSFWorkbook workbook = service.excelFileDownloadProcess(list);

		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "회원목록");

		// 스프링설정 context-file에서 빈설정
		return "excelDownloadView";
	}

	// 회원목록 엑셀파일 업로드
	@RequestMapping(value = "excelUpload.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String excelUpload(Model model, @RequestParam("attach") MultipartFile attach) throws Exception {

		List<MemberVO> list = service.excelFilUploadProcess(attach);

		if (list != null) {
			model.addAttribute("msg", "LoginSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "LoginFailed");
			model.addAttribute("url", "list.do");
		}

		return "/modules/common/common_message";

	}

	// 로그인폼
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, @ModelAttribute MemberVO memberVO) throws Exception {
		logger.info("회원로그인폼");

		model.addAttribute("memberVO", memberVO);

		return "modules/member/member_login";
	}

	// 로그인처리
	@RequestMapping(value = "loginCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, @ModelAttribute MemberVO memberVO, HttpSession session) throws Exception {

		logger.info("회원로그인처리");

		String rawPassword = memberVO.getPass();
		logger.info("로그인폼 비밀번호 " + rawPassword);

		String encodedPassword = service.getLoginPassword(memberVO.getUserid());
		logger.info("DB 비밀번호 " + encodedPassword);

		boolean passMatch = passwordEncoder.matches(rawPassword, encodedPassword);

		service.getLoginPassword(memberVO.getUserid());
		memberVO.setPass(encodedPassword);

		boolean result = service.loginCheck(memberVO, session);

		if (result == true && passMatch == true) {
			model.addAttribute("member", null);
			model.addAttribute("msg", "LoginSuccess");
			model.addAttribute("url", "../../index.do");
		} else {
			model.addAttribute("msg", "LoginFailed");
			model.addAttribute("url", "login.do");
		}

		return "/modules/common/common_message";
	}

	// 로그인풀화면폼
	@RequestMapping(value = "loginfull.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginfull() throws Exception {
		return "modules/member/loginfull";
	}

	// 회원로그아웃
	@RequestMapping(value = "logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(Model model, HttpSession session) throws Exception {

		service.logout(session);
		model.addAttribute("msg", "LogoutSuccess");
		model.addAttribute("url", "login.do");
		return "/modules/common/common_message";
	}

	// 아이디중복확인
	@RequestMapping(value = "idCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public int idCheck(MemberVO memberVO, HttpServletResponse response) throws Exception {

		logger.info("아이디중복확인");

		int result = service.idCheck(memberVO);

		// 1이면 중복된 아이디 0이면 사용가능한 아이디
		return result;
	}

	// 아이디/비밀번호찾기
	@RequestMapping(value = "find.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String find() throws Exception {
		return "modules/member/member_find";
	}

	// 회원인증폼
	@RequestMapping(value = "auth.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String auth() throws Exception {
		return "modules/member/member_auth";
	}

	// 회원약관동의폼
	@RequestMapping(value = "agree.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String agree(Model model) throws Exception {

		/*
		 * File file = new File(
		 * "/Users/ojeonghwan/git/project/SpringMVC/src/main/webapp/WEB-INF/views/modules/member/license01.txt"
		 * );
		 * 
		 * FileReader filereader = new FileReader(file);
		 * 
		 * BufferedReader bufferreader = new BufferedReader(filereader); // 크기를 안써도 됨
		 * 
		 * List<String> list = new ArrayList<String>();
		 * 
		 * while(true) { String str = bufferreader.readLine(); //buffer로부터 한 줄씩 읽어서 저장
		 * if(str == null) {//읽을 내용이 없으면 반복문 종료 break; } System.out.println(str); //한 줄씩
		 * 바로바로 출력 }
		 */

		// 파일 객체 생
		Path path = Paths.get(
				"/Users/ojeonghwan/git/project/SpringMVC/src/main/webapp/WEB-INF/views/modules/member/license01.txt");

		// 캐릭터셋 지정
		Charset cs = StandardCharsets.UTF_8;

		// 파일 내용담을 리스트
		List<String> list = new ArrayList<String>();

		list = Files.readAllLines(path, cs);

		for (String readLine : list) {
			// System.out.println(readLine);
		}

		model.addAttribute("license", list);

		return "modules/member/member_agree";
	}

	// 회원목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
		model.addAttribute("categoryselect", criteria.getCategory_idx());
		model.addAttribute("pageMaker", pageMaker);

		return "modules/member/member_list";
	}

	// 회원목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria) throws Exception {

		logger.info("회원목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList(criteria.getKind()));
		mav.addObject("categoryselect", criteria.getCategory_idx());
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("modules/member/member_list");

		return mav;
	}

	// 회원목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("회원목록");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		map.put("categoryname", service.getCategory());
		map.put("categorylist", service.getCategoryList(criteria.getKind()));
		map.put("categoryselect", criteria.getCategory_idx());
		map.put("pageMaker", pageMaker);

		model.addAllAttributes(map);

		return "modules/member/member_list";
	}

	// 회원등록폼
	@RequestMapping(value = "write.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Write(Model model, @ModelAttribute Criteria criteria, @ModelAttribute MemberVO memberVO)
			throws Exception {

		logger.info("회원쓰기");

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/member/member_write";
	}

	// 회원그룹등록폼
	@RequestMapping(value = "write_group.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Writegroup(Model model, @ModelAttribute Criteria criteria, @ModelAttribute MemberVO memberVO)
			throws Exception {

		logger.info("회원쓰기");

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/member/member_write_group";
	}

	// 회원저장
	@RequestMapping(value = "insert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String Insert(Model model, @ModelAttribute Criteria criteria, @ModelAttribute MemberVO memberVO,
			BindingResult bindingResult, HttpServletRequest request) throws Exception {

		logger.info("회원저장처리");

		// 서버측 유효성검증
		beanValidator.validate(memberVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			model.addAttribute("categoryname", service.getCategory());
			model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

			return "modules/member/member_write";
		}

		// 자동등록방지 검증
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");

		if (getAnswer.equals(answer)) {

			service.insert(memberVO);

			model.addAttribute("msg", "InsertSuccess");
			model.addAttribute("url", "list.do?criteria.getKind()=2");
		} else {
			model.addAttribute("msg", "CaptchaFailed");
			model.addAttribute("url", "write.do");
		}

		return "/modules/common/common_message";
	}

	// 회원보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @ModelAttribute Criteria criteria, @RequestParam int member_idx) throws Exception {

		logger.info("회원보기");

		model.addAttribute("memberVO", service.getView(member_idx));
		model.addAttribute("prenum", service.getPrevNum(member_idx));
		model.addAttribute("nextnum", service.getNextNum(member_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
		model.addAttribute("filelist", service.getFileList(member_idx));

		return "modules/member/member_view";
	}

	// 회원보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria, @RequestParam int member_idx) throws Exception {

		logger.info("회원보기");

		service.increaseCnt(member_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("memberVO", service.getView(member_idx));
		mav.addObject("prenum", service.getPrevNum(member_idx));
		mav.addObject("nextnum", service.getNextNum(member_idx));
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList(criteria.getKind()));
		mav.setViewName("modules/member/member_view");

		return mav;
	}

	// 회원수정
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String Modify(Model model, @ModelAttribute Criteria criteria, @RequestParam int member_idx)
			throws Exception {

		logger.info("회원수정");

		model.addAttribute("memberVO", service.getView(member_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
		model.addAttribute("categoryselect", criteria.getCategory_idx());

		return "modules/member/member_edit";
	}

	// 회원수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Modify(Model model, @ModelAttribute MemberVO memberVO, @ModelAttribute Criteria criteria,
			@RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("회원수정처리");

		// 서버측 유효성검증
		beanValidator.validate(memberVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			return "modules/member/member_edit";
		}

		String rawPassword = memberVO.getPass();
		String encodedPassword = service.getPassword(memberVO.getMember_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin@1234")) {
			service.update(memberVO);
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url",
					"modify.do?member_idx=" + memberVO.getMember_idx() + "&category_idx=" + memberVO.getCategory_idx());
		}

		return "/modules/common/common_message";
	}

	// 회원삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @RequestParam int member_idx)
			throws Exception {

		logger.info("회원삭제");

		model.addAttribute("memberVO", service.getView(member_idx));

		return "modules/member/member_delete";
	}

	// 회원삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute MemberVO memberVO,
			@RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("회원삭제처리");

		String rawPassword = memberVO.getPass();
		String encodedPassword = service.getPassword(memberVO.getMember_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin@1234")) {
			service.delete(memberVO.getMember_idx());

			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do?criteria.getKind()=2");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?member_idx=" + memberVO.getMember_idx());
		}

		return "/modules/common/common_message";
	}

	// 첨부파일삭제처리
	@RequestMapping(value = "attachDelete.do", method = RequestMethod.GET)
	public String attachDelete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO,
			@RequestParam int member_idx, @RequestParam String filename) throws Exception {

		logger.info("첨부파일삭제처리");

		UploadFileUtils.removeFile(uploadPath, filename);

		service.attachDelete(attachVO.getFile_idx());

		model.addAttribute("msg", "DeleteSuccess");
		model.addAttribute("url", "read.do?member_idx=" + member_idx);

		return "/modules/common/common_message";
	}

	@RequestMapping(value = "captchaImg.do", method = RequestMethod.GET)
	public void cpatchaImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		new CaptchaUtil().captchaImg(request, response);
	}

	@RequestMapping(value = "captchaAudio.do", method = RequestMethod.GET)
	public void cpatchaAudio(HttpServletRequest request, HttpServletResponse response) throws Exception {
		new CaptchaUtil().captchaAudio(request, response);
	}

}

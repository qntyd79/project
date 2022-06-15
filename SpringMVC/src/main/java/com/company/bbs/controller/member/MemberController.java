package com.company.bbs.controller.member;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@SuppressWarnings("unused")
	@Autowired
	private SessionLocaleResolver localeResolver;

	// 다국어 설정
	@SuppressWarnings("unused")
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

	// 회원아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "idCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int idCheck(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception {

		logger.info("아이디중복확인");

		int result = service.idCheck(memberVO);

		// 1이면 중복된 아이디 0이면 사용가능한 아이디
		return result;
	}

	// 회원아이디/비밀번호찾기폼
	@RequestMapping(value = "find.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String find(Model model, @ModelAttribute MemberVO memberVO) throws Exception {

		logger.info("아이디/비밀번호찾기폼");

		model.addAttribute("memberVO", memberVO);

		return "modules/member/member_find";
	}

	// 회원아이디찾기폼
	@RequestMapping(value = "idfind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String idfind(Model model, @ModelAttribute MemberVO memberVO) throws Exception {

		logger.info("아이디찾기폼");

		model.addAttribute("memberVO", memberVO);

		return "modules/member/member_idfind";
	}

	// 회원아이디찾기 처리
	@ResponseBody
	@RequestMapping(value = "idfindcheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> idfindcheck(Model model, @RequestBody MemberVO memberVO) throws Exception {

		logger.info("아이디찾기 결과화면");

		MemberVO result = service.idSearch(memberVO);
		System.out.println(result);
		Map<String, Object> map = new HashMap<String, Object>();

		// 아이디가 존재하지 않으면
		if (result == null) {

			map.put("check", 0);

		} else { // 아이디가 존재하면

			// 마지막 2자리 **표시
			String getid = result.getUserid();

			int length = getid.length();
			length = length - 2;

			String maskid = getid.substring(0, length);
			maskid = maskid + "**";

			map.put("check", 1);
			map.put("id", maskid);
		}

		return map;
	}

	// 회원비밀번호찾기폼
	@RequestMapping(value = "passfind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String passfind(Model model, @ModelAttribute MemberVO memberVO) throws Exception {

		logger.info("비밀번호찾기폼");

		model.addAttribute("memberVO", memberVO);

		return "modules/member/member_passfind";
	}

	// 회원비밀번호찾기 처리
	@ResponseBody
	@RequestMapping(value = "passfindcheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> passfindcheck(Model model, @RequestBody MemberVO memberVO) throws Exception {

		logger.info("비밀번호찾기 결과화면");

		MemberVO result = service.passSearch(memberVO);
		System.out.println(result);

		Map<String, Object> map = new HashMap<String, Object>();

		// 비밀번호가 존재하지 않으면
		if (result == null) {

			map.put("check", 0);

		} else { // 비밀번호가 존재하면

			// 마지막 4자리 ****표시
			String getpass = result.getPass();
			String getemail = result.getEmail();

			int length = getpass.length();
			length = length - 4;

			String maskpass = getpass.substring(0, length);
			maskpass = maskpass + "****";
			System.out.println(maskpass);

			map.put("check", 1);
			map.put("pass", maskpass);
			map.put("email", getemail);

		}

		return map;
	}

	// 회원비밀번호 확인 처리
	@ResponseBody
	@RequestMapping(value = "passchangecheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> passchangecheck(Model model, @RequestBody MemberVO memberVO) throws Exception {

		logger.info("비밀번호 확인");

		MemberVO result = service.passChangeCheck(memberVO);

		Map<String, Object> map = new HashMap<String, Object>();

		// DB비밀번호
		String rawPassword = memberVO.getPass();
		logger.info("폼에서 받아온 비밀번호 " + rawPassword);

		String encodedPassword = service.getLoginPassword(memberVO.getUserid());
		logger.info("DB비밀번호 " + encodedPassword);
			
		// 비밀번호가 일치하면 1 반환 / 비밀번호가 일치하지 않으면 0 반환
		if (passwordEncoder.matches(rawPassword, encodedPassword)) {		
			map.put("check", 1);
			map.put("userid", memberVO.getUserid());
			
			logger.info("넘어갈 아이디 " + memberVO.getUserid());
		} else {			
			map.put("check", 0);
		}

		return map;
	}

	// 회원비밀번호 변경 처리
	@ResponseBody
	@RequestMapping(value = "passchange.do", method = { RequestMethod.GET, RequestMethod.POST })
	public int passchange(@RequestBody MemberVO memberVO) throws Exception {

		logger.info("비밀번호 변경 결과");
		
		int result = service.updatePass(memberVO);
		
		System.out.println(result);
		
		return result;
	}

	// 회원인증폼
	@RequestMapping(value = "auth.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String auth() throws Exception {

		logger.info("회원인증폼");

		return "modules/member/member_auth";
	}

	// 회원약관동의폼
	@SuppressWarnings("unused")
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

		logger.info("회원목록");

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

		logger.info("회원등록폼");

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/member/member_write";
	}

	// 회원그룹등록폼
	@RequestMapping(value = "write_group.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Writegroup(Model model, @ModelAttribute Criteria criteria, @ModelAttribute MemberVO memberVO)
			throws Exception {

		logger.info("회원그룹등록폼 ");

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

	// 회원수정폼
	@RequestMapping(value = "edit.do", method = RequestMethod.GET)
	public String Edit(Model model, @ModelAttribute Criteria criteria, @RequestParam int member_idx)
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
	public String Update(Model model, @ModelAttribute MemberVO memberVO, @ModelAttribute Criteria criteria,
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
					"read.do?member_idx=" + memberVO.getMember_idx() + "&category_idx=" + memberVO.getCategory_idx());
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

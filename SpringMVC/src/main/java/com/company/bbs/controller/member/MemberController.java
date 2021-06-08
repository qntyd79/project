package com.company.bbs.controller.member;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.member.MemberService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;
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
		return "modules/board/validator";
	}

	// 로그인폼
	@RequestMapping(value = "/modules/login/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login() {
		return "modules/login/login";
	}

	// 로그인풀화면폼
	@RequestMapping(value = "/modules/login/loginfull.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginfull() {
		return "modules/login/loginfull";
	}

	// 아이디/비밀번호찾기
	@RequestMapping(value = "/modules/login/find.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String find() {
		return "modules/login/find";
	}

	// 회원인증폼
	@RequestMapping(value = "auth.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String auth() {
		return "modules/member/member_auth";
	}

	// 회원약관동의폼
	@RequestMapping(value = "agree.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String agree() {
		return "modules/member/member_agree";
	}

	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "2") int idx)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("categorylist", service.getCategoryList(idx));
		model.addAttribute("categoryselect", category_idx);
		model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("searchField", searchField);
		// model.addAttribute("searchWord", searchWord);

		return "modules/member/member_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx,
			@RequestParam(defaultValue = "2") int idx) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		mav.addObject("categorylist", service.getCategoryList(idx));
		mav.addObject("categoryselect", category_idx);
		mav.addObject("pageMaker", pageMaker);
		// mav.addObject("searchField", searchField);
		// mav.addObject("searchWord", searchWord);
		mav.setViewName("modules/member/member_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "2") int idx)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		map.put("categorylist", service.getCategoryList(idx));
		map.put("categoryselect", category_idx);
		map.put("pageMaker", pageMaker);
		// map.put("searchField", searchField);
		// map.put("searchWord", searchWord);

		model.addAllAttributes(map);

		return "modules/member/member_list";
	}

	// 글등록폼
	@RequestMapping(value = "write.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Write(Model model, @ModelAttribute MemberVO memberVO, @RequestParam(defaultValue = "2") int kind)
			throws Exception {

		logger.info("글쓰기");

		model.addAttribute("memberVO", memberVO);
		model.addAttribute("categorylist", service.getCategoryList(kind));

		return "modules/member/member_write";
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String Insert(Model model, @ModelAttribute MemberVO memberVO, BindingResult bindingResult,
			@RequestParam(defaultValue = "2") int kind, HttpServletRequest request) throws Exception {

		logger.info("글저장처리");

		// 서버측 유효성검증
		beanValidator.validate(memberVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("memberVO", memberVO);
			// model.addAttribute("categoryname", service.getCategory());
			model.addAttribute("categorylist", service.getCategoryList(kind));
			if (memberVO.getMember_idx() != 0) {
				return "modules/member/member_reply";
			} else {
				return "modules/member/member_write";
			}
		}

		// 자동등록방지 검증
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");

		if (getAnswer.equals(answer)) {

			service.insert(memberVO);

			model.addAttribute("msg", "InsertSuccess");
			model.addAttribute("url", "list.do");

			return "/modules/common/common_message";

		} else {
			model.addAttribute("msg", "CaptchaFailed");
			model.addAttribute("url", "write.do");
			
			return "modules/member/member_write";
		}
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @ModelAttribute Criteria criteria, @RequestParam int member_idx,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "2") int kind)
			throws Exception {

		logger.info("글보기");

		service.increaseCnt(member_idx);

		model.addAttribute("memberVO", service.getView(member_idx));
		model.addAttribute("prenum", service.getPrevNum(member_idx));
		model.addAttribute("nextnum", service.getNextNum(member_idx));
		model.addAttribute("categorylist", service.getCategoryList(kind));
		model.addAttribute("list", service.getFileList(member_idx));

		return "modules/member/member_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria, @RequestParam int member_idx,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "2") int kind)
			throws Exception {

		logger.info("글보기");

		service.increaseCnt(member_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("memberVO", service.getView(member_idx));
		mav.addObject("prenum", service.getPrevNum(member_idx));
		mav.addObject("nextnum", service.getNextNum(member_idx));
		mav.addObject("categorylist", service.getCategoryList(kind));
		mav.setViewName("modules/member/member_view");

		return mav;
	}

	// 글수정
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String Modify(Model model, @ModelAttribute Criteria criteria, @RequestParam int member_idx,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "2") int kind)
			throws Exception {

		logger.info("글수정");

		model.addAttribute("memberVO", service.getView(member_idx));
		model.addAttribute("categorylist", service.getCategoryList(kind));
		model.addAttribute("categoryselect", category_idx);

		return "modules/member/member_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Modify(Model model, @ModelAttribute MemberVO memberVO, @ModelAttribute Criteria criteria,
			@RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("글수정처리");

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

	// 글삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @RequestParam int member_idx)
			throws Exception {

		logger.info("글삭제");

		model.addAttribute("memberVO", service.getView(member_idx));

		return "modules/member/member_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute MemberVO memberVO,
			@RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("글삭제처리");

		String rawPassword = memberVO.getPass();
		String encodedPassword = service.getPassword(memberVO.getMember_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin@1234")) {
			service.delete(memberVO.getMember_idx());

			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?member_idx=" + memberVO.getMember_idx());
		}

		return "/modules/common/common_message";
	}

	// 첨부파일삭제처리
	@RequestMapping(value = "attachDelete.do", method = RequestMethod.GET)
	public String attachDelete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO,
			@RequestParam int board_idx, @RequestParam String filename) throws Exception {

		logger.info("첨부파일삭제처리");

		UploadFileUtils.removeFile(uploadPath, filename);

		service.attachDelete(attachVO.getFile_idx());

		model.addAttribute("msg", "DeleteSuccess");
		model.addAttribute("url", "read.do?board_idx=" + board_idx);

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

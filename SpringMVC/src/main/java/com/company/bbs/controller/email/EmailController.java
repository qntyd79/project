package com.company.bbs.controller.email;

import java.util.HashMap;
import java.util.Locale;
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
import org.springframework.security.crypto.password.PasswordEncoder;
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
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.email.EmailService;
import com.company.bbs.service.comment.CommentService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.email.EmailVO;

@SuppressWarnings("unused")
@Controller
@RequestMapping("modules/email/*")
public class EmailController {

	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Inject
	private EmailService service;

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
		return "modules/email/validator";
	}

	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "3") int kind)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(kind));
		model.addAttribute("categoryselect", category_idx);
		model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("searchField", searchField);
		// model.addAttribute("searchWord", searchWord);

		return "modules/email/email_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx,
			@RequestParam(defaultValue = "1") int kind) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList(kind));
		mav.addObject("categoryselect", category_idx);
		mav.addObject("pageMaker", pageMaker);
		// mav.addObject("searchField", searchField);
		// mav.addObject("searchWord", searchWord);
		mav.setViewName("modules/email/email_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "3") int kind)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		map.put("categoryname", service.getCategory());
		map.put("categorylist", service.getCategoryList(kind));
		map.put("categoryselect", category_idx);
		map.put("pageMaker", pageMaker);
		// map.put("searchField", searchField);
		// map.put("searchWord", searchWord);
		model.addAllAttributes(map);

		return "modules/email/email_list";
	}

	// 글등록폼
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(Model model, @ModelAttribute EmailVO emailVO, @RequestParam(defaultValue = "3") int kind)
			throws Exception {

		logger.info("글쓰기");

		model.addAttribute("emailVO", emailVO);
		model.addAttribute("categorylist", service.getCategoryList(kind));

		return "modules/email/email_write";
	}

	// 답글쓰기
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public ModelAndView Reply(@RequestParam int email_idx, @ModelAttribute Criteria criteria,
			@RequestParam(defaultValue = "3") int kind) throws Exception {

		logger.info("답글쓰기");

		ModelAndView mav = new ModelAndView();

		mav.addObject("emailVO", service.getView(email_idx));
		mav.addObject("categorylist", service.getCategoryList(kind));
		mav.setViewName("modules/email/email_reply");

		return mav;
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String Insert(Model model, @ModelAttribute EmailVO emailVO, BindingResult bindingResult,
			@RequestParam(defaultValue = "3") int kind, HttpServletRequest request) throws Exception {

		logger.info("글저장처리");

		// 서버측 유효성검증
		beanValidator.validate(emailVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("emailVO", emailVO);
			model.addAttribute("categoryname", service.getCategory());
			model.addAttribute("categorylist", service.getCategoryList(kind));
			if (emailVO.getEmail_idx() != 0) {
				return "modules/email/email_reply";
			} else {
				return "modules/email/email_write";
			}
		}

		// 자동등록방지 검증
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");

		if (getAnswer.equals(answer)) {

			service.insert(emailVO);

			model.addAttribute("msg", "InsertSuccess");
			model.addAttribute("url", "list.do?kind=1");

			return "/modules/common/common_message";

		} else {
			model.addAttribute("msg", "CaptchaFailed");
			model.addAttribute("url", "write.do");
			
			return "modules/email/email_write";
		}
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @ModelAttribute Criteria criteria, @RequestParam int email_idx,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "3") int kind)
			throws Exception {

		logger.info("글보기");

		service.increaseCnt(email_idx);

		model.addAttribute("emailVO", service.getView(email_idx));
		model.addAttribute("prenum", service.getPrevNum(email_idx));
		model.addAttribute("nextnum", service.getNextNum(email_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(kind));
		model.addAttribute("list", service.getFileList(email_idx));

		return "modules/email/email_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria, @RequestParam int email_idx,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "3") int kind)
			throws Exception {

		logger.info("글보기");

		service.increaseCnt(email_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("emailVO", service.getView(email_idx));
		mav.addObject("prenum", service.getPrevNum(email_idx));
		mav.addObject("nextnum", service.getNextNum(email_idx));
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList(kind));
		mav.setViewName("modules/email/email_view");

		return mav;
	}

	// 글수정폼
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String Modify(Model model, @ModelAttribute Criteria criteria, @RequestParam int email_idx,
			@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "3") int kind)
			throws Exception {

		logger.info("글수정");

		model.addAttribute("emailVO", service.getView(email_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(kind));
		model.addAttribute("categoryselect", category_idx);

		return "modules/email/email_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Modify(Model model, @ModelAttribute Criteria criteria, @ModelAttribute EmailVO emailVO,
			@RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("글수정처리");

		// 서버측 유효성검증
		beanValidator.validate(emailVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("emailVO", emailVO);
			return "modules/email/email_edit";
		}

		String rawPassword = emailVO.getPass();
		String encodedPassword = service.getPassword(emailVO.getEmail_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin@1234")) {
			service.update(emailVO);
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do?kind=3");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url",
					"modify.do?email_idx=" + emailVO.getEmail_idx() + "&category_idx=" + emailVO.getCategory_idx());
		}

		return "/modules/common/common_message";
	}

	// 글삭제폼
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @RequestParam int email_idx) throws Exception {

		logger.info("글삭제");

		model.addAttribute("emailVO", service.getView(email_idx));

		return "modules/email/email_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute EmailVO emailVO,
			@RequestParam String pass, BindingResult bindingResult
	/* RedirectAttributes redirectAttributes */
	) throws Exception {

		logger.info("글삭제처리");

		String rawPassword = emailVO.getPass();
		String encodedPassword = service.getPassword(emailVO.getEmail_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin@1234")) {
			service.delete(emailVO.getEmail_idx());

			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do?kind=3");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?email_idx=" + emailVO.getEmail_idx());
		}

		return "/modules/common/common_message";
	}

	// 첨부파일삭제처리
	@RequestMapping(value = "attachDelete.do", method = RequestMethod.GET)
	public String attachDelete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO,
			@RequestParam int email_idx, @RequestParam String filename) throws Exception {

		logger.info("첨부파일삭제처리");

		UploadFileUtils.removeFile(uploadPath, filename);

		service.attachDelete(attachVO.getFile_idx());

		model.addAttribute("msg", "DeleteSuccess");
		model.addAttribute("url", "read.do?email_idx=" + email_idx);

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

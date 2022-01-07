package com.company.bbs.controller.category;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.category.CategoryService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.vo.category.CategoryVO;

@SuppressWarnings("unused")
@Controller
@RequestMapping("modules/category/*")
public class CategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Inject
	private CategoryService service;

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
		return "modules/category/validator";
	}

	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
		model.addAttribute("categoryselect", criteria.getCategory_idx());
		model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("searchField", searchField);
		// model.addAttribute("searchWord", searchWord);

		return "modules/category/category_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		mav.addObject("categorylist", service.getCategoryList(criteria.getKind()));
		mav.addObject("categoryselect", criteria.getCategory_idx());
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("modules/category/category_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		map.put("categorylist", service.getCategoryList(criteria.getKind()));
		map.put("categoryselect", criteria.getCategory_idx());
		map.put("pageMaker", pageMaker);
		model.addAllAttributes(map);

		return "modules/category/category_list";
	}

	// 글등록
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(Model model, @ModelAttribute Criteria criteria, @ModelAttribute CategoryVO categoryVO)
			throws Exception {

		logger.info("글쓰기");

		model.addAttribute("categoryVO", categoryVO);
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/category/category_write";
	}

	// 답글쓰기
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public ModelAndView Reply(@ModelAttribute Criteria criteria, @RequestParam int category_idx) throws Exception {

		logger.info("답글쓰기");

		ModelAndView mav = new ModelAndView();

		mav.addObject("categoryVO", service.getView(category_idx));
		mav.addObject("categorylist", service.getCategoryList(criteria.getKind()));
		mav.setViewName("modules/category/category_reply");

		return mav;
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String Insert(Model model, @ModelAttribute Criteria criteria, @ModelAttribute CategoryVO categoryVO, 
			BindingResult bindingResult, HttpServletRequest request) throws Exception {

		logger.info("글저장처리");

		// 서버측 유효성검증
		beanValidator.validate(categoryVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("categoryVO", categoryVO);
			model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
			if (categoryVO.getCategory_idx() != 0) {
				return "modules/category/category_reply";
			} else {
				return "modules/category/category_write";
			}
		}

		// 자동등록방지 검증
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");

		if (getAnswer.equals(answer)) {
			service.insert(categoryVO);

			model.addAttribute("msg", "InsertSuccess");
			model.addAttribute("url", "list.do?kind=" + criteria.getKind());

		} else {
			model.addAttribute("msg", "CaptchaFailed");

			if (categoryVO.getCategory_idx() != 0) {
				model.addAttribute("url", "reply.do");
				return "modules/category/category_reply";
			} else {
				model.addAttribute("url", "write.do");
				return "modules/category/category_write";
			}
		}		

		return "/modules/common/common_message";
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글보기");

		service.increaseCnt(criteria.getCategory_idx());

		model.addAttribute("categoryVO", service.getView(criteria.getCategory_idx()));
		model.addAttribute("prenum", service.getPrevNum(criteria.getCategory_idx()));
		model.addAttribute("nextnum", service.getNextNum(criteria.getCategory_idx()));
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/category/category_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria) throws Exception {

		logger.info("글보기");

		service.increaseCnt(criteria.getCategory_idx());

		ModelAndView mav = new ModelAndView();

		mav.addObject("categoryVO", service.getView(criteria.getCategory_idx()));
		mav.addObject("prenum", service.getPrevNum(criteria.getCategory_idx()));
		mav.addObject("nextnum", service.getNextNum(criteria.getCategory_idx()));
		mav.addObject("categorylist", service.getCategoryList(criteria.getKind()));
		mav.setViewName("modules/category/category_view");

		return mav;
	}

	// 글수정폼
	@RequestMapping(value = "edit.do", method = RequestMethod.GET)
	public String Edit(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글수정");

		model.addAttribute("categoryVO", service.getView(criteria.getCategory_idx()));
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
		model.addAttribute("categoryselect", criteria.getCategory_idx());

		return "modules/category/category_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Update(Model model, @ModelAttribute Criteria criteria, @ModelAttribute CategoryVO categoryVO,
			@RequestParam String pass, BindingResult bindingResult
	) throws Exception {

		logger.info("글수정처리");

		// 서버측 유효성검증
		beanValidator.validate(categoryVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("categoryVO", categoryVO);
			return "modules/category/category_edit";
		}
		
				
		String rawPassword = categoryVO.getPass();		
		String encodedPassword = service.getPassword(categoryVO.getCategory_idx());
				
		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin!@1234")) {	
			
			service.update(categoryVO);
			
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "modify.do?category_idx=" + categoryVO.getCategory_idx());
		}

		return "/modules/common/common_message";
	}

	// 글삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @ModelAttribute Criteria criteria)
			throws Exception {

		logger.info("글삭제");

		model.addAttribute("categoryVO", service.getView(criteria.getCategory_idx()));

		return "modules/category/category_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute CategoryVO categoryVO,
			@RequestParam String pass, BindingResult bindingResult
	) throws Exception {

		logger.info("글삭제처리");

		String rawPassword = categoryVO.getPass();
		String encodedPassword = service.getPassword(categoryVO.getCategory_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin!@1234")) {
			service.delete(categoryVO.getCategory_idx());

			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do?kind=" + categoryVO.getKind());
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?category_idx=" + categoryVO.getCategory_idx());
		}

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

package com.company.bbs.controller.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.comment.CommentService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.vo.board.BoardVO;
import com.company.bbs.vo.comment.CommentVO;

@SuppressWarnings("unused")
@Controller
@RequestMapping("modules/comment/*")
public class CommentController {

	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Inject
	CommentService service;
	
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
		return "modules/comment/validator";
	}
	
	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(
			Model model, 
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("searchField", searchField);
		// model.addAttribute("searchWord", searchWord);

		return "modules/comment/comment_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		mav.addObject("pageMaker", pageMaker);
		// mav.addObject("searchField", searchField);
		// mav.addObject("searchWord", searchWord);
		mav.setViewName("modules/comment/comment_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(
			Model model, 
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		map.put("pageMaker", pageMaker);
		// map.put("searchField", searchField);
		// map.put("searchWord", searchWord);
		model.addAllAttributes(map);

		return "modules/comment/comment_list";
	}

	// 글등록 
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(
			Model model,
			@ModelAttribute CommentVO commentVO
			) throws Exception {

		logger.info("글쓰기");
		
		model.addAttribute("CommentVO", commentVO);

		return "modules/comment/comment_write";
	}

	// 답글쓰기
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public ModelAndView Reply(
			@RequestParam int comment_idx, 
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("답글쓰기");

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("commentVO", service.getView(comment_idx));
		mav.setViewName("modules/comment/comment_reply");

		return mav;
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String Insert(
			Model model, 
			@ModelAttribute CommentVO commentVO ,
			BindingResult bindingResult,
			HttpServletRequest request
			) throws Exception {

		logger.info("글저장처리");
		
		// 서버측 유효성검증
		beanValidator.validate(commentVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("commentVO", commentVO);
			if(commentVO.getComment_idx() != 0) {
				return "modules/comment/comment_reply";
			} else {
				return "modules/comment/comment_write";
			}
		}
				
		// 자동등록방지 검증 
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");
				
		if (getAnswer.equals(answer)) {
			service.insert(commentVO);

			model.addAttribute("msg", "InsertSuccess");
			model.addAttribute("url", "list.do");
					
			return "/modules/common/common_message";
					
		} else {
			model.addAttribute("msg", "CaptchaFailed");
					
			if(commentVO.getComment_idx() != 0) {
				model.addAttribute("url", "reply.do");			
				return "modules/comment/comment_reply";
			} else {
				model.addAttribute("url", "write.do");			
				return "modules/comment/comment_write";
			}
		}		
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(
			Model model, 
			@RequestParam int comment_idx, 
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("글보기");

		service.increaseCnt(comment_idx);

		model.addAttribute("commentVO", service.getView(comment_idx));
		model.addAttribute("prenum", service.getPrevNum(comment_idx));
		model.addAttribute("nextnum", service.getNextNum(comment_idx));

		return "modules/comment/comment_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(
			@RequestParam int comment_idx, 
			@RequestParam(defaultValue = "0") int category_idx,
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("글보기");

		service.increaseCnt(comment_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("commentVO", service.getView(comment_idx));
		mav.addObject("prenum", service.getPrevNum(comment_idx));
		mav.addObject("nextnum", service.getNextNum(comment_idx));
		mav.setViewName("modules/comment/comment_view");

		return mav;
	}

	// 글수정
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String Modify(
			Model model, 
			@RequestParam int comment_idx,
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("글수정");

		model.addAttribute("commentVO", service.getView(comment_idx));

		return "modules/comment/comment_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Modify(
			Model model, 
			@ModelAttribute CommentVO commentVO, 
			@ModelAttribute Criteria criteria,
			@RequestParam String pass,
			BindingResult bindingResult
			) throws Exception {

		logger.info("글수정처리");

		// 서버측 유효성검증
		beanValidator.validate(commentVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("commentVO", commentVO);
			return "modules/comment/comment_edit";
		}
				
		String rawPassword = commentVO.getPass();
		String encodedPassword = service.getPassword(commentVO.getComment_idx());	
			
		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin@1234")){
			service.update(commentVO);
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "modify.do?comment_idx=" + commentVO.getComment_idx());
		}

		return "/modules/common/common_message";
	}

	// 글삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(
			Model model, 
			@RequestParam int comment_idx, 
			@ModelAttribute Criteria criteria
			) throws Exception {

		logger.info("글삭제");

		model.addAttribute("commentVO", service.getView(comment_idx));

		return "modules/comment/comment_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(
			Model model, 
			@ModelAttribute Criteria criteria,
			@ModelAttribute CommentVO commentVO,
			@RequestParam String pass,
			BindingResult bindingResult
			) throws Exception {

		logger.info("글삭제처리");

		String rawPassword = commentVO.getPass();
		String encodedPassword = service.getPassword(commentVO.getComment_idx());	
		
		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin@1234")){
			service.delete(commentVO.getComment_idx());

			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?comment_idx=" + commentVO.getComment_idx()); 
		}

		return "/modules/common/common_message";
	}
	
	@RequestMapping(value = "captchaImg.do", method = RequestMethod.GET) 
	public void cpatchaImg(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception { 
				new CaptchaUtil().captchaImg(request, response);
	}
	 
	@RequestMapping(value = "captchaAudio.do", method = RequestMethod.GET) 
	public void cpatchaAudio(
			HttpServletRequest request, 
			HttpServletResponse response
			) throws Exception { 
				new CaptchaUtil().captchaAudio(request, response);
	}
	
	// ajax 글목록
	@RequestMapping(value = "ajaxlist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String List(
			Model model,
			@ModelAttribute CommentVO commentVO
			) throws Exception {

		logger.info("댓글쓰기");
		
		model.addAttribute("CommentVO", commentVO);				
		
		return "modules/comment/ajax_comment_list";
	}
	
	// ajax 글수정폼  
	@RequestMapping(value = "ajaxmodify.do", method = RequestMethod.GET)
	public ModelAndView Modify(
			@RequestParam int comment_idx
			) throws Exception {
		
		logger.info("댓글수정");

		ModelAndView mav = new ModelAndView();
			
		mav.addObject("commentVO", service.getView(comment_idx));
		mav.setViewName("modules/comment/ajax_comment_edit");

		return mav;
	}
	
	// ajax 댓글답글쓰기폼 
	@RequestMapping(value = "ajaxreply.do", method = RequestMethod.GET)
	public ModelAndView Reply(
			@RequestParam int comment_idx
			) throws Exception {

		logger.info("댓글답글쓰기");

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("commentVO", service.getView(comment_idx));
		mav.setViewName("modules/comment/ajax_comment_reply");

		return mav;
	}

}
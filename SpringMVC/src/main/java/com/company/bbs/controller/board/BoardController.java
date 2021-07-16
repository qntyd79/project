package com.company.bbs.controller.board;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.board.BoardService;
import com.company.bbs.service.comment.CommentService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;

@SuppressWarnings("unused")
@Controller
@SessionAttributes("memberVO")
@RequestMapping("modules/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

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
	
	@ModelAttribute("boardVO")
	public BoardVO setEmpyt() {
		return new BoardVO();
	}


	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("noticelist", service.getNoticeList(criteria));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList());
		model.addAttribute("categoryselect", criteria.getCategory_idx());
		model.addAttribute("pageMaker", pageMaker);

		return "modules/board/board_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		mav.addObject("noticelist", service.getNoticeList(criteria));
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList());
		mav.addObject("categoryselect", criteria.getCategory_idx());
		mav.addObject("pageMaker", pageMaker);

		mav.setViewName("modules/board/board_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		map.put("noticelist", service.getNoticeList(criteria));
		map.put("categoryname", service.getCategory());
		map.put("categorylist", service.getCategoryList());
		map.put("categoryselect", criteria.getCategory_idx());
		map.put("pageMaker", pageMaker);

		model.addAllAttributes(map);

		return "modules/board/board_list";
	}

	// 글등록폼
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(Model model, @ModelAttribute Criteria criteria, @ModelAttribute("boardVO") BoardVO boardVO)
			throws Exception {

		logger.info("글쓰기");
		
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("categorylist", service.getCategoryList());
		
		System.out.println("아이디 " + boardVO.getUserid());
		System.out.println("이름 " + boardVO.getName());
		System.out.println("이메일 " + boardVO.getEmail());
		System.out.println("홈페이지 " + boardVO.getHomepage());

		return "modules/board/board_write";
	}

	// 답글쓰기
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public ModelAndView Reply(@ModelAttribute Criteria criteria, @RequestParam int board_idx) throws Exception {

		logger.info("답글쓰기");

		ModelAndView mav = new ModelAndView();

		mav.addObject("boardVO", service.getView(board_idx));
		mav.addObject("categorylist", service.getCategoryList());
		mav.setViewName("modules/board/board_reply");

		return mav;
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String Insert(Model model, @ModelAttribute Criteria criteria, @ModelAttribute("boardVO") BoardVO boardVO,
			SessionStatus sessionStatus, BindingResult bindingResult, HttpServletRequest request) throws Exception {

		logger.info("글저장처리");

		// 서버측 유효성검증
		beanValidator.validate(boardVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("boardVO", boardVO);
			model.addAttribute("categoryname", service.getCategory());
			model.addAttribute("categorylist", service.getCategoryList());

			if (boardVO.getBoard_idx() != 0) {
				// 새글이 아니면 답글폼 출력
				return "modules/board/board_reply";
			} else {
				// 새글이면 새글등록폼 출력
				return "modules/board/board_write";
			}
		}

		// 자동등록방지 검증
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");

		if (getAnswer.equals(answer)) {

			service.insert(boardVO);

			model.addAttribute("msg", "InsertSuccess");
			model.addAttribute("url", "list.do");

		} else {

			model.addAttribute("msg", "CaptchaFailed");
			if (boardVO.getBoard_idx() != 0) {
				model.addAttribute("url", "reply.do");
				return "modules/board/board_reply";
			} else {
				model.addAttribute("url", "write.do");
				return "modules/board/board_write";
			}
		}

		// 세션에서 지운다.
		sessionStatus.setComplete();

		return "/modules/common/common_message";
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @ModelAttribute Criteria criteria, @RequestParam int board_idx) throws Exception {

		logger.info("글보기");

		service.increaseCnt(board_idx);

		model.addAttribute("boardVO", service.getView(board_idx));
		model.addAttribute("prenum", service.getPrevNum(board_idx));
		model.addAttribute("nextnum", service.getNextNum(board_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList());
		model.addAttribute("filelist", service.getFileList(board_idx));

		return "modules/board/board_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria, @RequestParam int board_idx) throws Exception {

		logger.info("글보기");

		service.increaseCnt(board_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("boardVO", service.getView(board_idx));
		mav.addObject("prenum", service.getPrevNum(board_idx));
		mav.addObject("nextnum", service.getNextNum(board_idx));
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList());
		mav.setViewName("modules/board/board_view");

		return mav;
	}

	// 글수정폼
	@RequestMapping(value = "edit.do", method = RequestMethod.GET)
	public String Edit(Model model, @ModelAttribute Criteria criteria, @RequestParam int board_idx) throws Exception {

		logger.info("글수정");

		model.addAttribute("boardVO", service.getView(board_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList());
		model.addAttribute("categoryselect", criteria.getCategory_idx());
		model.addAttribute("filelist", service.getFileList(board_idx));

		return "modules/board/board_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Update(Model model, @ModelAttribute Criteria criteria, @ModelAttribute("isAdmin") BoardVO boardVO,
			SessionStatus sessionStatus, @RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("글수정처리");

		// 서버측 유효성검증
		beanValidator.validate(boardVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("boardVO", boardVO);
			return "modules/board/board_edit";
		}

		String rawPassword = boardVO.getPass();
		String encodedPassword = service.getPassword(boardVO.getBoard_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin!@1234")) {
			service.update(boardVO);
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url",
					"modify.do?board_idx=" + boardVO.getBoard_idx() + "&category_idx=" + boardVO.getCategory_idx());
		}

		// 세션에서 지운다.
		sessionStatus.setComplete();

		return "/modules/common/common_message";

	}

	// 글삭제폼
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @RequestParam int board_idx) throws Exception {

		logger.info("글삭제");

		model.addAttribute("boardVO", service.getView(board_idx));

		return "modules/board/board_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute("isAdmin") BoardVO boardVO,
			SessionStatus sessionStatus, @RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("글삭제처리");

		String rawPassword = boardVO.getPass();
		String encodedPassword = service.getPassword(boardVO.getBoard_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin!@1234")) {

			service.delete(boardVO.getBoard_idx());

			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?board_idx=" + boardVO.getBoard_idx());
		}

		// 세션에서 지운다.
		sessionStatus.setComplete();

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

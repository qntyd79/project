package com.company.bbs.controller.board;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.ResultMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.attach.AttachService;
import com.company.bbs.service.board.BoardService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;
import com.company.bbs.vo.comment.CommentVO;

@Controller
@SessionAttributes("memberVO")
@RequestMapping("modules/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	@Inject
	private AttachService fservice;

	// 첨부파일 저장경로 설정
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 암호화 설정
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

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

	// 클라이언트측 유효성검증 설정 https://web-obj.tistory.com/456 참고
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
		//model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList());
		model.addAttribute("categoryselect", criteria.getCategory_idx());
		model.addAttribute("pageMaker", pageMaker);

		return "modules/board/board_list";
	}

	@RequestMapping(value = "ajaxlist.do")
	public String indexListAjax(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("ajax 글목록");

		List<ResultMap> list = new ArrayList<>();

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

		return "modules/board/ajax_board_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria) throws Exception {

		// logger.info("글목록");

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

		return "modules/board/board_write";
	}

	// ajax 글등록폼
	@RequestMapping(value = "ajaxwrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String ajaxWrite(Model model, @ModelAttribute Criteria criteria, @ModelAttribute("boardVO") BoardVO boardVO)
			throws Exception {

		logger.info("ajax 글쓰기");

		model.addAttribute("boardVO", boardVO);
		model.addAttribute("categorylist", service.getCategoryList());

		return "modules/board/ajax_board_write";
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

			// 글저장프로세스
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
	public String Read(Model model, @ModelAttribute Criteria criteria, @RequestParam int board_idx,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		logger.info("글보기");

		// 클라이언트가 보낸 쿠키 읽기 (HttpServletRequest에서 읽기)
		// 쿠키가 없으면 null이 반환됨
		Cookie[] cookies = request.getCookies();

		// 비교하기 위해 새로운 쿠키
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + board_idx)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}

		if (viewCookie == null) {
			System.out.println("cookie 없음");

			// 쿠키 생성(이름, 값)
			Cookie newCookie = new Cookie("cookie" + board_idx, "|" + board_idx + "|");

			// 쿠키 시간 설정(쿠키 유지시간 24시간)
			newCookie.setMaxAge(60 * 60 * 24);

			// 쿠키 추가
			response.addCookie(newCookie);

			// 쿠키를 추가 시키고 조회수 증가시
			service.increaseCnt(board_idx);

		} else {
			// 쿠키 값 받아옴.
			String value = viewCookie.getValue();
			System.out.println("cookie 값 : " + value);
		}

		model.addAttribute("boardVO", service.getView(board_idx));
		model.addAttribute("prenum", service.getPrevNum(board_idx));
		model.addAttribute("nextnum", service.getNextNum(board_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList());
		model.addAttribute("filelist", service.getFileList(board_idx));

		return "modules/board/board_view";
	}

	// ajax 글보기
	@RequestMapping(value = "ajaxread.do", method = RequestMethod.GET)
	public String ajaxRead(Model model, @ModelAttribute Criteria criteria, @RequestParam int board_idx,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		logger.info("글보기");

		// 클라이언트가 보낸 쿠키 읽기 (HttpServletRequest에서 읽기)
		// 쿠키가 없으면 null이 반환됨
		Cookie[] cookies = request.getCookies();

		// 비교하기 위해 새로운 쿠키
		Cookie viewCookie = null;

		// 쿠키가 있을 경우
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				// Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌
				if (cookies[i].getName().equals("cookie" + board_idx)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}

		if (viewCookie == null) {
			System.out.println("cookie 없음");

			// 쿠키 생성(이름, 값)
			Cookie newCookie = new Cookie("cookie" + board_idx, "|" + board_idx + "|");

			// 쿠키 시간 설정(쿠키 유지시간 24시간)
			newCookie.setMaxAge(60 * 60 * 24);

			// 쿠키 추가
			response.addCookie(newCookie);

			// 쿠키를 추가 시키고 조회수 증가시
			service.increaseCnt(board_idx);

		} else {
			// 쿠키 값 받아옴.
			String value = viewCookie.getValue();
			System.out.println("cookie 값 : " + value);
		}

		model.addAttribute("boardVO", service.getView(board_idx));
		model.addAttribute("prenum", service.getPrevNum(board_idx));
		model.addAttribute("nextnum", service.getNextNum(board_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList());
		model.addAttribute("filelist", service.getFileList(board_idx));

		return "modules/board/ajax_board_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria, @RequestParam int board_idx) throws Exception {

		logger.info("글보기");

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
			// 글수정처리프로세스
			service.update(boardVO);
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url",
					"edit.do?board_idx=" + boardVO.getBoard_idx() + "&category_idx=" + boardVO.getCategory_idx());
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

	// 체크박스글삭제처리(ajax)
	@ResponseBody
	@RequestMapping(value = "checkdelete.do", method = RequestMethod.POST)
	public int checkDelete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute("isAdmin") BoardVO boardVO,
			@RequestParam(value = "check[]") List<String> valueArr) throws Exception {

		logger.info("체크박스글삭제처리");

		int result = 0;
		int checkNum = 0;

		for (String i : valueArr) {
			checkNum = Integer.parseInt(i);
			boardVO.setBoard_idx(checkNum);
			service.delete(boardVO.getBoard_idx());
		}

		result = 1;

		return result;
	}

	// 첨부파일 삭제처리
	@RequestMapping(value = "fileDelete.do", method = RequestMethod.GET)
	public String attachDelete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO,
			@RequestParam int board_idx, @RequestParam String filename) throws Exception {

		logger.info("첨부파일삭제처리");

		UploadFileUtils.removeFile(uploadPath, filename);

		service.attachDelete(attachVO.getFile_idx());

		model.addAttribute("msg", "DeleteSuccess");
		model.addAttribute("url", "read.do?board_idx=" + board_idx);

		return "/modules/common/common_message";
	}

	// 첨부파일 다운로드
	@RequestMapping(value = "fileDownload.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void fileDownload(@ModelAttribute AttachVO attachVO, @RequestParam int file_idx, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		logger.info("파일다운로드");

		AttachVO file = fservice.getView(file_idx);

		String saveFileName = file.getFile_hash_name();
		String originalFileName = file.getFile_name();

		// thumb_삭제
		saveFileName = saveFileName.replace("thumb_", "");
		logger.info("thumb_제거 : " + saveFileName);

		File downloadFile = new File(uploadPath + saveFileName);

		byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);

		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
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

package com.company.bbs.controller.attach;

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

import com.company.bbs.service.attach.AttachService;
import com.company.bbs.utill.CaptchaUtil;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.board.BoardVO;

@SuppressWarnings("unused")
@Controller
@RequestMapping("modules/attach/*")
public class AttachController {

	private static final Logger logger = LoggerFactory.getLogger(AttachController.class);

	@Inject
	private AttachService service;

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
		return "modules/attach/validator";
	}

	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
		model.addAttribute("categoryselect", criteria.getCategory_idx());
		model.addAttribute("pageMaker", pageMaker);

		return "modules/attach/attach_list";
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
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList(criteria.getKind()));
		mav.addObject("categoryselect", criteria.getCategory_idx());
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("modules/attach/attach_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글목록");

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

		return "modules/attach/attach_list";
	}

	// 글등록폼
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO)
			throws Exception {

		logger.info("글쓰기");

		model.addAttribute("attachVO", attachVO);
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/attach/attach_write";
	}

	// 글등록폼(ajax)
	@RequestMapping(value = "ajaxwrite.do", method = RequestMethod.GET)
	public String ajaxWrite(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO)
			throws Exception {

		logger.info("글쓰기");

		model.addAttribute("attachVO", attachVO);
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/attach/ajax_attach_write";
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String Insert(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO,
			BindingResult bindingResult, HttpServletRequest request, @RequestParam("attach") MultipartFile[] attach)
			throws Exception {

		logger.info("글저장처리");

		// 서버측 유효성검증
		beanValidator.validate(attachVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("attachVO", attachVO);
			model.addAttribute("categoryname", service.getCategory());
			model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

			return "modules/attach/attach_write";
		}

		// 자동등록방지 검증
		String getAnswer = (String) request.getSession().getAttribute("captcha");
		String answer = request.getParameter("answer");

		if (getAnswer.equals(answer)) {

			// 파일 업로드 처리
			// String fileName=null;
			// MultipartFile uploadFile = attachVO.getAttach();
			// https://to-dy.tistory.com/95 참고
			for (MultipartFile file : attach) {

				if (file != null && file.getOriginalFilename() != null && file.getSize() != 0) {

					logger.info("------------- file start -------------");
					logger.info("fileName : " + file.getOriginalFilename());
					logger.info("fileSize : " + file.getSize());
					logger.info("contentType : " + file.getContentType());
					logger.info("server FileName : " + file.getName());
					logger.info("-------------- file end --------------\n");

					// UploadFileUtils 사용하여 저장
					String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),
							file.getBytes());
					attachVO.setFile_name(file.getOriginalFilename());
					attachVO.setFile_hash_name(savedName);
					attachVO.setFile_size(file.getSize());
					attachVO.setFile_type(file.getContentType());

					// 파일확장자
					String fileName = file.getOriginalFilename();
					int index = fileName.lastIndexOf(".");
					String fileExt = fileName.substring(index + 1);
					attachVO.setFile_ext(fileExt);
				}

				service.insert(attachVO);
			}

			model.addAttribute("msg", "InsertSuccess");
			model.addAttribute("url", "list.do");

			return "/modules/common/common_message";

		} else {
			model.addAttribute("msg", "CaptchaFailed");
			model.addAttribute("url", "write.do");

			return "modules/attach/attach_write";
		}
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @ModelAttribute Criteria criteria, @RequestParam int file_idx,
			@RequestParam(defaultValue = "0") int board_idx) throws Exception {

		logger.info("글보기");

		service.increaseCnt(file_idx);

		model.addAttribute("list", service.getFileList(board_idx));
		model.addAttribute("attachVO", service.getView(file_idx));
		model.addAttribute("prenum", service.getPrevNum(file_idx));
		model.addAttribute("nextnum", service.getNextNum(file_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));

		return "modules/attach/attach_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria, @RequestParam int file_idx) throws Exception {

		logger.info("글보기");

		service.increaseCnt(file_idx);

		ModelAndView mav = new ModelAndView();
		mav.addObject("attachVO", service.getView(file_idx));
		mav.addObject("prenum", service.getPrevNum(file_idx));
		mav.addObject("nextnum", service.getNextNum(file_idx));
		mav.addObject("categoryname", service.getCategory());
		mav.addObject("categorylist", service.getCategoryList(criteria.getKind()));
		mav.setViewName("modules/attach/attach_view");

		return mav;
	}

	// 글수정폼
	@RequestMapping(value = "update.do", method = RequestMethod.GET)
	public String Update(Model model, @ModelAttribute Criteria criteria, @RequestParam int file_idx) throws Exception {

		logger.info("글수정");

		model.addAttribute("attchVO", service.getView(file_idx));
		model.addAttribute("categoryname", service.getCategory());
		model.addAttribute("categorylist", service.getCategoryList(criteria.getKind()));
		model.addAttribute("categoryselect", criteria.getCategory_idx());

		return "modules/attach/attach_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Update(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO,
			@RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("글수정처리");

		// 서버측 유효성검증
		beanValidator.validate(attachVO, bindingResult);

		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if (bindingResult.hasErrors()) {
			model.addAttribute("attchVO", attachVO);
			return "modules/attach/attach_edit";
		}
		
		BoardVO boardVO = new BoardVO();
		
		String rawPassword = boardVO.getPass();		
		//String rawPassword = attachVO.getPass();
		String encodedPassword = service.getPassword(attachVO.getFile_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin!@1234")) {
			service.update(attachVO);
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url",
					"modify.do?file_idx=" + attachVO.getFile_idx() + "category_idx=" + attachVO.getCategory_idx());
		}

		return "/modules/common/common_message";
	}

	// 글삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @RequestParam int file_idx) throws Exception {

		logger.info("글삭제");

		model.addAttribute("attachVO", service.getView(file_idx));

		return "modules/attach/attach_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @ModelAttribute AttachVO attachVO,
			@RequestParam String pass, BindingResult bindingResult) throws Exception {

		logger.info("글삭제처리");
		
		BoardVO boardVO = new BoardVO();
		
		String rawPassword = boardVO.getPass();
		//String rawPassword = attachVO.getPass();
		String encodedPassword = service.getPassword(attachVO.getFile_idx());

		if (passwordEncoder.matches(rawPassword, encodedPassword) || pass.equals("admin!@1234")) {
			service.delete(attachVO.getFile_idx());

			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?file_idx=" + attachVO.getFile_idx());
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

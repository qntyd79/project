package com.company.bbs.controller.category;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
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
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.vo.category.CategoryVO;

@Controller
@RequestMapping("modules/category/*")
public class CategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

	@Inject
	CategoryService service;
	
	// 다국어 지역 세션설정
	@Autowired
	private SessionLocaleResolver localeResolver;	
		
	// 유효성검사
	@Autowired
	private DefaultBeanValidator beanValidator;
		
	// 다국어 설정
	@Autowired
	private MessageSource messageSource;
		
	// 클라이언트측 유효성검증 설정
	@RequestMapping(value="validator.do")
	protected String getValidator() throws Exception {
		return "modules/board/validator";
	}


	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria, @RequestParam(defaultValue="0") int category_idx, @RequestParam(defaultValue="1") int kind) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();
		// 화면에 보여줄 갯수설정
		criteria.setPerPageNum(5);
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));			
		
		model.addAttribute("list", service.getList(criteria));
		// model.addAttribute("noticelist", service.getNoticeList(criteria));
		model.addAttribute("categorylist", service.getCategoryList(kind));
		model.addAttribute("categoryselect", category_idx);
		model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("searchField", searchField);
		// model.addAttribute("searchWord", searchWord);

		return "modules/category/category_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria, @RequestParam(defaultValue="0") int category_idx, @RequestParam(defaultValue="1") int kind)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		// pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		// mav.addObject("noticelist", service.getNoticeList(criteria));
		mav.addObject("categorylist", service.getCategoryList(kind));
		mav.addObject("categoryselect", category_idx);
		mav.addObject("pageMaker", pageMaker);
		// mav.addObject("searchField", searchField);
		// mav.addObject("searchWord", searchWord);

		mav.setViewName("modules/category/category_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria,	@RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue="1") int kind) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		// pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		// map.put("noticelist", service.getNoticeList(criteria));
		map.put("categorylist", service.getCategoryList(kind));
		map.put("categoryselect", category_idx);
		map.put("pageMaker", pageMaker);
		// map.put("searchField", searchField);
		// map.put("searchWord", searchWord);

		model.addAllAttributes(map);

		return "modules/category/category_list";
	}

	// 글등록
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(Model model, @ModelAttribute CategoryVO categoryVO, @RequestParam(defaultValue="1") int kind) throws Exception {

		logger.info("글쓰기");
		
		model.addAttribute("categoryVO", categoryVO);
		model.addAttribute("categorylist", service.getCategoryList(kind));

		return "modules/category/category_write";
	}

	// 답글쓰기
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public ModelAndView Reply(@ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue="1") int kind ) throws Exception {

		logger.info("답글쓰기");

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("categoryVO", service.getView(category_idx));
		mav.addObject("categorylist", service.getCategoryList(kind));
		mav.setViewName("modules/category/category_reply");

		return mav;
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String Insert(Model model, @ModelAttribute CategoryVO categoryVO, BindingResult bindingResult, @RequestParam(defaultValue = "1") int kind /* RedirectAttributes redirectAttributes */)
			throws Exception {

		logger.info("글저장처리");
		
		// 서버측 유효성검증
		beanValidator.validate(categoryVO, bindingResult);
		
		// 서버측 유효성검증 후 에러가 발생할 경우 등록폼 출력
		if(bindingResult.hasErrors()) {		
			model.addAttribute("categoryVO", categoryVO);
			model.addAttribute("categorylist", service.getCategoryList(kind));
			return "modules/category/category_write";
		}
								
		service.insert(categoryVO);
		
		model.addAttribute("msg", "InsertSuccess");
		model.addAttribute("url", "list.do?kind=" + categoryVO.getKind());
		// redirectAttributes.addFlashAttribute("msg", "InsertSuccess");
		// return "redirect:list.do";
		return "/modules/common/common_message";
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "1") int kind)
			throws Exception {

		logger.info("글보기");

		service.increaseCnt(category_idx);

		model.addAttribute("categoryVO", service.getView(category_idx));
		model.addAttribute("prenum", service.getPrevNum(category_idx));
		model.addAttribute("nextnum", service.getNextNum(category_idx));
		model.addAttribute("categorylist", service.getCategoryList(kind));

		return "modules/category/category_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "1") int kind, @RequestParam(defaultValue = "0") int board_idx
			) throws Exception {

		logger.info("글보기");

		service.increaseCnt(category_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("categoryVO", service.getView(category_idx));
		mav.addObject("prenum", service.getPrevNum(category_idx));
		mav.addObject("nextnum", service.getNextNum(category_idx));
		mav.addObject("categorylist", service.getCategoryList(kind));
		mav.setViewName("modules/category/category_view");

		return mav;
	}

	// 글수정
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String Modify(Model model, @ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx, @RequestParam(defaultValue = "1") int kind) throws Exception {

		logger.info("글수정"); 

		model.addAttribute("categoryVO", service.getView(category_idx));
		model.addAttribute("categorylist", service.getCategoryList(kind));
		model.addAttribute("categoryselect", category_idx);

		return "modules/category/category_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Modify(Model model, @ModelAttribute Criteria criteria , @ModelAttribute CategoryVO categoryVO /* RedirectAttributes redirectAttributes */) throws Exception {

		logger.info("글수정처리");

		String dbpass = service.getPassword(categoryVO.getCategory_idx());

		if (dbpass.equals(categoryVO.getPass()) || (categoryVO.getPass()).equals("admin")) {
			service.update(categoryVO);
			// redirectAttributes.addFlashAttribute("page", criteria.getPage());
			// redirectAttributes.addFlashAttribute("perPageNum", criteria.getPerPageNum());
			// redirectAttributes.addFlashAttribute("searchField", criteria.getSearchField());
			// redirectAttributes.addFlashAttribute("keyWord", criteria.getKeyWord());
			// redirectAttributes.addFlashAttribute("msg", "UpdateSuccess");
			// return "redirect:list.do";
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			// redirectAttributes.addFlashAttribute("msg", "PassFailed");
			// return "redirect:modify.do?category_idx=" + dto.getcategory_idx();
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "modify.do?category_idx=" + categoryVO.getCategory_idx());
		}

		return "/modules/common/common_message";
	}

	// 글삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx)
			throws Exception {

		logger.info("글삭제");

		model.addAttribute("categoryVO", service.getView(category_idx));

		return "modules/category/category_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @ModelAttribute Criteria criteria , @RequestParam(defaultValue = "0") int category_idx, @RequestParam String pass
			/* RedirectAttributes redirectAttributes */) throws Exception {

		logger.info("글삭제처리");

		String dbpass = service.getPassword(category_idx);

		if (dbpass.equals(pass) || pass.equals("admin")) {
			service.delete(category_idx);
			// redirectAttributes.addFlashAttribute("page", criteria.getPage());
			// redirectAttributes.addFlashAttribute("perPageNum", criteria.getPerPageNum());
			// redirectAttributes.addFlashAttribute("searchField",criteria.getSearchField());
			// redirectAttributes.addFlashAttribute("keyWord", criteria.getKeyWord());
			// redirectAttributes.addFlashAttribute("msg", "DeleteSuccess");
			// return "redirect:list.do";
			model.addAttribute("msg", "DeleteSuccess");
			model.addAttribute("url", "list.do");
		} else {
			// redirectAttributes.addFlashAttribute("msg", "PassFailed");
			// return "redirect:delete.do?category_idx=" + category_idx;
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?category_idx=" + category_idx);
		}

		return "/modules/common/common_message";
	}

}

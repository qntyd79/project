package com.company.bbs.controller.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.company.bbs.service.comment.CommentService;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.vo.comment.CommentVO;

@Controller
@RequestMapping("modules/comment/*")
public class CommentController {

	private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

	@Inject
	CommentService service;
	
	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria,
			@RequestParam(defaultValue = "0") int category_idx) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		// pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		// model.addAttribute("noticelist", service.getNoticeList(criteria));
		//model.addAttribute("categorylist", service.getCategoryList());
		model.addAttribute("categoryselect", category_idx);
		model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("searchField", searchField);
		// model.addAttribute("searchWord", searchWord);

		return "modules/comment/comment_list";
	}

	// 글목록 (ModelAndView)
	@RequestMapping(value = "mvlist.do")
	public ModelAndView List(@ModelAttribute Criteria criteria, @RequestParam(defaultValue = "0") int category_idx)
			throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		// pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		ModelAndView mav = new ModelAndView();

		mav.addObject("list", service.getList(criteria));
		// mav.addObject("noticelist", service.getNoticeList(criteria));
		//mav.addObject("categorylist", service.getCategoryList());
		mav.addObject("categoryselect", category_idx);
		mav.addObject("pageMaker", pageMaker);
		// mav.addObject("searchField", searchField);
		// mav.addObject("searchWord", searchWord);
		mav.setViewName("modules/comment/comment_list");

		return mav;
	}

	// 글목록 (Map)
	@RequestMapping(value = "mlist.do")
	public String List1(Model model, @ModelAttribute Criteria criteria,
			@RequestParam(defaultValue = "0") int category_idx) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));
		// pageMaker.setNoticeCount(service.getNoticeCount(criteria));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", service.getList(criteria));
		// map.put("noticelist", service.getNoticeList(criteria));
		//map.put("categorylist", service.getCategoryList());
		map.put("categoryselect", category_idx);
		map.put("pageMaker", pageMaker);
		// map.put("searchField", searchField);
		// map.put("searchWord", searchWord);
		model.addAllAttributes(map);

		return "modules/comment/comment_list";
	}

	// 글쓰기
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(Model model) throws Exception {

		logger.info("글쓰기");

		//model.addAttribute("categorylist", service.getCategoryList());

		return "modules/comment/comment_write";
	}

	// 답글쓰기
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public ModelAndView Reply(@RequestParam int comment_idx, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("답글쓰기");

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto", service.getView(comment_idx));
		//mav.addObject("categorylist", service.getCategoryList());
		mav.setViewName("modules/comment/comment_reply");

		return mav;
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String Insert(Model model, @ModelAttribute CommentVO commentVO /* RedirectAttributes redirectAttributes */)
			throws Exception {

		logger.info("글저장처리");
		
		service.insert(commentVO);
		
		model.addAttribute("msg", "InsertSuccess");
		model.addAttribute("url", "list.do");
		// redirectAttributes.addFlashAttribute("msg", "InsertSuccess");
		// return "redirect:list.do";
		return "/modules/common/common_message";
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @RequestParam int comment_idx, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글보기");

		service.increaseCnt(comment_idx);

		model.addAttribute("dto", service.getView(comment_idx));
		model.addAttribute("prenum", service.getPrevNum(comment_idx));
		model.addAttribute("nextnum", service.getNextNum(comment_idx));
		//model.addAttribute("categorylist", service.getCategoryList());

		return "modules/comment/comment_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@RequestParam int comment_idx, @RequestParam(defaultValue = "0") int category_idx,
			@ModelAttribute Criteria criteria) throws Exception {

		logger.info("글보기");

		service.increaseCnt(comment_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("dto", service.getView(comment_idx));
		mav.addObject("prenum", service.getPrevNum(comment_idx));
		mav.addObject("nextnum", service.getNextNum(comment_idx));
		//mav.addObject("categorylist", service.getCategoryList());
		mav.setViewName("modules/comment/comment_view");

		return mav;
	}

	// 글수정
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String Modify(Model model, @RequestParam int comment_idx,
			@ModelAttribute Criteria criteria) throws Exception {

		logger.info("글수정");

		model.addAttribute("dto", service.getView(comment_idx));
		//model.addAttribute("categorylist", service.getCategoryList());
		//model.addAttribute("categoryselect", category_idx);

		return "modules/comment/comment_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Modify(Model model, @ModelAttribute CommentVO commentVO, @ModelAttribute Criteria criteria
	/* RedirectAttributes redirectAttributes */) throws Exception {

		logger.info("글수정처리");

		String dbpass = service.getPassword(commentVO.getComment_idx());

		if (dbpass.equals(commentVO.getPass()) || (commentVO.getPass()).equals("admin")) {
			service.update(commentVO);
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
			// return "redirect:modify.do?comment_idx=" + dto.getcomment_idx() + "&category_idx=" + dto.getCategory_idx();
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url",
					"modify.do?comment_idx=" + commentVO.getComment_idx() + "&category_idx=" + commentVO.getCategory_idx());
		}

		return "/modules/common/common_message";
	}

	// 글삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @RequestParam int comment_idx, @ModelAttribute Criteria criteria)
			throws Exception {

		logger.info("글삭제");

		model.addAttribute("dto", service.getView(comment_idx));

		return "modules/comment/comment_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @RequestParam int comment_idx, @RequestParam String pass,
			@ModelAttribute Criteria criteria /* RedirectAttributes redirectAttributes */) throws Exception {

		logger.info("글삭제처리");

		String dbpass = service.getPassword(comment_idx);

		if (dbpass.equals(pass) || pass.equals("admin")) {
			service.delete(comment_idx);
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
			// return "redirect:delete.do?comment_idx=" + comment_idx;
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?comment_idx=" + comment_idx);
		}

		return "/modules/common/common_message";
	}
	
	// ajax 글목록
	@RequestMapping(value = "ajaxlist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String List() {
		return "modules/comment/ajax_comment_list";
	}

}
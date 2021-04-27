package com.company.bbs.controller.email;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.company.bbs.service.email.EmailService;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.vo.email.EmailVO;

@Controller
@RequestMapping("modules/email/*")
public class EmailController {

	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);

	@Inject
	EmailService service; // 서비스를 호출하기위한 의존성 주입

	// 메일발송폼
	@RequestMapping(value = "send.do", method = RequestMethod.GET)
	public String Send() throws Exception {

		logger.info("메일발송폼");

		return "modules/email/send";
	}

	// 메일발송
	@RequestMapping(value = "sending.do", method = RequestMethod.POST)
	public String Send(Model model, @ModelAttribute EmailVO emailVO) throws Exception {

		logger.info("메일발송");

		// 메일발송 유틸사용
		try {
			service.sendMailTest(emailVO);
			model.addAttribute("msg", "MailSuccess");
			model.addAttribute("url", "send.do");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "MailFailed"); // 이메일 발송이 실패되었다는 메시지를 출력
		}
			
		return "/modules/common/common_message";
	}

	// 글목록 (Model)
	@RequestMapping(value = "list.do")
	public String List(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(service.getCount(criteria));

		model.addAttribute("list", service.getList(criteria));
		model.addAttribute("pageMaker", pageMaker);
		// model.addAttribute("searchField", searchField);
		// model.addAttribute("searchWord", searchWord);

		return "modules/email/email_list";
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
		mav.addObject("pageMaker", pageMaker);
		// mav.addObject("searchField", searchField);
		// mav.addObject("searchWord", searchWord);
		mav.setViewName("modules/email/email_list");

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
		map.put("pageMaker", pageMaker);
		// map.put("searchField", searchField);
		// map.put("searchWord", searchWord);
		model.addAllAttributes(map);

		return "modules/email/email_list";
	}

	// 글쓰기
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write() throws Exception {

		logger.info("글쓰기");

		return "modules/email/email_write";
	}

	// 답글쓰기
	@RequestMapping(value = "reply.do", method = RequestMethod.GET)
	public ModelAndView Reply(@RequestParam int email_idx, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("답글쓰기");

		ModelAndView mav = new ModelAndView();

		mav.addObject("dto", service.getView(email_idx));
		mav.setViewName("modules/email/email_reply");

		return mav;
	}

	// 글저장
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public String Insert(Model model, @ModelAttribute EmailVO emailVO /* RedirectAttributes redirectAttributes */)
			throws Exception {

		logger.info("글저장처리");

		// 메일발송 유틸사용
		service.sendMail(emailVO);

		// 발송된 메일 저장
		service.insert(emailVO);

		model.addAttribute("msg", "InsertSuccess");
		model.addAttribute("url", "list.do");
		// redirectAttributes.addFlashAttribute("msg", "InsertSuccess");
		// return "redirect:list.do";
		return "/modules/common/common_message";
	}

	// 글보기
	@RequestMapping(value = "read.do", method = RequestMethod.GET)
	public String Read(Model model, @RequestParam int email_idx, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글보기");

		service.increaseCnt(email_idx);

		model.addAttribute("dto", service.getView(email_idx));
		model.addAttribute("prenum", service.getPrevNum(email_idx));
		model.addAttribute("nextnum", service.getNextNum(email_idx));

		return "modules/email/email_view";
	}

	// 글보기
	@RequestMapping(value = "mvread.do", method = RequestMethod.GET)
	public ModelAndView Read(@RequestParam int email_idx, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글보기");

		service.increaseCnt(email_idx);

		ModelAndView mav = new ModelAndView();

		mav.addObject("dto", service.getView(email_idx));
		mav.addObject("prenum", service.getPrevNum(email_idx));
		mav.addObject("nextnum", service.getNextNum(email_idx));
		mav.setViewName("modules/email/email_view");

		return mav;
	}

	// 글수정
	@RequestMapping(value = "modify.do", method = RequestMethod.GET)
	public String Modify(Model model, @RequestParam int email_idx, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글수정");

		model.addAttribute("dto", service.getView(email_idx));

		return "modules/email/email_edit";
	}

	// 글수정처리
	@RequestMapping(value = "update.do", method = RequestMethod.POST)
	public String Modify(Model model, @ModelAttribute EmailVO emailVO, @ModelAttribute Criteria criteria
	/* RedirectAttributes redirectAttributes */) throws Exception {

		logger.info("글수정처리");

		String dbpass = service.getPassword(emailVO.getEmail_idx());

		if (dbpass.equals(emailVO.getPass()) || (emailVO.getPass()).equals("admin")) {
			service.update(emailVO);
			// redirectAttributes.addFlashAttribute("page", criteria.getPage());
			// redirectAttributes.addFlashAttribute("perPageNum", criteria.getPerPageNum());
			// redirectAttributes.addFlashAttribute("searchField",
			// criteria.getSearchField());
			// redirectAttributes.addFlashAttribute("keyWord", criteria.getKeyWord());
			// redirectAttributes.addFlashAttribute("msg", "UpdateSuccess");
			// return "redirect:list.do";
			model.addAttribute("msg", "UpdateSuccess");
			model.addAttribute("url", "list.do");
		} else {
			// redirectAttributes.addFlashAttribute("msg", "PassFailed");
			// return "redirect:modify.do?email_idx=" + dto.getemail_idx() +
			// "&category_idx=" + dto.getCategory_idx();
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "modify.do?email_idx=" + emailVO.getEmail_idx());
		}

		return "/modules/common/common_message";
	}

	// 글삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public String Delete(Model model, @RequestParam int email_idx, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("글삭제");

		model.addAttribute("dto", service.getView(email_idx));

		return "modules/email/email_delete";
	}

	// 글삭제처리
	@RequestMapping(value = "delete.do", method = RequestMethod.POST)
	public String Delete(Model model, @RequestParam int email_idx, @RequestParam String pass,
			@ModelAttribute Criteria criteria /* RedirectAttributes redirectAttributes */) throws Exception {

		logger.info("글삭제처리");

		String dbpass = service.getPassword(email_idx);

		if (dbpass.equals(pass) || pass.equals("admin")) {
			service.delete(email_idx);
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
			// return "redirect:delete.do?email_idx=" + email_idx;
			model.addAttribute("msg", "PassFailed");
			model.addAttribute("url", "delete.do?email_idx=" + email_idx);
		}

		return "/modules/common/common_message";
	}

}

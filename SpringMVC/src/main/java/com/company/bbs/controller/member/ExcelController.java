package com.company.bbs.controller.member;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.service.member.MemberService;
import com.company.bbs.utill.Criteria;
import com.company.bbs.vo.member.MemberVO;

@Controller
@RequestMapping("modules/member/*")
public class ExcelController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

	@Inject
	MemberService service;

	// 첨부파일 저장경로 설정
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 회원목록 엑셀업로드
	@RequestMapping(value = "excelUpload.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String excelUpload(Model model, @RequestParam("attach") MultipartFile attach) throws Exception {

		logger.info("엑셀파일 업로드");

		List<MemberVO> list = service.excelFilUploadProcess(attach);

		if (list != null) {
			model.addAttribute("msg", "LoginSuccess");
			model.addAttribute("url", "list.do");
		} else {
			model.addAttribute("msg", "LoginFailed");
			model.addAttribute("url", "list.do");
		}

		return "/modules/common/common_message";

	}

	// 회원목록 엑셀다운로드
	@RequestMapping(value = "excelDownload.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String excelDownload(Model model, @ModelAttribute Criteria criteria) throws Exception {

		logger.info("다운로드폼");

		// 회원목록 가져오기
		List<MemberVO> list = service.getExcelList();

		// 회원목록 엑셀다운로드
		SXSSFWorkbook workbook = service.excelFileDownloadProcess(list);

		model.addAttribute("locale", Locale.KOREA);
		model.addAttribute("workbook", workbook);
		model.addAttribute("workbookName", "회원목록");

		// 스프링설정 context-file에서 빈설정
		return "excelDownloadView";
	}

}

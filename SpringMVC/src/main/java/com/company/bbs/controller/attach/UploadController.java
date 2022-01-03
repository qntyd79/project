package com.company.bbs.controller.attach;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.attach.AttachService;
import com.company.bbs.utill.MediaUtils;
import com.company.bbs.utill.UploadFileUtils;
import com.company.bbs.vo.attach.AttachVO;
import com.google.gson.JsonObject;

@SuppressWarnings("unused")
@Controller
@RequestMapping("modules/attach/*")
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Inject
	private AttachService service;

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
	// @Autowired
	// private DefaultBeanValidator beanValidator;

	// 클라이언트측 유효성검증 설정
	// @RequestMapping(value = "validator.do")
	// protected String getValidator() throws Exception {
	// return "modules/attach/validator";
	// }

	@Resource(name = "uploadPath") 
	private String uploadPath;	
	//private String uploadPath = "/Users/ojeonghwan/git/project/SpringMVC/src/main/webapp/resources/upload";

	// 1.일반적인 방식
	// 파일폼
	@RequestMapping(value = "write1.do", method = RequestMethod.GET)
	public String Write(Model model, @ModelAttribute AttachVO attachVO, @RequestParam(defaultValue = "1") int kind)
			throws Exception {

		logger.info("글쓰기");

		model.addAttribute("attachVO", attachVO);
		model.addAttribute("categorylist", service.getCategoryList(kind));

		return "modules/attach/attach_write";
	}

	// 파일등록
	@RequestMapping(value = "write.do", method = RequestMethod.POST)
	public String Write(Model model, @RequestParam MultipartFile[] attach) throws Exception {

		logger.info("일반 파일업로드");

		for (MultipartFile file : attach) {
			if (file != null && file.getOriginalFilename() != null && file.getSize() != 0) {
				logger.info("------------- file start -------------");
				logger.info("fileName : " + file.getOriginalFilename());
				logger.info("fileSize : " + file.getSize());
				logger.info("contentType : " + file.getContentType());
				logger.info("server FileName : " + file.getName());
				logger.info("-------------- file end --------------\n");

				// UploadFileUtils 사용하여 저장
				String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				model.addAttribute("savedName", savedName);
				model.addAttribute("msg", "UploadSuccess");
			} else {
				model.addAttribute("msg", "UploadFailed");
			}
		}

		model.addAttribute("url", "write.do");

		return "/modules/common/common_message";	
	}

	// 파일저장함수
	private String uploadFile(String originalName, byte[] fileDate) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileDate, target);

		return savedName;
	}

	// ckEditor 업로드설정 https://ninedc.tistory.com/54
	@RequestMapping(value = "ckUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public void ckUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile[] upload)
			throws Exception {

		logger.info("ckUpload 진입 =========================================");
		
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		
		// 절대경로 webapp폴더 경로설정
		HttpSession session = req.getSession(); 
	    String rootPath = session.getServletContext().getRealPath("/"); 
		//String uploadPath1 = rootPath + "resources/upload";
		  
		// 인코딩 
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		for (MultipartFile file : upload) {
			if (file != null && file.getOriginalFilename() != null && file.getSize() != 0) {
				logger.info("------------- file start -------------");
				logger.info("fileName : " + file.getOriginalFilename());
				logger.info("fileSize : " + file.getSize());
				logger.info("contentType : " + file.getContentType());
				logger.info("server FileName : " + file.getName());
				logger.info("-------------- file end --------------\n");
				
				// UploadFileUtils 사용하여 저장
				String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				
				logger.info("파일저장 경로 : " + savedName);
				
				String callback = req.getParameter("CKEditorFuncNum");
				printWriter = res.getWriter();
				String fileName = file.getOriginalFilename();
				String fileUrl = rootPath + "/resources/upload" + savedName;
				
				System.out.println("fileUrl : " + fileUrl);
				
				// 업로드시 메시지 출력
				printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction(" + callback +",'"+ fileUrl +"','이미지를 업로드하였습니다.')" +"</script>");
				
				// json 데이터로 등록
                // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                json.addProperty("uploaded", 1);
                json.addProperty("fileName", fileName);
                json.addProperty("url", fileUrl);
				
				printWriter.println(json);
				printWriter.flush();	
			}
		}
	}

	// 2.Ajax 방식
	@RequestMapping(value = "upload.do", method = RequestMethod.GET)
	public void Upload() throws Exception {
	}

	// 파일등록
	@ResponseBody
	@RequestMapping(value = "upload.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> Upload(MultipartFile file) throws Exception {

		ResponseEntity<String> entity = null;

		logger.info("Ajax 파일업로드");

		try {
			logger.info("------------- file start -------------");
			logger.info("fileName : " + file.getOriginalFilename());
			logger.info("fileSize : " + file.getSize());
			logger.info("contentType : " + file.getContentType());
			logger.info("server FileName : " + file.getName());
			logger.info("-------------- file end --------------");

			// UploadFileUtils함수 사용하여 저장
			entity = new ResponseEntity<>(
					UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
					HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 파일미리보기
	@ResponseBody
	@RequestMapping(value = "display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(String fileName) throws Exception {

		InputStream in = null;
		ResponseEntity<byte[]> entity = null;

		logger.info("File name: " + fileName);

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}

		return entity;
	}

	// 파일삭제
	@ResponseBody
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ResponseEntity<String> delete(String fileName) throws Exception {

		logger.info("delete file:" + fileName);

		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		MediaType mType = MediaUtils.getMediaType(formatName);

		if (mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}

		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

}
package com.company.bbs.controller.attach;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.utill.MediaUtils;
import com.company.bbs.utill.UploadFileUtils;

@Controller
@RequestMapping("modules/attach/*")
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	// @Autowired("uploadPaht")
	// private String uploadPath;
	private String uploadPath = "C:\\Users\\ohjeonghwan\\OneDrive\\Web-Project\\WEB_app\\Spring_Project\\src\\main\\webapp\\resources\\data";

	// 절대경로 webapp폴더 경로설정
	// String rootPath = request.getSession().getServletContext().getRealPath("/");
	// String uploadPath = rootPath + "resources/upload/";

	// 일반적인 방식
	// 파일폼
	@RequestMapping(value = "write.do", method = RequestMethod.GET)
	public String Write(Model model) throws Exception {

		logger.info("글쓰기");

		//model.addAttribute("categorylist", service.getCategoryList());

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
		// return "modules/attach/attach_write";
	}

	// 파일저장함수
	@SuppressWarnings("unused")
	private String uploadFile(String originalName, byte[] fileDate) throws Exception {

		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileDate, target);

		return savedName;
	}

	// Ajax 파일업로드
	@RequestMapping(value = "upload.do", method = RequestMethod.GET)
	public void Upload() throws Exception {

	}
	
	// 파일등록
	@ResponseBody
	@RequestMapping(value = "upload.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> Upload(MultipartFile file) throws Exception {

		logger.info("Ajax 파일업로드");

		logger.info("------------- file start -------------");
		logger.info("fileName : " + file.getOriginalFilename());
		logger.info("fileSize : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		logger.info("server FileName : " + file.getName());
		logger.info("-------------- file end --------------");

		// UploadFileUtils함수 사용하여 저장
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
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
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
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
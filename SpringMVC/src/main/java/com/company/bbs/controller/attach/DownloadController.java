package com.company.bbs.controller.attach;

import java.io.File;
import java.net.URLEncoder;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.company.bbs.service.attach.AttachService;
import com.company.bbs.vo.attach.AttachVO;

@Controller
@RequestMapping("modules/attach/*")
public class DownloadController {

	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);

	@Inject
	private AttachService service;

	@Resource(name = "uploadPath") 
	private String uploadPath;	

	@RequestMapping(value = "filedownload.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void fileDownload(@ModelAttribute AttachVO attachVO, @RequestParam int file_idx, HttpServletRequest request, HttpServletResponse response) throws Exception {

		logger.info("파일다운로드");
		
		AttachVO file = service.getView(file_idx);
		
		String saveFileName = file.getFile_hash_name();
        String originalFileName = file.getFile_name();
        
        File downloadFile = new File(uploadPath + saveFileName);
        
        byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);
        
        response.setContentType("application/octet-stream");
        response.setContentLength(fileByte.length);
        
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8") +"\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        response.getOutputStream().write(fileByte);
        response.getOutputStream().flush();
        response.getOutputStream().close();
	}

}
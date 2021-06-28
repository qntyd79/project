package com.company.bbs.utill;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.web.multipart.MultipartFile;

import com.company.bbs.vo.attach.AttachVO;
import com.company.bbs.vo.email.EmailVO;

public class MailSendUtils {

	private static final Logger logger = LoggerFactory.getLogger(MailSendUtils.class);

	@Inject
	private JavaMailSenderImpl mailSender;

	public MailSendUtils(JavaMailSenderImpl mailSender) throws MessagingException {
		this.mailSender = mailSender;
	}

	// 메일보내기 https://offbyone.tistory.com/167
	public String sendMailing(EmailVO emailVO, String uploadPath) throws Exception {

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@SuppressWarnings("unused")
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); // true 멀티파트사용

				helper.setFrom(emailVO.getSendemail(), "노라조"); // 보내는메일
				helper.setTo(emailVO.getToemail()); // 받는메일
				helper.setSubject(emailVO.getTitle()); // 메일제목
				helper.setText(emailVO.getContent(), true); // 메일내용 true html사용

				// 이미지첨부
				// String contents = emailVO.getContent() + "<img src=\"cid:DUKE.gif\">";
				// helper.setText(contents, true);
				// helper.addInline(emailVO.getFile_name(), file);
				
				// 첨부파일 처리
				AttachVO attachVO = new AttachVO();
				
				MultipartFile[] attach = emailVO.getAttach(); // 첨부파일 배열
				
				if (attach == null)
					return; // 첨부파일이 없으면 종료

				// 첨부파일 db저장처리
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
						
						FileSystemResource file1 = new FileSystemResource(new File(uploadPath + savedName));
						helper.addAttachment(file.getOriginalFilename(), file1);
					}

					
				}	
				
			}
		};

		mailSender.send(preparator);

		return "result";
	}
}

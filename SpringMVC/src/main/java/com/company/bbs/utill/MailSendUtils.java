package com.company.bbs.utill;

import java.io.File;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

import com.company.bbs.vo.email.EmailVO;

public class MailSendUtils {

	@SuppressWarnings("unused")
	private final Logger logger = LoggerFactory.getLogger(MailSendUtils.class);

	@Inject
	private JavaMailSenderImpl mailSender;

	public MailSendUtils(JavaMailSenderImpl mailSender) throws MessagingException {
		this.mailSender = mailSender;
	}

	// 메일보내기
	public String sendMailing(EmailVO emailVO) throws Exception {
		
		//MimeMessagePreparator[] preparators = new MimeMessagePreparator[mails.size()];	
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); // true 멀티파트사용

				helper.setFrom(emailVO.getSendemail()); // 보내는메일
				helper.setTo(emailVO.getToemail()); // 받는메일
				helper.setSubject(emailVO.getTitle()); // 메일제목
				helper.setText(emailVO.getContent(), true); // 메일내용 true html사용
				
				// 이미지첨부				
				//String contents = emailVO.getContent() + "<img src=\"cid:DUKE.gif\">"; 
				//helper.setText(contents, true);

				//String pathToAttachment = null;
				// 첨부파일포함
				//FileSystemResource file = new FileSystemResource(new File(pathToAttachment));
				//helper.addAttachment("Invoice", file);
				//helper.addInline("DUKE.gif", file);
			}
		};

		mailSender.send(preparator);

		return "result";
	}
}

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
		//message = this.mailSender.createMimeMessage();
		//messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	/*
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}

	public void setText(String htmlContent) throws MessagingException {
		messageHelper.setText(htmlContent, true);
	}

	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email, name);
	}

	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}

	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}

	public void send() {
		try {
			mailSender.send(message);
        }catch (Exception e) {
            e.printStackTrace();
        }
	}
	*/
	
		
	// 텍스트 단순 메일보내기
	public String sendMessage(EmailVO dto) throws Exception {

		SimpleMailMessage message = new SimpleMailMessage();

		message.setTo(dto.getToemail());
		message.setSubject(dto.getTitle());
		message.setText(dto.getContent());

		mailSender.send(message);
		return null;
	}

	// HTML 메일보내기
	public void sendHtmlMessage(String to, String subject, String text, String pathToAttachment) throws Exception {

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(text);

		mailSender.send(message);
	}

	// 첨부파일 포함 메일보내기
	public void sendAttachMessage(String to, String subject, String text, String pathToAttachment)
			throws Exception {

		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		helper.setTo(to);
		helper.setSubject(subject);
		helper.setText(text);

		FileSystemResource file = new FileSystemResource(new File(pathToAttachment));
		helper.addAttachment("Invoice", file);

		mailSender.send(message);
	}

	// 메일보내기 테스트
	public void sendMail(String to, String subject, String text) throws Exception {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

				//helper.setFrom(dto.getSendemail()); // recipient
				helper.setTo(to); // sender
				helper.setSubject(subject); // mail title
				helper.setText(text, true); // mail content
			}
		};

		mailSender.send(preparator);
	}

	// 이메일템플릿
	/*
	 * @Bean public SimpleMailMessage templateSimpleMessage() { SimpleMailMessage
	 * message = new SimpleMailMessage();
	 * message.setText("This is the test email template for your email:\n%s\n");
	 * return message; }
	 * 
	 * @Autowired public SimpleMailMessage template;
	 * 
	 * String text = String.format(template.getText(), templateArgs);
	 * sendSimpleMessage(to, subject, text);
	 */

}

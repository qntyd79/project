package com.company.bbs.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.company.bbs.service.member.MemberService;
import com.company.bbs.vo.member.MemberVO;

@Controller
@RequestMapping("modules/member/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Inject
	MemberService service;

	// 암호화 설정
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	// 로그인폼
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login() throws Exception {
		return "modules/member/member_login";
	}
	
	// 로그인풀화면폼
	@RequestMapping(value = "loginfull.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginfull() throws Exception {

		return "modules/member/member_loginfull";
	}

	// 로그인처리
	@RequestMapping(value = "loginCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, @ModelAttribute MemberVO memberVO, HttpSession session) throws Exception {

		logger.info("회원로그인처리");

		String rawPassword = memberVO.getPass();
		logger.info("로그인폼 비밀번호 " + rawPassword);

		String encodedPassword = service.getLoginPassword(memberVO.getEmail());
		logger.info("DB 비밀번호 " + encodedPassword);
		
		boolean passMatch = passwordEncoder.matches(rawPassword, encodedPassword);
		memberVO.setPass(encodedPassword);

		boolean result = service.loginCheck(memberVO, session);
		

		if (result != true && encodedPassword == null ) {
			model.addAttribute("msg", "UserFailed");
			model.addAttribute("url", "login.do");		
		} else if (result != true && passMatch != true) {
			model.addAttribute("isAdmin", null);
			model.addAttribute("msg", "LoginFailed");
			model.addAttribute("url", "login.do");			
		} else {
			model.addAttribute("msg", "LoginSuccess");
			model.addAttribute("url", "../../index.do");	
		}

		return "/modules/common/common_message";
	}
	
	// 로그아웃
	@RequestMapping(value = "logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(Model model, HttpSession session) throws Exception {

		service.logout(session);

		model.addAttribute("msg", "LogoutSuccess");
		model.addAttribute("url", "login.do");

		return "/modules/common/common_message";
	}

}

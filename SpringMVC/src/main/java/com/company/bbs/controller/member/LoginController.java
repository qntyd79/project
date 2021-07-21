package com.company.bbs.controller.member;

import java.util.HashMap;

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
import org.springframework.web.bind.annotation.RequestParam;

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
	public String login(Model model, @ModelAttribute MemberVO memberVO) throws Exception {

		logger.info("회원로그인폼");

		model.addAttribute("memberVO", memberVO);

		return "modules/member/member_login";
	}

	// 로그인처리
	@RequestMapping(value = "loginCheck.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, @ModelAttribute MemberVO memberVO, HttpSession session) throws Exception {

		logger.info("회원로그인처리");

		String rawPassword = memberVO.getPass();
		logger.info("로그인폼 비밀번호 " + rawPassword);

		String encodedPassword = service.getLoginPassword(memberVO.getUserid());
		logger.info("DB 비밀번호 " + encodedPassword);

		boolean passMatch = passwordEncoder.matches(rawPassword, encodedPassword);
		memberVO.setPass(encodedPassword);

		boolean result = service.loginCheck(memberVO, session);

		if (result == true && passMatch == true) {
			model.addAttribute("isAdmin", null);
			model.addAttribute("msg", "LoginSuccess");
			model.addAttribute("url", "../../index.do");
		} else {
			model.addAttribute("msg", "LoginFailed");
			model.addAttribute("url", "login.do");
		}

		return "/modules/common/common_message";
	}

	// 로그인풀화면폼
	@RequestMapping(value = "loginfull.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginfull() throws Exception {

		return "modules/member/member_loginfull";
	}

	// 로그아웃
	@RequestMapping(value = "logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(Model model, HttpSession session) throws Exception {

		service.logout(session);

		model.addAttribute("msg", "LogoutSuccess");
		model.addAttribute("url", "login.do");

		return "/modules/common/common_message";
	}

	// 카카오계정 로그인폼 https://linkeverything.github.io/springboot/kakao-login-3/
	@RequestMapping(value = "kakaoLogin")
	public String kakaoLogin() {
		
		logger.info("카카오계정 로그인폼");
		
		StringBuffer loginUrl = new StringBuffer();
		
		loginUrl.append("https://kauth.kakao.com/oauth/authorize?client_id=");
		loginUrl.append("fb9baa40fdf2fd4b68931ad19a07a720");
		loginUrl.append("&redirect_uri=");
		loginUrl.append("http://localhost:8090/modules/member/kakaocallback");
		loginUrl.append("&response_type=code");

		return "redirect:" + loginUrl.toString();
	}

	// 카카오계정 
	@RequestMapping(value = "kakaocallback", method = RequestMethod.GET)
	public String redirectkakao(@RequestParam String code, HttpSession session) throws Exception {
		
		logger.info("카카오계정 로그인처리");
		
		System.out.println(code);

		// 접속토큰 get
		String kakaoToken = service.getReturnAccessToken(code);

		// 접속자 정보 get
		HashMap<String, Object> userInfo = service.getUserInfo(kakaoToken);
		
		System.out.println("컨트롤러 출력" + userInfo);
		
		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("kakaoinfo", userInfo.get("email"));
            session.setAttribute("kakaonickname", userInfo.get("nickname"));
            session.setAttribute("profile_image", userInfo.get("profile_image"));
            session.setAttribute("kakaoToken", kakaoToken);
        }
        
        System.out.println("###email#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
        System.out.println("###kakaoToken#### : " + kakaoToken);
		
		/*
		SessionConfigVO configVO = new SessionConfigVO();
		configVO.setUser_name((String) result.get("nickname"));
		configVO.setProfile_img((String) result.get("profile_image"));

		session.setAttribute("sessionConfigVO", configVO);
		*/

		return "redirect:/";
	}

	// 카카오계정 로그아웃
	@RequestMapping(value = "kakaologout.do")
	public String kakaoLogout(Model model, HttpSession session) throws Exception {
		
		String kakaoToken = (String)session.getAttribute("kakaoToken");		
		
		if(kakaoToken != null && !"".equals(kakaoToken)){
			service.getLogout((String) session.getAttribute("kakaoToken"));  
			
            session.removeAttribute("kakaoinfo");
            session.removeAttribute("kakaonickname");
            session.removeAttribute("profile_image");
            session.removeAttribute("kakaoToken");
        } else {
        	System.out.println("로그아웃 정상종료");
        }
		
		return "redirect:/";
		/*
		model.addAttribute("msg", "LogoutSuccess");
		model.addAttribute("url", "login.do");

		return "/modules/common/common_message";
		*/
	}

}

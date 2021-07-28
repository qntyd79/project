package com.company.bbs.controller.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

// https://hune.tistory.com/20?category=820384
@Controller
@RequestMapping("modules/member/*")
public class NaverLoginController {

	private static final Logger logger = LoggerFactory.getLogger(NaverLoginController.class);

	private final static String CLIENT_ID = "px0tM1NkYXMlMfwVAR0v";
	private final static String CLIENT_SECRET = "phMnV38dao";
	private final static String REDIRECT_URI = "http://localhost:8090/modules/member/navercallback";

	// 네이버계정 로그인폼
	@RequestMapping(value = "naverlogin")
	public String naverlogin() {

		logger.info("네이버계정 로그인폼");			

		StringBuffer loginUrl = new StringBuffer();

		loginUrl.append("https://nid.naver.com/oauth2.0/authorize?client_id=");
		loginUrl.append(CLIENT_ID);
		loginUrl.append("&client_secret=");
		loginUrl.append(CLIENT_SECRET);
		loginUrl.append("&redirect_uri=");
		loginUrl.append(REDIRECT_URI);
		loginUrl.append("&response_type=code");
		//loginUrl.append("&state=state");
		
		return "redirect:" + loginUrl.toString();
	}

	// 네이버계정 콜백
	@RequestMapping(value = "navercallback", method = RequestMethod.GET)
	public String navercallback(@RequestParam("code") String authorize_code, HttpSession session) throws Exception {

		logger.info("네이버계정 로그인처리");
		
		System.out.println(authorize_code);

		// 접속토큰 get
		String accessToken = getAccessToken(authorize_code);

		// 접속자 정보 get
		HashMap<String, Object> userInfo = getUserInfo(accessToken);

		System.out.println("컨트롤러 출력" + userInfo);

		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if (userInfo.get("email") != null) {
			session.setAttribute("naverinfo", userInfo.get("email"));
			session.setAttribute("name", userInfo.get("name"));
			session.setAttribute("profile_image", userInfo.get("profile_image"));
			session.setAttribute("accessToken", accessToken);
		}

		System.out.println("### email #### : " + userInfo.get("email"));
		System.out.println("### name #### : " + userInfo.get("name"));
		System.out.println("### profile_image #### : " + userInfo.get("profile_image"));
		System.out.println("### accessToke #### : " + accessToken);

		return "redirect:/";
	}

	// 네이버계정 로그아웃
	@RequestMapping(value = "naverlogout")
	public String naverlogout(Model model, HttpSession session) throws Exception {

		String accessToken = (String) session.getAttribute("accessToken");

		if (accessToken != null && !"".equals(accessToken)) {
			getLogout((String) session.getAttribute("accessToken"));

			session.removeAttribute("naverinfo");
			session.removeAttribute("name");
			session.removeAttribute("profile_image");
			session.removeAttribute("accessToken");
			
			model.addAttribute("msg", "LogoutSuccess");
			model.addAttribute("url", "../../index.do");

			return "/modules/common/common_message";			
		} 

		return "redirect:/";
	}

	// CSRF 방지를 위한 상태 토큰 생성 코드
	// 상태 토큰은 추후 검증을 위해 세션에 저장되어야 한다.
	public String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

	// 네이버계정 로그인 토큰 가져오기
	public String getAccessToken(String authorize_code) {

		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://nid.naver.com/oauth2.0/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// HttpURLConnection 설정 값 셋팅
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// buffer 스트림 객체 값 셋팅 후 요청
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + CLIENT_ID); // 앱 KEY VALUE
			sb.append("&client_secret=" + CLIENT_SECRET);
			sb.append("&redirect_uri=" + REDIRECT_URI); // 앱 CALLBACK 경로
			sb.append("&code=" + authorize_code);
			//sb.append("&state=state");
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// RETURN 값 result 변수에 저장
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			System.out.println(element);

			// 토큰 값 저장 및 리턴
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);

			br.close();
			bw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_token;
	}

	// 네이버계정 사용자정보 가져오기
	public HashMap<String, Object> getUserInfo(String access_token) {

		HashMap<String, Object> userInfo = new HashMap<>();

		String reqURL = "https://openapi.naver.com/v1/nid/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);
			conn.setRequestProperty("charset", "utf-8");

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			System.out.println("response : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성 / https://like-tomato.tistory.com/83
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject object = element.getAsJsonObject();

			JsonObject response = object.get("response").getAsJsonObject();

			String name = response.getAsJsonObject().get("name").getAsString();
			String email = response.getAsJsonObject().get("email").getAsString();
			//String profile_image = response.getAsJsonObject().get("profile_image").getAsString();

			userInfo.put("name", name);
			userInfo.put("email", email);
			//userInfo.put("profile_image", profile_image);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}

	// 카카오계정 로그아웃
	public void getLogout(String access_token) {

		String reqURL = "http://nid.naver.com/nidlogin.logout";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + access_token);

			int responseCode = conn.getResponseCode();
			System.out.println("네아버 로그아웃 responseCode : " + responseCode);

			if (responseCode == 400)
				throw new RuntimeException("네이버 로그아웃 도중 오류 발생");

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}

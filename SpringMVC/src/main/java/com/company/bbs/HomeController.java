package com.company.bbs;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Controller
@RequestMapping("/")
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) 
	 * public String home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "home"; }
	 */

	@Autowired
	SessionLocaleResolver localeResolver;
	
	@Autowired
	MessageSource messageSource;

	@RequestMapping(value = "i18n.do", method = RequestMethod.GET) 
	public String i18n(Locale locale, HttpServletRequest request, Model model) throws Exception { 
		// RequestMapingHandler로 부터 받은 Locale 객체를 출력해 봅니다. 
		logger.info("Welcome i18n! The client locale is {}.", locale); 
		// localeResolver 로부터 Locale 을 출력해 봅니다. 
		logger.info("Session locale is {}.", localeResolver.resolveLocale(request)); 
		logger.info("site.title : {}", messageSource.getMessage("site.title", null, "default text", locale)); 
		logger.info("site.count : {}", messageSource.getMessage("site.count", new String[] {"첫번째"}, "default text", locale)); 
		logger.info("not.exist : {}", messageSource.getMessage("not.exist", null, "default text", locale)); 
		//logger.info("not.exist 기본값 없음 : {}", messageSource.getMessage("not.exist", null, locale)); 
		// JSP 페이지에서 EL 을 사용해서 arguments 를 넣을 수 있도록 값을 보낸다. 
		model.addAttribute("siteCount", messageSource.getMessage("msg.first", null, locale)); 
		return "i18n";
	}

	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home() throws Exception {
		return "index";
	}
	
	@RequestMapping(value = "index.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String index() throws Exception {
		return "index";
	}

	@RequestMapping(value = "contents/map.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String map() throws Exception {
		return "contents/map";
	}

	@RequestMapping(value = "contents/slider.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String slider() throws Exception {
		return "contents/slider";
	}

	@RequestMapping(value = "contents/video.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String video() throws Exception {
		return "contents/video";
	}

	@RequestMapping(value = "contents/table.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String table() throws Exception {
		return "contents/table";
	}

	@RequestMapping(value = "contents/div-center.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String divcenter() throws Exception {
		return "contents/div-center";
	}

	@RequestMapping(value = "contents/content01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String content01() throws Exception {
		return "contents/content01";
	}

	@RequestMapping(value = "contents/content02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String content02() throws Exception {
		return "contents/content02";
	}

	@RequestMapping(value = "contents/content03.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String content03() throws Exception {
		return "contents/content03";
	}

	@RequestMapping(value = "contents/content04.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String content04() throws Exception {
		return "contents/content04";
	}

	@RequestMapping(value = "contents/content05.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String content05() throws Exception {
		return "contents/content05";
	}

	@RequestMapping(value = "contents/content06.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String content06() throws Exception {
		return "contents/content06";
	}

	// html페이지맵핑
	@RequestMapping(value = "contents/innomaps.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String innomaps() throws Exception {
		return "contents/innomaps";
	}

	@RequestMapping(value = "contents/company.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String company() throws Exception {
		return "contents/company";
	}

	@RequestMapping(value = "contents/solution.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soultion() throws Exception {
		return "contents/solution";
	}

	@RequestMapping(value = "contents/solution01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soultion01() throws Exception {
		return "contents/solution01";
	}

	@RequestMapping(value = "contents/solution02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soultion02() throws Exception {
		return "contents/solution02";
	}

	@RequestMapping(value = "contents/solution03.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soultion03() throws Exception {
		return "contents/solution03";
	}

	@RequestMapping(value = "contents/solution04.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soultion04() throws Exception {
		return "contents/solution04";
	}

	@RequestMapping(value = "contents/solution05.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soultion05() throws Exception {
		return "contents/solution05";
	}

	@RequestMapping(value = "contents/solution06.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String soultion06() throws Exception {
		return "contents/solution06";
	}

	@RequestMapping(value = "contents/business.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String business() throws Exception {
		return "contents/business";
	}

	@RequestMapping(value = "contents/support.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String support() throws Exception {
		return "contents/support";
	}

	@RequestMapping(value = "contents/services.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String services() throws Exception {
		return "contents/services";
	}

	@RequestMapping(value = "contents/database.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String database() throws Exception {
		return "contents/database";
	}

	@RequestMapping(value = "contents/contact.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String contact() throws Exception {
		return "contents/contact";
	}

	@RequestMapping(value = "contents/sitemap.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String sitemap() throws Exception {
		return "contents/sitemap";
	}

	/*
	 * // Model은 파라미터 방식으로 메소드 즉 testModel(Model model)에 Model model 인자를 넣어준다. 또한
	 * 돌려줄때는 String형으로 돌려준다.
	 * 
	 * @RequestMapping("models/model") public String
	 * testModel(@ModelAttribute("info") Model model) { Model info = null;
	 * info.addAttribute("name", "홍길동");
	 * 
	 * return "/models/model"; }
	 * 
	 * // ModelAndView는 컴포넌트 즉 객체방식으로 작성되고 돌려준다. 그래서 인자가 없으며 돌려주는 데이터형도
	 * ModelAndView이다.
	 * 
	 * @RequestMapping("models/modelAndView") public ModelAndView testModelAndView()
	 * { ModelAndView mv = new ModelAndView(); mv.addObject("name", "강호동");
	 * mv.addObject("email", "this@daum.net");
	 * mv.setViewName("/models/modelAndView");
	 * 
	 * return mv; }
	 * 
	 * // SpringMVC :: @RequestParam, HttpServletRequest 없이 바로 값 받아오고 뷰로 넘겨주기
	 * 
	 * @RequestMapping("/member/memberInfo") public String
	 * memberInfo(@RequestParam("userid") String userid, @RequestParam("pwd") String
	 * pwd,
	 * 
	 * @RequestParam("name") String name, @RequestParam("address1") String address1,
	 * Model model) {
	 * 
	 * BoardDto dto = new BoardDto(); dto.setUserid(userid);
	 * model.addAttribute("dto", dto);
	 * 
	 * return "/member/memberInfo"; }
	 * 
	 * // Command 객체 사용(dto 또는 vo) 아무런 내용이 없지만, 스프링 프레임워크가 알아서 값을 받아와, 뷰로 값을 넘긴다.
	 * 
	 * @RequestMapping("/member/memberInfo") public String MemberRead(BoardDto dto)
	 * { return "/member/memberInfo"; }
	 * 
	 * // 1. HttpServletRequest을 이용한 값 받아오기
	 * 
	 * @RequestMapping("/board/confirmId") public String
	 * confirmId(HttpServletRequest httpServletRequest, @ModelAttribute Model model)
	 * { String id = httpServletRequest.getParameter("id"); String pwd =
	 * httpServletRequest.getParameter("pwd"); model.addAttribute("id", id);
	 * model.addAttribute("pwd", pwd);
	 * 
	 * return "board/confirmId"; }
	 * 
	 * // 2. HttpServletRequest을 이용한 값 받아오기
	 * 
	 * @RequestMapping("inputUp") public String
	 * testHttpServletRequest(HttpServletRequest request, @ModelAttribute Model
	 * model) {
	 * 
	 * String userId = request.getParameter("userId"); String userName =
	 * request.getParameter("userName");
	 * 
	 * model.addAttribute("userId", userId); model.addAttribute("userName",
	 * userName);
	 * 
	 * return "/users/inputUp"; }
	 * 
	 * // 3. @ReuqestParam을 이용한 값 받아오기 @RequestParam("가져올 데이터의 이름") [데이터타입] [가져온데이터를
	 * 담을 변수]
	 * 
	 * @RequestMapping("inputUp") public String
	 * testRequestParam(@RequestParam("userId") String
	 * userId, @RequestParam("userName") String userName, Model model) {
	 * 
	 * model.addAttribute("userId", userId); model.addAttribute("userName",
	 * userName);
	 * 
	 * return "/users/inputUp"; }
	 * 
	 * // 4. Command을 이용한 값 받아오기
	 * 
	 * @RequestMapping("inputUp") public String testCommand(@RequestParam("userId")
	 * String userId, @RequestParam("userName") String userName,
	 * 
	 * @RequestParam("userTel") String userTel, @RequestParam("userEmail") String
	 * userEmail, Model model) {
	 * 
	 * Users users = new Users(); users.setUserId(userId);
	 * users.setUserName(userName); users.setUserTel(userTel);
	 * users.setUserEmail(userEmail); model.addAttribute("usersInfo", users);
	 * 
	 * return "/users/inputUp"; }
	 * 
	 * // 5. @PathVariable을 이용한 값 받아오기 // @ReuqestMapping("[경로]/[변수이름]")
	 * 
	 * @RequestMapping("/student/{studentId}") public String student(@PathVariable
	 * String studentId, Model model) {
	 * 
	 * model.addAttribute("studentId", studentId);
	 * 
	 * return "student"; }
	 * 
	 * // @RequestMapping의 GET방식 요청과 POST방식 요청 // @RequestMapping(value="경로",
	 * method=RequestMethod.GET)
	 * 
	 * @RequestMapping(value = "/student/studentForm", method = RequestMethod.GET)
	 * public String studentForm() { // get 방식만 가능 return "student/studentForm"; }
	 * 
	 * // @RequestMapping(value="경로", method=RequestMethod.POST)
	 * 
	 * @RequestMapping(value = "/student/studentPro", method = RequestMethod.POST)
	 * public String studentPro(BoardDto dto) { // post 방식만 가능
	 * System.out.println(dto.toString()); return "student/studentPro"; }
	 * 
	 * // @RequestMapping(value="경로")
	 * 
	 * @RequestMapping(value = "index") public String index() { // get, post 방식 모두
	 * 가능 return "index"; }
	 */
}

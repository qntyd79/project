package com.company.bbs.controller.board;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.attach.AttachService;
import com.company.bbs.service.board.BoardService;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@SuppressWarnings("unused")
@Controller
@RequestMapping("modules/openapi/*")
public class OpenapiController {

	private static final Logger logger = LoggerFactory.getLogger(OpenapiController.class);

	@Inject
	private BoardService service;

	@Inject
	private AttachService fservice;

	// 첨부파일 저장경로 설정
	@Resource(name = "uploadPath")
	private String uploadPath;

	// 암호화 설정
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	// 다국어 지역세션설정
	@Autowired
	private SessionLocaleResolver localeResolver;

	// 다국어 설정
	@Autowired
	private MessageSource messageSource;

	// 유효성검사
	@Autowired
	private DefaultBeanValidator beanValidator;

	// 클라이언트측 유효성검증 설정 https://web-obj.tistory.com/456 참고
	@RequestMapping(value = "validator.do")
	protected String getValidator() throws Exception {
		return "modules/openapi/validator";
	}

	@RequestMapping(value = "openapilist.do")
	public String List(Model model, @ModelAttribute Criteria criteria,
			@RequestParam(value = "lawdcd", required = false, defaultValue = "11110") String lawdcd,
			@RequestParam(value = "dealymd", required = false, defaultValue = "201510") String dealymd)
			throws Exception {

		logger.info("openapi 글목록");

		PageMaker pageMaker = new PageMaker();

		pageMaker.setCriteria(criteria);

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("criteria", criteria);
		model.addAttribute("lawdcd", lawdcd);
		model.addAttribute("dealymd", dealymd);

		return "modules/openapi/board_list";
	}

	// 게시판 글목록 (Model)
	// @ResponseBody
	@RequestMapping(value = "alist.do")
	public Map<String, Object> aList(Model model, @ModelAttribute Criteria criteria, @RequestParam("pageNo") int pageNo,
			@RequestParam("perPageNum") int perPageNum, @RequestParam("lawdcd") String lawdcd, 
			@RequestParam("dealymd") String dealymd) throws Exception {

		StringBuilder urlBuilder = new StringBuilder("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev"); 
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=hiViuwIGjr7rUCTyOmmmvPnPjPcUNSZg6XvXbo2llXpf2xHXAuYWtCREqrOmXIEE5a0McLePjyCHja%2B6FMzQ1Q%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + pageNo); /* 페이지번호 */
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + perPageNum); /* 한 페이지 결과 수 */
		urlBuilder.append("&" + URLEncoder.encode("LAWD_CD", "UTF-8") + "=" + URLEncoder.encode(lawdcd, "UTF-8")); /* 지역코드 */
		urlBuilder.append("&" + URLEncoder.encode("DEAL_YMD", "UTF-8") + "=" + URLEncoder.encode(dealymd, "UTF-8")); /* 계약월 */

		// URI를 URL객체로 저장
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/xml");
		// System.out.println("Response code: " + conn.getResponseCode());
		// 버퍼 데이터(응답 메세지)를 읽어서 result에 저장 : result에는 XML 형식의 응답 데이터가 String으로 저장되어 있음
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}

		StringBuilder sb = new StringBuilder();
		String line;

		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}

		rd.close();
		conn.disconnect();

		// XML String을 JSON Object로 변환
		JSONObject jsonObject = XML.toJSONObject(sb.toString());

		// 이제부터 JSON데이터를 get()메소드로 쉽게 찾을 수 있음
		JSONObject response = (JSONObject) jsonObject.get("response");
		JSONObject body = (JSONObject) response.get("body");
		JSONObject items = (JSONObject) body.get("items");
		JSONArray itemArr = (JSONArray) items.get("item");

		// item 결과 출력
		/*
		 * System.out.println("---------------------------"); for(int i=0;
		 * i<itemArr.length(); i++){ JSONObject item = (JSONObject)itemArr.get(i);
		 * System.out.println("등록일 : "+item.get("obsrValue"));
		 * System.out.println("발표일자 : "+item.get("baseDate"));
		 * System.out.println("발표시간 : "+item.get("baseTime"));
		 * System.out.println("---------------------------"); }
		 */

		// JSON정렬
		ObjectMapper mapper = new ObjectMapper();
		mapper.enable(SerializationFeature.INDENT_OUTPUT);
		Object json = mapper.readValue(jsonObject.toString(), Object.class);
		String jsonStr = mapper.writeValueAsString(json);
		System.out.println(jsonStr);

		// JSON객체에서 JAVA객체로 변환
		// Map<String, Object> map = jsonObject.toMap();
		// System.out.println("map : " + map);
		List<Object> list = itemArr.toList();
		// System.out.println("list : " + list);
		int totalCount = (int) body.get("totalCount");

		// openapi pageNo적용
		criteria.setPage(pageNo);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(totalCount);
		pageMaker.setDisplayPageNum(perPageNum);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageMaker", pageMaker);

		return map;
	}
}
/*
 * //https://jjung-a.tistory.com/14 org.json.JSONObject xmlJSONObj =
 * XML.toJSONObject(sb.toString()); String xmlJSONObjString =
 * xmlJSONObj.toString();
 * System.out.println("### xmlJSONObjString=>"+xmlJSONObjString);
 * 
 * ObjectMapper objectMapper = new ObjectMapper(); Map<String, Object> map = new
 * HashMap<>(); map = objectMapper.readValue(xmlJSONObjString, new TypeReference
 * <Map<String,Object>>(){}); Map<String, Object> dataResponse = (Map<String,
 * Object>) map.get("response"); Map<String, Object> body = (Map<String,
 * Object>) dataResponse.get("body"); Map<String, Object> items = null;
 * List<Map<String, Object>> itemList = null;
 * 
 * items = (Map<String, Object>) body.get("items"); itemList = (List<Map<String,
 * Object>>) items.get("item");
 * 
 * System.out.println("### map="+map);
 * System.out.println("### dataResponse="+dataResponse);
 * System.out.println("### body="+body); System.out.println("### items="+items);
 * System.out.println("### itemList="+itemList);
 * 
 * resultMap.put("Result", "0000"); resultMap.put("numOfRows",
 * body.get("numOfRows")); resultMap.put("pageNo", body.get("pageNo"));
 * resultMap.put("totalCount", body.get("totalCount")); resultMap.put("data",
 * itemList);
 */

/*
 * //1. 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성. JSONParser parser = new
 * JSONParser(); //2. 문자열을 JSON 형태로 JSONObject 객체에 저장. JSONObject obj =
 * (JSONObject)parser.parse(sb.toString()); //3. 필요한 리스트 데이터 부분만 가져와 JSONArray로
 * 저장. JSONArray dataArr = (JSONArray) obj.get("data"); //4. model에 담아준다.
 * model.addAttribute("data",dataArr);
 */
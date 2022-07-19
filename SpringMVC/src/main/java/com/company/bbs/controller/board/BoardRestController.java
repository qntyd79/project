package com.company.bbs.controller.board;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.company.bbs.service.board.BoardService;
import com.company.bbs.service.comment.CommentService;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;
import com.company.bbs.vo.board.BoardVO;
import com.company.bbs.vo.comment.CommentVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

@SuppressWarnings("unused")
@RestController
@RequestMapping("modules/board/*")
public class BoardRestController {

	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);

	@Inject
	BoardService service;
	
	// 목록페이징 https://jjung-a.tistory.com/14
	@GetMapping(value = { "openapi/{page}/{perPageNum}", "openapi/{page}/{perPageNum}/{lawdcd}/{dealymd}"})
	public ResponseEntity<Map<String, Object>> aList(@ModelAttribute Criteria criteria, @PathVariable("page") int page, @PathVariable("perPageNum") int perPageNum,
			@PathVariable("lawdcd") String lawdcd, @PathVariable("dealymd") String dealymd) {
			System.out.println(lawdcd);
		ResponseEntity<Map<String, Object>> entity = null;
			
		try {				
			StringBuilder urlBuilder = new StringBuilder("http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?_wadl&type=xml"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=hiViuwIGjr7rUCTyOmmmvPnPjPcUNSZg6XvXbo2llXpf2xHXAuYWtCREqrOmXIEE5a0McLePjyCHja%2B6FMzQ1Q%3D%3D");
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + page); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + perPageNum); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("LAWD_CD","UTF-8") + "=" + URLEncoder.encode(lawdcd, "UTF-8")); /*지역코드*/
	        urlBuilder.append("&" + URLEncoder.encode("DEAL_YMD","UTF-8") + "=" + URLEncoder.encode(dealymd, "UTF-8")); /*계약월*/
		    		        
	        // URI를 URL객체로 저장
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        System.out.println("Response code: " + conn.getResponseCode());
		        
	        // 버퍼 데이터(응답 메세지)를 읽어서 result에 저장 : result에는 XML 형식의 응답 데이터가 String으로 저장되어 있음
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
	        String result=null;
		        
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        result=sb.toString();
	        
	        rd.close();
	        conn.disconnect();
		    	        
	        // XML String을 JSON Object로 변환
	        JSONObject jsonObject = XML.toJSONObject(result);
	        	        
	        // 이제부터 JSON데이터를 get() 메소드로 쉽게 찾을 수 있음
	        JSONObject response = (JSONObject)jsonObject.get("response");
	        JSONObject body = (JSONObject)response.get("body");
	        JSONObject items = (JSONObject)body.get("items");
	        JSONArray itemArr = (JSONArray)items.get("item");
	       			    
		    // JSON객체에서 JAVA객체로 변환
		    Map<String, Object> map = jsonObject.toMap();
		    List<Object> list = itemArr.toList();
		    System.out.println(list);
		    int totalCount = (int) body.get("totalCount");
	
		    PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(totalCount);
			pageMaker.setDisplayPageNum(perPageNum);

			//Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
				
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 글저장
	@RequestMapping(value = "ajaxInsert", method = RequestMethod.POST)
	public ResponseEntity<String> Insert(@RequestBody BoardVO boardVO) {

		ResponseEntity<String> entity = null;

		try {
			service.insert(boardVO);
			// 코멘트갯수 업데이트
			// bservice.getCommentCount(boardVO.getBoard_idx());
			entity = new ResponseEntity<>("insertSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 목록(페이징없이 전체값 목록으로 뿌려주기)
	@RequestMapping(value = "ajaxlist/all/", method = RequestMethod.GET)
	public ResponseEntity<List<BoardVO>> List(Criteria criteria) {

		ResponseEntity<List<BoardVO>> entity = null;

		try {
			entity = new ResponseEntity<>(service.getList(criteria), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
		
	// 목록페이징
	// @GetMapping(value = {"/", "/index", "/main"}) 출처:https://byul91oh.tistory.com/433 [개꼬 [: 개발하는 꼬바리]:티스토리]
	@GetMapping(value = {"ajaxlist/{page}/{category_idx}", "ajaxlist/{page}/{category_idx}/{searchField}/{keyWord}"})
	public ResponseEntity<Map<String, Object>> List(@ModelAttribute Criteria criteria, @PathVariable("page") int page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			criteria.setSearchField(criteria.getSearchField());
			criteria.setKeyWord(criteria.getKeyWord());

			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(service.getCount(criteria));
			pageMaker.setNoticeCount(service.getNoticeCount(criteria));

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", service.getList(criteria));
			map.put("noticelist", service.getNoticeList(criteria));
			map.put("pageMaker", pageMaker);

			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 보기
	@RequestMapping(value = "ajaxlist/read/{board_idx}", method = RequestMethod.GET)
	public ResponseEntity<BoardVO> Read(@PathVariable("board_idx") int board_idx) {

		ResponseEntity<BoardVO> entity = null;

		try {
			service.increaseCnt(board_idx);
			entity = new ResponseEntity<>(service.getView(board_idx), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 수정
	@RequestMapping(value = "ajaxlist/modify/{board_idx}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> Modify(@PathVariable("board_idx") int board_idx, @RequestBody BoardVO boardVO) {

		ResponseEntity<String> entity = null;

		try {
			boardVO.setBoard_idx(board_idx);
			service.update(boardVO);
			entity = new ResponseEntity<>("modifySuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 삭제
	@RequestMapping(value = "ajaxlist/delete/{board_idx}", method = RequestMethod.DELETE)
	public ResponseEntity<String> Delete(@PathVariable("board_idx") int board_idx) {

		ResponseEntity<String> entity = null;

		try {
			service.delete(board_idx);
			entity = new ResponseEntity<>("deleteSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}

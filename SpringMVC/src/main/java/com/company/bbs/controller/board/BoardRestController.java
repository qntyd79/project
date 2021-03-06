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
	
	//??????????????? https://jjung-a.tistory.com/14
	@GetMapping(value = { "openapi/{pageNo}/{perPageNum}", "openapi/{pageNo}/{perPageNum}/{lawdcd}/{dealymd}"})
	public ResponseEntity<Map<String, Object>> aList(@ModelAttribute Criteria criteria, 
			@PathVariable("pageNo") int pageNo, @PathVariable("perPageNum") int perPageNum,
			@PathVariable("lawdcd") String lawdcd, @PathVariable("dealymd") String dealymd) {

		ResponseEntity<Map<String, Object>> entity = null;
		//http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade //??????????????? ???????????????
		//http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev //??????????????? ????????? ????????????
		//http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptRent //????????? ??????????????? 
		try {				
			StringBuilder urlBuilder = new StringBuilder("http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev"); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=hiViuwIGjr7rUCTyOmmmvPnPjPcUNSZg6XvXbo2llXpf2xHXAuYWtCREqrOmXIEE5a0McLePjyCHja%2B6FMzQ1Q%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + pageNo); /*???????????????*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + perPageNum); /*??? ????????? ?????? ???*/
	        urlBuilder.append("&" + URLEncoder.encode("LAWD_CD","UTF-8") + "=" + URLEncoder.encode(lawdcd, "UTF-8")); /*????????????*/
	        urlBuilder.append("&" + URLEncoder.encode("DEAL_YMD","UTF-8") + "=" + URLEncoder.encode(dealymd, "UTF-8")); /*?????????*/
		    		        
	        //URI??? URL????????? ??????
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/xml");
	        //System.out.println("Response code: " + conn.getResponseCode());
	        //?????? ?????????(?????? ?????????)??? ????????? result??? ?????? : result?????? XML ????????? ?????? ???????????? String?????? ???????????? ??????
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
	        }
	        
	        StringBuilder sb = new StringBuilder();
	        String line;
		        
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        
	        rd.close();
	        conn.disconnect();
		    	        
	        //XML String??? JSON Object??? ??????
	        JSONObject jsonObject = XML.toJSONObject(sb.toString());
	        
	        //???????????? JSON???????????? get()???????????? ?????? ?????? ??? ??????
	        JSONObject response = (JSONObject)jsonObject.get("response");
	        JSONObject body = (JSONObject)response.get("body");
	        JSONObject items = (JSONObject)body.get("items");
	        JSONArray itemArr = (JSONArray)items.get("item");
	       	
	        //item ?????? ??????
	        /*
	        System.out.println("---------------------------");
	        for(int i=0; i<itemArr.length(); i++){
	            JSONObject item = (JSONObject)itemArr.get(i);
	            System.out.println("????????? : "+item.get("obsrValue"));
	            System.out.println("???????????? : "+item.get("baseDate"));
	            System.out.println("???????????? : "+item.get("baseTime"));
	            System.out.println("---------------------------");
	        }
	        */
	        
	        //JSON??????
		    ObjectMapper mapper = new ObjectMapper();
		    mapper.enable(SerializationFeature.INDENT_OUTPUT);
		    Object json = mapper.readValue(jsonObject.toString(), Object.class);
		    String jsonStr = mapper.writeValueAsString(json);
		    System.out.println(jsonStr);
		        
		    //JSON???????????? JAVA????????? ??????
		    //Map<String, Object> map = jsonObject.toMap();
		    //System.out.println("map : " + map);
		    List<Object> list = itemArr.toList();
		    //System.out.println("list : " + list);
		    int totalCount = (int) body.get("totalCount");
		    
		    //openapi pageNo??????
		    criteria.setPage(pageNo);
		    
		    PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(totalCount);
			pageMaker.setDisplayPageNum(perPageNum);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
				
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	//?????????
	@RequestMapping(value = "ajaxInsert", method = RequestMethod.POST)
	public ResponseEntity<String> Insert(@RequestBody BoardVO boardVO) {

		ResponseEntity<String> entity = null;

		try {
			service.insert(boardVO);
			//??????????????? ????????????
			//bservice.getCommentCount(boardVO.getBoard_idx());
			entity = new ResponseEntity<>("insertSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	//??????(??????????????? ????????? ???????????? ????????????)
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
		
	//???????????????
	//@GetMapping(value = {"/", "/index", "/main"}) ??????:https://byul91oh.tistory.com/433 [?????? [: ???????????? ?????????]:????????????]
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

	//??????
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

	//??????
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

	//??????
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

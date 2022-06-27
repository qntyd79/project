package com.company.bbs.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
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

@SuppressWarnings("unused")
@RestController
@RequestMapping("modules/board/*")
public class BoardRestController {

	private static final Logger logger = LoggerFactory.getLogger(BoardRestController.class);
	
	@Inject
	BoardService service;
	
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
	@RequestMapping(value = "ajaxlist/{page}/{category_idx}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> List(Criteria criteria, @PathVariable("page") int page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			//Criteria criteria = new Criteria(); 
			
			criteria.setPage(page);
		
			List<BoardVO> list = service.getList(criteria);
			
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

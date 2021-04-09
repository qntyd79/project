package com.company.bbs.controller.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.company.bbs.dto.comment.CommentDto;
import com.company.bbs.service.comment.CommentService;
import com.company.bbs.utill.Criteria;
import com.company.bbs.utill.PageMaker;

@RestController
@RequestMapping("modules/comment/*")
public class CommentRestController {

	private static final Logger logger = LoggerFactory.getLogger(CommentRestController.class);

	@Inject
	CommentService service;

	// 댓글등록
	@ResponseBody
	@RequestMapping(value = "ajaxInsert", method = RequestMethod.POST)
	public ResponseEntity<String> Insert(@RequestBody CommentDto dto) {

		ResponseEntity<String> entity = null;

		try {
			service.insert(dto);
			entity = new ResponseEntity<>("insertSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	// 댓글목록
	@ResponseBody
	@RequestMapping(value = "ajaxlist/all/{board_idx}", method = RequestMethod.GET)
	public ResponseEntity<List<CommentDto>> List(@PathVariable("board_idx") int board_idx, Criteria criteria) {

		ResponseEntity<List<CommentDto>> entity = null;

		try {
			entity = new ResponseEntity<>(service.getLista(board_idx, criteria), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 댓글목록페이징
	@ResponseBody
	@RequestMapping(value = "ajaxlist/{board_idx}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> List(@PathVariable("board_idx") int board_idx,
			@PathVariable("page") int page) {

		ResponseEntity<Map<String, Object>> entity = null;

		try {
			Criteria criteria = new Criteria(); 
			
			criteria.setPage(page);
			//criteria.setPerPageNum(5);

			List<CommentDto> list = service.getLista(board_idx, criteria);
			int commentTotalCount = service.getCommentCount(board_idx);

			PageMaker pageMaker = new PageMaker();
			
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(commentTotalCount);

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

	// 댓글보기
	@ResponseBody
	@RequestMapping(value = "ajaxlist/read/{comment_idx}", method = RequestMethod.GET)
	public ResponseEntity<CommentDto> Read(@PathVariable("comment_idx") int comment_idx) {

		ResponseEntity<CommentDto> entity = null;

		try {
			service.increaseCnt(comment_idx);
			entity = new ResponseEntity<>(service.getView(comment_idx), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 댓글수정
	@ResponseBody
	@RequestMapping(value = "ajaxlist/modify/{comment_idx}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> Modify(@PathVariable("comment_idx") int comment_idx, @RequestBody CommentDto dto) {

		ResponseEntity<String> entity = null;

		try {
			dto.setComment_idx(comment_idx);
			service.update(dto);
			entity = new ResponseEntity<>("modifySuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 댓글삭제
	@ResponseBody
	@RequestMapping(value = "ajaxlist/delete/{comment_idx}", method = RequestMethod.DELETE)
	public ResponseEntity<String> Delete(@PathVariable("comment_idx") int comment_idx) {

		ResponseEntity<String> entity = null;

		try {
			service.delete(comment_idx);
			entity = new ResponseEntity<>("deleteSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
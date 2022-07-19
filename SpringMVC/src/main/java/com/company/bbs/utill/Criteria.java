package com.company.bbs.utill;

import java.io.Serializable;

public class Criteria implements Serializable {
	// 참고 https://rongscodinghistory.tistory.com/7
	// 페이징
	private static final long serialVersionUID = 706986535304576134L;
	private int page; // 보여줄 페이지
	private int perPageNum; // 페이지당 보여줄 게시물수 기본 10개
	private int category_idx; // 카테고리
	private int kind; // 카테고리 분류 1:게시판 2:회원
	private String searchField; // 검색
	private String keyWord;

	// 최초 default 생성자로 기본 객체 생성시 초기값을 지정한다. (1페이지, 10개씩)
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	// limit 구문에서 시작 부분에 필요한 값을 반환(mybatis에서 사용)
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}

	public int getCategory_idx() {
		return category_idx;
	}

	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	// toString()
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", " + "searchField=" + searchField
				+ ", keyWord=" + keyWord + ", category_idx=" + category_idx + ", kind=" + kind + "]";
	}

}

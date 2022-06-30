package com.company.bbs.utill;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
    private Criteria criteria; // page, perPageNum , 카테고리, 검색관련 을 가지고 있음
    private int totalCount; //전체 게시글 
    private int startPage; //시작페이지
    private int endPage; //마지막페이지
    private boolean prev;
    private boolean next;
    private int displayPageNum = 10; // 화면 하단에 보여지는 페이지의 수
    private int totalPage;
    private int noticeCount; 
    private int curNum;
       
    public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	private void calcData() {

        endPage = (int) (Math.ceil (criteria.getPage() / (double) displayPageNum) * displayPageNum);

        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil (totalCount / (double) criteria.getPerPageNum()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;

        next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;
    }
	
	public int getTotalPage() {		
		totalPage = (int) Math.ceil (totalCount / (double) criteria.getPerPageNum()); // 전체페이지 수
		
		return totalPage;
	}

	public void setTotalPage(int totalPage) {		
		this.totalPage = totalPage;		
	}
	 
    
	/*public String makeQuery(int page) {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
        		.queryParam("page", page)
                .queryParam("perPageNum", criteria.getPerPageNum())
                .build();

        return uriComponents.toUriString();
    } */
	
    public String makeSearch(int page) {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
        		.queryParam("page",page)
                .queryParam("perPageNum",criteria.getPerPageNum())
                .queryParam("searchField",criteria.getSearchField())
				.queryParam("keyWord",encoding(criteria.getKeyWord()))
				.queryParam("category_idx",criteria.getCategory_idx())
                .build();

        return uriComponents.toUriString();
    }    
    
    private String encoding(String keyWord) {
		if (keyWord == null || keyWord.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyWord, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
    
    // 게시판번호 재정렬
    public int getCurNum() {
    	curNum = totalCount - (criteria.getPerPageNum() * (criteria.getPage()-1)); // 전체게시물수 - (페이지당 레코드 수 * (현재페이지수-1)) nowPage의 초기값이 1일때 -1을 해준다.
		return curNum;
	}

	public void setCurNum(int curNum) {
		this.curNum = curNum;
	}
	  
	
	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	@Override
	public String toString() {
		return "PageMaker [criteria=" + criteria + ", totalCount=" + totalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", totalPage=" + totalPage + ", noticeCount=" + noticeCount + "]";
	}
	

}


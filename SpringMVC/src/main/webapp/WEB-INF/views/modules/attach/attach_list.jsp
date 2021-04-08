<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javaScript" language="javascript" defer="defer">
       
	/* 수정 화면 function */
    function fn_egov_select(id)
	{
       	document.listForm.selectedId.value = id;
       	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
       	document.listForm.submit();
    }
        
    /* 등록 화면 function */
    function fn_egov_addView()
    {
     	document.listForm.action = "<c:url value='insertPermssionUser.do'/>";
       	document.listForm.submit();
    }
        
    /* 목록 화면 function */
    function fn_egov_selectList()
    {
      	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
       	document.listForm.submit();
    }
        
    /* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo)
    {
      	document.listForm.pageIndex.value = pageNo;
       	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
      	document.listForm.submit();
    }

</script>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img02"></div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                    <%@ include file="../../include/content_header.jsp"%>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <h2>파일목록</h2>
                                <form name="searchForm" id="searchForm" method="post" enctype="multipart/form-data">
                                    <div class="search-form" style="float:right; margin-bottom:10px;">
                                        <fieldset>
                                            <select name="searchField" id="searchField">
                                                <option value="n" <c:out value="${criteria.searchField == null ? 'selected' : ' '}" />>선택해주세요</option>
                                                <option value="t" <c:out value="${criteria.searchField eq 't' ? 'selected' : ' '}" />>제목</option>
                                                <option value="c" <c:out value="${criteria.searchField eq 'c' ? 'selected' : ' '}" />>내용</option>
                                                <option value="w" <c:out value="${criteria.searchField eq 'w' ? 'selected' : ' '}" />>작성자</option>
                                                <option value="tc" <c:out value="${criteria.searchField eq 'tc' ? 'selected' : ' '}" />>제목+내용</option>
                                                <option value="cw" <c:out value="${criteria.searchField eq 'cw' ? 'selected' : ' '}" />>내용+작성자</option>
                                                <option value="tcw" <c:out value="${criteria.searchField eq 'tcw' ? 'selected' : ' '}" />>제목+내용+작성자</option>
                                            </select>
                                            <input type="search" name="keyWord" id="keyWord" value="<c:out value=" ${criteria.keyWord}" />" placeholder="검색어" />
                                            <input type="button" value="검색" id="searchBtn" onclick="$(this.form).submit();" />
                                            <input type="button" value="초기화" onClick="window.location='list.do'" />
                                        </fieldset>
                                    </div>
                                </form>
                                <form name="categoryForm" id="categoryForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <div class="category-form" style="float:right; margin-right:5px; margin-bottom:10px;">
                                        <fieldset>
                                            <select name="category_idx" id="category_idx" form="categoryForm" onChange="$(this.form).submit();">
                                                <option value="0" <c:if test="${categoryselect == 0}">
                                                    <c:out value="selected=selected" />
                                                    </c:if>>전체목록</option>
                                                <c:forEach var="item" items="${categorylist}" varStatus="status">
                                                    <option value="<c:out value=" ${item.category_idx}" />" <c:if test="${item.category_idx == categoryselect}">
                                                        <c:out value="selected=selected" />
                                                    </c:if>>
                                                    <c:out value="${item.title}" />
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </fieldset>
                                    </div>
                                </form>
                                <div class="articles">
                                    전체글 : <span>${pageMaker.totalCount}</span> 개 | 공지글 : <span>${pageMaker.noticeCount}</span> | 현재페이지 : <span>${pageMaker.criteria.page}</span> | 총페이지 : <span>${pageMaker.totalPage}</span>
                                </div>
                                <form name="listForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <fieldset>
                                        <legend>Board List Form</legend>
                                        <table summary="기본게시판 보여주고 있습니다." class="table">
                                            <caption>등록일 : 2017년08월24일 기준</caption>
                                            <colgroup>
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="40%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                            </colgroup>
                                            <thead>
                                                <tr class="tline">
                                                    <th scope="col"><label><input type="checkbox" class="allCheck" name="allCheck" /></label></th>
                                                    <th scope="col">N</th>
                                                    <th scope="col">분류</th>
                                                    <th scope="col">제목</th>
                                                    <th scope="col">작성자</th>
                                                    <th scope="col">등록일</th>
                                                    <th scope="col">파일</th>
                                                    <th scope="col">추천</th>
                                                    <th scope="col">조회</th>
                                                    <th scope="col">D</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:choose>
                                                    <c:when test="${fn:length(list) == 0 && fn:length(noticelist) == 0}">
                                                        <tr>
                                                            <td colspan="10"><label>등록된 글이 없습니다.</label></td>
                                                        </tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach varStatus="status" var="row1" items="${noticelist}">
                                                            <tr>
                                                                <td><label><input type="checkbox" name="check" /></label></td>
                                                                <td><span>공지</span></td>
                                                                <td>
                                                                    <c:forEach var="item" items="${categorylist}">
                                                                        <c:if test="${row1.category_idx == item.category_idx}">${item.title}</c:if>
                                                                    </c:forEach>
                                                                </td>
                                                                <td class="text-left">
                                                                    <a href="${path}/modules/board/read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=<c:out value=" ${row1.board_idx}" />">${row1.title}</a>
                                                                    <c:if test="${row1.hit >= 20}">
                                                                        <span class="hit">HIT</span>
                                                                    </c:if>
                                                                </td>
                                                                <td>${row1.name}</td>
                                                                <td>${row1.regdate}</td>
                                                                <td>filecnt</td>
                                                                <td>${row1.vote}</td>
                                                                <td>${row1.hit}</td>
                                                                <td><a href="${path}/modules/board/delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=<c:out value=" ${row1.board_idx}" />">D</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:forEach varStatus="status" var="row" items="${list}">
                                                            <tr>
                                                                <td><label><input type="checkbox" name="check" /></label></td>
                                                                <td><strong><c:if test="${row.notice == 0}">${(pageMaker.curNum-status.index)-(pageMaker.noticeCount)}</c:if></strong></td>
                                                                <td>
                                                                    <c:forEach var="item" items="${categorylist}">
                                                                        <c:if test="${row.category_idx == item.category_idx}">${item.title}</c:if>
                                                                    </c:forEach>
                                                                </td>
                                                                <td class="text-left">
                                                                    <c:if test="${row.depth > 0}">
                                                                        <c:forEach var="i" begin="1" end="${row.depth}">
                                                                            <span>&nbsp;</span>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <a href="${path}/modules/board/read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=<c:out value=" ${row.board_idx}" />">
                                                                    <c:if test="${row.depth > 0}">
                                                                        <i class="fas fa-angle-double-right"></i>&nbsp;
                                                                    </c:if>${row.title}</a>
                                                                    <c:if test="${row.hit >= 20}">
                                                                        <span class="hit">HIT</span>
                                                                    </c:if>
                                                                </td>
                                                                <td>${row.name}</td>
                                                                <td>${row.regdate}</td>
                                                                <td>filecnt</td>
                                                                <td>${row.vote}</td>
                                                                <td>${row.hit}</td>
                                                                <td><a href="${path}/modules/board/delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=<c:out value=" ${row.board_idx}" />">DEL</a></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <nav class="paging-group">
                                            <ul>
                                                <c:if test="${pageMaker.prev}">
                                                    <li><a href="${path}/modules/board/list.do${pageMaker.makeSearch(1)}"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                                                    <li><a href="${path}/modules/board/list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                                    <%-- <li><a href="${pageMaker.startPage - 1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li> --%>
                                                </c:if>
                                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                                    <li>
                                                        <a href="${path}/modules/board/list.do${pageMaker.makeSearch(idx)}" <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ' '}" /> >${idx}</a>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                                    <%-- <li><a href="${pageMaker.endPage + 1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li> --%>
                                                    <li><a href="${path}/modules/board/list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                                    <li><a href="${path}/modules/board/list.do${pageMaker.makeSearch(pageMaker.totalPage)}"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                                </c:if>
                                            </ul>
                                        </nav>
                                        <c:import url="/WEB-INF/views/modules/common/common_btn.jsp"/>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
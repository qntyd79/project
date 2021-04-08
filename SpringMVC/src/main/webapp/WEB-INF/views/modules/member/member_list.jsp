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
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <%@ include file="../../include/content_header.jsp"%>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <h2>회원목록</h2>
                                <form name="searchForm" id="searchForm" method="post" enctype="multipart/form-data">
                                    <div class="search-form" style="float:right; margin-bottom:10px;">
                                        <fieldset>                                        	
                                            <select name="searchField" id="searchField">
												<option value="n" <c:out value="${criteria.searchField == null ? 'selected' : ' '}"/>>선택해주세요</option>
									            <option value="t" <c:out value="${criteria.searchField eq 't' ? 'selected' : ' '}"/>>제목</option>
									            <option value="c" <c:out value="${criteria.searchField eq 'c' ? 'selected' : ' '}"/>>내용</option>
									            <option value="w" <c:out value="${criteria.searchField eq 'w' ? 'selected' : ' '}"/>>작성자</option>
									            <option value="tc" <c:out value="${criteria.searchField eq 'tc' ? 'selected' : ' '}"/>>제목+내용</option>
									            <option value="cw" <c:out value="${criteria.searchField eq 'cw' ? 'selected' : ' '}"/>>내용+작성자</option>
									            <option value="tcw" <c:out value="${criteria.searchField eq 'tcw' ? 'selected' : ' '}"/>>제목+내용+작성자</option>
											</select>
											<input type="search" name="keyWord" id="keyWord" value="<c:out value="${criteria.keyWord}"/>" placeholder="검색어" /> 
											<input type="button" value="검색"  id="searchBtn" onclick="$(this.form).submit()"/> 
											<input type="button" value="초기화" onClick="window.location='list.do'" />  											                                   
                                        </fieldset>
                                    </div>
                                </form>
                                <form name="categoryForm" id="categoryForm" method="post" enctype="multipart/form-data" action="list.do">
									<div class="category-form" style="float:right; margin-right:5px; margin-bottom:10px;">							
										<fieldset>								
											<select name="category_idx" id="category_idx" form="categoryForm" onChange="this.form.submit();">									
												<option value="0" <c:if test="${categoryselect == 0}"><c:out value= "selected=selected"/></c:if>>전체목록</option>									
												<c:forEach var="item" items="${categorylist}" varStatus="status" >																								
													<option value="<c:out value="${item.category_idx}"/>" <c:if test="${item.category_idx == categoryselect}"><c:out value= "selected=selected"/></c:if>>
													<c:out value="${item.title}"/>
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
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="15%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="5%" />
                                            </colgroup>
                                            <thead>
                                                <tr class="tline">
                                                    <th scope="col"><label><input type="checkbox" class="allCheck" name="allCheck"/></label></th>
                                                    <th scope="col">N</th>
                                                    <th scope="col">분류</th>
                                                    <th scope="col">회원아이디</th>
                                                    <th scope="col">회원이름</th>
                                                    <th scope="col">이메일</th>
                                                    <th scope="col">핸드폰번호</th>
                                                    <th scope="col">전화번호</th>                                                    
                                                    <th scope="col">회원등급</th>
                                                    <th scope="col">포인트</th>
                                                    <th scope="col">메일수신</th>
                                                    <th scope="col">가입일</th>
                                                    <th scope="col">DEL</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:choose>
												<c:when test="${fn:length(list) == 0}">
													<tr>
                                                        <td colspan="13"><label>등록된 글이 없습니다.</label></td>
													</tr>
												</c:when>									
												<c:otherwise>
												<c:forEach varStatus="status" var="row" items="${list}">
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td><strong>${pageMaker.curNum-status.index}</strong></td>
                                                    <td>
                                                        <c:forEach var="item" items="${categorylist}">												
															<c:if test="${row.category_idx == item.category_idx}">${item.title}</c:if>
														</c:forEach>											
													</td>
                                                    <td><a href="${path}/modules/member/read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&member_idx=<c:out value="${row.member_idx}"/>">${row.userid}</a></td>
                                                    <td>${row.name}</td>
                                                    <td>${row.email}</td>
                                                    <td>${row.hphone}</td>
                                                    <td>${row.phone}</td>
                                                    <td>${row.level}</td>
                                                    <td>${row.point}</td>
                                                    <td>${row.mail_check eq '1' ? 'Y' : 'N'}</td>
                                                    <td>${row.join_date}</td>                                                    
                                                    <td><a href="${path}/modules/member/delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&member_idx=<c:out value="${row.member_idx}"/>">DEL</a></td>
                                                </tr>
                                            	</c:forEach>									
												</c:otherwise>									
											</c:choose>	   
                                            </tbody>
                                        </table>
                                        <nav class="paging-group">
											<ul>
												<c:if test="${pageMaker.prev}">
													<li><a href="${path}/modules/member/list.do${pageMaker.makeSearch(1)}"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
													<li><a href="${path}/modules/member/list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
													<%-- <li><a href="${pageMaker.startPage - 1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li> --%>
												</c:if>
												
												<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
													<li>
														<a href="${path}/modules/member/list.do${pageMaker.makeSearch(idx)}" <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ' '}"/> >${idx}</a>
													</li>
												</c:forEach>
												
												<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
													<%-- <li><a href="${pageMaker.endPage + 1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li> --%>
													<li><a href="${path}/modules/member/list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
													<li><a href="${path}/modules/member/list.do${pageMaker.makeSearch(pageMaker.totalPage)}"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
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
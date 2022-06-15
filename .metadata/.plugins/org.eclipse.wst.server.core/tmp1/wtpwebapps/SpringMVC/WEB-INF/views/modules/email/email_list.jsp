<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img02"></div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    <article>                    
                        <div class="row">
                            <div class="col-md-12">
                            
                            
                                <h2><spring:message code="bbs.title.list"/></h2>
                                <form name="searchForm" id="searchForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <div class="search-form" style="float:right; margin-bottom:10px;">
                                        <fieldset>
                                            <select id="searchField" name="searchField" title="<spring:message code="select.searchCondition"/>">
                                                <option value="n" <c:out value="${criteria.searchField == null ? 'selected' : ''}" />>선택해주세요</option>
                                                <option value="t" <c:out value="${criteria.searchField eq 't' ? 'selected' : ''}" />>제목</option>
                                                <option value="c" <c:out value="${criteria.searchField eq 'c' ? 'selected' : ''}" />>내용</option>
                                                <option value="w" <c:out value="${criteria.searchField eq 'w' ? 'selected' : ''}" />>작성자</option>
                                                <option value="tc" <c:out value="${criteria.searchField eq 'tc' ? 'selected' : ''}" />>제목+내용</option>
                                                <option value="cw" <c:out value="${criteria.searchField eq 'cw' ? 'selected' : ''}" />>내용+작성자</option>
                                                <option value="tcw" <c:out value="${criteria.searchField eq 'tcw' ? 'selected' : ''}" />>제목+내용+작성자</option>
                                            </select>
                                            <input type="search" id="keyWord" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" title="<spring:message code="button.search"/>" />
                                            <input type="button" value="<spring:message code="button.search"/>" onclick="$(this.form).submit();" />
                                            <input type="button" value="<spring:message code="button.init"/>" onClick="window.location='list.do'" />
                                        </fieldset>
                                    </div>
                                </form>
                                <form name="categoryForm" id="categoryForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <div class="category-form" style="float:right;  margin-right:5px; margin-bottom:10px;">
                                        <fieldset>
                                            <select name="category_idx" id="category_idx" form="categoryForm" onChange="$(this.form).submit();">
                                                <option value="0" <c:if test="${categoryselect == 0}"><c:out value="selected=selected" /></c:if>>전체목록</option>
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
                                    	전체글 : <span>${pageMaker.totalCount}</span> 개 | 현재페이지 : <span>${pageMaker.criteria.page}</span> | 총페이지 : <span>${pageMaker.totalPage}</span>
                                </div>
                                <form name="listForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.list"/>">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                            	<c:if test="${sessionScope.isAdmin != null}">		
                                                <col width="5%" />
                                                </c:if>
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="20%" />
                                                <col width="20%" />
                                                <col width="20%" />
                                                <col width="10%" />
                                                <c:if test="${sessionScope.isAdmin != null}">		
                                                <col width="10%" />
                                                </c:if>
                                            </colgroup>
                                            <thead>
                                                <tr class="tline">
                                                	<c:if test="${sessionScope.isAdmin != null}">		
                                                    <th scope="col"><label><input type="checkbox" class="allCheck" name="allCheck" /></label></th>
                                                    </c:if>
                                                    <th scope="col"><spring:message code="bbs.list.no"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.catetory_idx"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.title"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.toemail"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.sendemail"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.sendregdate"/></th> 
                                                    <c:if test="${sessionScope.isAdmin != null}">		                                                  
                                                    <th scope="col"><spring:message code="bbs.list.del"/></th>
                                                    </c:if>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:choose>
                                                    <c:when test="${fn:length(list) == 0}">
                                                        <tr>
                                                            <td colspan="8"><spring:message code="info.nodata.msg"/></td>
                                                        </tr>
                                                    </c:when>
                                                    <c:otherwise>                                                        
                                                        <c:forEach varStatus="status" var="row" items="${list}">
                                                            <tr>
                                                            	<c:if test="${sessionScope.isAdmin != null}">		
                                                                <td><label><input type="checkbox" name="check" /></label></td>
                                                                </c:if>
                                                                <td><strong>${pageMaker.curNum-status.index}</strong></td>
                                                                <td>
                                                                    <c:forEach var="item" items="${categoryname}">
                                                                        <c:if test="${row.category_idx == item.category_idx}">${item.title}</c:if>
                                                                    </c:forEach>
                                                                </td>
                                                                <td class="text-left">
                                                                    <a href="read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&email_idx=<c:out value="${row.email_idx}"/>">
                                                                    ${row.title}</a>
                                                                    <c:if test="${row.hit >= 20}">
                                                                        <span class="hit">HIT</span>
                                                                    </c:if>
                                                                </td>
                                                                <td>${row.toemail}</td>
                                                                <td>${row.sendemail}</td>
                                                                <td>
                                                                	<fmt:parseDate var="dateString" value="${row.regdate}" pattern="yyyy-MM-dd" />                                                               
	                                                                <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/>
	                                                            </td>
	                                                            <c:if test="${sessionScope.isAdmin != null}">		
                                                                <td><a href="delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&email_idx=<c:out value="${row.email_idx}"/>">삭제</a></td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tbody>
                                        </table>
                                        <nav class="paging-group">
                                            <ul>
                                                <c:if test="${pageMaker.prev}">
                                                    <li><a href="list.do${pageMaker.makeSearch(1)}"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a></li>
                                                    <li><a href="list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                                    <%-- <li><a href="${pageMaker.startPage - 1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li> --%>
                                                </c:if>
                                                <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
                                                    <li>
                                                        <a href="list.do${pageMaker.makeSearch(idx)}" <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ' '}" /> >${idx}</a>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                                                    <%-- <li><a href="${pageMaker.endPage + 1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li> --%>
                                                    <li><a href="list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                                                    <li><a href="list.do${pageMaker.makeSearch(pageMaker.totalPage)}"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
                                                </c:if>
                                            </ul>
                                        </nav>
                                        <nav class="btn-group">
											<ul>
												<c:if test="${sessionScope.isAdmin != null}">												
												<li><input type="button" value="<spring:message code="button.allselect"/>" class="btnallCheck"/></li>
												<li><input type="button" value="<spring:message code="button.selectreverse"/>" class="reversalallCheck"/></li>
												<li><input type="button" value="<spring:message code="button.selectcancle"/>" class="unallCheck"/></li>
												<li><input type="button" value="<spring:message code="button.selectdelete"/>" onClick="location.href='delete.do'"/></li>
												</c:if>
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do'"/></li>
												<li><input type="button" value="<spring:message code="button.create"/>" onClick="location.href='write.do'"/></li>											
											</ul>
										</nav>
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
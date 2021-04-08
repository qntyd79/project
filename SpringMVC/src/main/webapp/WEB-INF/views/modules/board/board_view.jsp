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
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                            
                            
                                <h2><spring:message code="bbs.title.view"/></h2>
                                <form name="readForm" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="board_idx" value="<c:out value="${boardVO.board_idx}" />" >
                                    <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
                                    <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
                                    <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
                                    <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
                                    <fieldset>
                                         <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.view"/>" class="board_detail">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="20%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="col"><label for="date">제목 </label></th>
                                                    <td scope="col" colspan="3" class="text-left"><c:out value="${boardVO.title}" /></td>
                                                    <th><label for="hit">분류</label></th>
                                                    <td>
                                                        <c:forEach var="item" items="${categoryname}">
                                                            <c:if test="${boardVO.category_idx eq item.category_idx}">${item.title}</c:if>
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name">작성자</label></th>
                                                    <td><c:out value="${boardVO.name}" /></td>
                                                    <th><label for="regdate">등록일</label></th>
                                                    <td><c:out value="${boardVO.regdate}" /></td>
                                                    <th><label for="hit">조회수</label></th>
                                                    <td><c:out value="${boardVO.hit}" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" class="text-left" style="padding: 15px;">
                                                        <c:if test="${boardVO.tag == 0}">
                                                            <c:out value="${boardVO.content}" escapeXml="false" />
                                                        </c:if>
                                                        <c:if test="${boardVO.tag == 1}">
                                                            <pre class="brush:java toolbar:false">${fn:replace(fn:replace(boardVO.content, '<br/>', '') , '&nbsp;', '')}</pre>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" class="align-left">첨부파일목록출력</td>
                                                </tr>
                                                <tr>
                                                    <th><label for="link1">관련링크1</label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${not empty boardVO.link1}"><a href="${boardVO.link1}" target="_blank"><c:out value="${boardVO.link1}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                               	 관련링크가 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="link2">관련링크2</label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${not empty boardVO.link2}"><a href="${boardVO.link2}" target="_blank"><c:out value="${boardVO.link2}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                	관련링크가 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="pre">이전글 </label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${prenum.board_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${prenum.board_idx}" />"><c:out value="${prenum.title}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                	이전글이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="next">다음글 </label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${nextnum.board_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${nextnum.board_idx}" />"><c:out value="${nextnum.title}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                               	 다음글이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="next">접속아이피</label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:out value="${boardVO.cipp}" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table> 
                                        <nav class="btn-group">
											<ul>												
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}'" /></li>
										        <li><input type="button" value="<spring:message code="button.update"/>" onClick="location.href='modify.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${boardVO.board_idx}" />&category_idx=<c:out value="${boardVO.category_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.reply"/>" onClick="location.href='reply.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${boardVO.board_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.delete"/>" onClick="location.href='delete.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${boardVO.board_idx}" />'" /></li>
											</ul>
										</nav>                                       
                                        <!--<c:import url="/WEB-INF/views/modules/common/common_btn.jsp"/> -->                                       
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
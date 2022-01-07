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
                                    <input type="hidden" name="category_idx" value="<c:out value="${categoryVO.category_idx}" />" >
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
                                                <col width="11.42%" />
                                                <col width="11.42%" />
                                                <col width="11.42%" />
                                                <col width="11.42%" />
                                                <col width="11.42%" />
                                                <col width="11.42%" />
                                                <col width="11.42%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                	<th><label for="category_idx"><spring:message code="label.category_idx"/></label></th>
                                                    <td><c:out value="${categoryVO.title}" /></td>
                                                    <th><label for="name"><spring:message code="label.name"/></label></th>
                                                    <td><c:out value="${categoryVO.name}" /></td>
                                                    <th><label for="regdate"><spring:message code="label.regdate"/></label></th>
                                                    <td><fmt:parseDate var="dateString" value="${categoryVO.regdate}" pattern="yyyy-MM-dd" />                                                               
	                                                    <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/></td>
                                                    <th><label for="hit"><spring:message code="label.hit"/></label></th>
                                                    <td><c:out value="${categoryVO.hit}" /></td>
                                                </tr>                                                                                                                                          
                                                <tr>
                                                    <th><label for="pre"><spring:message code="label.pre"/></label></th>
                                                    <td colspan="7" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${prenum.category_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&category_idx=<c:out value="${prenum.category_idx}" />"><c:out value="${prenum.title}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                	이전글이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="next"><spring:message code="label.next"/></label></th>
                                                    <td colspan="7" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${nextnum.category_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&category_idx=<c:out value="${nextnum.category_idx}" />"><c:out value="${nextnum.title}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                               	 다음글이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="cipp"><spring:message code="label.cipp"/></label></th>
                                                    <td colspan="7" class="text-left">
                                                        <c:out value="${categoryVO.cipp}" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table> 
                                        <nav class="btn-group">
											<ul>												
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&kind=${criteria.kind}'" /></li>
										        <li><input type="button" value="<spring:message code="button.edit"/>" onClick="location.href='edit.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&category_idx=<c:out value="${categoryVO.category_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.reply"/>" onClick="location.href='reply.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&category_idx=<c:out value="${categoryVO.category_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.delete"/>" onClick="location.href='delete.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&category_idx=<c:out value="${categoryVO.category_idx}" />'" /></li>
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
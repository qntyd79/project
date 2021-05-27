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
                                    <input type="hidden" name="file_idx" value="<c:out value="${attachVO.file_idx}" />" >
                                    <input type="hidden" name="board_idx" value="<c:out value="${attachVO.board_idx}" />" >
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
                                                    <th scope="col"><label for="title"><spring:message code="label.title"/></label></th>
                                                    <td scope="col" colspan="7" class="text-center"><c:out value="${attachVO.title}" /></td>
                                                </tr>
                                                <tr>
                                                	<th><label for="board_idx"><spring:message code="label.category_idx"/></label></th>
                                                    <td>
                                                    	<c:forEach var="item" items="${categoryname}">
                                                            <c:if test="${attachVO.category_idx eq item.category_idx}">${item.title}</c:if>
                                                        </c:forEach>
                                                    </td>
                                                    <th><label for="name"><spring:message code="label.name"/></label></th>
                                                    <td><c:out value="${attachVO.name}" /></td>
                                                    <th><label for="regdate"><spring:message code="label.regdate"/></label></th>
                                                    <td><fmt:parseDate var="dateString" value="${attachVO.regdate}" pattern="yyyy-MM-dd" />                                                               
	                                                    <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/></td>
                                                    <th><label for="hit"><spring:message code="label.hit"/></label></th>
                                                    <td><c:out value="${attachVO.hit}" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="8" class="text-left" style="padding: 15px;">
                                                       <c:out value="${attachVO.content}" escapeXml="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="8" class="align-left">  
                                                                                                      	
					                                        <table summary="<spring:message code="bbs.table.summary.list"/>">
					                                            <caption><spring:message code="bbs.table.caption"/></caption>
					                                            <colgroup>
					                                                <col width="10%" />
					                                                <col width="30%" />
					                                                <col width="10%" />
					                                                <col width="15%" />
					                                                <col width="10%" />
					                                                <col width="10%" />
					                                                <col width="10%" />
					                                                <col width="5%" />
					                                            </colgroup>
					                                            <thead>
					                                                <tr class="tline">
					                                                    <th scope="col"><spring:message code="bbs.list.catetory_idx"/></th>
					                                                    <th scope="col">파일명</th>
					                                                    <th scope="col">파일사이즈</th>
					                                                    <th scope="col">파일타입</th>
					                                                    <th scope="col">파일확장자</th>
					                                                    <th scope="col">등록일</th>
					                                                    <th scope="col">다운로드</th>
					                                                    <th scope="col"><spring:message code="bbs.list.del"/></th>
					                                                </tr>
					                                            </thead>
					                                            <tbody>
					                                                <c:choose>
					                                                    <c:when test="${fn:length(list) == 0}">
					                                                        <tr>
					                                                            <td colspan="10"><spring:message code="info.nodata.msg"/></td>
					                                                        </tr>
					                                                    </c:when>
					                                                    <c:otherwise>                                                       
					                                                        <c:forEach varStatus="status" var="row" items="${list}">
					                                                            <tr>					                                                               
					                                                              	<td>
					                                                                    <c:forEach var="item" items="${categoryname}">
					                                                                        <c:if test="${row.category_idx == item.category_idx}">${item.title}</c:if>
					                                                                    </c:forEach>
					                                                                </td>
					                                                                <td class="text-left">                                                                    
					                                                                    <a href="read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&file_idx=<c:out value="${row.file_idx}"/>">${row.file_name}</a>
					                                                                    <c:if test="${row.hit >= 20}">
					                                                                        <span class="hit">HIT</span>
					                                                                    </c:if>
					                                                                </td>
					                                                                <td><fmt:formatNumber value="${row.file_size}" type="number"/>KB</td>
					                                                                <td>${row.file_type}</td>
					                                                                <td>${row.file_ext}</td>
					                                                                <td>
					                                                                	<fmt:parseDate var="dateString" value="${row.regdate}" pattern="yyyy-MM-dd" />                                                               
						                                                                <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/>
						                                                            </td>
					                                                                <td>클릭</td>
					                                                                <td><a href="delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&file_idx=<c:out value="${row.file_idx}"/>">D</a></td>
					                                                            </tr>
					                                                        </c:forEach>
					                                                    </c:otherwise>
					                                                </c:choose>
					                                            </tbody>
					                                       </table>	
					                                       				                                        
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th><label for="pre"><spring:message code="label.pre"/></label></th>
                                                    <td colspan="7" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${prenum.file_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&file_idx=<c:out value="${prenum.file_idx}" />"><c:out value="${prenum.title}" /></a>
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
                                                            <c:when test="${nextnum.file_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&file_idx=<c:out value="${nextnum.file_idx}" />"><c:out value="${nextnum.title}" /></a>
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
                                                        <c:out value="${attachVO.cipp}" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table> 
                                        <nav class="btn-group">
											<ul>												
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}'" /></li>
										        <li><input type="button" value="<spring:message code="button.update"/>" onClick="location.href='modify.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&file_idx=<c:out value="${attachVO.file_idx}" />&board_idx=<c:out value="${attachVO.board_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.delete"/>" onClick="location.href='delete.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&file_idx=<c:out value="${attachVO.file_idx}" />'" /></li>
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
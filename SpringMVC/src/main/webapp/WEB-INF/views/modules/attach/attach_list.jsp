<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/views/include/header.jsp" />

<div id="container-wrap">
	<div class="clearfix">
		<div class="content-box">
			<div class="content-full-img02"></div>
			<div class="content-full-bg02-hidden">
				<section class="content">
					<c:import url="/WEB-INF/views/include/content_header.jsp" />
					<article>
						<div class="row">
							<div class="col-md-12">


								<h2><spring:message code="bbs.title.list" /></h2>								
								<div class="articles">전체글 : <span>${pageMaker.totalCount}</span> 개 | 현재페이지 : <span>${pageMaker.criteria.page}</span> | 총페이지 : <span>${pageMaker.totalPage}</span></div>
								<form name="listForm" method="post"	enctype="multipart/form-data" action="list.do">
									<fieldset>
										<legend>
											<spring:message code="bbs.table.legend" />
										</legend>
										<table
											summary="<spring:message code="bbs.table.summary.list"/>">
											<caption>
												<spring:message code="bbs.table.caption" />
											</caption>
											<colgroup>
												<c:if test="${sessionScope.isAdmin != null}">		
												<col width="5%" />
												</c:if>
												<col width="5%" />
												<col width="40%" />
												<col width="10%" />
												<col width="10%" />
												<col width="10%" />
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
													<th scope="col"><spring:message code="bbs.list.no" /></th>
													<th scope="col">파일명</th>
													<th scope="col">파일사이즈</th>
													<th scope="col">파일확장자</th>
													<th scope="col">등록일</th>
													<th scope="col">다운로드</th>
													<c:if test="${sessionScope.isAdmin != null}">		
													<th scope="col"><spring:message code="bbs.list.del" /></th>
													</c:if>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${fn:length(list) == 0}">
														<tr>
															<td colspan="8"><spring:message code="info.nodata.msg" /></td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach varStatus="status" var="row" items="${list}">
															<tr>
																<c:if test="${sessionScope.isAdmin != null}">		
																<td><label><input type="checkbox" name="check" /></label></td>
																</c:if>
																<td><strong>${pageMaker.curNum-status.index}</strong></td>
																<td class="text-left">${row.file_name}</td>
																<td><fmt:formatNumber value="${row.file_size}" type="number" />KB</td>
																<td>${row.file_ext}</td>
																<td>
																	<fmt:parseDate var="dateString"	value="${row.regdate}" pattern="yyyy-MM-dd" />
																 	<fmt:formatDate	value="${dateString}" pattern="yyyy-MM-dd" />
																</td>
																<td><a href="fileDownload.do?file_idx=<c:out value="${row.file_idx}"/>">다운로드</a></td>
																		
																<td><a href="fileDelete.do?file_idx=<c:out value="${row.file_idx}"/>">삭제</a></td>
																
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

<c:import url="/WEB-INF/views/include/footer.jsp" />
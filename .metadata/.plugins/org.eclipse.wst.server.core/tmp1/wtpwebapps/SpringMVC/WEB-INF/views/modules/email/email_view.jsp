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
                                    <input type="hidden" name="email_idx" value="<c:out value="${emailVO.email_idx}" />" >
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
                                                <col width="15%" />
                                                <col width="15%" />
                                                <col width="20%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="col"><label for="title"><spring:message code="label.title"/></label></th>
                                                    <td scope="col" colspan="6" class="text-left"><c:out value="${emailVO.title}" /></td>
                                                   
                                                </tr>
                                                <tr>                                                	
                                                   	<th><label for="toemail"><spring:message code="label.toemail"/></label></th>
                                                    <td colspan="2"><c:out value="${emailVO.toemail}" /></td>
                                                    <th><label for="regdate"><spring:message code="label.regdate"/></label></th>
                                                    <td colspan="2"><fmt:parseDate var="dateString" value="${emailVO.regdate}" pattern="yyyy-MM-dd" />                                                               
	                                                    <fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd"/>
	                                                </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="8" class="text-left" style="padding: 15px;">                                                       
                                                    	<c:out value="${emailVO.content}" escapeXml="false" />
                                                    </td>
                                                </tr>
                                                  <tr>
                                                    <td colspan="8" class="align-left">
                                                    	<!-- 첨부파일 목록출력 시작 -->
	                                                    <fieldset>
															<legend><spring:message code="bbs.table.legend" /></legend>
															<table summary="<spring:message code="bbs.table.summary.list"/>">
																<caption><spring:message code="bbs.table.caption" /></caption>
																<colgroup>
																	<col width="5%" />
																	<col width="45%" />
																	<col width="10%" />
																	<col width="10%" />
																	<col width="10%" />
																	<col width="10%" />
																	<col width="10%" />
																</colgroup>
																<thead>
																	<tr class="tline">
																		<th scope="col"><spring:message code="bbs.list.no"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filename"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filesize"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filetype"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.regdate"/></th>
                                                                        <th scope="col">다운로드</th>
																		<th scope="col"><spring:message code="bbs.list.del" /></th>
																	</tr>
																</thead>
																<tbody>
																	<c:choose>
																		<c:when test="${fn:length(filelist) == 0}">
																			<tr>
																				<td colspan="7"><spring:message code="info.nodata.msg" /></td>
																			</tr>
																		</c:when>
																		<c:otherwise>
																			<c:forEach varStatus="status" var="row" items="${filelist}">
																				<tr>	
																					<td><strong>${status.index+1}</strong></td>														
																					<td class="text-left"><a href="read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&file_idx=<c:out value="${row.file_idx}"/>">${row.file_name}</a></td>
																					<td><fmt:formatNumber value="${row.file_size}" type="number"/>KB</td>
																					<td>${row.file_ext}</td>
																					<td>
																						<fmt:parseDate var="dateString" value="${row.regdate}" pattern="yyyy-MM-dd"/> 
																						<fmt:formatDate	value="${dateString}" pattern="yyyy-MM-dd"/></td>
																					<td>클릭</td>
																					<td><a href="attachDelete.do?filename=<c:out value="${row.file_hash_name}"/>&board_idx=<c:out value="${boardVO.board_idx}"/>&file_idx=<c:out value="${row.file_idx}"/>">삭제</a></td>
																				</tr>
																			</c:forEach>
																		</c:otherwise>
																	</c:choose>
																</tbody>
															</table>										
														</fieldset>
														<!-- 첨부파일 목록출력 종료 -->
                                                    </td>
                                                </tr>                                              
                                                <tr>
                                                    <th><label for="pre"><spring:message code="label.pre"/></label></th>
                                                    <td colspan="7" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${prenum.email_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value="${prenum.email_idx}" />"><c:out value="${prenum.title}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                	이전글이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="next"><spring:message code="label.next"/> </label></th>
                                                    <td colspan="7" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${nextnum.email_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value="${nextnum.email_idx}" />"><c:out value="${nextnum.title}" /></a>
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
                                                        <c:out value="${emailVO.cipp}" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table> 
                                        <nav class="btn-group">
											<ul>												
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}'" /></li>
										        <li><input type="button" value="<spring:message code="button.update"/>" onClick="location.href='edit.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value="${emailVO.email_idx}" />&category_idx=<c:out value="${emailVO.category_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.delete"/>" onClick="location.href='delete.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value="${emailVO.email_idx}" />'" /></li>
											</ul>
										</nav>                                       
                                        <!--<c:import url="/WEB-INF/views/modules/common/common_btn.jsp"/> -->                                       
                                    </fieldset>
                                </form>
                                <!-- 코멘트 목록출력 시작
                                <script type="text/javascript" language="javascript">
                             		$(document).ready(function(){	

                             			var email_idx = "${emailVO.email_idx}";
                    
										$.ajax({
											type : "POST", //전송방식을 지정한다 (POST,GET)
										    url : "${path}/modules/comment/ajaxlist.do?email_idx=" + email_idx,//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
	    								    dataType : "text",
	 									    success : function(result){
										    	$("#result").html(result); //div에 받아온 값을 넣는다.
										    	//alert("통신 데이터 값 : " + result);
										    	console.log("호출성공");
										    },
										    error : function(){
										    	console.log("호출실패");
										    }
									    });
									});
								</script>
                                <div id="result"></div>
                               코멘트 목록출력 종료 -->
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp"/>
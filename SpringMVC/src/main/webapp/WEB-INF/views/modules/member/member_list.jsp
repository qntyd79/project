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
                                <h2>회원목록</h2>
                                <script type="text/javascript">
								
								    function doExcelUploadProcess(){
									   
										var f = new FormData(document.getElementById('excelform'));
											
										if(document.excelform.attach.value == ""){
											alert("업로드할 엑셀파일을 등록해주세요.")
											return;
										} else {											
										    $.ajax({
										    url: "${path}/modules/member/excelUpload.do",
										    data: f,
										    processData: false,
										    contentType: false,
										    type: "POST",
										    success: function(data){
											    //console.log(data);
											    document.getElementById('result').innerHTML = JSON.stringify(data);
											    }
											})
										}
									    
									}
								    
								    function doExcelDownloadProcess(){
								        var f = document.excelform;
								        f.action = "excelDownload.do";
								        f.submit();
								    }								    
								</script>
								<form name="excelform" id="excelform" method="post" enctype="multipart/form-data">
									<div class="search-form" style="float:both; text-align:right; margin-bottom:10px;">
										<div class="filebox">
											<input class="upload-name" id="item" disabled="disabled" style="width:260px;"/>
											<label for="ex_filename" >파일첨부</label>
											<input type='file' name='attach' id='ex_filename' class='upload-hidden'/>
											<input type="button" id="addItemBtn" value="엑셀업로드" onclick="doExcelUploadProcess()"/>
											<button type="button" class="green" onclick="doExcelDownloadProcess()">엑셀다운로드</button>	
										</div>	
									</div>						  
								</form>
								<div id="result"></div>	
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
											<input type="button" value="<spring:message code="button.search"/>"  id="searchBtn" onclick="$(this.form).submit()"/> 
											<input type="button" value="<spring:message code="button.init"/>" onClick="window.location='list.do'" />  											                                   
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
                                        <table summary="기본게시판 보여주고 있습니다.">
                                            <caption>등록일 : 2017년08월24일 기준</caption>
                                            <colgroup>
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="15%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="15%" />
                                                <col width="5%" />
                                            </colgroup>
                                            <thead>
                                                <tr class="tline">
                                                    <th scope="col"><label><input type="checkbox" class="allCheck" name="allCheck"/></label></th>
                                                    <th scope="col">N</th>
                                                    <th scope="col">회원아이디</th>
                                                    <th scope="col">회원이름</th>
                                                    <th scope="col">이메일</th>
                                                    <th scope="col">핸드폰번호</th>
                                                    <th scope="col">전화번호</th>                                                    
                                                    <th scope="col">포인트</th>
                                                    <th scope="col">메일수신</th>
                                                    <th scope="col">가입일</th>
                                                    <th scope="col">삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:choose>
												<c:when test="${fn:length(list) == 0}">
													<tr>
                                                        <td colspan="12"><label>등록된 회원이 없습니다.</label></td>
													</tr>
												</c:when>									
												<c:otherwise>
												<c:forEach varStatus="status" var="row" items="${list}">
                                                <tr>
                                                    <td><label><input type="checkbox" name="check" /></label></td>
                                                    <td><strong>${pageMaker.curNum-status.index}</strong></td>                                                    
                                                    <td><a href="read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&member_idx=<c:out value="${row.member_idx}"/>">${row.userid}</a></td>
                                                    <td>${row.name}</td>
                                                    <td>${row.email}</td>
                                                    <td>${row.hphone}</td>
                                                    <td>${row.phone}</td>
                                                    <td>${row.point}</td>
                                                    <td>${row.mail_check eq '1' ? 'Y' : 'N'}</td>
                                                    <td>${row.join_date}</td>                                                    
                                                    <td><a href="delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&member_idx=<c:out value="${row.member_idx}"/>">삭제</a></td>
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
														<a href="list.do${pageMaker.makeSearch(idx)}" <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ' '}"/> >${idx}</a>
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
												<c:if test="${sessionScope.isAdmin == null}">												
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
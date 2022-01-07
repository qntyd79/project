<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
<validator:javascript formName="categoryVO" staticJavascript="false" xhtml="true" cdata="false"/>

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
                                                     
                            
                                <h2><spring:message code="bbs.title.edit"/></h2>
                                <form:form modelAttribute="categoryVO" method="post" id="categoryForm" name="categoryForm" enctype="multipart/form-data" action="update.do">
                                <input type="hidden" name="category_idx" value="<c:out value=" ${categoryVO.category_idx}"/>" >
						        <input type="hidden" name="kind" value="<c:out value=" ${categoryVO.kind}"/>" >
						        <input type="hidden" name="board_idx" value="<c:out value=" ${categoryVO.board_idx}"/>" >
						        <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
						        <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
						        <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
						        <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
						        <input type="hidden" name="msgStr" value="<c:out value=" ${msg}"/>" >
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.edit"/>" class="board_detail">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="80%" />
                                            </colgroup>
                                            <tbody>                                            
                                                <tr>
						                            <th><label for="name"> <spring:message code="label.name"/></label></th>
						                            <td class="text-left"><input type="text" name="name" placeholder="Name" class="wfull" value="<c:out value='${categoryVO.name}'/>" readonly="readonly"/><form:errors path="name" /></td>
						                        </tr>
						                        <tr>
						                            <th><label for="pass"> <spring:message code="label.pass"/></label></th>
						                            <td class="text-left"><input type="password" name="pass" placeholder="Password" class="wfull"/><form:errors path="pass" /></td>
						                        </tr>
                                                <tr>
						                            <th><label for="kind"> <spring:message code="label.kind"/></label></th>
						                            <td class="text-left">
						                            	<select id="kind" name="kind">
						                            		<option value='' <c:if test="${categoryVO.kind eq 0}">selected</c:if>>선택된 분류가 없습니다</option>
						                                	<option value='1' <c:if test="${categoryVO.kind eq 1}">selected</c:if>>게시판서비스에 분류추가</option>
						                                	<option value="2" <c:if test="${categoryVO.kind eq 2}">selected</c:if>>회원서비스에 분류추가</option>
						                                	<option value="3" <c:if test="${categoryVO.kind eq 3}">selected</c:if>>메일서비스에 분류추가</option>
						                           		</select>						                           		
                                                        <form:errors path="kind" />						                           	
						                        	</td>
						                        </tr>
						                        <tr>
						                            <th><label for="categorytitle"><spring:message code="label.categorytitle"/></label></th>
						                            <td class="text-left">
						                            	<input type="text" name="title" placeholder="CategoryName" class="wfull" value="<c:out value='${categoryVO.title}'/>"/>
						                            </td>
						                        </tr>
                                                <tr>
                                                    <th><label for="code"><spring:message code="label.code"/></label></th>
                                                    <td class="text-left">
                                                        <img id="captchaImg" src="${path}/modules/category/captchaImg.do" />
                                                        <div id="captchaAudio" style="display:none;"></div>                                                       
                                                        <input type="button" id="refreshBtn" value="<spring:message code="button.refresh"/>" >
                                                        <input type="button" id="audio" value="<spring:message code="button.voice"/>" >  
                                                        <input type="text" id="answer" name="answer" placeholder="CaptchaCode"/> 
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
											<ul>
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do?kind=1'"/></li>
												<li><input type="button" value="<spring:message code="button.edit"/>" onclick="$(this.form).submit()" /></li>											
											</ul>
										</nav>
										<!--<c:import url="/WEB-INF/views/modules/common/common_btn.jsp"/>-->
                                    </fieldset>
                                </form:form>
                                
                                
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp"/>
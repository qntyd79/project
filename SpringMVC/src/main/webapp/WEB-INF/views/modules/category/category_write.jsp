<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
<validator:javascript formName="categoryVO" staticJavascript="false" xhtml="true" cdata="false"/>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script type="text/javaScript">       
  	
    /* 등록 function */
    function fn_insert(form){    	
    	if(!validateBoardDto(form)){
    		return;
    	} else {
	    	form.action = "<c:url value='insert.do'/>";
	    	form.submit();
    	}
    }
          
	/* 수정 화면 function */
    function fn_modify(val) {
       	document.listForm.selectedId.value = val;
       	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
       	document.listForm.submit();
    }
        
    /* 등록 화면 function */
    function fn_write() {
    	form.action = "<c:url value='insertPermssionUser.do'/>";
    	form.submit();
    }
        
    /* 목록 화면 function */
    function fn_list() {
    	location.href = "<c:url value='list.do'/>";
    }
    
    /* 삭제 화면 function */
    function fn_delete(val) {
    	document.listForm.selectedId.value = val;	
      	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
       	document.listForm.submit();
    }    
        
    /* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo) {
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
						    
						        <h2>글쓰기</h2>
						        <form:form modelAttribute="categoryVO" method="post" id="writeForm" name="writeForm" enctype="multipart/form-data" action="insert.do">
                                     <fieldset>
						                <legend>Board Write Form</legend>
						                <table summary="기본게시판 보여주고 있습니다." class="board_detail">
						                    <caption>등록일 : 2017년08월24일 기준</caption>
						                    <colgroup>
						                        <col width="20%" />
						                        <col width="80%" />
						                    </colgroup>
						                    <tbody>
						                        <tr>
						                            <th><label for="name"><spring:message code="label.name"/></label></th>
						                            <td class="text-left"><form:input path="name" type="text"  placeholder="Name" class="wfull"/> <form:errors path="name" /> <span>6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span></td>
						                        </tr>
						                        <tr>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                    <td class="text-left"><form:input path="pass" type="password" placeholder="Password" class="wfull"/> <form:errors path="pass" /> <span>6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span></td>
                                                </tr>
						                        <tr>
						                            <th><label for="kind"> <spring:message code="label.kind"/></label></th>
						                            <td class="text-left">
						                            	<!-- 
						                            	<form:select path="kind">
						                            		<c:forEach var="item" items="${categorylist}" varStatus="status">
	                                                        	<option value="<c:out value='${item.category_idx}'/>"
		                                                        <c:if test="${item.category_idx == categoryselect}">
		                                                        	<c:out value="selected=selected" />
		                                                        </c:if> >
	                                                            <c:out value="${item.title}" />
	                                                            </option>
                                                            </c:forEach>
                                                        </form:select>
                                                        -->
						                            	<select name="kind">
						                            		<option value='0' selected="selected">분류를 선택해주세요 </option>
						                                	<option value='1' >게시판에 분류 추가 </option>
						                                	<option value="2">회원가입에 분류 추가 </option>
						                           		</select>
						                        	</td>
						                        </tr>
						                        <tr>
                                                    <th><label for="title"><spring:message code="label.categorytitle"/></label></th>
                                                    <td class="text-left"><form:input path="title" type="text" placeholder="Title" class="wfull"/> <form:errors path="title" /></td>
                                                </tr>
						                    </tbody>
						                </table>
						                <nav class="btn-group">
						                    <ul>
                                                <li><input type="button" value="목록가기" onClick="javascript:fn_list();"></li>
                                                <li><input type="button" value="등록하기" onclick="$(this.form).submit();"></li>
                                            </ul>
						                </nav>
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
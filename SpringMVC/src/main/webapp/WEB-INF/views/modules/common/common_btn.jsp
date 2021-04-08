<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<script type="text/javaScript">       
  	
    /* 등록저장 function */
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
       	location.href = "<c:url value='edit.do'/>";
    }
        
    /* 등록 화면 function */
    function fn_write() {
    	location.href = "<c:url value='write.do'/>";
    }

    /* 답글 화면 function */
    function fn_reply() {
    	location.href = "<c:url value='reply.do'/>";
    }
        
    /* 목록 화면 function */
    function fn_list() {
    	location.href = "<c:url value='list.do'/>";
    }
    
    /* 삭제 화면 function */
    function fn_delete() {
    	location.href = "<c:url value='delete.do'/>";
    } 
       
</script>

<nav class="btn-group">
	<ul>
		<li><input type="button" value="<spring:message code="button.list"/>" onClick="javascript:fn_list();"/></li>
		<li><input type="button" value="<spring:message code="button.create"/>" onClick="javascript:fn_write();"/></li>
		<li><input type="button" value="<spring:message code="button.allselect"/>" class="btnallCheck"/></li>
		<li><input type="button" value="<spring:message code="button.selectreverse"/>" class="reversalallCheck"/></li>
		<li><input type="button" value="<spring:message code="button.selectcancle"/>" class="unallCheck"/></li>
		<li><input type="button" value="<spring:message code="button.selectdelete"/>" onClick="javascript:fn_delete();"/></li>
		
		<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}'" /></li>
        <li><input type="button" value="<spring:message code="button.create"/>" onClick="location.href='write.do'" /></li>
        <li><input type="button" value="<spring:message code="button.update"/>" onClick="location.href='modify.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${boardVO.board_idx}" />&category_idx=<c:out value="${boardVO.category_idx}" />'" /></li>
        <li><input type="button" value="<spring:message code="button.delete"/>" onClick="location.href='delete.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${boardVO.board_idx}" />'" /></li>
        <li><input type="button" value="<spring:message code="button.reply"/>" onClick="location.href='reply.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&board_idx=<c:out value="${boardVO.board_idx}" />'" /></li>
        
        <li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do'"></li>
		<li><input type="button" value="<spring:message code="button.delete"/>" onclick="$(this.form).submit()"></li>
	</ul>
</nav>
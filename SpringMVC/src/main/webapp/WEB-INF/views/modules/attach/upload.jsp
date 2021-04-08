<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javaScript" language="javascript" defer="defer">
       
	/* 수정 화면 function */
    function fn_egov_select(id)
	{
       	document.listForm.selectedId.value = id;
       	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
       	document.listForm.submit();
    }
        
    /* 등록 화면 function */
    function fn_egov_addView()
    {
     	document.listForm.action = "<c:url value='insertPermssionUser.do'/>";
       	document.listForm.submit();
    }
        
    /* 목록 화면 function */
    function fn_egov_selectList()
    {
      	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
       	document.listForm.submit();
    }
        
    /* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo)
    {
      	document.listForm.pageIndex.value = pageNo;
       	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
      	document.listForm.submit();
    }

</script>
<c:import url="/WEB-INF/views/include/header.jsp"/>

<h2>Write</h2>
<form id="Form" name="writeForm" method="post"enctype="multipart/form-data" action="upload.do">
	<fieldset>
		<legend>Board Write Form</legend>
		<table summary="기본게시판 보여주고 있습니다." class="table">
			<caption>등록일 : 2018년05월14일 기준</caption>
			<colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
			<tbody>
				<tr>
					<th><label for="name">첨부파일</label></th>
					<td class="text-left">
						<div class="filedrop"></div>
					</td>
				</tr>
				<tr>
					<th><label for="name">파일목록</label></th>
					<td class="text-left">
						<div class="uploadlist"></div>
					</td>
				</tr>
			</tbody>
		</table>
		<nav class="btn-group">
			<ul>
				<li><input type="button" value="목록가기" onClick="location.href='list.do'"></li>
				<!--<li><input type="button" value="등록하기" onClick="Board_Write_Check();"></li>-->
				<!--<li><input type="button" value="등록하기" onclick="$(this.form).submit()"></li>-->
				<button type="submit" class="btn btn-warning">제출하기</button>
			</ul>
		</nav>
	</fieldset>
</form>

<c:import url="/WEB-INF/views/include/footer.jsp"/>
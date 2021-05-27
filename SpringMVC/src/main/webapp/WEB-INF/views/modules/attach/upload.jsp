<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
<validator:javascript formName="attachVO" staticJavascript="false"
	xhtml="true" cdata="false" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<c:import url="/WEB-INF/views/include/header.jsp" />

<h2><spring:message code="bbs.title.write" /></h2>
<form:form modelAttribute="attachVO" method="post" id="writeForm" name="writeForm" enctype="multipart/form-data" action="upload.do">
	<input type="hidden" name="msgStr" value="<c:out value="${msg}"/> ">
	<fieldset>
		<legend>
			<spring:message code="bbs.table.legend" />
		</legend>
		<table summary="<spring:message code="bbs.table.summary.write"/>"
			class="board_detail">
			<caption>
				<spring:message code="bbs.table.caption" />
			</caption>
			<colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
			<tbody>
				<tr>
					<th><label for="name"><spring:message code="label.file"/></label></th>
					<td class="text-left"><div class="filedrop"></div></td>
				</tr>
				<tr>
					<th><label for="name">파일목록</label></th>
					<td class="text-left"><div class="uploadlist"></div></td>
				</tr>
				<tr>
					<th><label for="code"><spring:message code="label.code" /></label></th>
					<td class="text-left"><img id="captchaImg" src="${path}/modules/attach/captchaImg.do" />
						<div id="captchaAudio" style="display: none;"></div> 
						<input type="button" id="refreshBtn" value="<spring:message code="button.refresh"/>">
						<input type="button" id="audio" value="<spring:message code="button.voice"/>">
						<input type="text" id="answer" name="answer" placeholder="CaptchaCode" />
					</td>
				</tr>
			</tbody>
			</tbody>
		</table>
		<nav class="btn-group">
			<ul>
				<li><input type="button"
					value="<spring:message code="button.list"/>" onClick="location.href='list.do'" /></li>
				<li><input type="button" value="<spring:message code="button.create"/>"	onClick="$(this.form).submit();" /></li>
			</ul>
		</nav>
	</fieldset>
</form:form>

<c:import url="/WEB-INF/views/include/footer.jsp" />
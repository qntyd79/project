<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript">
	//메세지 출력
	var message = '${msg}';
	var url = '${url}';
	
	if (message == "LoginSuccess") {
		alert("정상적으로 로그되었습니다.");
		location.href = url;
	} else if (message == "LoginFailed") {
	    alert("로그인정보가 일치하지 않습니다.");
	    location.href = url;
	} else if (message == "LogoutSuccess") {
	    alert("로그아웃 되었습니다.");
	    location.href = url;
	} else if (message == "InsertSuccess") {
		alert("정상적으로 등록되었습니다.");
		location.href = url;
	} else if (message == "UpdateSuccess") {
	    alert("정상적으로 수정되었습니다.");
	    location.href = url;
	} else if (message == "DeleteSuccess") {
	    alert("정상적으로 삭제되었습니다.");
	    location.href = url;
	} else if (message == "PassFailed") {
	  	alert("비밀번호가 일치하지 않습니다.");
	  	location.href = url;
	} else if (message == "CaptchaFailed") {
		alert("자동등록방지코드가 일치하지 않습니다.");
		location.href = url;
	} else if (message == "UploadSuccess") {
	  	alert("파일 등록 성공");
	  	location.href = url;
	} else if (message == "UploadFailed") {
		alert("파일 등록 실패");
		location.href = url;
	} else if (message == "MailSuccess") {
		alert("메일 발송 성공");
		location.href = url;
	} else if (message == "MailFailed") {
		alert("메일 발송 실패");
		location.href = url;
	}
	
</script>
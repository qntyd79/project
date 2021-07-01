<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="gnb-box">
    <nav class="gnb">
        <ul>
        	<c:choose>
	        	<c:when test="${sessionScope.userid == null}">
		            <li><a href="${path}/modules/member/login.do"><i class="fas fa-user-lock"></i> 로그인</a></li>
		            <li><a href="${path}/modules/member/auth.do"><i class="fas fa-address-card"></i> 회원가입</a></li>
		            <li><a href="${path}/modules/member/find.do"><i class="fas fa-address-card"></i>아이디/비밀번호찾기</a></li>
	            </c:when>
	            <c:otherwise>
		            <li><a href="${path}/modules/member/login.do"> ${sessionScope.name} </a></li>
		            <li><a href="${path}/index.do"><i class="fas fa-desktop"></i>회원정보</a></li>
		            <li><a href="${path}/modules/member/logout.do"><i class="fas fa-user-lock"></i> 로그아웃 </a></li>
	            </c:otherwise>
            </c:choose>
            <li><a href="${path}/contents/sitemap.do"><i class="fas fa-sitemap"></i> 사이트맵</a></li>
            <li><a href="${path}/modules/board/list.do"><i class="fas fa-users"></i> 고객센터</a></li>
            <li><a href='#' onclick="window.open('/contents/map.do','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=1024,height=1000,left=0, top=0, scrollbars=no');return false">
<i class="fas fa-map"></i> 지도서비스</a></li>
        </ul>
        <a href="#" id="pull"><i class="fas fa-bars"></i></a>
    </nav>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/modules/header.jsp"/>

	<h1 class="text-center">System Error</h1>
	<h2 class="content-subtitle"><i class="fa fa-warning text-red"></i><c:out value="${exception.getMessage()}"/></h2>
	<ul>
		<c:forEach items="${exception.getStackTrace()}" var="stack">
		<li><p>${stack.toString()}</p></li>
		</c:forEach>
	</ul>					

<c:import url="/WEB-INF/views/modules/footer.jsp"/>		
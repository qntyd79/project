<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="siteTitle"><spring:message code="site.title"/></c:set>
<!DOCTYPE html>
<html lang="kor">
<head>
	<title>${siteTitle}</title>
	<!--  파비콘 미설정시 해지 <link rel="icon" href="data:;base64,iVBORw0KGgo="> -->	
	<!-- 파비콘 설정 https://www.favicon-generator.org -->
	<!-- Chrome, Safari, IE -->
	<link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon/favicon.ico">
	<link rel="icon" type="image/x-icon" href="/resources/images/favicon/favicon.ico">
	
	<!-- Firefox, Opera (Chrome and Safari say thanks but no thanks) -->
	<link rel="apple-touch-icon" sizes="57x57" href="/resources/images/favicon/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/resources/images/favicon/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/resources/images/favicon/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/resources/images/favicon/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/resources/images/favicon/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/resources/images/favicon/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/resources/images/favicon/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/resources/images/favicon/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/resources/images/favicon/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/resources/images/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/resources/images/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/resources/images/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/resources/images/favicon/favicon-16x16.png">
	<link rel="manifest" href="/resources/images/favicon/manifest.json">		
    <meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/resources/images/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content=-1 />
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />   

    <!-- css -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <!--  <link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400,700,800&display=swap&subset=korean" rel="stylesheet">-->
    <link href="<c:url value="/resources/css/fontawesome.all.min.css" />" rel="stylesheet" type="text/css" media="all">
    <link href="<c:url value="/resources/css/jquery.bxslider.css" />" rel="stylesheet" type="text/css" media="all">    
    <link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet" type="text/css" media="all">
    <link href="<c:url value="/resources/css/dataTables.min.css" />" rel="stylesheet" type="text/css" media="all"/> 
     <link href="<c:url value="/resources/css/odefault.less" />" rel="stylesheet/less" type="text/css" media="all" > 
    <link href="<c:url value="/resources/css/ol.css" />" rel="stylesheet" type="text/css" media="all" >
    <link href="<c:url value="/resources/plugin/syntaxhighlighter/styles/shCoreDefault.css" />" rel="stylesheet" type="text/css" media="all" >  
    <link href="<c:url value="/resources/plugin/syntaxhighlighter/styles/shThemeEclipse.css" />" rel="stylesheet" type="text/css" media="all" >   
   
    <!--  js -->
    <script src="<c:url value="/resources/js/less.min.js"/>" ctype="text/javascript" charset="UTF-8"></script> 
    <script src="<c:url value="/resources/js/html5.js"/>" type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/respond.min.js"/>" type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/jquery-3.2.1.min.js"/>" type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/jquery-ui.min.js"/>" type="text/javascript" charset="UTF-8"></script>   
    <script src="<c:url value="/resources/js/jquery.bxslider.min.js"/>" type="text/javascript" charset="UTF-8"></script> 
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/messages_ko.min.js"/>" type="text/javascript" charset="UTF-8"></script>
    <script src="https://cdn.datatables.net/v/dt/dt-1.12.1/datatables.min.js" type="text/javascript" ></script>
    <script src="<c:url value="/resources/js/ol.js"/>" type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/proj4.js" />"type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/map.js" />"type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/my_jquery.js"/>" type="text/javascript" charset="UTF-8"></script>      
    
    <!--  plugin -->
    <script src="<c:url value="/resources/plugin/ckeditor4/full/ckeditor.js" />" type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/plugin/syntaxhighlighter/scripts/shCore.js"/>" type="text/javascript" charset="UTF-8"></script> 
    <script src="<c:url value="/resources/plugin/syntaxhighlighter/scripts/shBrushJava.js"/>" type="text/javascript" charset="UTF-8"></script> 
    <script type="text/javascript">SyntaxHighlighter.all();</script>
</head>
	
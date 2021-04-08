<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="siteTitle"><spring:message code="site.title"/></c:set>
<!DOCTYPE html>
<html lang="kor">
<head>
	<link rel="shortcut icon" href="#">
    <title>${siteTitle}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content=-1 />
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no" />

    <!-- css -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400,700,800&display=swap&subset=korean" rel="stylesheet">
    <link href="<c:url value="/resources/css/fontawesome.all.min.css" />" rel="stylesheet" type="text/css" media="all">
    <link href="<c:url value="/resources/css/jquery.bxslider.min.css" />" rel="stylesheet" type="text/css" media="all">    
    <link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet" type="text/css" media="all">
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
    <script src="<c:url value="/resources/js/ol.js"/>" type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/proj4.js" />"type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/map.js" />"type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/js/my_jquery.js"/>" type="text/javascript" charset="UTF-8"></script>      
    
    <!--  plugin -->
    <script src="<c:url value="/resources/plugin/ckeditor4/full/ckeditor.js" />"type="text/javascript" charset="UTF-8"></script>
    <script src="<c:url value="/resources/plugin/syntaxhighlighter/scripts/shCore.js"/>" type="text/javascript" charset="UTF-8"></script> 
    <script src="<c:url value="/resources/plugin/syntaxhighlighter/scripts/shBrushJava.js"/>" type="text/javascript" charset="UTF-8"></script> 
    <script type="text/javascript">SyntaxHighlighter.all();</script>
</head>
	
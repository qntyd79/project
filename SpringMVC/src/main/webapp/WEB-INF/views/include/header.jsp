<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/include/head.jsp"/>
<body>
    <div id="preloader">
        <div id="status"></div>
    </div>
    <div id="wrap">
        <div id="header-wrap">
            <div class="header-box">
                <header class="header">
                    <%@ include file="gnb.jsp"%>
                    <div class="logo-box">
                        <h1 class="logo"><a href="/index.do"><img src="/resources/images/logo/logo.png"/></a></h1>
                    </div>
                    <div class="lnb-box">
                        <nav class="lnb">
                            <ul>
                                <li class="dropdown">
                                    <a href="/contents/slider.do"> 슬라이드인덱스</a>
                                    <ul class="dropdown-submenu">
                                        <li><a href="/contents/video.do">동영상인덱스</a></li>
                                        <li><a href="/contents/div-center.do">가운데정렬</a></li>
                                        <li><a href="/contents/table.do"> 테이블폼</a></li>
                                        <li><a href="https://github.com/" target="_blank">github</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="/modules/member/loginfull.do"> 로그인풀화면</a>
                                    <ul class="dropdown-submenu">
                                        <li><a href="/modules/member/login.do">회원로그인폼</a></li>                                       
                                        <li><a href="/modules/member/auth.do">회원실명인증</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="/modules/member/agree.do"> 회원가입폼</a>
                                    <ul class="dropdown-submenu">
                                        <li><a href="/modules/member/write_group.do">회원가입폼(그룹)</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="/modules/board/list.do"> 기본게시판 </a>
                                    <ul class="dropdown-submenu">
                                        <li><a href="/modules/category/list.do">분류게시판</a></li>
                                        <li><a href="/modules/comment/list.do">댓글게시판</a></li>
                                        <li><a href="/modules/attach/list.do">파일게시판</a></li>        
                                        <li><a href="/modules/email/list.do">메일게시판</a></li>
                                        <li><a href="/modules/board/ajaxlist.do">ajax게시판</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="/contents/content01.do"> 컨텐츠폼</a>
                                    <ul class="dropdown-submenu">
                                        <li><a href="/contents/content02.do">컨텐츠폼02</a></li>
                                        <li><a href="/contents/content03.do">컨텐츠폼03</a></li>
                                        <li><a href="/contents/content04.do">컨텐츠폼04</a></li>
                                        <li><a href="/contents/content05.do">컨텐츠폼05</a></li>
                                        <li><a href="/contents/content06.do">컨텐츠폼06</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                        <li><a href="#">메뉴추가</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="/contents/innomaps.do"> InnoMaps</a>
                                    <ul class="dropdown-submenu">
                                        <li><a href="/contents/company.do"> 회사소개</a></li>
                                        <li><a href="/contents/solution.do"> 솔루션</a></li>
                                        <li><a href="/contents/business.do"> 비즈니스</a></li>                                        
                                        <li><a href="/contents/services.do"> 서비스</a></li>
                                        <li><a href="/contents/database.do"> 데이터베이스</a></li>
                                        <li><a href="/contents/support.do"> 문의사항</a></li>
                                        <li><a href="/contents/contact.do"> Contact</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </nav>
                    </div>                    
                </header>
            </div>
        </div>
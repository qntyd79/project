<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="memberVO" staticJavascript="false" xhtml="true" cdata="false"/>

<c:import url="/WEB-INF/views/include/head.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01-hidden"></div>
            <div class="div-center-box-bg-hidden">
                <section class="content">
                    <article>
                    
                    
                    
                        <form method="post" id="loginForm" name="loginForm" enctype="multipart/form-data" action="loginCheck.do">
                            <input type="hidden" name="msgStr" value="<c:out value="${msg}"/> ">
                            <fieldset>
                                <legend>Member Login Form</legend>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="div-vcenter">                                            
                                            <ul class="content-data-1" style="width:330px;">
                                                <li>
                                                    <div class="panel">
                                                        <div class="logo-box">
                                                            <a href="${path}/index.do"><img src="/resources/images/logo/logo.png" /></a>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="userid"><spring:message code="label.userid"/></label>
                                                            <input name="userid" type="text" class="btn-block" placeholder="UserID"/> <form:errors path="userid" />
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="pass"><spring:message code="label.pass"/></label>
                                                            <input name="pass" type="password" class="btn-block" placeholder="Password"/> <form:errors path="pass" />
                                                        </div>
                                                        <div class="text-left"><input type="checkbox" name="usecookie"> 로그인 상태유지</div>                                                        
                                                        <div class="btn-group-m">
                                                            <input type="button" value="이메일 로그인" class="btn-block danger"  onClick="$(this.form).submit();"/>
                                                        </div>
                                                        <div class="btn-group-m">
    														<input type="button" value="카카오톡 로그인" class="btn-block kakao"  onclick="location.href='kakaologin'" >
                                                        </div>
                                                        <div class="btn-group-m">
    														<input type="button" value="네이버 로그인" class="btn-block naver" onclick="location.href='naverlogin'" >
                                                        </div>
                                                        <div class="btn-group-m">
    														<input type="button" value="구글 로그인" class="btn-block google" onclick="location.href='googlelogin'" >
                                                         </div>
                                                        <!--
                                                         <div class="btn-group-m">
                                                            <a href="facebooklogin">
    															<img src="${path}/resources/images/btn/facebookloginbtn.png" style="width:298px;"/>
															</a>                                                            
                                                        </div>
                                                         <div class="btn-group-m">
                                                            <a href="emaillogin">
    															<img src="${path}/resources/images/btn/emailloginbtn.png" style="width:298px;"/>
															</a>                                                            
                                                        </div>
                                                        -->
                                                       	<!--
                                                        <div class="social-box">
                                                            <a href="#"><i class="fab fa-facebook"></i></a>
                                                            <a href="#"><i class="fab fa-google"></i></a>
                                                            <a href="#"><i class="fab fa-linkedin"></i></a>
                                                            <a href="#"><i class="fab fa-vimeo"></i></a>
                                                            <a href="#"><i class="fab fa-yahoo"></i></a>
                                                            <a href="#"><i class="fab fa-snapchat-ghost"></i></a>
                                                        </div>
                                                        -->
                                                        <div class="btn-group-m">
                                                            <a href="#" onclick="location.href='${path}/index.do'" >홈&nbsp; &nbsp; </a> 
                                                            <a href="#" onclick="location.href='agree.do'">회원가입&nbsp; &nbsp; </a> 
                                                            <a href="#" onclick="location.href='find.do'">아이디/비밀번호 찾기</a>                                            
                                                        </div>
                                                    </div>
                                                </li>
                                                <!--
                                                <li>
                                                	<img src="${path}/resources/images/add/s02.jpg" />
                                                </li>
                                                -->
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                        
                        
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>

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
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01">
            </div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <%@ include file="../../include/content_header.jsp"%>
                    <article>
                        <h2>회원로그인</h2>
                        <form>
                            <fieldset>
                                <legend>Member Login Form</legend>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="div-hcenter">
                                            <ul class="content-data-2">
                                                <li>
                                                    <div class="panel">
                                                        <h1 class="logo-box"><a href="/jhbbs/index.do"><img src="/jhbbs/images/logo/logo.png" /></a></h1>
                                                        <div class="form-group">
                                                            <label for="name"> 회원아이디</label>
                                                            <input type="text" id="name" name="name" class="btn-block" placeholder="아이디를 입력해주세요">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="pw"> 비밀번호 </label>
                                                            <input type="password" id="pass" name="pass" class="btn-block" placeholder="비밀번호를 입력해주세요">
                                                        </div>
                                                        <div class="text-left"><input type="checkbox" name="state" value="1" id="state"> 로그인 상태 유지</div>
                                                        <div class="btn-group-m">
                                                            <input type="button" value="Login" onclick="location.href='../../modules/login/member_login.html'" class="btn-block danger" style="font-size:20px; height:57px;">
                                                        </div>
                                                        <div class="social-box">
                                                            <a href="#"><i class="fab fa-facebook"></i></a>
                                                            <a href="#"><i class="fab fa-google"></i></a>
                                                            <a href="#"><i class="fab fa-linkedin"></i></a>
                                                            <a href="#"><i class="fab fa-vimeo"></i></a>
                                                            <a href="#"><i class="fab fa-yahoo"></i></a>
                                                            <a href="#"><i class="fab fa-snapchat-ghost"></i></a>
                                                        </div>
                                                        <div class="btn-group-m">
                                                            <input type="button" value="홈" onclick="location.href='../../index.html'" />
                                                            <input type="button" value="회원가입" onclick="location.href='../../modules/member/member_agree.html'">
                                                            <input type="button" value="아이디/비밀번호찾기" class="modal-open-btn">
                                                            <!-- <input type="button" value="아이디찾기" onclick="location.href='../../modules/login/member_find.html'"> -->
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="panel">
                                                        <div class="thumbnail">
                                                            <img src="/jhbbs/images/add/s02.jpg" />
                                                        </div>
                                                    </div>
                                                </li>
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
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<%@ include file="../../modules/login/find.jsp"%>
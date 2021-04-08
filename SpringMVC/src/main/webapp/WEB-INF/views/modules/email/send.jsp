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
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <%@ include file="../../include/content_header.jsp"%>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <h2>메일발송폼</h2>
                                <form id="mailForm" name="mailForm" method="post" enctype="multipart/form-data" action="<c:url value='sending.do'/>">
                                    <fieldset>
                                        <legend>Email Write Form</legend>
                                        <table summary="기본게시판 보여주고 있습니다." class="table">
                                            <caption>등록일 : 2017년08월24일 기준</caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="80%" />
                                            </colgroup>
                                            <tbody>                                                
                                                <tr>
                                                    <th><label for="userid"> 아이디 <c:out value='${dto.board_count}' /></label></th>
                                                    <td class="text-left"><input type="text" id="userid" name="userid" value="testid" placeholder="UserID"> <span>6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="pw"> 비밀번호 </label></th>
                                                    <td class="text-left"><input type="password" id="pass" name="pass" value="1234" placeholder="Password"> <span>6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span></td>
                                                </tr>                                                
                                                <tr>
                                                    <th><label for="toemail"> 받는사람 </label></th>
                                                    <td class="text-left"><input type="text" id="toemail" name="toemail" value="qntyd79@naver.com" placeholder="toemail" /></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="sendemail"> 보내는사람 </label></th>
                                                    <td class="text-left"><input type="text" id="sendemail" name="sendemail" value="domain.co.kr" placeholder="sendemail" /></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="title"> 제목 </label></th>
                                                    <td class="text-left"><input type="text" id="title" name="title" value="이메일발송테스트입니다." placeholder="Title"></td>
                                                </tr>                                               
                                                <tr>
                                                    <td colspan="10" class="text-left">
                                                        <textarea name="content" id="editor" placeholder="Content">내용을 입력해주세요</textarea>
                                                        <script>
                                                            CKEDITOR.replace('editor',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});
                                                        </script>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name">첨부파일</label></th>
                                                    <td class="text-left">
                                                        <!-- <div class="preview">
                                                            <img id="blah" src="#" alt="your image" />
                                                        </div> -->
                                                        <div class="fileboxlist">
                                                            <!-- 첨부파일목록 -->
                                                            <table summary="기본게시판 보여주고 있습니다." id="filelist">
                                                                <caption>등록일 : 2017년08월24일 기준</caption>
                                                                <colgroup>
                                                                    <col width="20%" />
                                                                    <col width="40%" />
                                                                    <col width="15%" />
                                                                    <col width="15%" />
                                                                    <col width="10%" />
                                                                </colgroup>
                                                                <thead>
                                                                    <tr class="tline1">
                                                                        <th scope="col"><label for="cate">미리보기</label></th>
                                                                        <th scope="col"><label for="cate">파일명</label></th>
                                                                        <th scope="col"><label for="cate">파일사이즈</label></th>
                                                                        <th scope="col"><label for="cate">파일타입</label></th>
                                                                        <th scope="col"><label for="cate">삭제</label></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="filebox">
                                                            <ul id="example">
                                                                <!--
                                                                <li style="margin-bottom:5px;">
                                                                    <input class="upload-name" id="item_1" />
                                                                    <label for="ex_filename_1">업로드</label>
                                                                    <input type="file" name="attach" id="ex_filename_1" class="upload-hidden_1">
                                                                </li>
                                                            -->
                                                            </ul>
                                                        </div>
                                                        <div>
                                                            <input type="button" value="파일폼추가" id="addItemBtn" /> <span>첨부파일은 최대5개까지 첨부가능합니다.</span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="code">자동등록방지</label></th>
                                                    <td class="text-left">
                                                        <!-- <img id="captchaImg" src="/modules/board/captchaImg.do" /> -->
                                                        <div id="captchaAudio" style="display:none;"></div>
                                                        <input type="text" placeholder="보안문자를 입력하세요" name="captcha">
                                                        <input type="button" value="새로고칭" onClick="refreshBtn();">
                                                        <input type="button" value="음성듣기" onClick="audioBtn();"> <span>보안문자를 입력하세요.</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
                                            <ul>
                                                <li><input type="button" value="목록가기" onClick="location.href='list.do'"></li>
                                                <!--<li><input type="button" value="등록하기" onClick="Board_Write_Check();"></li> -->
                                                <li><input type="button" value="발송하기" onclick="$(this.form).submit()"></li>
                                            </ul>
                                        </nav>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
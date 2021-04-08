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
                                <h2>글수정</h2>
                                <form id="writeForm" name="writeForm" method="post" enctype="multipart/form-data" action="<c:url value='update.do'/>">
                                    <input type="hidden" name="comment_idx" value="<c:out value=" ${dto.comment_idx}"/>" >
                                    <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
                                    <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
                                    <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
                                    <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
                                    <input type="hidden" name="msgStr" value="<c:out value="${msg}"/>" >
                                    <fieldset>
                                        <legend>Board Write Form</legend>
                                        <table summary="기본게시판 보여주고 있습니다." class="table">
                                            <caption>등록일 : 2017년08월24일 기준</caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="30%" />
                                                <col width="20%" />
                                                <col width="30%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th><label for="userid"> 아이디 <c:out value="" /></label></th>
                                                    <td class="text-left"><input type="text" id="userid" name="userid" placeholder="UserID" value="<c:out value=" ${dto.userid}" />" readonly="readonly" /></td>
                                                    <th><label for="pw"> 비밀번호 </label></th>
                                                    <td class="text-left"><input type="password" id="pass" name="pass" placeholder="Password" /></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"> 이름</label></th>
                                                    <td class="text-left"><input type="text" id="name" name="name" placeholder="Name" value="<c:out value='${dto.name}'/>" readonly="readonly" /></td>
                                                    <th scope="row"><label for="email"> 이메일 </label></th>
                                                    <td class="text-left"><input type="text" id="email" name="email" placeholder="Email" value="<c:out value='${dto.email}'/>" readonly="readonly" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" class="text-left">
                                                    	<textarea name="content" id="editor1" placeholder="Content"><c:out value="${dto.content}" /></textarea>
                                                        <script>
                                                            CKEDITOR.replace('editor1',{customConfig : '${path}/plugin/ckeditor4/full/custom-config.js'});
														</script>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
                                            <ul>
                                                <li><input type="button" value="목록가기" onClick="location.href='list.do'"></li>
                                                <!--<li><input type="button" value="등록하기" onClick="Board_Write_Check();"></li> -->
                                                <li><input type="button" value="수정하기" onclick="$(this.form).submit();"></li>
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
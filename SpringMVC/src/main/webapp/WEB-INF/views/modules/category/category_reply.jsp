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

</script>s
<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img02"></div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                    <%@ include file="../../include/content_header.jsp"%>
                    <article>
                    
						<div class="row">
						    <div class="col-md-12">
						        <h2>답글쓰기</h2>
						        <form id="writeForm" name="writeForm" method="post" enctype="multipart/form-data" action="insert.do">
						            <input type="hidden" name="category_idx" value="<c:out value=" ${dto.category_idx}"/>" >
						            <input type="hidden" name="idx" value="<c:out value=" ${dto.idx}"/>" >
						            <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
						            <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
						            <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
						            <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
						            <input type="hidden" name="parent" value="<c:out value=" ${dto.parent}"/>" >
						            <input type="hidden" name="depth" value="<c:out value=" ${dto.depth}"/>" >
						            <input type="hidden" name="sortno" value="<c:out value=" ${dto.sortno}"/>" >
						            <fieldset>
						                <legend>Board Write Form</legend>
						                <table summary="기본게시판 보여주고 있습니다." class="table">
						                    <caption>등록일 : 2017년08월24일 기준</caption>
						                    <colgroup>
						                        <col width="20%" />
						                        <col width="80%" />
						                    </colgroup>
						                    <tbody>
						                        <tr>
						                            <th><label for="name"> 이름</label></th>
						                            <td class="text-left"><input type="text" id="name" name="name" placeholder="Name" /> <span></span></td>
						                        </tr>
						                        <tr>
						                            <th><label for="pass"> 비밀번호 </label></th>
						                            <td class="text-left"><input type="password" id="pass" name="pass" placeholder="Password" /> <span>6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span></td>
						                        </tr>
						                        <tr>
						                            <th><label for="title"> 분류명 </label></th>
						                            <td class="text-left"><input type="text" id="title" name="title" placeholder="Category" /></td>
						                        </tr>
						                    </tbody>
						                </table>
						                <nav class="btn-group">
						                    <ul>
						                        <li><input type="button" value="목록가기" onClick="location.href='list.do'"></li>
						                        <!--<li><input type="button" value="등록하기" onClick="Board_Write_Check();"></li> -->
						                        <li><input type="button" value="등록하기" onclick="$(this.form).submit()"></li>
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
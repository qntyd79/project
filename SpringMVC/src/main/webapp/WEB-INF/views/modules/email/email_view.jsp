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
                                <h2>글보기</h2>
                                <form name="readForm" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="email_idx" value="<c:out value="${dto.email_idx}" />" >
                                    <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
                                    <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
                                    <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
                                    <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
                                    <fieldset>
                                        <legend>Borad View Form</legend>
                                        <table summary="기본게시판 보여주고 있습니다." class="table">
                                            <caption>등록일 : 2017년08월24일 기준</caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="20%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                                <col width="15%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="col"><label for="date">메일제목 </label></th>
                                                    <td scope="col" colspan="5" class="text-left"><c:out value="${dto.title}" /></td>
                                                </tr>
                                                 <tr>
                                                    <th scope="col"><label for="date">받는메일 </label></th>
                                                    <td scope="col" colspan="5" class="text-left"><c:out value="${dto.toemail}" /></td>
                                                </tr>
                                                <tr>
                                                    <th scope="col"><label for="date">보내는메일 </label></th>
                                                    <td scope="col" colspan="5" class="text-left"><c:out value="${dto.sendemail}" /></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name">작성자</label></th>
                                                    <td><c:out value="${dto.userid}" /></td>
                                                    <th><label for="regdate">등록일</label></th>
                                                    <td><c:out value="${dto.regdate}" /></td>
                                                    <th><label for="hit">조회수</label></th>
                                                    <td><c:out value="${dto.hit}" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6" class="text-left" style="padding: 15px;">
                                                    	<c:out value="${dto.content}" escapeXml="false" />                                                        
                                                    </td>
                                                </tr>                                              
                                                <tr>
                                                    <td colspan="6" class="align-left">첨부파일목록출력</td>
                                                </tr>                                               
                                                <tr>
                                                    <th><label for="pre">이전글 </label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${prenum.email_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value=" ${prenum.email_idx}" />"><c:out value="${prenum.title}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                이전글이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="next">다음글 </label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:choose>
                                                            <c:when test="${nextnum.email_idx ne null}"><a href="read.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value=" ${nextnum.email_idx}" />"><c:out value="${nextnum.title}" /></a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                다음글이 없습니다.
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="next">접속아이피</label></th>
                                                    <td colspan="5" class="text-left">
                                                        <c:out value="${dto.cipp}" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
                                            <ul>
                                                <li><input type="button" value="글목록" onClick="location.href='list.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}'" /></li>
                                                <li><input type="button" value="글등록" onClick="location.href='write.do'" /></li>
                                                <li><input type="button" value="글수정" onClick="location.href='modify.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value=" ${dto.email_idx}" />'" /></li>
                                                <li><input type="button" value="글삭제" onClick="location.href='delete.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&email_idx=<c:out value=" ${dto.email_idx}" />'" /></li>
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
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
<div class="modal-box" style="width:800px">
    <div class="modal-header">
        <h2>댓글수정</h2>
    </div>
    <div class="modal-content">
        <article>
            <div class="row">
                <div class="col-md-12">
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
                                    <th colspan="4"><input type="text" id="replycomment_idx" name="replycomment_idx" readonly></th>
                                </tr>
                                <tr>
                                    <th><label for="userid"> 아이디 </label></th>
                                    <td class="text-left"><input type="text" id="replyuserid" name="replyuserid"></td>
                                    <th><label for="pw"> 비밀번호 </label></th>
                                    <td class="text-left"><input type="password" id="replypass" name="replypass"></td>
                                </tr>
                                <tr>
                                    <th><label for="name"> 이름</label></th>
                                    <td class="text-left"><input type="text" id="replyname" name="replyname"></td>
                                    <th scope="row"><label for="email"> 이메일 </label></th>
                                    <td class="text-left"><input type="text" id="replyemail" name="replyemail" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-left">
                                    	<textarea name="content" id="editor1"></textarea>
                                        <script>
                                            CKEDITOR.replace('editor1',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});                                                          
                                        </script>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <nav class="btn-group">
                            <ul>
                                <li><input type="button" value="수정하기" id="modifyBtn"></li>
                                <li><input type="button" value="삭제하기" id="deleteBtn"></li>
                            </ul>
                        </nav>
                    </fieldset>
                </div>
            </div>
        </article>
    </div>
    <div class="modal-footer">
        <div class="modal-close-btn">닫기</div>
    </div>
</div>
<div class="modal-back"></div>
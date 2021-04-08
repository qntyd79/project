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
                                <h2>파일답글</h2>
                                <form id="writeForm" name="writeForm" method="post" enctype="multipart/form-data" action="<c:url value='insert.do'/>"> 
									<input type="hidden" name="board_idx" value="<c:out value="${dto.board_idx}"/>" >
									<input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
									<input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
									<input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
									<input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
									<input type="hidden" name="parent" value="<c:out value="${dto.parent}"/>" >
									<input type="hidden" name="depth" value="<c:out value="${dto.depth}"/>" >
									<input type="hidden" name="sortno" value="<c:out value="${dto.sortno}"/>" >
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
													<th><label for="cate">분류</label></th>
													<td class="text-left">
													<select name="category_idx" id="category_idx">		
														<c:forEach var="item" items="${categorylist}" varStatus="status" >																								
															<option value="<c:out value="${item.category_idx}"/>" <c:if test="${item.category_idx == categoryselect}"><c:out value= "selected=selected"/></c:if>>
															<c:out value="${item.title}"/>
															</option>
														</c:forEach>										
													</select>  
													<button type="button"  class="popupBtn" value="#layer1">분류추가</button>
														<div class="layer">
															<div class="bg"></div>
															<div id="layer1" class="pop-layer">
																<div class="pop-container">
																	<div class="pop-conts">
																		<iframe name="ifrm_file" src="${path}/modules/category/list.do"	height="670px" marginwidth="0" marginheight="0"	scrolling="no" frameborder="0" style="width: 100%;"></iframe>
																		<div class="btn-r"><a href="#" class="cbtn">Close</a></div>
																	</div>
																</div>
															</div>
														</div>
													</td>
												</tr>
                                                <tr>
													<th><label for="name"> 아이디 </label></th>
													<td class="text-left"><input type="text" id="userid" name="userid" placeholder="UserID"/> <span>6~12자의 영문	소문자, 숫자만 사용할 수 있습니다.</span></td>
												</tr>
												<tr>
													<th><label for="name"> 이름</label></th>
													<td class="text-left"><input type="text" id="name" name="name" placeholder="Name"/> </td>
												</tr>
												<tr>
													<th><label for="pass"> 비밀번호 </label></th>
													<td class="text-left"><input type="password" id="pass" name="pass" placeholder="Password"/> <span>6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span></td>
												</tr>												
												<tr>
                                                    <th scope="row"><label for="email"> 이메일 </label></th>
                                                    <td scope="row" class="text-left">
                                                        <input type="text" name="email" id="str_email01" value="test79"/> @
													    <input type="text" name="email2" id="str_email02"/>
													    <select id="selectEmail">
													        <option value="1" selected="selected">직접입력</option>
													        <option value="naver.com">naver.com</option>
													        <option value="hanmail.net">hanmail.net</option>
													        <option value="nate.com">nate.com</option>
													        <option value="hotmail.com">hotmail.com</option>
													        <option value="paran.com">paran.com</option>
													        <option value="yahoo.com">yahoo.com</option>
													        <option value="chol.com">chol.com</option>
													        <option value="dreamwiz.com">dreamwiz.com</option>
													        <option value="empal.com">empal.com</option>
													        <option value="freechal.com">freechal.com</option>
													        <option value="gmail.com">gmail.com</option>
													        <option value="hanafos.com">hanafos.com</option>
													        <option value="hanmir.com">hanmir.com</option>
													        <option value="hitel.net">hitel.net</option>
													        <option value="korea.com">korea.com</option>
													        <option value="lycos.co.kr">lycos.co.kr</option>
													        <option value="netian.com">netian.com</option>
													    </select>
                                                        <span>알찬 서비스 소식 및 이벤트을 전해드립니다.</span>
                                                    </td>
                                                </tr>
												<tr>
													<th><label for="homepage"> 홈페이지 </label></th>
													<td class="text-left"><input type="text" id="homepage" name="homepage" placeholder="Homepage"/></td>
												</tr>
												<tr>
													<th><label for="title"> 제목 </label></th>
													<td class="text-left"><input type="text" id="title" name="title" placeholder="Title"/></td>
												</tr>
												<tr>
													<th><label for="date"> 일정 </label></th>
													<td class="text-left">
														<input type="text" name="sdate" id="sdate" placeholder="StartDay"/> - 
														<input type="text" name="edate" id="edate" placeholder="EndDay"/>
													</td>
												</tr>
												<tr>
													<th><label for="notice"> 옵션</label></th>
													<td class="text-left">
														<span>
															<input type="checkbox" name="notice" value="1" id="notice"> 공지사항
															<input type="checkbox" name="secret" value="1" id="secret"> 비밀글
															<input type="checkbox" name="tag" value="1" id="tag"> 소스코드
														</span>
													</td>
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
													<th><label for="link1"> 관련링크1 </label></th>
													<td class="text-left"><input type="text" id="link1" name="link1" " placeholder="Link1"/> </td>
												</tr>
												<tr>
													<th><label for="link2"> 관련링크2 </label></th>
													<td class="text-left"><input type="text" id="link2" name="link2" placeholder="Link2"/> </td>
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
                                                    	<img id="captchaImg" src="/modules/board/captchaImg.do" />
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
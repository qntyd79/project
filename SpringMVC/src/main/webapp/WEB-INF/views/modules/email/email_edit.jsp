<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
<validator:javascript formName="emailVO" staticJavascript="false" xhtml="true" cdata="false"/>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                            
                                <h2><spring:message code="bbs.title.write"/></h2>
                                <form:form modelAttribute="emailVO" method="post" id="writeForm" name="writeForm" enctype="multipart/form-data" action="update.do">
                                <input type="hidden" name="email_idx" value="<c:out value="${emailVO.email_idx}"/> ">
                                <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
                                <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/> ">
                                <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/> ">
                                <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/> ">
                                <input type="hidden" name="msgStr" value="<c:out value="${msg}"/> ">
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.write"/>" class="board_detail">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="80%" />
                                            </colgroup>
                                            <tbody>
                                             <tr>
                                                    <th><label for="category_idx"><spring:message code="label.category_idx"/></label></th>
                                                    <td class="text-left">
                                                        <form:select path="category_idx" id="category_idx" name="category_idx" >
                                                            <c:forEach var="item" items="${categorylist}" varStatus="status">
                                                                <option value="<c:out value='${item.category_idx}'/>"
	                                                                <c:if test="${item.category_idx == categoryselect}">
	                                                                    <c:out value="selected=selected" />
	                                                                </c:if> >
                                                                	<c:out value="${item.title}" />
                                                                </option>
                                                            </c:forEach>
                                                        </form:select>
                                                        <form:errors path="category_idx" />
                                                        <!-- 
                                                        <button type="button" value="#layer1" class="popupBtn" >분류추가</button>
                                                        <div class="layer">
                                                            <div class="bg"></div>
                                                            <div id="layer1" class="pop-layer">
                                                                <div class="pop-container">
                                                                    <div class="pop-conts">
                                                                        <iframe name="ifrm_file" src="${path}/modules/category/list.do?idx=1" height="680px" marginwidth="0" marginheight="0" scrolling="no" frameborder="0" style="width:100%;"></iframe>
                                                                        <div class="btn-r">
                                                                            <a href="#" class="cbtn">Close</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        -->
                                                    </td>
                                                </tr>                                              
                                                <tr>
                                                    <th><label for="userid"><spring:message code="label.userid"/></label></th>
                                                    <td class="text-left"><input name="userid" type="text" placeholder="UserID" class="wfull" value="<c:out value="${emailVO.userid}"/>" readonly="readonly"/> <form:errors path="userid" />
                                                </tr>
                                                <tr>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                    <td class="text-left"><input name="pass" type="password" placeholder="Password" class="wfull"/> <form:errors path="pass" /> </td>
                                                </tr>                                                
                                                <tr>
                                                    <th><label for="toemail"><spring:message code="label.toemail"/></label></th>
                                                    <td class="text-left"><form:input path="toemail" type="text" placeholder="Toemail" class="wfull"/> <form:errors path="toemail" /></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="sendemail"><spring:message code="label.sendemail"/></label></th>
                                                    <td class="text-left"><form:input path="sendemail" type="text" placeholder="Sendemail" class="wfull"/> <form:errors path="sendemail" /></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="title"><spring:message code="label.title"/></label></th>
                                                    <td class="text-left"><form:input path="title" type="text" placeholder="Title" class="wfull"/> <form:errors path="title" /></td>
                                                </tr>                                               
                                                <tr>
                                                    <td colspan="10" class="text-left">
                                                        <form:textarea  path="content" id="content" placeholder="Content"/> <form:errors path="content"/>
                                                        <script>
                                                            CKEDITOR.replace('content');                    
                                                        </script> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"><spring:message code="label.file"/></label></th>
                                                    <td class="text-left">
                                                        <!-- <div class="preview">
                                                            <img id="blah" src="#" alt="your image" />
                                                        </div> -->
                                                        <div class="fileboxlist">
                                                            <!-- 첨부파일목록 -->
                                                            <table summary="기본게시판 보여주고 있습니다." id="filelist">
                                                                <caption><spring:message code="bbs.table.caption"/></caption>
                                                                <colgroup>
                                                                    <col width="20%" />
                                                                    <col width="40%" />
                                                                    <col width="15%" />
                                                                    <col width="15%" />
                                                                    <col width="10%" />
                                                                </colgroup>
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col"><spring:message code="bbs.list.preview"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filename"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filesize"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filetype"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.del"/></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="filebox">
                                                            <ul id="example"></ul>
                                                        </div>
                                                        <div>
                                                            <input type="button" id="addItemBtn" value="<spring:message code="button.fileadd"/>" /> 첨부파일은 최대5개까지 첨부가능합니다.
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="code"><spring:message code="label.code"/></label></th>
                                                    <td class="text-left">
                                                        <img id="captchaImg" src="${path}/modules/board/captchaImg.do" />
                                                        <div id="captchaAudio" style="display:none;"></div>                                                       
                                                        <input type="button" id="refreshBtn" value="<spring:message code="button.refresh"/>" >
                                                        <input type="button" id="audio" value="<spring:message code="button.voice"/>" >  
                                                        <input type="text" id="answer" name="answer" placeholder="CaptchaCode"/> 
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
											<ul>
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do'"/></li>
												<li><input type="button" value="<spring:message code="button.update"/>" onClick="$(this.form).submit();"/></li>	
												<li><input type="button" value="<spring:message code="button.emailsend"/>" onClick="$(this.form).submit();"/></li>											
											</ul>
										</nav>
                                    </fieldset>
                                </form:form>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
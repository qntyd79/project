<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
<validator:javascript formName="attachVO" staticJavascript="false" xhtml="true" cdata="false"/>

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
                                <form method="post" id="attachForm" name="attachForm" enctype="multipart/form-data" action="insert.do">
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
                                                                   	<!--<col width="5%" />-->
                                                                    <col width="65%" />
                                                                    <col width="10%" />
                                                                    <col width="10%" />
                                                                    <col width="10%" />
                                                                    <!--<col width="10%" />-->
                                                                </colgroup>
                                                                <thead>
                                                                    <tr>
                                                                        <!--<th scope="col"><spring:message code="bbs.list.no"/></th>-->
                                                                        <th scope="col"><spring:message code="bbs.list.filename"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filesize"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filetype"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.regdate"/></th>
                                                                        <!-- <th scope="col"><spring:message code="bbs.list.del"/></th> -->
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
                                                        <img id="captchaImg" src="${path}/modules/attach/captchaImg.do" />
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
												<li><input type="button" value="<spring:message code="button.create"/>" onClick="$(this.form).submit();"/></li>												
											</ul>
										</nav>
										<!--<c:import url="/WEB-INF/views/modules/common/common_btn.jsp"/>-->
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
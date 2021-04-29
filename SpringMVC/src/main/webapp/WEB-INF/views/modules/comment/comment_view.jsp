<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                            
                            
                                <h2><spring:message code="bbs.title.view"/></h2>
                                <form name="readForm" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="comment_idx" value="<c:out value=" ${commentVO.comment_idx}"/>" >
                                    <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
                                    <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
                                    <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
                                    <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.view"/>" class="board_detail">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="30%" />
                                                <col width="20%" />
                                                <col width="30%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th><label for="userid"> 아이디 </label></th>
                                                    <td class="text-left"><c:out value="${commentVO.userid}" /></td>
                                                    <th><label for="pass"> 비밀번호 </label></th>
                                                    <td class="text-left"><input name="pass" type="password" placeholder="Password" class="wfull"/> <form:errors path="pass" /></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"> 이름</label></th>
                                                    <td class="text-left"><c:out value="${commentVO.name}" /></td>
                                                    <th scope="row"><label for="email"> 이메일 </label></th>
                                                    <td class="text-left"><c:out value="${commentVO.email}" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" class="text-left" style="padding: 15px;">
                                                    	<c:out value="${commentVO.content}" escapeXml="false"/>
                                                    </td>
                                                </tr>                                                
                                                <tr>
                                                    <th><label for="next">접속아이피</label></th>
                                                    <td colspan="4" class="text-left">
                                                    	<c:out value="${commentVO.cipp}" />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
											<ul>												
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}'" /></li>
										        <li><input type="button" value="<spring:message code="button.update"/>" onClick="location.href='modify.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&comment_idx=<c:out value="${commentVO.comment_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.reply"/>" onClick="location.href='reply.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&comment_idx=<c:out value="${commentVO.comment_idx}" />'" /></li>
										        <li><input type="button" value="<spring:message code="button.delete"/>" onClick="location.href='delete.do?page=${criteria.page}&perPageNum=${criteria.perPageNum}&comment_idx=<c:out value="${commentVO.comment_idx}" />'" /></li>
											</ul>
										</nav>                                       
                                        <!--<c:import url="/WEB-INF/views/modules/common/common_btn.jsp"/> --> 
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
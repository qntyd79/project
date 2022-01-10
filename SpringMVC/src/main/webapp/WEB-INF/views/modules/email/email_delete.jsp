<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
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
                            
                            
                                <h2><spring:message code="bbs.title.delete"/></h2>
                                <form method="post" id="deleteForm" name="deleteForm" enctype="multipart/form-data" action="delete.do">
									<input type="hidden" name="email_idx" value="<c:out value="${emailVO.email_idx}"/>" >
						        	<input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
						       	 	<input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
						        	<input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
		        					<input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.delete"/>" class="board_detail">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="50%" />
                                                <col width="50%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th colspan="2"><label for="date">해당 글을 삭제하시겠습니까?</label></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                    <td class="text-left"><input name="pass" type="password" placeholder="Password" class="wfull" /> <form:errors path="pass" /> </td>
                                                </tr> 
                                            </tbody>
                                        </table>
                                        <nav class="btn-group">
											<ul>
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do'"></li>
												<li><input type="button" value="<spring:message code="button.delete"/>" onclick="$(this.form).submit()"></li>
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
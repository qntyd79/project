<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="memberVO" staticJavascript="false" xhtml="true" cdata="false"/>

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
                                <form:form modelAttribute="memberVO" method="post" id="memberForm" name="memberForm" enctype="multipart/form-data" action="update.do">
                                	<input type="hidden" name="member_idx" value="<c:out value="${memberVO.member_idx}"/>" >
                                    <input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
                                    <input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
                                    <input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
                                    <input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
                                    <input type="hidden" name="msgStr" value="<c:out value="${msg}"/>" > 
                                    <input type="hidden" id="me_id_yn" name="me_id_yn" value="Y"/> 
                                    <fieldset>
                                    	<legend><spring:message code="bbs.table.legend"/></legend>
                                        <div class="panel-box">                                            
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 01. ???????????? ??????????????? ????????? ?????????. (????????????)</h3>
                                            </div>
                                           	<table summary="<spring:message code="bbs.table.summary.write"/>" class="board_detail">
                                           		<caption><spring:message code="bbs.table.caption"/></caption>
                                                <colgroup>
                                                    <col width="20%" />
                                                    <col width="80%" />
                                                </colgroup>                                                
                                                <tr>
                                                    <th><label for="category_idx"><spring:message code="label.category_idx"/></label></th>
                                                    <td class="text-left">
                                                        <form:select path="category_idx" id="category_idx" name="category_idx" >
                                                            <c:forEach var="item" items="${categorylist}" varStatus="status">
                                                                <option value="<c:out value='${item.category_idx}'/>"
	                                                                <c:if test="${memberVO.category_idx eq item.category_idx}">
	                                                                    <c:out value="selected=selected" />
	                                                                </c:if>><c:out value="${item.title}" />
                                                                </option>
                                                            </c:forEach>
                                                        </form:select>
                                                        <form:errors path="category_idx" />                                                        
                                                    </td>
                                                </tr>                                                
                                                <tr>
                                                    <th><label for="userid"><spring:message code="label.userid"/></label></th>
                                                    <td class="text-left">
                                                        <input name="userid" type="text" placeholder="UserID" value="<c:out value="${memberVO.userid}"/>" readonly="readonly"/>
                                                        <form:errors path="userid" /> 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                   	<td class="text-left"><input name="pass" type="password" placeholder="Password" />                                                    	
                                                    <input type="button" value="???????????? ????????????" class="modal-open-btn"/>
                                                    <form:errors path="pass" />                                                   
                                                   	</td>
                                                </tr>                                               
                                                <tr>
                                                    <th><label for="pass_ask"><spring:message code="label.pass_ask"/></label></th>
                                                    <td class="text-left">
                                                        <form:select path="pass_ask" name="pass_ask" class="select" style="width:200px;" readonly="readonly">
                                                            <option value='' <c:if test="${memberVO.pass_ask eq 0}">selected</c:if>>-????????? ???????????? ????????????-</option>
                                                            <option value="1" <c:if test="${memberVO.pass_ask eq 1}">selected</c:if>>?????? ??????????????? ???????????? </option>
                                                            <option value="2" <c:if test="${memberVO.pass_ask eq 2}">selected</c:if>>???????????? 1?????? </option>
                                                            <option value="3" <c:if test="${memberVO.pass_ask eq 3}">selected</c:if>>????????? ????????? </option>
                                                            <option value="4" <c:if test="${memberVO.pass_ask eq 4}">selected</c:if>>????????? ????????? </option>
                                                            <option value="5" <c:if test="${memberVO.pass_ask eq 5}">selected</c:if>>????????? ????????? </option>
                                                            <option value="6" <c:if test="${memberVO.pass_ask eq 6}">selected</c:if>>?????? ???????????? ????????? </option>
                                                            <option value="7" <c:if test="${memberVO.pass_ask eq 7}">selected</c:if>>???????????? ????????? </option>
                                                            <option value="8" <c:if test="${memberVO.pass_ask eq 8}">selected</c:if>>???????????? ????????? </option>
                                                            <option value="9" <c:if test="${memberVO.pass_ask eq 9}">selected</c:if>>????????? ?????? </option>
                                                        </form:select>
                                                        <form:errors path="pass_ask" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="pass_account"><spring:message code="label.pass_account"/></label></th>
                                                    <td class="text-left">
	                                                    <form:input path="pass_account" id="pass_account" placeholder="Password Answer" class="wfull" readonly="readonly" /> 
	                                                    <form:errors path="pass_account" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"><spring:message code="label.name"/></label></th>
                                                    <td class="text-left">
	                                                    <input name="name" type="text" placeholder="Name" value="<c:out value="${memberVO.name}"/>" class="wfull" readonly="readonly" /> 
	                                                    <form:errors path="name" />
                                                    </td>
                                                </tr>                                               
                                                <tr>
                                                    <th><label for="email"><spring:message code="label.email"/></label></th>
                                                    <td class="text-left">
                                                        <input name="email" type="text" placeholder="Email" class="wfull" value="<c:out value="${memberVO.email}"/>" readonly="readonly" />                                                       
                                                        <form:errors path="email" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="zipcode"><spring:message code="label.zipcode"/></label></th>
                                                    <td class="text-left">
                                                        <form:input path="zipcode" type="text" id="zipcode" placeholder="Zipcode" readonly="readonly"/>
                                                       <input type="button" id="findzipcode" class="findzipcode" value="??????????????????" />
                                                        <form:errors path="zipcode" />
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <th><label for="address"><spring:message code="label.address"/></label></th>
                                                    <td class="text-left">
	                                                    <form:input path="address" type="text" id="address" placeholder="Address" class="wfull" readonly="readonly"/>
	                                                    <form:errors path="address" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="detailaddress"><spring:message code="label.detailaddress"/> </label></th>
                                                    <td class="text-left">
                                                    	<form:input path="detailaddress" type="text" id="detailAddress" placeholder="Detail Address" class="wfull"/> 
                                                    	<form:input path="extraaddress" type="text" id="extraAddress" placeholder="Refer to item" style="margin-top:3px;" class="wfull"/> 
                                                    	<form:errors path="detailaddress" />	
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="phone"><spring:message code="label.phone"/></label></th>
                                                    <td class="text-left">
	                                                    <form:input path="phone" type="text" id="phone" placeholder="000-0000-0000" class="wfull"/>
	                                                    <form:errors path="phone" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="hphone"><spring:message code="label.hphone"/></label></th>
                                                    <td class="text-left">
                                                    <form:input path="hphone" type="text" id="hphone" placeholder="000-0000-0000" class="wfull"/>
                                                    <form:errors path="hphone" /> </td>
                                                </tr>                                                
                                            </table>
                                            <hr>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 02. ???????????? ??????????????? ????????? ?????????. (????????????)</h3>
                                            </div>
                                            <table summary="?????????????????? ???????????? ????????????." class="board_detail">
                                                <colgroup>
                                                    <col width="20%" />
                                                    <col width="80%" />
                                                </colgroup>
                                                <tr>
                                                    <th><label for="nickname"><spring:message code="label.nickname"/></label></th>
                                                    <td class="text-left">
                                                    <form:input path="nickname" type="text" placeholder="Nickname" class="wfull"/> 
                                                    <form:errors path="nickname" /> </td>
                                                </tr> 
                                                <tr>
                                                    <th><label for="homepage"><spring:message code="label.homepage"/></label></th>
                                                    <td class="text-left">
                                                    	<form:input path="homepage" type="text" placeholder="Homepage" class="wfull"/> 
                                                    	<form:errors path="homepage" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="job"><spring:message code="label.job"/></label></th>
                                                    <td class="text-left">
                                                        <form:select path="job" style="width:200px;">
                                                            <option value="" <c:if test="${memberVO.job eq '0'}">selected</c:if>>-????????? ???????????? ????????????-</option>
                                                            <option value="?????????" <c:if test="${memberVO.job eq '?????????'}">selected</c:if>>?????????</option>
                                                            <option value="?????????" <c:if test="${memberVO.job eq '?????????'}">selected</c:if>>?????????</option>
                                                            <option value="?????????" <c:if test="${memberVO.job eq '?????????'}">selected</c:if>>?????????</option>
                                                            <option value="?????????" <c:if test="${memberVO.job eq '?????????'}">selected</c:if>>?????????</option>
                                                            <option value="?????????" <c:if test="${memberVO.job eq '?????????'}">selected</c:if>>?????????</option>
                                                            <option value="??????" <c:if test="${memberVO.job eq '??????'}">selected</c:if>>??????</option>
                                                            <option value="??????" <c:if test="${memberVO.job eq '??????'}">selected</c:if>>??????</option>
                                                            <option value="????????????" <c:if test="${memberVO.job eq '????????????'}">	selected</c:if>>????????????</option>
                                                            <option value="??????" <c:if test="${memberVO.job eq '??????'}">selected</c:if>>??????</option>
                                                        </form:select>
                                                        <form:errors path="job" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" class="text-left">
                                                        <form:textarea  path="message" id="message" placeholder="Message"/> <form:errors path="message"/>
                                                        <script>
                                                            CKEDITOR.replace('message',{height:150, customConfig:'${path}/plugin/ckeditor4/full/custom-config.js'});
                                                        </script>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="mail_check"><spring:message code="label.mail_check"/></label></th>
                                                    <td class="text-left">
                                                    	<div class='container'>
	                                                    	<input type="radio" name="mail_check" value="1" <c:if test="${memberVO.mail_check == 1}">
		                                                    <c:out value="checked" />
		                                                    </c:if>> ???
		                                                    <input type="radio" name="mail_check" value="0" <c:if test="${memberVO.mail_check == 0}">
		                                                    <c:out value="checked" />
		                                                    </c:if>> ?????????
	                       									<form:errors path="mail_check"/>
                       									</div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 03. ?????? ????????? ???????????? ?????? ?????? ????????????????????? ????????????.</h3>
                                            </div> 
                                            <table summary="?????????????????? ???????????? ????????????." class="board_detail">
                                                <colgroup>
                                                    <col width="20%" />
                                                    <col width="80%" />
                                                </colgroup>
                                                <tr>
                                                    <th><label for="name"><spring:message code="label.file"/></label></th>
                                                    <td class="text-left">
                                                        <!-- <div class="preview">
                                                            <img id="blah" src="#" alt="your image" />
                                                        </div> -->
                                                        <div class="fileboxlist">
                                                            <!-- ?????????????????? -->
                                                            <table summary="<spring:message code="bbs.table.summary.list"/>">
																<caption><spring:message code="bbs.table.caption"/></caption>
                                                                <colgroup>
                                                                	<col width="5%" />
                                                                    <col width="55%" />
                                                                    <col width="10%" />
                                                                    <col width="10%" />
                                                                    <col width="10%" />
                                                                    <col width="10%" />
                                                                </colgroup>
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col"><spring:message code="bbs.list.no"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filename"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filesize"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.filetype"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.regdate"/></th>
                                                                        <th scope="col"><spring:message code="bbs.list.del"/></th>
                                                                    </tr>
                                                                </thead>
																<tbody>
																	<c:choose>
																		<c:when test="${fn:length(filelist) == 0}">
																			<tr>
																				<td colspan="5"><spring:message code="info.nodata.msg" /></td>
																			</tr>
																		</c:when>
																		<c:otherwise>
																			<c:forEach varStatus="status" var="row" items="${filelist}">
																				<tr>	
																					<td><strong>${status.index+1}</strong></td>														
																					<td class="text-left"><a href="read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&file_idx=<c:out value="${row.file_idx}"/>">${row.file_name}</a></td>
																					<td><fmt:formatNumber value="${row.file_size}" type="number"/>KB</td>
																					<td>${row.file_ext}</td>
																					<td>
																						<fmt:parseDate var="dateString" value="${row.regdate}" pattern="yyyy-MM-dd"/> 
																						<fmt:formatDate	value="${dateString}" pattern="yyyy-MM-dd"/></td>
																					<td><a href="attachDelete.do?filename=<c:out value="${row.file_hash_name}"/>&board_idx=<c:out value="${boardVO.board_idx}"/>&file_idx=<c:out value="${row.file_idx}"/>">??????</a></td>
																				</tr>
																			</c:forEach>
																		</c:otherwise>
																	</c:choose>
																</tbody>
															</table>
                                                        </div>
                                                        <div class="filebox">
                                                            <ul id="example"></ul>
                                                        </div>
                                                        <div>
                                                            <input type="button" id="addItemBtn" value="<spring:message code="button.fileadd"/>" /> ??????????????? ??????5????????? ?????????????????????.
                                                        </div>
                                                    </td>
                                                </tr>                                                
                                            </table>
                                            <hr>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 04. ?????? ?????? ????????? ???????????? ???????????????.</h3>
                                            </div>
                                            <table summary="?????????????????? ???????????? ????????????." class="table">
                                                <colgroup>
                                                    <col width="20%" />
                                                    <col width="80%" />
                                                </colgroup>
                                                <tr>
                                                    <td colspan="2" class="text-left">
                                                        <form:textarea  path="etc" id="etc" placeholder="Etc"/> <form:errors path="etc"/>
                                                        <form:errors path="Etc"/>
                                                        <script>
                                                            CKEDITOR.replace('etc',{height:150, customConfig:'${path}/plugin/ckeditor4/full/custom-config.js'});
                                                        </script>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="code"><spring:message code="label.code"/></label></th>
                                                    <td class="text-left">
                                                        <img id="captchaImg" src="${path}/modules/member/captchaImg.do" />
                                                        <div id="captchaAudio" style="display:none;"></div>                                                       
                                                        <input type="button" id="refreshBtn" value="<spring:message code="button.refresh"/>" >
                                                        <input type="button" id="audio" value="<spring:message code="button.voice"/>" >  
                                                        <input type="text" id="answer" name="answer" placeholder="CaptchaCode"/> 
                                                    </td>
                                                </tr>
                                            </table>                                            
                                            
                                            <nav class="btn-group">
												<ul>
													<c:if test="${sessionScope.isAdmin == null}">	
													<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='list.do'"/></li>
													</c:if>
													<li><input type="button" value="<spring:message code="button.update"/>" onClick="$(this.form).submit();"/></li>												
												</ul>
											</nav>
                                        </div>
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

<c:import url="/WEB-INF/views/modules/member/member_passchange.jsp"/>

<!-- ???????????? ?????? api?????? -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

	$(document).ready(function() {	
	
		// ??????????????????
		$("#findzipcode").on("click",function(){	
			
	    	new daum.Postcode({
	            oncomplete: function(data) {
	            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
	
	            // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
	            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
	            var addr = ''; // ?????? ??????
	            var extraAddr = ''; // ???????????? ??????
	
	            //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
	            if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
	        	    addr = data.roadAddress;
	            } else { // ???????????? ?????? ????????? ???????????? ??????(J)
	                addr = data.jibunAddress;
	            }
	
	            // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
	            if(data.userSelectedType === 'R'){
	            // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
	            // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
	            if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
	            	extraAddr += data.bname;
	                    }
	                    // ???????????? ??????, ??????????????? ?????? ????????????.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
	                    if(extraAddr !== ''){
	                        extraAddr = '(' + extraAddr + ')';
	                    }
	                    // ????????? ??????????????? ?????? ????????? ?????????.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // ??????????????? ?????? ????????? ?????? ????????? ?????????.
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // ????????? ???????????? ????????? ????????????.
	                document.getElementById("detailAddress").focus();

					// ???????????? jquery validate ?????? ????????? ????????? ???????????? ??????
	                if(document.getElementById('zipcode').value != ''){
	    	    		document.getElementById('zipcode').style.borderColor = '#e6e6e6';
	    	    		document.getElementById('zipcode-error').style = 'display:none';
	    	    		document.getElementById("address").style.borderColor = '#e6e6e6';
	    	    		document.getElementById('address-error').style = 'display:none';
	    		    }
	            }
	        }).open();	        
		}); 

	    
		
	});
</script>
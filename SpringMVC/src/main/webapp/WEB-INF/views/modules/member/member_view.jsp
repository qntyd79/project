<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
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
                            
                            
                                <h2><spring:message code="bbs.title.write"/></h2>
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
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 01. 고객님의 기본사항을 입력해 주세요. (필수항목)</h3>
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
	                                                                <c:if test="${item.category_idx == categoryselect}">
	                                                                    <c:out value="selected=selected" />
	                                                                </c:if> >
                                                                	<c:out value="${item.title}" />
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
                                                    <input type="button" value="비밀번호 변경하기" class="modal-open-btn"/>
                                                    <form:errors path="pass" />                                                   
                                                   	</td>
                                                </tr>                                               
                                                <tr>
                                                    <th><label for="pass_ask"><spring:message code="label.pass_ask"/></label></th>
                                                    <td class="text-left">
                                                        <form:select path="pass_ask" name="pass_ask" class="select" style="width:200px;" readonly="readonly">
                                                            <option value='' <c:if test="${memberVO.pass_ask eq 0}">selected</c:if>>-질문을 선택하여 주십시오-</option>
                                                            <option value="1" <c:if test="${memberVO.pass_ask eq 1}">selected</c:if>>가장 인상깊었던 여행지는 </option>
                                                            <option value="2" <c:if test="${memberVO.pass_ask eq 2}">selected</c:if>>나의보물 1호는 </option>
                                                            <option value="3" <c:if test="${memberVO.pass_ask eq 3}">selected</c:if>>아버지 성함은 </option>
                                                            <option value="4" <c:if test="${memberVO.pass_ask eq 4}">selected</c:if>>어머니 성함은 </option>
                                                            <option value="5" <c:if test="${memberVO.pass_ask eq 5}">selected</c:if>>어릴적 별명은 </option>
                                                            <option value="6" <c:if test="${memberVO.pass_ask eq 6}">selected</c:if>>나의 애완동물 이름은 </option>
                                                            <option value="7" <c:if test="${memberVO.pass_ask eq 7}">selected</c:if>>좋아하는 동물은 </option>
                                                            <option value="8" <c:if test="${memberVO.pass_ask eq 8}">selected</c:if>>좋아하는 색깔은 </option>
                                                            <option value="9" <c:if test="${memberVO.pass_ask eq 9}">selected</c:if>>태어난 곳은 </option>
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
                                                        <form:input path="email" type="text" placeholder="Email" class="wfull" readonly="readonly" />                                                       
                                                        <form:errors path="email" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="zipcode"><spring:message code="label.zipcode"/></label></th>
                                                    <td class="text-left">
                                                        <form:input path="zipcode" type="text" id="zipcode" placeholder="Zipcode" readonly="readonly"/>
                                                       <input type="button" id="findzipcode" class="findzipcode" value="우편번호찾기" />
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
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 02. 고객님의 추가사항을 입력해 주세요. (선택항목)</h3>
                                            </div>
                                            <table summary="회원가입폼을 보여주고 있습니다." class="board_detail">
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
                                                            <option value="" <c:if test="${memberVO.job eq '0'}">selected</c:if>>-직업을 선택하여 주십시오-</option>
                                                            <option value="은행업" <c:if test="${memberVO.job eq '은행업'}">selected</c:if>>은행업</option>
                                                            <option value="증권업" <c:if test="${memberVO.job eq '증권업'}">selected</c:if>>증권업</option>
                                                            <option value="보험업" <c:if test="${memberVO.job eq '보험업'}">selected</c:if>>보험업</option>
                                                            <option value="운송업" <c:if test="${memberVO.job eq '운송업'}">selected</c:if>>운송업</option>
                                                            <option value="유통업" <c:if test="${memberVO.job eq '유통업'}">selected</c:if>>유통업</option>
                                                            <option value="학생" <c:if test="${memberVO.job eq '학생'}">selected</c:if>>학생</option>
                                                            <option value="의료" <c:if test="${memberVO.job eq '의료'}">selected</c:if>>의료</option>
                                                            <option value="서비스업" <c:if test="${memberVO.job eq '서비스업'}">	selected</c:if>>서비스업</option>
                                                            <option value="기타" <c:if test="${memberVO.job eq '기타'}">selected</c:if>>기타</option>
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
		                                                    </c:if>> 예
		                                                    <input type="radio" name="mail_check" value="0" <c:if test="${memberVO.mail_check == 0}">
		                                                    <c:out value="checked" />
		                                                    </c:if>> 아니오
	                       									<form:errors path="mail_check"/>
                       									</div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 03. 참고 자료가 있으시면 참고 자료 파일을등록하여 주십시오.</h3>
                                            </div> 
                                            <table summary="회원가입폼을 보여주고 있습니다." class="board_detail">
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
                                                            <!-- 첨부파일목록 -->
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
																					<td><a href="attachDelete.do?filename=<c:out value="${row.file_hash_name}"/>&board_idx=<c:out value="${boardVO.board_idx}"/>&file_idx=<c:out value="${row.file_idx}"/>">삭제</a></td>
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
                                                            <input type="button" id="addItemBtn" value="<spring:message code="button.fileadd"/>" /> 첨부파일은 최대5개까지 첨부가능합니다.
                                                        </div>
                                                    </td>
                                                </tr>                                                
                                            </table>
                                            <hr>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 04. 기타 하실 말씀이 있으시면 적어주세요.</h3>
                                            </div>
                                            <table summary="회원가입폼을 보여주고 있습니다." class="table">
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
													<li><input type="button" value="<spring:message code="button.home"/>" onClick="location.href='../../index.do'"/></li>
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


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	$(document).ready(function() {	
	
		// 우편번호검색
		$("#findzipcode").on("click",function(){	
			
	    	new daum.Postcode({
	            oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	        	    addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	            	extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = '(' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();

					// 추가부분 jquery validate 값이 들어가 있으면 보더색깔 변경
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
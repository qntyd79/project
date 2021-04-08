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
                                <h2>회원정보</h2>
                                <form id="writeForm" name="writeForm" method="post" enctype="multipart/form-data" action="<c:url value='update.do'/>">
                                	<input type="hidden" name="member_idx" value="<c:out value="${dto.member_idx}"/>" >
									<input type="hidden" name="page" value="<c:out value="${criteria.page}"/>" >
									<input type="hidden" name="perPageNum" value="<c:out value="${criteria.perPageNum}"/>" >
									<input type="hidden" name="searchField" value="<c:out value="${criteria.searchField}"/>" >
									<input type="hidden" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" >
									<input type="hidden" name="msgStr" value="<c:out value="${msg}"/>" >
                                    <fieldset>
                                        <div class="panel-box">
                                            <legend>Board Write Form</legend>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 01. 고객님의 기본사항을 입력해 주세요. (필수항목)</h3>
                                            </div>
                                            <table summary="회원가입폼을 보여주고 있습니다." class="table">
                                                <colgroup>
                                                    <col width="20%" />
                                                    <col width="80%" />
                                                </colgroup>
                                                
                                                <%-- <tr class="tline">
                                                    <th>
                                                        <label for="cate">분류</label>
                                                    </th>
                                                    <td class="text-left">
                                                    <select name="category_idx" id="category_idx">
														<c:forEach var="item" items="${categorylist}" varStatus="status">
															<option value="<c:out value="${item.category_idx}"/>"
																<c:if test="${item.category_idx == categoryselect}"><c:out value= "selected=selected"/></c:if>>
																<c:out value="${item.title}" />
															</option>
														</c:forEach>
													</select>
													<button type="button" class="popupBtn" value="#layer1">분류추가</button>
													<div class="layer">
														<div class="bg"></div>
														<div id="layer1" class="pop-layer">
															<div class="pop-container">
																<div class="pop-conts">
																	<iframe name="ifrm_file" src="${path}/modules/category/list.do" height="680px" marginwidth="0" marginheight="0" scrolling="no"
																		frameborder="0" style="width:100%;"></iframe>
																	<div class="btn-r">
																		<a href="#" class="cbtn">Close</a>
																	</div>
																</div>
															</div>
														</div>
													</div></td>
                                                </tr> --%>
                                                
                                                <tr>
                                                    <th scope="row"><label for="userid">회원아이디</label></th>
                                                    <td scope="row" class="text-left">
                                                        <input type="text" id="userid" name="userid" value="${dto.userid}" class="readonly" readonly/>
                                                        <!-- <input type="button" value="아이디 중복검사" class="modal-open-btn">-->
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="pass"> 비밀번호 </label></th>
                                                    <td scope="row" class="text-left"><input type="password" id="pass" name="pass" /> <span>6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span></td>
                                                </tr>                                               
                                                <tr>
                                                    <th scope="row"><label for="pass_ask"> 비밀번호 분실시 질문</label></th>
                                                    <td scope="row" class="text-left">
                                                        <select name="pass_ask" class="readonly" readonly 
                                                        onFocus="this.initialSelect = this.selectedIndex;" 
												        onChange="this.selectedIndex = this.initialSelect;">                                                        	  
                                                            <option value='0' <c:if test="${dto.pass_ask eq 0}">selected</c:if>>-질문을 선택하여 주십시오-</option>
                                                            <option value="1" <c:if test="${dto.pass_ask eq 1}">selected</c:if>>가장 인상깊었던 여행지는 </option>
                                                            <option value="2" <c:if test="${dto.pass_ask eq 2}">selected</c:if>>나의보물 1호는 </option>
                                                            <option value="3" <c:if test="${dto.pass_ask eq 3}">selected</c:if>>아버지 성함은 </option>
                                                            <option value="4" <c:if test="${dto.pass_ask eq 4}">selected</c:if>>어머니 성함은 </option>
                                                            <option value="5" <c:if test="${dto.pass_ask eq 5}">selected</c:if>>어릴적 별명은 </option>
                                                            <option value="6" <c:if test="${dto.pass_ask eq 6}">selected</c:if>>나의 애완동물 이름은 </option>
                                                            <option value="7" <c:if test="${dto.pass_ask eq 7}">selected</c:if>>좋아하는 동물은 </option>
                                                            <option value="8" <c:if test="${dto.pass_ask eq 8}">selected</c:if>>좋아하는 색깔은 </option>
                                                            <option value="9" <c:if test="${dto.pass_ask eq 9}">selected</c:if>>태어난 곳은 </option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="pass_account"> 비밀번호 분실시 답변 </label></th>
                                                    <td scope="row" class="text-left"><input type="text" id="pass_account" name="pass_account" value="${dto.pass_account}" class="readonly" readonly/> </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="name"> 이름 </label></th>
                                                    <td scope="row" class="text-left"><input type="text" id="name" name="name" value="${dto.name}" class="readonly" readonly/> </td>
                                                </tr>                                               
                                                <tr>
                                                    <th scope="row"><label for="email"> 이메일 </label></th>
                                                    <td scope="row" class="text-left">
                                                        <input type="text" name="email" id="str_email01" value="${dto.email}" class="readonly" readonly/>
                                                        <!--  @
													    <input type="text" name="email2" id="str_email02" value="" readonly/>
													    <select id="selectEmail">
													        <option value="1">직접입력</option>
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
													    -->
                                                        <span>알찬 서비스 소식 및 이벤트을 전해드립니다.</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="zipcode"> 우편번호 </label></th>
                                                    <td scope="row" class="text-left">
                                                        <input type="text"  id="zipcode"  name="zipcode" value="${dto.zipcode}" placeholder="우편번호"/>
                                                        <input type="button"  onclick="findzipcode()" value="우편번호 찾기" />
                                                    </td> 
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="address"> 주소 </label></th>
                                                    <td scope="row" class="text-left">
	                                                    <input type="text" name="address" id="address" value="${dto.address}" placeholder="주소"/> 
	                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="address2"> 상세주소 </label></th>
                                                    <td scope="row" class="text-left">
                                                    	<input type="text" name="detailaddress" id="detailAddress" value="${dto.detailaddress}" placeholder="상세주소"/> 
                                                    	<input type="text" name="extraaddress" id="extraAddress" value="${dto.extraaddress}" placeholder="참고항목" style="margin-top:5px;"/> 	
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="phone"> 전화번호 </label></th>
                                                    <td scope="row" class="text-left"><input type="text" name="phone" id="phone" value="${dto.phone}"/> </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="hphone"> 핸드폰번호 </label></th>
                                                    <td scope="row" class="text-left"><input type="text" name="hphone" id="hphone" value="${dto.hphone}"/> </td>
                                                </tr>
                                                <!--                                                 
                                                <tr>
                                                    <th scope="row"><label for="phone1"> 전화번호</label></th>
                                                    <td scope="row" class="text-left">
                                                        <select name="phone" id="phone">
                                                            <option>선택</option>
                                                            <option value="02" selected="selected">02</option>
                                                            <option value="031">031</option>
                                                            <option value="032">032</option>
                                                            <option value="033">033</option>
                                                            <option value="041">041</option>
                                                            <option value="042">042</option>
                                                            <option value="043">043</option>
                                                            <option value="051">051</option>
                                                            <option value="052">052</option>
                                                            <option value="053">053</option>
                                                            <option value="054">054</option>
                                                            <option value="055">055</option>
                                                            <option value="061">061</option>
                                                            <option value="062">062</option>
                                                            <option value="063">063</option>
                                                            <option value="064">064</option>
                                                            <option value="070">070</option>
                                                        </select>
                                                        -
                                                        <input name="phone2" type="text" id="phone2" value="1234"/> -
                                                        <input name="phone3" type="text" id="phone3" value="5678"/>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="hphone"> 핸드폰</label></th>
                                                    <td scope="row" class="text-left">
                                                        <select name="hphone" id="hphone">
                                                            <option>선택</option>
                                                            <option value="010" selected="selected">010</option>
                                                            <option value="011">011</option>
                                                            <option value="016">016</option>
                                                            <option value="017">017</option>
                                                            <option value="018">018</option>
                                                            <option value="019">019</option>
                                                        </select>
                                                        -
                                                        <input name="hphone2" type="text" id="hphone2" value="5674"/> -
                                                        <input name="hphone3" type="text" id="hphone3" value="3456"/>
                                                    </td>
                                                </tr>
                                                -->
                                            </table>
                                            <hr>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 02. 고객님의 추가사항을 입력해 주세요. (선택항목)</h3>
                                            </div>
                                            <table summary="회원가입폼을 보여주고 있습니다." class="table">
                                                <colgroup>
                                                    <col width="20%" />
                                                    <col width="80%" />
                                                </colgroup>
                                                <tr class="tline">
                                                    <th scope="row"><label for="nickname"> 닉네임</label></th>
                                                    <td scope="row" class="text-left"><input type="text" id="nickname" name="nickname" value="${dto.nickname}" class="readonly" readonly/></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="homepage"> 홈페이지 </label></th>
                                                    <td scope="row" class="text-left"><input type="text" id="homepage" name="homepage" value="${dto.homepage}" /></td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="job"> 직업</label></th>
                                                    <td scope="row" class="text-left">
                                                        <select name="job">
                                                            <option value="0" 			<c:if test="${dto.job eq '0'}">			selected</c:if>>-직업을 선택하여 주십시오-</option>
                                                            <option value="은행업" 		<c:if test="${dto.job eq '은행업'}">	selected</c:if>>은행업</option>
                                                            <option value="증권업" 		<c:if test="${dto.job eq '증권업'}">	selected</c:if>>증권업</option>
                                                            <option value="보험업" 		<c:if test="${dto.job eq '보험업'}">	selected</c:if>>보험업</option>
                                                            <option value="운송업" 		<c:if test="${dto.job eq '운송업'}">	selected</c:if>>운송업</option>
                                                            <option value="유통업" 		<c:if test="${dto.job eq '유통업'}">	selected</c:if>>유통업</option>
                                                            <option value="학생" 			<c:if test="${dto.job eq '학생'}">		selected</c:if>>학생</option>
                                                            <option value="의료" 			<c:if test="${dto.job eq '의료'}">		selected</c:if>>의료</option>
                                                            <option value="서비스업" 	<c:if test="${dto.job eq '서비스업'}">	selected</c:if>>서비스업</option>
                                                            <option value="기타" 			<c:if test="${dto.job eq '기타'}">		selected</c:if>>기타</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                     <td colspan="2" class="text-left">
                                                        <textarea name="message" id="message">${dto.message}</textarea>
                                                        <script>
                                                            CKEDITOR.replace('message',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});
                                                        </script>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row"><label for="mail_check"> 메일수신여부</label></th>
                                                    <td scope="row" class="text-left">
                                                        <input type="radio" name="mail_check" value="1" <c:if test="${dto.mail_check eq '1'}"><c:out value= "checked"/></c:if>> 예
                                                        <input type="radio" name="mail_check" value="0"  <c:if test="${dto.mail_check eq '0'}"><c:out value= "checked"/></c:if>> 아니오
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr>
                                            <div class="panel-header">
                                                <h3 class="panel-title"><i class="fas fa-file-alt"></i> 03. 참고 자료가 있으시면 참고 자료 파일을등록하여 주십시오.</h3>
                                            </div>
                                            <table summary="회원가입폼을 보여주고 있습니다." class="table">
                                                <colgroup>
                                                    <col width="20%" />
                                                    <col width="80%" />
                                                </colgroup>
                                                <tr class="tline">
                                                    <td colspan="2" class="text-left">
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
                                                            <!-- <input type="button" value="파일폼삭제" id="delItemBtn" /> -->
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
                                                <tr class="tline">
                                                     <td colspan="2" class="text-left">
                                                        <textarea name="etc" id="etc">${dto.etc}</textarea>
                                                         <script>
                                                            CKEDITOR.replace('etc',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});
                                                        </script>
                                                    </td>
                                                </tr>
                                            </table>                                            
                                            
                                            <nav class="btn-group">
												<ul>
													<li><input type="button" value="회원목록" onClick="location.href='list.do'"></li>
													<!--<li><input type="button" value="등록하기" onClick="Board_Write_Check();"></li> -->
													<li><input type="button" value="정보수정" onclick="$(this.form).submit()"></li>
												</ul>
											</nav>
                                        </div>
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
<%@ include file="../../include/modal.jsp"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function findzipcode() {
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
                        extraAddr = ' (' + extraAddr + ')';
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
            }
        }).open();
    }
</script>
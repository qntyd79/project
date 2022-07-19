<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="boardVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script src="<c:url value="/resources/js/my_jquery.js"/>" type="text/javascript" charset="UTF-8"></script>  

<!--
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                      -->
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                            
                            
                                <h2><spring:message code="bbs.title.write"/></h2>
                                <form:form modelAttribute="boardVO" method="post" id="writeForm" name="writeForm" enctype="multipart/form-data" >
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
                                                        <form:select path="category_idx" id="category_idx">
                                                            <c:forEach var="item" items="${category}" varStatus="status">
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
                                                                        <iframe name="ifrm_file" src="${path}/modules/category/list.do?idx=1" height="680px" marginwidth="0" marginheight="0" 
                                                                        scrolling="no" frameborder="0" style="width:100%;"></iframe>
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
                               					<!--<c:if test="${sessionScope.isAdmin == null && kakaoinfo == null && naverinfo == null && googleinfo == null}">-->
                                                <tr>
                                                    <th><label for="userid"><spring:message code="label.userid"/></label></th>
                                                    <td class="text-left"><form:input path="userid" type="text" placeholder="UserID" class="wfull" value="test"/> <form:errors path="userid" /> </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"><spring:message code="label.name"/></label></th>
                                                    <td class="text-left"><form:input path="name" type="text" placeholder="Name" class="wfull" value="관리자"/> <form:errors path="name" /> </td>
                                                </tr>
                                                <!--</c:if>-->                                               
                                                <tr>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                    <td class="text-left"><form:input path="pass" type="password" placeholder="Password" class="wfull" value="test!@1234"/> <form:errors path="pass" /> </td>
                                                </tr> 
                                                <!--<c:if test="${sessionScope.isAdmin == null && kakaoinfo == null && naverinfo == null && googleinfo == null}">-->                                             
                                                <tr>
                                                    <th><label for="email"><spring:message code="label.email"/></label></th>
                                                    <td class="text-left"><form:input path="email" type="text" placeholder="Email" value="test@co.kr"/>
                                                       <input type="text" name="email2" value="기능업그레이드 예정"/>
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
                                                        <form:errors path="email" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="homepage"><spring:message code="label.homepage"/></label></th>
                                                    <td class="text-left">
                                                    	<form:input path="homepage" type="text" placeholder="Homepage" class="wfull" value="test.co.kr"/> <form:errors path="homepage" />
                                                    </td>
                                                </tr>
                                                <!--</c:if>-->
                                                <tr>
                                                    <th><label for="title"><spring:message code="label.title"/></label></th>
                                                    <td class="text-left">
                                                    	<form:input path="title" type="text" placeholder="Title" class="wfull" value="테스트입니다."/> <form:errors path="title" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="date"><spring:message code="label.sdate"/></label></th>
                                                    <td class="text-left">
                                                        <form:input path="sdate" id="sdate" type="text" placeholder="StartDay" class="datePicker" value="2022-01-03"/> <form:errors path="sdate" />                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="date"><spring:message code="label.edate"/></label></th>
                                                    <td class="text-left">
                                                        <form:input path="edate" id="edate" type="text" placeholder="EndDay" class="datePicker" value="2022-01-04"/> <form:errors path="edate" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="option"><spring:message code="label.option"/></label></th>
                                                    <td class="text-left">
                                                        <input type="checkbox" name="notice" value="1" /> 공지사항
                                                        <input type="checkbox" name="secret" value="1" /> 비밀글
                                                        <input type="checkbox" name="tag" value="1" /> 소스코드
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="10" class="text-left">
                                                        <form:textarea path="content" id="content" placeholder="Content"/><form:errors path="content"/>
                                                        <script>
                                                            CKEDITOR.replace('content',{"removePlugins": "exportpdf"});
                                                        </script>
                                                        <!--<label for="content"><spring:message code="label.content"/></label>-->   
                                                     </td>
                                                </tr>                                                
                                                <tr>
                                                    <th><label for="link1"><spring:message code="label.link1"/></label></th>
                                                    <td class="text-left"><form:input path="link1" type="text" placeholder="Link1"  class="wfull" value="link1.co.kr"/> <form:errors path="link1"/></td>
                                                </tr>
                                                <tr>
                                                    <th><label for="link2"> <spring:message code="label.link2"/></label></th>
                                                    <td class="text-left"><form:input path="link2" type="text" placeholder="Link2"  class="wfull" value="link2.co.kr"/> <form:errors path="link2"/></td>
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
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='ajaxlist.do'"/></li>
												<li><input type="button" value="<spring:message code="button.create"/>" id="writeBtn"/></li>												
											</ul>
										</nav>
									</fieldset>
                            	</form:form>
                                
                                
                            </div>
                        </div>
                    </article>
                    <!--
                </section>
            </div>
        </div>
    </div>
</div>
-->


<script type="text/javascript">
$(document).ready(function() {
	
    //게시판등록    	
	$("#writeBtn").on("click",function(){

		//var board_idx = ${board_idx};
			
		var isValid = $("#writeForm").validate().form();
			
		if (isValid == true){ //true 반환 
	    		
		   	CKupdate();
				
		   	//화면입력값 변수처리
		   	var category_idx = $("#category_idx").val();
			var userid = $("#userid").val();
			var pass = $("#pass").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var homepage = $("#homepage").val();
			var title = $("#title").val();
			var sdate = $("#sdate").val();
			var edate = $("#edate").val();
			var notice = $("#notice").val();
			var secret = $("#secret").val();
			var tag = $("#tag").val();
			var content = $("#content").val();
			var link1 = $("#link1").val();
			var link2 = $("#link2").val();
						
			//ajax
			$.ajax({
				type: "POST",
				url: "${path}/modules/board/ajaxInsert",
				headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST"},
				dataType: "text",
				data: JSON.stringify({ // stringify는 json개체를 string개체로 변환
					category_idx : category_idx,
					userid : userid,
					pass : pass,
					name : name,
					email : email,
					homepage : homepage,
					title : title,
					sdate : sdate,
					edate : edate,
					notice : notice,
					secret : secret,
					tag : tag,					        
					content : content,
					link1 : link1,
					link2 : link2
				}),
				success: function(result) {
				    // 서비스 성공 시 처리 할 내용
				    if (result == "insertSuccess") {
				      	alert("ajax 게시글등록 완료");
				    }  
				    
				  	// 게시물목록으로 페이지이동 
				    location.reload();
				    location.href = "${path}/modules/board/ajaxlist.do";
				    
				},
				error : function(request, status, error) {
					 // 서비스 실패 시 처리 할 내용
			    	alert("ajax 게시글등록 실패");
				}
			}); // ajax종료 	
		
			return false;
		} 	
	});
		
		// 게시판 - 작성 콜백 함수
	    function insertBoardCallback(obj){
	    
		   	if(obj != null){        
		            
			   	var result = obj.result;

				if(result == "insertSuccess"){                
			    	alert("게시글 등록을 성공하였습니다.");                
			    	goBoardList();                 
			    } else {                
			    	alert("게시글 등록을 실패하였습니다.");    
			    	return;
			   	}
	        }
	    }
	
	    //AJAX 로 폼의 데이터를 전송할 때 CKEDITOR로 변환 된 textarea값을 다시 변경해줘야 데이터가 전달된다.
	    function CKupdate() {
	        for (instance in CKEDITOR.instances)
	            CKEDITOR.instances[instance].updateElement();
	    }
	
	    function CKreset() {
	        for (instance in CKEDITOR.instances)
	            CKEDITOR.instances[instance].setData("");

        		$("#content-error").remove();
	    }
	 
});

</script>

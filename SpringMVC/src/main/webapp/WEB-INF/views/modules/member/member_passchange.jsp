<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="modal-box">
	<div class="modal-header">
		<h2>비밀번호 변경하기</h2>
		<p style="margin-bottom:5px;">회원님의 개인정보를 안전하게 보호하고, 개인정보 도용으로 인한 피해를 예방하기 위해 <br> 30일 이상 비밀번호를 변경하지 않은 경우 비밀번호 변경을 권장하고 있습니다.</p>
	</div>
	<div class="modal-content">
		<article>
			<div class="row">
				<div class="col-md-12">

					<form method="post" id="passChangeForm" name="passChangeForm" enctype="multipart/form-data" action="passChange.do">
					<input type="hidden" id="reuserid" value="<c:out value="${memberVO.userid}"/>"/>
						<div class="form-group">
							<label for="nowpass"><spring:message code="label.nowpass"/></label>
							<input name="nowpass" id="nowpass" type="password" class="btn-block"	placeholder="Current Password" />
							<form:errors path="pass" />
						</div>
						<div class="form-group">
							<label for="newpass"><spring:message code="label.newpass"/></label>
							<input name="newpass" id="newpass" type="password" class="btn-block"	placeholder="New password" />
							<form:errors path="newpass" />
						</div>
						<div class="form-group">
							<label for="newpassch"><spring:message code="label.newpassch"/></label>
							<input name="newpassch"	id="newpassch" type="password" class="btn-block" placeholder="New password confirmation" />
							<form:errors path="newpassch" />
						</div>
						<input type="button" id="passChangeBtn" value="비밀번호 변경하기" class="btn-large btn-block danger" style="height:45px; margin-bottom:15px;"/>
						<input type="button" id="nextChangeBtn" value="다음에 변경하기" class="btn-large btn-block info" style="height:45px;"/>
					</form>

				</div>
			</div>
		</article>
	</div>
	<!--
	<div class="modal-footer">
		<div class="modal-close-btn">닫기</div>
	</div>
	  -->
</div>
<div class="modal-back"></div>

<script type="text/javascript">
	$(document).ready(function() {
		
		 
		// 다음에 변경하기 
		$("#nextChangeBtn").on("click",function(){
			$('.modal-box').removeClass('modal-on');
            $('.modal-back').removeClass('back-on');
            $('body').removeClass('body-lock');
		});
		
		//비밀전호 변경	
		$("#passChangeBtn").on("click",function(){
			
			//var isValid = $("#loginForm").validate().form();
			
			//if (isValid == true){ //true 반환 
		    
			    //화면입력값 변수처리
			    var reuserid = $("#reuserid").val();
			    var repass = $("#nowpass").val();
			    var param = { "pass" : repass, "userid" : reuserid};
			    alert(repass);
			    
				//ajax
				$.ajax({
				  	type: "POST",
				    url: "${path}/modules/member/passchangecheck.do",
				    headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
				    dataType: "json",
				    data: JSON.stringify(param),
				    success: function(data) {
	
						// 비밀번호가 일치하면 1
						if(data.check == 1) {
							
							alert("현재 비밀번호가 일치합니다.");	

							var newpass = $("#newpass").val();
							alert(newpass);
						    var param = { "pass" : newpass, "userid" : data.userid};
						    
							$.ajax({
							  	type: "POST",
							    url: "${path}/modules/member/passchange.do",
							    headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
							    dataType: "json",
							    data: JSON.stringify(param),
							    success: function(data) {
									if(data === 1){
										alert("비밀번호가 변경되었습니다.");	
									} else {
										alert("입력정보를 다시 확인하세요.");	
									}
							    },
							    error: function(request, status, error) {
							        // 서비스 실패 시 처리 할 내용
							    	alert("시스템 에러");
							    }
							}); //ajax종료 	
				    		
						} else { // 비밀번호가 일치하지 않으면 0
							alert("현재 비밀번호가 일치하지 않습니다.");	
							//$('#result').text("일치하는 정보가 존재하지 않습니다.");
						}	

						$("#nowpass").val("");
					    $("#newpass").val("");  
					    $("#newpassch").val("");    			
				    	
				    },
				    error: function(request, status, error) {
				        // 서비스 실패 시 처리 할 내용
				    	alert("시스템 에러입니다.");
				    }
				}); //ajax종료 	
		
				//return false;
		  // } 
		
		});
		
	});
</script>
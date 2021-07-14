<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

								
	
												<div class="panel">
													<div class="form-group">
														<div class="test-box">
															<p class="icon-top"><i class="fas fa-address-card"></i></p>
															<h1 class="title">비밀번호찾기</h1>
															<h2 class="subtitle">가입하신 아이디와 이메일로 비밀번호찾기가 가능합니다.</h2>
															<h2 class="subtitle"><span id="result"></span></h2>															
														</div>
													</div>
													<div class="form-group">
														<label for="userid"><spring:message code="label.userid" /></label> 
														<input name="userid" id="userid" type="text" class="btn-block" placeholder="UserID" />
														<form:errors path="userid" />
													</div>
													<div class="form-group">
														<label for="email"><spring:message code="label.email" /></label> 
														<input name="email" id="email" type="text" class="btn-block" placeholder="Email" />
														<form:errors path="email" />
													</div>
													<div class="btn-group">
														<input type="button" id="passfindBtn" value="확인" class="btn-block danger" style="height: 45px; margin-bottom: 15px;" />
														<input type="button" value="로그인" class="btn-block info"	style="height: 45px;" onclick="location.href='login.do'" />
													</div>
												</div>
							

<script type="text/javascript">
	$(document).ready(function() {
	    
		//비밀번호찾기   	
		$("#passfindBtn").on("click",function(){
		
			
			var isValid = $("#loginForm").validate().form();
			
			if (isValid == true){ //true 반환 
		    
			    //화면입력값 변수처리
			    var userid = $("#userid").val();
			    var email = $("#email").val();
			    var param = { "userid" : userid, "email" : email};
			    
				//ajax
				$.ajax({
				  	type: "POST",
				    url: "${path}/modules/member/passfindcheck.do",
				    headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
				    dataType: "json",
				    data: JSON.stringify(param),
				    success: function(data) {

						// 아이디가 존재하면 1
						if(data.check == 1) {
				    		$('#result').text("임시 비밀번호를 " + data.email + " 로 발송하였습니다.");
				    		//$('#result').append(data.pass);
						} else { // 아이디가 존재하지 않으면 0
							$('#result').text("일치하는 정보가 존재하지 않습니다.");
						}
				    	
					    //입력폼 초기화
					    $("#userid").val("");
					    $("#email").val("");   
				    },
				    error: function(request, status, error) {
				        // 서비스 실패 시 처리 할 내용
				    	alert("시스템 에러");
				    }
				}); //ajax종료 	
		
				return false;
		   } 
		
		});
		
	});
</script>

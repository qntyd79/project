<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


											
												<div class="panel">
													<div class="form-group">
														<div class="test-box">
															<p class="icon-top"><i class="fas fa-address-card"></i></p>
															<h1 class="title">아이디찾기</h1>
															<h2 class="subtitle">가입하신 이름과 이메일로 아이디찾기가 가능합니다.</h2>
															<h2 class="subtitle"><span id="result"></span></h2>				
														</div>
													</div>
													<div class="form-group">
														<label for="name"><spring:message code="label.name" /></label> 
														<input name="name" id="name" type="text" class="btn-block" placeholder="Name" />
														<form:errors path="name" />
													</div>
													<div class="form-group">
														<label for="email"><spring:message code="label.email" /></label> 
														<input name="email" id="email" type="text" class="btn-block" placeholder="Email" />
														<form:errors path="email" />
													</div>
													<div class="btn-group">
														<input type="button" id="idfindBtn" value="확인"	class="btn-block danger" style="height:45px; margin-bottom:15px;" />
														<input type="button" value="로그인" class="btn-block info"	style="height: 45px;" onclick="location.href='login.do'" />
													</div>
												</div>
										

<script type="text/javascript">

$(document).ready(function() {
	
	//아이디찾기   	
	$("#idfindBtn").on("click",function(){
		
		var isValid = $("#loginForm").validate().form();
		
		if (isValid == true){ //true 반환 
	    
		    //화면입력값 변수처리
		    var name = $("#name").val();
		    var email = $("#email").val();
		    var param = { "name" : name, "email" : email};
		    
			//ajax
			$.ajax({
			  	type: "POST",
			    url: "${path}/modules/member/idfindcheck.do",
			    headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
			    dataType: "json",
			    data: JSON.stringify(param),
			    success: function(data) {

					// 아이디가 존재하면 1
					if(data.check == 1) {
			    		$('#result').text("찾으시는 아이디는 " + data.id + "입니다.");
					} else { // 아이디가 존재하지 않으면 0
						$('#result').text("일치하는 정보가 존재하지 않습니다.");
					}
			    	
				    //입력폼 초기화
				    $("#name").val("");
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

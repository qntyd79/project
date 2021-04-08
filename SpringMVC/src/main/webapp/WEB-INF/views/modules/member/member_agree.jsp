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
								<h2>개인정보동의</h2>
								<form>
									<fieldset>
										<legend>회원가입약관</legend>
										
										<div class="panel-box">
											<div class="panel-header">
												<h3 class="panel-title">
													<i class="fas fa-file-alt"></i> 회원약관 (필수)
												</h3>
											</div>
											<div class="panel-body">
												<div class="license">
													<h3>제1장 총 칙</h3>
													<h4>제1조 (목 적)</h4>
													<p>이 약관은 주식회사 온세텔레콤(이하 "회사")이 제공하는 온세테마샵 웹사이트(이하
														"사이트")에서 제공하는 홈페이지 서비스(이하 "서비스")를 이용함에 있어 서비스 이용조건, 절차,
														범위에 관한 기본적인 사항을 정함을 목적으로 합니다.</p>
													<h4>제2조 (약관의 효력 및 변경)</h4>
													<p>① 이 약관은 서비스 사이트의 게시판을 통하여 이용자에게 공시함으로써 효력이 발생합니다. 이
														약관에 동의하고 회원가입을 한 회원은 약관에 동의한 시점부터 동의한 약관의 적용을 받고 약관의 변경이
														있을 경우에는 변경의 효력이 발생한 시점부터 변경된 약관의 적용을 받습니다.</p>
													<p>② 회사는 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 지체
														없이 제1항과 같은 방법으로 공시합니다. 다만, 이용자의 권리 또는 의무에 관한 중요한 규정의 변경은
														변경전 7일전에 공시합니다.</p>
													<p>③ 회원은 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용 계약을 해지할 수
														있으며, 변경된 약관의 효력 발생일 이후에도 서비스를 계속 사용할 경우 약관의 변경사항에 동의한 것으로
														간주됩니다.</p>
													<h4>제3조 (약관 외 준칙)</h4>
													<p>이 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법 등 관계법령 및 회사가
														정한 서비스이용약관 등의 규정에 따르며, 서비스에 대한 세부적인 사항은 해당 서비스의 세부이용지침,
														이용안내 및 공지에 따릅니다.</p>
													<h4>제4조 (용어의 정의)</h4>
													<p>① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
													<p>1. 사이트 : 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를
														이용하여 재화, 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이트를 운영하는
														사업자의 의미로도 사용합니다.</p>
													<p>2. 회원 : 사이트에 접속하여 이 약관에 동의하고, ID(고유번호)와
														Password(비밀번호)를 발급 받은 고객으로 회원의 자격 및 권한은 사이트별로 별도 관리합니다.</p>
													<p>3. ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가
														승인하는 영문자와 숫자의 조합으로 이용 가능합니다.</p>
													<p>4. Password(비밀번호) : 회원의 정보 보호를 위해 회원 자신이 설정한 문자와 숫자의
														조합을 말합니다.</p>
													<p>5. 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사가 선정한 자를 말합니다.</p>
													<p>6. 서비스 중지 : 정상 이용 중 회사가 정한 일정한 요건에 따라 일정기간 동안 서비스의
														제공을 중지하는 것을 말합니다. ② 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는
														관계법령 및 서비스별 안내에서 정하는 바에 의합니다.</p>
												</div>
											</div>
											<div class="panel-footer">
												<div class="privacy-btn">
													<input type="checkbox" name="agree1" value="1"> 이용
													약관에 동의합니다.
												</div>
											</div>
										</div>
										<hr>
										<div class="panel-box">
											<div class="panel-header">
												<h3 class="panel-title">
													<i class="fas fa-file-alt"></i> 개인정보보호정책 (필수)
												</h3>
											</div>
											<div class="panel-body">
												<div class="license">
													<h3>제1장 총 칙</h3>
													<h4>제1조 (목 적)</h4>
													<p>이 약관은 주식회사 온세텔레콤(이하 "회사")이 제공하는 온세테마샵 웹사이트(이하
														"사이트")에서 제공하는 홈페이지 서비스(이하 "서비스")를 이용함에 있어 서비스 이용조건, 절차,
														범위에 관한 기본적인 사항을 정함을 목적으로 합니다.</p>
													<h4>제2조 (약관의 효력 및 변경)</h4>
													<p>① 이 약관은 서비스 사이트의 게시판을 통하여 이용자에게 공시함으로써 효력이 발생합니다. 이
														약관에 동의하고 회원가입을 한 회원은 약관에 동의한 시점부터 동의한 약관의 적용을 받고 약관의 변경이
														있을 경우에는 변경의 효력이 발생한 시점부터 변경된 약관의 적용을 받습니다.</p>
													<p>② 회사는 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 지체
														없이 제1항과 같은 방법으로 공시합니다. 다만, 이용자의 권리 또는 의무에 관한 중요한 규정의 변경은
														변경전 7일전에 공시합니다.</p>
													<p>③ 회원은 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용 계약을 해지할 수
														있으며, 변경된 약관의 효력 발생일 이후에도 서비스를 계속 사용할 경우 약관의 변경사항에 동의한 것으로
														간주됩니다.</p>
													<h4>제3조 (약관 외 준칙)</h4>
													<p>이 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법 등 관계법령 및 회사가
														정한 서비스이용약관 등의 규정에 따르며, 서비스에 대한 세부적인 사항은 해당 서비스의 세부이용지침,
														이용안내 및 공지에 따릅니다.</p>
													<h4>제4조 (용어의 정의)</h4>
													<p>① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
													<p>1. 사이트 : 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를
														이용하여 재화, 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이트를 운영하는
														사업자의 의미로도 사용합니다.</p>
													<p>2. 회원 : 사이트에 접속하여 이 약관에 동의하고, ID(고유번호)와
														Password(비밀번호)를 발급 받은 고객으로 회원의 자격 및 권한은 사이트별로 별도 관리합니다.</p>
													<p>3. ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가
														승인하는 영문자와 숫자의 조합으로 이용 가능합니다.</p>
													<p>4. Password(비밀번호) : 회원의 정보 보호를 위해 회원 자신이 설정한 문자와 숫자의
														조합을 말합니다.</p>
													<p>5. 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사가 선정한 자를 말합니다.</p>
													<p>6. 서비스 중지 : 정상 이용 중 회사가 정한 일정한 요건에 따라 일정기간 동안 서비스의
														제공을 중지하는 것을 말합니다. ② 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는
														관계법령 및 서비스별 안내에서 정하는 바에 의합니다.</p>
												</div>
											</div>
											<div class="panel-footer">
												<div class="privacy-btn">
													<input type="checkbox" name="agree2" value="1"> 이용
													약관에 동의합니다.
												</div>
											</div>
										</div>
										<hr>
										<div class="panel-box">
											<div class="panel-header">
												<h3 class="panel-title">
													<i class="fas fa-file-alt"></i> 제3자 정보제공 동의 (선택)
												</h3>
											</div>
											<div class="panel-body">
												<div class="license">
													<h3>제1장 총 칙</h3>
													<h4>제1조 (목 적)</h4>
													<p>이 약관은 주식회사 온세텔레콤(이하 "회사")이 제공하는 온세테마샵 웹사이트(이하
														"사이트")에서 제공하는 홈페이지 서비스(이하 "서비스")를 이용함에 있어 서비스 이용조건, 절차,
														범위에 관한 기본적인 사항을 정함을 목적으로 합니다.</p>
													<h4>제2조 (약관의 효력 및 변경)</h4>
													<p>① 이 약관은 서비스 사이트의 게시판을 통하여 이용자에게 공시함으로써 효력이 발생합니다. 이
														약관에 동의하고 회원가입을 한 회원은 약관에 동의한 시점부터 동의한 약관의 적용을 받고 약관의 변경이
														있을 경우에는 변경의 효력이 발생한 시점부터 변경된 약관의 적용을 받습니다.</p>
													<p>② 회사는 필요하다고 인정되는 경우 이 약관을 변경할 수 있으며, 약관이 변경된 경우에는 지체
														없이 제1항과 같은 방법으로 공시합니다. 다만, 이용자의 권리 또는 의무에 관한 중요한 규정의 변경은
														변경전 7일전에 공시합니다.</p>
													<p>③ 회원은 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용 계약을 해지할 수
														있으며, 변경된 약관의 효력 발생일 이후에도 서비스를 계속 사용할 경우 약관의 변경사항에 동의한 것으로
														간주됩니다.</p>
													<h4>제3조 (약관 외 준칙)</h4>
													<p>이 약관에 명시되지 않은 사항에 대해서는 전기통신기본법, 전기통신사업법 등 관계법령 및 회사가
														정한 서비스이용약관 등의 규정에 따르며, 서비스에 대한 세부적인 사항은 해당 서비스의 세부이용지침,
														이용안내 및 공지에 따릅니다.</p>
													<h4>제4조 (용어의 정의)</h4>
													<p>① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
													<p>1. 사이트 : 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를
														이용하여 재화, 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이트를 운영하는
														사업자의 의미로도 사용합니다.</p>
													<p>2. 회원 : 사이트에 접속하여 이 약관에 동의하고, ID(고유번호)와
														Password(비밀번호)를 발급 받은 고객으로 회원의 자격 및 권한은 사이트별로 별도 관리합니다.</p>
													<p>3. ID(고유번호) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가
														승인하는 영문자와 숫자의 조합으로 이용 가능합니다.</p>
													<p>4. Password(비밀번호) : 회원의 정보 보호를 위해 회원 자신이 설정한 문자와 숫자의
														조합을 말합니다.</p>
													<p>5. 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 회사가 선정한 자를 말합니다.</p>
													<p>6. 서비스 중지 : 정상 이용 중 회사가 정한 일정한 요건에 따라 일정기간 동안 서비스의
														제공을 중지하는 것을 말합니다. ② 이 약관에서 사용하는 용어의 정의는 제1항에서 정하는 것을 제외하고는
														관계법령 및 서비스별 안내에서 정하는 바에 의합니다.</p>
												</div>
											</div>
											<div class="panel-footer">
												<div class="privacy-btn">
													<input type="checkbox" name="agree3" value="1"> 이용
													약관에 동의합니다.
												</div>
											</div>
										</div>
										<div class="privacy-btn">
													<input type="checkbox" name="allagree" value="1"> 이용
													이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.
										</div>
										<nav class="btn-group">
											<ul>
												<li><input type="button" value="확인"
													onclick="$(this.form).submit()">
												</li>
												<li><input type="button" value="취소"
													onclick="location.href='history.back(-1)"></li>
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
<script>
$(document).ready(function() {
	
   	$("[name=allagree]").prop("checked",true); 
   	
   	$("[name=agree1]").prop("checked",true);
   	
   	$("[name=agree2]").prop("checked",true);
   	
   	$("[name=agree3]").prop("checked",true);
 
	function oneCheck(a)
	{
	    var allChkBox = $("[name=agree]");
	    var chkBoxName = $(a).attr("name");
	 
	    if( $(a).prop("checked") )
	    {
	        checkBoxLength = $("[name="+ chkBoxName +"]").length;
	         //전체체크박스 수(모두동의하기 체크박스 제외)
	        checkedLength = $("[name="+ chkBoxName +"]:checked").length;
	        //체크된 체크박스 수 
	        if( checkBoxLength == checkedLength ) {
	            allChkBox.prop("checked", true);
	            //전체체크박스수 == 체크된 체크박스 수 같다면 모두체크
	 
	        } else {
	            allChkBox.prop("checked", false);
	            
	        }
	    }
	    else
	    {
	        allChkBox.prop("checked", false);
	    }
	}
	 
	$(function(){
	    $("[name=allagree]").click(function(){
	        allCheck(this);
	    });
	    $("[name=agree1]").each(function(){
	        $(this).click(function(){
	            oneCheck(this);
	        });
	    });
	    $("[name=agree2]").each(function(){
	        $(this).click(function(){
	            oneCheck(this);
	        });
	    });
	    $("[name=agree3]").each(function(){
	        $(this).click(function(){
	            oneCheck(this);
	        });
	    });
	});

}
</script>


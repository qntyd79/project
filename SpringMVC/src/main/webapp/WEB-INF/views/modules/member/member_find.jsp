<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="memberVO" staticJavascript="false" xhtml="true" cdata="false"/>

<c:import url="/WEB-INF/views/include/head.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="div-center-box-bg-hidden">
                <section class="content">
                    <article>
                    
                    	
                    	<form method="post" id="loginForm" name="loginForm"	enctype="multipart/form-data">
							<input type="hidden" name="msgStr" value="<c:out value="${msg}"/> ">	
							<div class="row">
								<div class="col-md-12">
									<div class="div-vcenter">
										<h1 class="text-center">아이디/비밀번호 찾기</h1>
										<div class="tabs-box">
											<ul class="tabs">
												<li rel="tab1" id="idfind" style="width: 50%;">아이디찾기</li>
												<li rel="tab2" id="passfind" style="width: 50%;">비밀번호찾기</li>
											</ul>
											<div class="tab-container">			
												<div id="tab1" class="tab-content"></div>
												<div id="tab2" class="tab-content"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						
						
					</article>
                </section>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	// https://ggmouse.tistory.com/95
	$(document).ready(function() {

		$("#tab1").load('idfind.do');
			
		$("#idfind").on("click",function(){	 
			$("#tab1").load('idfind.do');
			$("#tab2 *").remove();
		});

		$("#passfind").on("click",function(){	 
			$("#tab2").load('passfind.do');
			$("#tab1 *").remove();
		});
		
	});
</script>

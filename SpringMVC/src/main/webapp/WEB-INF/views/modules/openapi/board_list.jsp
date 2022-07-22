<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/views/include/header.jsp"/>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img02">
            	<div class="bgtitle">
                </div>
            </div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                	<c:import url="/WEB-INF/views/include/content_header.jsp"/>
                	<article>
                        <h2><spring:message code="bbs.title.list"/></h2>
                        <div class="lead">부동산 거래신고에 관한 법률에 따라 신고된 주택의 실거래 자료를 제공합니다.<br>
                        지역코드와 기간을 이용하여 해당기간, 해당지역의 아파트 매매 신고자료를 제공하는 아파트 매매 신고 정보 조회서비스를 이용하실 수 있습니다.</div>
                    </article>
                    <article>                    
                        <div class="row">
                            <div class="col-md-12">
                                <form name="localForm" id="localForm" method="post" enctype="multipart/form-data">
			                        <div class="row">
			                            <div class="col-md-12">
			                            <div class="search-form">
			                                <dl class="dline">
			                                    <dt class="padding">지역선택</dt>
			                                    <dd>
			                                    	<select id="sido_code" name="sido_code" class="w180">
														<option value="">:: 시/도 ::</option>
													</select>
													<select id="sigoon_code" name="sigoon_code" class="w180">
														<option value="">:: 시/군/구 ::</option>
													</select>
													<select id="dong_code" name="dong_code" class="w180">
														<option>:: 읍/면/동 ::</option>
													</select>
													<select id="lee_code" name="lee_code" class="w180">
														<option>:: 리 ::</option>
													</select>
												</dd>
			                                    <dt class="padding">기간선택</dt>
			                                    <dd>	
			                                    	<select id="year" name="year" class="w180">
														<option value="">선택해주세요</option>
													</select>
													<select id="month" name="month" class="w180">
														<option value="">선택해주세요</option>
													</select>
													<select id="day" name="day" class="w180">
														<option value="">선택해주세요</option>
													</select>
													<!-- <input type="search" id="dealymd" name="dealymd" placeholder="ex)202201" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ex)202201'" maxlength="6" oninput="numberMaxLength(this);" title="<spring:message code="button.search"/>" onKeyup="$(this).val($(this).val().replace(/[^0-9]/gi,''));"/> -->
													<input type="button" id="searchbtn" value="<spring:message code="button.inquire"/>" />
			                                    </dd>			                                    
			                                </dl>
			                            </div>
			                            </div>
			                        </div>
                                </form>
                                <div class="articles">
                                	전체글 : <span class="totalNum"></span> 개 | 현재페이지 : <span class="nowpage"></span> | 총페이지 : <span class="totalPage"></span>
                                </div>
                                <form name="listForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.list"/>">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="25%" />
                                                <col width="10%" />
                                                <col width="5%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                            </colgroup>
                                            <thead>
                                                <tr class="tline">                                               	
                                                    <th scope="col"><label><input type="checkbox" class="allCheck" name="allCheck" /></label></th>                                            	
                                                    <th scope="col"><spring:message code="bbs.list.no"/></th>
                                                    <th scope="col">아파트명</th>
                                                    <th scope="col">전용면적(㎡)</th>
                                                    <th scope="col">층</th>
                                                    <th scope="col">건축년도</th>
                                                    <th scope="col">거래금액(만원)</th>
                                                    <th scope="col">거래유형</th>
                                                    <th scope="col">법정동</th>
                                                    <th scope="col">지번</th>
                                                </tr>
                                            </thead>
                                            <tbody id="boardlist">
                                            </tbody>
                                            <div id="iframe"></div>
                                       	</table> 
                                       	<nav class="paging-group">
				                            <ul class="pagination"></ul>
				                        </nav>
                                       	<nav class="btn-group">
											<ul>
											<c:if test="${sessionScope.isAdmin != null}">												
												<li><input type="button" value="<spring:message code="button.allselect"/>" class="btnallCheck"/></li>
												<li><input type="button" value="<spring:message code="button.selectreverse"/>" class="reversalallCheck"/></li>
												<li><input type="button" value="<spring:message code="button.selectcancle"/>" class="unallCheck"/></li>
												<li><input type="button" value="<spring:message code="button.selectdelete"/>" class="checkDeleteBtn"/></li>
											</c:if>	
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='ajaxlist.do'"/></li>
												<li><input type="button" value="<spring:message code="button.create"/>" id="writeBtn"/></li>											
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


<script>
$.support.cors = true;

$(document).ready(function(){
		
	//게시물초기값 설정(page = 1)
	getPageList(1);
	
	//년 셀렉트박스 출력
	appendYear();
	//월 셀렉트 출력
	appendMonth();
	//appendDay();
		
	//초기화설정
	//$('#lee_code').hide();
		
	function getPageList(page) {
			
		var lawdcd = ${lawdcd};
		var dealymd = ${dealymd};
		var perPageNum = 10;
			
		if(dealymd != ""){
	   		url = "${path}/modules/board/openapi/" + page + "/" + perPageNum  + "/" + lawdcd + "/" + dealymd;
	   	} else {
	   		url = "${path}/modules/board/openapi/" + page + "/" + perPageNum;
	   	}	
	    	
	   	//BoardRestController.java 실행 
	   	$.getJSON(url, function(data) {
	    			    		
	   		var str = "";
	   		var totalCount = data.pageMaker.totalCount;
           	var totalPage = data.pageMaker.totalPage;
            	            	
	       	//게시물출력 item수 만큼 반복 출력
	       	var item = data.list;
	       	var page = data.pageMaker.criteria.page;
	         	
	        $(item).each(function(index) {
	            	
	       	var index = index; 
	   		var cumN = data.pageMaker.curNum-index;
       		
      		//item 목록출력
	       	var aptname = item[index].아파트;
	       	var area = item[index].전용면적;
	        var floor = item[index].층;
	        var date = item[index].건축년도;
	        var amount = item[index].거래금액;
	        var category = item[index].거래유형;
	        var roadname = item[index].법정동;
	        var number = item[index].지번;

	        str += "<tr>" + 
	        		"<td width='5%' class='text-center'><label><input type='checkbox' name='check'/></label></td>" + 
	            	"<td width='5%' class='text-center'>" + cumN + "</td>" + 
	            	"<td width='25%'class='text-left'>" + aptname + "</td>" + 
	            	"<td width='10%' class='text-center'>" + area  + "</td>" + 
	            	"<td width='5%' class='text-center'>" + floor + "</td>" + 
	            	"<td width='10%' class='text-center'>" + date + "</td>" + 
	            	"<td width='10%' class='text-center'>" + amount + "</td>" + 
	            	"<td width='10%' class='text-center'>" + category + "</td>" + 
	            	"<td width='10%' class='text-center'>" + roadname  + "</td>" + 
	            	"<td width='10%' class='text-center'>" + number + "</td>" + 
	            	"</tr>";
	        });
	            
	        $(".totalPage").text(totalPage);
	        $(".totalNum").text(totalCount);
	        $(".nowpage").text(page);
	        $("#boardlist").html(str);
				
	        //console.log(data.pageMaker);
	        //페이징처리 
	        printPaging(data.pageMaker);
	    });    			
	}	  	
		
	//시도코드
	$.ajax({
		type: "get",
		url: "https://api.vworld.kr/req/data?key=5638C501-9663-3A53-8DDF-701B190423EE&domain=http://localhost:8090&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
		async: false,
		dataType: 'jsonp',
		success: function(data) {
			let html = "<option value=''>:: 시/도 ::</option>";
			data.response.result.featureCollection.features.forEach(function(f){
				let code = f.properties.ctprvn_cd;
				let nm = f.properties.ctp_kor_nm;
				
				html +="<option value=" + code + ">" + nm + "</option>";	
			})
	        $('#sido_code').html(html);				
		},
		error : function(request, status, error) {
			//서비스 실패 시 처리 할 내용
		   	alert("시도코드 조회서비스 실패");
		}
	});
		
	//시군구코드
	$(document).on("change","#sido_code",function(){
			
		let thisVal = $(this).val();		

		$.ajax({
			type: "get",
			url: "https://api.vworld.kr/req/data?key=5638C501-9663-3A53-8DDF-701B190423EE&domain=http://localhost:8090&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
			data : {attrfilter : 'sig_cd:like:' + thisVal},
			async: false,
			dataType: 'jsonp',
			success: function(data) {
				let html = "<option value=''>:: 시/군/구 ::</option>";
				data.response.result.featureCollection.features.forEach(function(f){
					let code = f.properties.sig_cd;
					let nm = f.properties.sig_kor_nm;
					
					html +="<option value=" + code + ">" + nm + "</option>";							
				})
	            $('#sigoon_code').html(html);					
			},
			error : function(request, status, error) {
				//서비스 실패 시 처리 할 내용
		    	alert("시군구코드 조회서비스 실패");
			}
		});
	});
		
	//읍면동코드
	$(document).on("change","#sigoon_code",function(){ 
			
		let thisVal = $(this).val();		

		$.ajax({
			type: "get",
			url: "https://api.vworld.kr/req/data?key=5638C501-9663-3A53-8DDF-701B190423EE&domain=http://localhost:8090&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
			data : {attrfilter : 'emd_cd:like:' + thisVal},
			async: false,
			dataType: 'jsonp',
			success: function(data) {
				let html = "<option value=''>:: 읍/면/동 ::</option>";
				data.response.result.featureCollection.features.forEach(function(f){
					let code = f.properties.emd_cd;
					let nm = f.properties.emd_kor_nm;
					
					html +="<option value=" + code + ">" + nm + "</option>";						
				})
				
	            $('#dong_code').html(html);
			},
			error : function(request, status, error) {
				//서비스 실패 시 처리 할 내용
		    	alert("읍면동코드 조회서비스 실패");
			}
		});
	});

	//리코드
	$(document).on("change","#dong_code",function(){ 
		
		let thisVal = $(this).val();				
		let selectvalue = $("#dong_code option:selected").text();
		
		//읍면동에서 동선택시 동이 포함되어 있지 않으면 코드 실행
		//includes() 대소문자구분함
		//var arr = ["읍","면"];
		if((selectvalue.includes("읍") || selectvalue.includes("면")) == true){
			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=5638C501-9663-3A53-8DDF-701B190423EE&domain=http://localhost:8090&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADRI_INFO",
				data : {attrfilter : 'li_cd:like:' + thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {				
					let html = "<option value=''>:: 리 ::</option>";				
					data.response.result.featureCollection.features.forEach(function(f){
						let code = f.properties.li_cd;
						let nm = f.properties.li_kor_nm;
									
						html +="<option value=" + code + ">" + nm + "</option>";						
					})
					$('#lee_code').show();
					$('#lee_code').html(html);		
				},
				error : function(request, status, error) {
					//서비스 실패 시 처리 할 내용
			    	alert("리코드 조회서비스 실패");
				}
			});
		}			
	});	
			
	//년출력(2006부터 현재까지)
	function appendYear(){
		var start_year="2006";
		var dt = new Date();
		var today_year = dt.getFullYear();
		
		for(var y = start_year; y <= today_year; y++){
			$('#year').append("<option value=" + y + ">" + y + "년" +"</option>");
		}
	}  
	
	$(document).on("change","#year",function(){ 
		var year = $("#year option:selected").val();		
	});
	
	//달출력(1월부터 12월까지)
	function appendMonth(){
		for(var i = 1; i <= 12; i++){
			//두자리수 변경 01,02,03...12
			var mm = i.toString().length < 2 ? '0' + i : i;
			$('#month').append("<option value=" + mm + ">" + mm + "월" +"</option>");
		}
	}

	$(document).on("change","#month",function(){ 
		var year = $('#year option:selected').val();
		var month = $('#month option:selected').val();
		var lastDate = getLastDay(year,month);
		
		//일출력(1일부터31일까지 윤달 적용)
		$('#day').empty(); //초기화
		$('#day').prepend("<option value='''>선택해주세요"); //초기화
		for(var j = 1; j <= lastDate; j++){
			//두자리수 변경 01,02,03...12
			var dd = j.toString().length < 2 ? '0' + j : j;
			$('#day').append("<option value=" + dd + ">" + dd + "일" +"</option>");
		}		
	});	
		
	//출처: https://link2me.tistory.com/1123 [소소한 일상 및 업무TIP 다루기:티스토리]
	function getLastDay(year,month){			
		if(month==04 || month==06 || month==09 || month==11){
			return 30;
		} else if(month==02){//2월
			if(year%4 == 0){ //2월, 윤년일 경우
				return 29;
			} else { //2월, 윤년이 아닐 경우
			    return 28;
			}
		} else {
			return 31;
		}
	}			
	 
	//검색 클릭시 이벤트 처리
	$("#searchbtn").on("click",function(){			
	//var isValid = $("#localForm").validate().form();			
	//if (isValid == true){ //true 반환 
		var sido = $('#sido_code option:selected').val();
		var lawdcd = $('#sigoon_code option:selected').val();
		   			    
		if($.trim($('#sido_code').val()) == ""){
			alert('시도를 선택해주세요.');
			$('#sido_code').css('border-color','red'); 					
			return false;
		}
		    
		if($.trim($('#sigoon_code').val()) == ""){
			alert('시군구를 선택해주세요.');
			$('#sigoon_code').css('border-color','red');  				
			return false;
		}
		    
		if($.trim($('#year').val()) == ""){
			alert('년도를 선택해주세요.');
			$('#year').css('border-color','red'); 				
			return false;
		}
		    
		if($.trim($('#month').val()) == ""){
			alert('월을 선택해주세요.');
			$('#month').css('border-color','red'); 				
			return false;
		}
		
		if($.trim($('#day').val()) == ""){
			alert('일을 선택해주세요.');
			$('#day').css('border-color','red'); 				
			return false;
		}
		    
		var year = $("#year").val();
		var month = $('#month').val();
		var dealy = year + month;		    
		/*
		if($.trim($("#dealymd").val()) == ""){
			alert('년을 입력해주세요.');
			$("#dealymd").css('border-color','red').focus();
				
			$("#dealymd").focus(function() {
              	$(this).css('border-color','red');
	        })
	        //input창에 입력되면
	        $("#dealymd").keyup(function() {
		       	$(this).css('border-color','');
	        })	               
			return false;
		}
		*/			    
		location.href = "${path}/modules/openapi/openapilist.do?lawdcd=" + lawdcd + "&dealy=" + dealy;
	//} 
	});	
		
	//자바스크립트 체크(6자리만 입력받음)
	function numberMaxLength(e){
		if(e.value.length > e.maxLength){
	    	e.value = e.value.slice(0, e.maxLength);
	    }
	}
		
	//URL링크
	function fn_iframe(url){
	  	$('#iframe').attr('src', url);
	}
	    
	//페이징함수 
	function printPaging(pageMaker) {		
	 	var str = "";
	 	
	   	if (pageMaker.prev) {
	        str += "<li><a href='" + pageMaker.startPage + "'><i class='fa fa-angle-double-left' aria-hidden='true'></i></a></li> ";
	        str += "<li><a href='" + (pageMaker.startPage - 1) + "'><i class='fa fa-angle-left' aria-hidden='true'></i></a></li> ";
	   	}	
	    for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
	        var strClass = pageMaker.criteria.page == i ? 'class=active' : '';
	        str += "<li><a href='" + i + "'" + strClass + ">" + i + "</a></li> ";
	    }	
	  	if (pageMaker.next && pageMaker.endPage > 0) {
	    	str += "<li><a href='" + (pageMaker.endPage + 1) + "'><i class='fa fa-angle-right' aria-hidden='true'></i></a></li> ";
	        str += "<li><a href='" + (pageMaker.totalPage) + "'><i class='fa fa-angle-double-right' aria-hidden='true'></i></a></li> ";
	  	}	
	    $(".pagination").html(str);	
	    //페이징 번호클릭시 처리 
	    var replyPage = 1;	    
	    $(".pagination").on("click", "li a", function(event) {
	    	event.preventDefault();
	        replyPage = $(this).attr("href");
	        getPageList(replyPage);
	    })
	}		
});	
</script>

<c:import url="/WEB-INF/views/include/footer.jsp"/>

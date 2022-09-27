<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/views/include/header.jsp" />
<div id="container-wrap">
	<div class="clearfix">
		<div class="content-box">
			<div class="content-full-img02">
				<div class="bgtitle"></div>
			</div>
			<div class="content-full-bg02-hidden">
				<section class="content">
					<c:import url="/WEB-INF/views/include/content_header.jsp" />
					<article>
						<h2>
							<spring:message code="bbs.title.list" />
						</h2>
						<div class="lead">
							부동산 거래신고에 관한 법률에 따라 신고된 주택의 실거래 자료를 제공합니다.<br> 지역코드와 기간을 이용하여 해당기간, 해당지역의 아파트 매매 신고자료를 제공하는 아파트 매매 신고 정보 조회서비스를 이용하실 수 있습니다.
						</div>
					</article>
					<article>
						<div class="row">
							<div class="col-md-12">
								<form
									name="localForm"
									id="localForm"
									method="post"
									enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-12">
											<div class="search-form">
												<dl class="dline">
													<dt class="padding">조회지역선택</dt>
													<dd>
														<select	id="sido_code" name="sido_code" class="w180">
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
													<dt class="padding">조회기간선택</dt>
													<dd>
														<select id="year" name="year" class="w180">
															<option value="">:: 년 ::</option>
														</select>
														<select id="month" name="month" class="w180">
															<option value="">:: 월 ::</option>
														</select>
														<select id="day" name="day" class="w180">
															<option value="">:: 일 ::</option>
														</select>
														<input type="search" id="dealymd" name="dealymd"
															placeholder="ex)202201" 
															onfocus="this.placeholder = ''"
															onblur="this.placeholder = 'ex)202201'"
															maxlength="6"
															oninput="numberMaxLength(this);"
															title="<spring:message code="button.search"/>"
															onKeyup="$(this).val($(this).val().replace(/[^0-9]/gi,''));" />
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
								<form
									name="listForm"
									method="post"
									enctype="multipart/form-data"
									action="list.do">
									<fieldset>
										<legend>
											<spring:message code="bbs.table.legend" />
										</legend>
										<table
											id="data_list"
											summary="<spring:message code="bbs.table.summary.list"/>">
											<caption>
												<spring:message code="bbs.table.caption" />
											</caption>
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
													<th scope="col"><spring:message code="bbs.list.no" /></th>
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
												<li><input type="button" value="<spring:message code="button.allselect"/>" class="btnallCheck" /></li>
												<li><input type="button" value="<spring:message code="button.selectreverse"/>" class="reversalallCheck" /></li>
												<li><input type="button" value="<spring:message code="button.selectcancle"/>" class="unallCheck" /></li>
												<li><input type="button" value="<spring:message code="button.selectdelete"/>" class="checkDeleteBtn" /></li>
											</c:if>
												<li><input type="button" value="<spring:message code="button.list"/>" onClick="location.href='ajaxlist.do'" /></li>
												<li><input type="button" value="<spring:message code="button.create"/>" id="writeBtn" /></li>
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
	$('#lee_code').hide();
		
	function getPageList(page) {
			
		var lawdcd = ${lawdcd};
		var dealymd = ${dealymd};		
				
		if(dealymd != ""){
	   		url = "${path}/modules/board/openapi/" + page + "/" + lawdcd + "/" + dealymd;
	   	} else {
	   		url = "${path}/modules/board/openapi/" + page;
	   	}			
		
		//BoardRestController.java 실행 
		$.getJSON(url,function(data) {
	    			    		
	   		var str = "";
	   		var totalCount = data.pageMaker.totalCount;
           	var totalPage = data.pageMaker.totalPage;
          	            	
	       	//게시물출력 item수 만큼 반복 출력
	       	var item = data.data;
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
	       	}); //$(item).each() 닫기
	            
	    	$(".totalNum").text(totalCount);
	      	$(".nowpage").text(page);
	      	$(".totalPage").text(totalPage);
	      	// html출력 
	       	//$("#boardlist").html(str);

	       	//페이징처리 
	      	//printPaging(data.pageMaker);	
	       	
		}); //$.getJSON 닫기 
	} //function 닫기  	
	
	//페이징함수 
	function printPaging(pageMaker) {		
	 	var str = "";
	 	
	   	if (pageMaker.prev) {
	        str += "<li><a href='" + 1 + "'><i class='fa fa-angle-double-left' aria-hidden='true'></i></a></li> ";
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
		
	//jquery플러그인 DataTable적용
	$("#data_list").DataTable().destroy();
   	$("#data_list").DataTable({
    	processing: true,
    	//serverSide: true,		            
    	ajax: {
       		type : "GET",
            url : url,
            dataType : "JSON",
            dataSrc: function(res) {
				//console.log('데이터', res)
				var data = res.data;
				// 리스트번호 
				for (let i = 0; i < data.length; i++) {
					data[i].listIndex = i + 1;
				}	
				return data;
			}
        },
        columns:[
          	{data : null},
           	{title:"번호",data: "listIndex"},
           	{title:"아파트명", data : "아파트"},
           	{title:"전용면적(㎡)",data : "전용면적"},
           	{title:"층",data : "층"},
           	{title:"건축년도",data : "건축년도"},
           	{title:"거래금액",data : "거래금액"},
           	{title:"거래유형",data : "거래유형"},
           	{title:"법정동",data : "법정동"},
           	{title:"지번",data : "지번"}
        ],
        "columnDefs": [
        	{//컬럼 순서에 따라 이런식으로 조립을 할 수 있어요.
            	"targets": [0],
                "render": function (data, type, full, meta) {
                return '<input data-member="member_chk" type="checkbox" class="' + data + '" name="member_id[]" value="' + data + '" >';
            	}
            },
        ],
        order:[[1,"desc"]],
        pagingType: 'full_numbers',
        select: true,
       	//검색옵션 유무
       	searching: true,
       	//정렬기능 유무
       	ordering: true,
       	//정보기능 유무
       	info: true,
       	//페이징기능 유무
       	paging: true,
       	//세로스크롤 유무
       	//scrollY: "500px",
        //scrollCollapse: false,
       	//가로스크롤 유무
       	//scrollX: true,
       	//가로자동정렬
       	autoWidth: false,
       	//테이블 재생성
    	destroy : true,
    	//데이터건수 변경
        lengthChange : true,
        //기본 데이터건수
        pageLength : 10,
        //데이터건수옵션 
        lengthMenu: [ [10, 20, 30, 40, 50, -1], [10, 20, 30, 40, 50, "All"] ],
        language: {
        	emptyTable: "데이터가 없습니다.",
            lengthMenu: "페이지당 _MENU_ 개씩 보기",
            info: "현재 _START_ - _END_ / _TOTAL_건",
            infoEmpty: "데이터 없음",
            infoFiltered: "( _MAX_건의 데이터에서 필터링됨 )",
            search: "",
            zeroRecords: "일치하는 데이터가 없습니다.",
            loadingRecords: "로딩중...",
            processing: "잠시만 기다려 주세요.",
            paginate: {
              	next: "다음",
               	previous: "이전",
               	first:"처음",
               	last:"마지막"
            }
        }
    });
   	
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
		$('#day').prepend("<option value='''>:: 일 ::"); //초기화
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
		var sido = $("#sido_code option:selected").val();
		var lawdcd = $("#sigoon_code option:selected").val();
		var yearvalue = $("#year").val();
		   			    
		if($.trim($("#sido_code").val()) == ""){
			alert('시/도를 선택해주세요.');
			$("#sido_code").css('border-color','red'); 		
			$("#sido_code").focus(function() {
              	$(this).css('border-color','');
	        })
			return false;
		}
		    
		if($.trim($("#sigoon_code").val()) == ""){
			alert('시/군/구를 선택해주세요.');
			$("#sigoon_code").css('border-color','red'); 
			$("#sigoon_code").focus(function() {
              	$(this).css('border-color','');
	        })
			return false;
		}
		
		if($.trim($("#dong_code").val()) == ""){
			alert('읍/면/동을 선택해주세요.');
			$("#dong_code").css('border-color','red'); 
			$("#dong_code").focus(function() {
              	$(this).css('border-color','');
	        })
			return false;
		}
		
		if($.trim($("#lee_code").val()) == ""){
			alert('리를 선택해주세요.');
			$("#lee_code").css('border-color','red');  
			$("#lee_code").focus(function() {
              	$(this).css('border-color','');
	        })
			return false;
		}
		if($.trim($("#dealymd").val()) == ""){
			if($.trim($("#year").val()) == ""){
				alert('년을 선택해주세요.');
				$("#year").css('border-color','red'); 	
				$("#year").focus(function() {
	              	$(this).css('border-color','');
		        })
				return false;
			}
			    
			if($.trim($("#month").val()) == ""){
				alert('월을 선택해주세요.');
				$("#month").css('border-color','red'); 	
				$("#month").focus(function() {
	              	$(this).css('border-color','');
		        })
				return false;
			}
			
			if($.trim($("#day").val()) == ""){
				alert('일을 선택해주세요.');
				$("#day").css('border-color','red'); 
				$("#day").focus(function() {
	              	$(this).css('border-color','');
		        })
				return false;
			}
		
		} else {
			if($.trim($("#year").val()) == "" || $.trim($("#month").val()) == "" ){
				
				if($.trim($("#dealymd").val()) == ""){
					alert('년월을 입력해주세요.');
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
			}		
		}
		
		var year = $("#year").val();
		var month = $('#month').val();		
		var dealymd = year + month;

		if ($("#dealymd").val() != ""){ //값이 있으면
			dealymd = $("#dealymd").val();
		} else { //값이 없으면
			dealymd = dealymd;
		}
 				    
		location.href = "${path}/modules/openapi/openapilist.do?lawdcd=" + lawdcd + "&dealymd=" + dealymd;
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
	    
	
});	
</script>

<c:import url="/WEB-INF/views/include/footer.jsp" />

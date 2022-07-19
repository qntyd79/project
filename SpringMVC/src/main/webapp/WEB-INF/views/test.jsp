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
                        <div class="row">
                            <div class="col-md-12">
                                <h2><spring:message code="bbs.title.list"/></h2>
                                <form name="searchForm" id="searchForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <div class="search-form" style="float:right; margin-bottom:10px;">
                                        <fieldset>
                                        	<select id="sido_code">
												<option>선택해주세요</option>
											</select>
											<select id="sigoon_code">
												<option>선택해주세요</option>
											</select>
											<select id="dong_code">
												<option>선택해주세요</option>
											</select>
											<select id="lee_code">
												<option>선택해주세요</option>
											</select>
                                            <input type="button" id="btn" value="<spring:message code="button.search"/>" onclick="$(this.form).submit();" />
                                        </fieldset>
                                    </div>
                                </form>
                                <div class="articles">
                                    	전체글 : <span>${pageMaker.totalCount}</span> 개 | 공지글 : <span>${pageMaker.noticeCount}</span> | 현재페이지 : <span>${pageMaker.criteria.page}</span> | 총페이지 : <span>${pageMaker.totalPage}</span>
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
                                                    <th scope="col">계약일</th>
                                                    <th scope="col">거래금액(만원)</th>
                                                    <th scope="col">거래유형</th>
                                                    <th scope="col">도로명</th>
                                                    <th scope="col">지번</th>
                                                </tr>
                                            </thead>
                                            <tbody id="boardlist">
                                            </tbody>
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
		// 아파트실거래상세정보
		//xml.jsp페이지에서 xml데이터를 읽어와서 출력하기
		var skey = "hiViuwIGjr7rUCTyOmmmvPnPjPcUNSZg6XvXbo2llXpf2xHXAuYWtCREqrOmXIEE5a0McLePjyCHja%2B6FMzQ1Q%3D%3D";
		var url="http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev?LAWD_CD=11110&DEAL_YMD=201512&serviceKey=";
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+ skey;
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10');
		queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent('11110');
		queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('201512');
	   	
		$.ajax({
	   		type : "GET",
			url : url + queryParams,
			dataType : "xml",  
		   	success : function(data){
				// 1. alert창으로 잘 처리되는지 확인
			   	//alert('xml데이터를 읽어오기 성공');
			   	//alert(data); //출력값 [object XMLDocument]
			   
			   	// 2. data안에서 person태그를 찾아서 그안의 데이터 출력 > object라서 접근을 each로 해야함
			   	let tmp = $(data).find('person');
			   	//alert(tmp) //출력값 [object Object]
			   
			   	// 2-1. each로 반복문을 돌린 후 body에 출력
			   	// xml파일에서 불어올 데이터접근 people에 접근할 필요없이 원하는 태그인 person에 바로 접근 가능
			   	$(data).find('person').each(function(){
					let name = $(this).find('name').text();
				 	let gender = $(this).find('gender').text();
					let hobby = $(this).find('hobby').text();
				   
					//3. body에 출력시키기
				   	//$('body').append(name+"/"+gender+"/"+hobby+"<br>");	
					
				   	str += 	"<tr>" + 
        			"<td width='5%' class='text-center'><label><input type='checkbox' name='check' value=" + this.board_idx + "/></label></td>" + 
        			"<td width='5%' class='text-center'>" + mark + "</td>" + 
        			"<td width='10%'class='text-center'>" + this.categoryVO.title +  "</td>" + 
        			"<td width='40%' class='text-left'>" + tab + icon + "<a href='ajaxread.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=" + this.board_idx + "' >" + tab + this.title + hit + "</a></td>" + 
        			"<td width='10%' class='text-center'>" + this.name + "</td>" + 
        			"<td width='10%' class='text-center'>" + formatDate(this.regdate) + "</td>" + 
        			"<td width='5%' class='text-center'>" + this.filecnt + "</td>" + 
        			"<td width='5%' class='text-center'>" + this.vote + "</td>" + 
        			"<td width='5%' class='text-center'>" + this.hit + "</td>" + 
        			"<td width='5%' class='text-center'><a href='ajaxdelete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=" + this.board_idx + "'>삭제</a></td>" +
        			"</tr>";
			   });
			   	
			   $("#boardlist").html(str);
		   	},
		   	error : function(request, status, error) {
				 // 서비스 실패 시 처리 할 내용
		    	alert("아파트 실거래 상세조회 서비스 실패");
			} 
  		});
		
		// 시도코드
		var skey = "hiViuwIGjr7rUCTyOmmmvPnPjPcUNSZg6XvXbo2llXpf2xHXAuYWtCREqrOmXIEE5a0McLePjyCHja%2B6FMzQ1Q%3D%3D";
		var url = 'http://apis.data.go.kr/1741000/StanReginCd/getStanReginCdList';
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+ skey;
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('3');
		queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');
		queryParams += '&' + encodeURIComponent('locatadd_nm') + '=' + encodeURIComponent('서울특별시');
		
		$.ajax({
			type: "get",
			url: url + queryParams,
			async: false,
			dataType: 'json',
			success: function(data) {
				let html = "<option>선택해주세요</option>";
				$(data).find('sido_cd').each(function(){					
					let code = $(this).find('sido_cd').text();
					alert(code);
					let nm = $(this).find('locatadd_nm').text();
					
					html +="<option value=" + code + ">" + nm + "</option>"	
				})
				
	            $('#sido_code').html(html);				
			},
			error : function(request, status, error) {
				 // 서비스 실패 시 처리 할 내용
		    	alert("시도코드 조회서비스 실패");
			}
		});
		
		// 시군구코드
		$(document).on("change","#sido_code",function(){
			
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=5638C501-9663-3A53-8DDF-701B190423EE&domain=http://localhost:8090&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
				data : {attrfilter : 'sig_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택해주세요</option>";
					data.response.result.featureCollection.features.forEach(function(f){
						console.log(f.properties)
						let code = f.properties.sig_cd;
						let nm = f.properties.sig_kor_nm;
						
						html +="<option value=" + code + ">" + nm + "</option>"							
					})
		            $('#sigoon_code').html(html);					
				},
				error : function(request, status, error) {
					 // 서비스 실패 시 처리 할 내용
			    	alert("서비스 실패");
				}
			});
		});
		
		// 읍면동코드
		$(document).on("change","#sigoon_code",function(){ 
			
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=5638C501-9663-3A53-8DDF-701B190423EE&domain=http://localhost:8090&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
				data : {attrfilter : 'emd_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택해주세요</option>";
					data.response.result.featureCollection.features.forEach(function(f){
						console.log(f.properties)
						let code = f.properties.emd_cd;
						let nm = f.properties.emd_kor_nm;
						
						html +="<option value=" + code + ">" + nm + "</option>"							
					})
		            $('#dong_code').html(html);					
				},
				error : function(request, status, error) {
					 // 서비스 실패 시 처리 할 내용
			    	alert("서비스 실패");
				}
			});

		});

		// 리코드
		$(document).on("change","#dong_code",function(){ 
			
			let thisVal = $(this).val();	
			
			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=5638C501-9663-3A53-8DDF-701B190423EE&domain=http://localhost:8090&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADRI_INFO",
				data : {attrfilter : 'li_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {				
					let html = "<option>선택해주세요</option>";				
					data.response.result.featureCollection.features.forEach(function(f){
						console.log(f.properties)
						let code = f.properties.li_cd;
						let nm = f.properties.li_kor_nm;
									
						html +="<option value=" + code + ">" + nm + "</option>"							
					})
					$('#lee_code').html(html);						
				},
				error : function(request, status, error) {
					 // 서비스 실패 시 처리 할 내용
			    	alert("서비스 실패");
				}
			});
		});	
		
		// 검색 클릭시 이벤트 처리
		$(document).on("click","#btn",function(){ 
			var sido = $('#sido_code option:selected').val();
		    var sigugun = $('#sigoon_code option:selected').val();
		    var dong = $('#dong_code option:selected').val();
		    var dongCode = sido + sigugun + dong + '00';
		    
			// 동네예보 URL
		    var url = 'https://www.weather.go.kr/weather/process/timeseries-dfs-body-ajax.jsp?myPointCode=' + dongCode + '&unit=K';
	
		    // iframe으로 결과 보기
		    fn_iframe(url);
		});	
	   	    
	    function fn_iframe(url){
	    	$('#iframe').attr('src', url);
	    }
		
	})
	
</script>
<c:import url="/WEB-INF/views/include/footer.jsp"/>

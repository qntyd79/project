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
                	<c:import url="/WEB-INF/views/include/content_header.jsp"/>
                </div>
            </div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                  	<c:import url="/WEB-INF/views/include/content_header.jsp"/>
                	<div id="formcontent"></div>
                    <article id="ajaxlistform">                    
                        <div class="row">
                            <div class="col-md-12">
                            
                            
                                <h2><spring:message code="bbs.title.list"/></h2>
                                <form name="searchForm" id="searchForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <div class="search-form" style="float:right; margin-bottom:10px;">
                                        <fieldset>
                                            <select id="searchField" name="searchField" title="<spring:message code="select.searchCondition"/>">
                                                <option value="n" <c:out value="${criteria.searchField == null ? 'selected' : ''}" />>선택해주세요</option>
                                                <option value="t" <c:out value="${criteria.searchField eq 't' ? 'selected' : ''}" />>제목</option>
                                                <option value="c" <c:out value="${criteria.searchField eq 'c' ? 'selected' : ''}" />>내용</option>
                                                <option value="w" <c:out value="${criteria.searchField eq 'w' ? 'selected' : ''}" />>작성자</option>
                                                <option value="tc" <c:out value="${criteria.searchField eq 'tc' ? 'selected' : ''}" />>제목+내용</option>
                                                <option value="cw" <c:out value="${criteria.searchField eq 'cw' ? 'selected' : ''}" />>내용+작성자</option>
                                                <option value="tcw" <c:out value="${criteria.searchField eq 'tcw' ? 'selected' : ''}" />>제목+내용+작성자</option>
                                            </select>
                                            <input type="search" id="keyWord" name="keyWord" value="<c:out value="${criteria.keyWord}"/>" title="<spring:message code="button.search"/>" />
                                            <input type="button" value="<spring:message code="button.search"/>" onclick="$(this.form).submit();" />
                                            <input type="button" value="<spring:message code="button.init"/>" onClick="window.location='list.do'" />
                                        </fieldset>
                                    </div>
                                </form>
                                <form name="categoryForm" id="categoryForm" method="post" enctype="multipart/form-data" action="list.do">
                                    <div class="category-form" style="float:right; margin-right:5px; margin-bottom:10px;">
                                        <fieldset>
                                            <select name="category_idx" id="category_idx" form="categoryForm" onChange="$(this.form).submit();">
                                                <option value="0" <c:if test="${categoryselect == 0}"><c:out value="selected=selected" /></c:if>>전체목록</option>
                                                <c:forEach var="item" items="${categorylist}" varStatus="status">
                                                    <option value="<c:out value=" ${item.category_idx}" />" <c:if test="${item.category_idx == categoryselect}">
                                                        <c:out value="selected=selected" />
                                                    </c:if>>
                                                    <c:out value="${item.title}" />
                                                    </option>
                                                </c:forEach>
                                            </select>
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
                                       
                                                <col width="10%" />
                                                <col width="40%" />
                                                <col width="10%" />
                                                <col width="10%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                                <col width="5%" />
                                   
                                                <col width="5%" />
                                           
                                            </colgroup>
                                            <thead>
                                                <tr class="tline">
                                               	
                                                    <th scope="col"><label><input type="checkbox" class="allCheck" name="allCheck" /></label></th>
                                            	
                                                    <th scope="col"><spring:message code="bbs.list.no"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.catetory_idx"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.title"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.name"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.regdate"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.file"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.vote"/></th>
                                                    <th scope="col"><spring:message code="bbs.list.hit"/></th>
                                               
                                                    <th scope="col"><spring:message code="bbs.list.del"/></th>
                                                  
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

<c:import url="/WEB-INF/views/include/footer.jsp"/>

<script type="text/javascript">
	$(document).ready(function() {
		
		//게시판등록    	
		$("#writeBtn").on("click",function(){
			//ajax
			$.ajax({
				type: "GET",
				url: "${path}/modules/board/ajaxwrite.do",	
				dataType: "text",
				success: function(result) {
				    //서비스 성공 시 처리 할 내용
				    if (result == "insertSuccess") {
				      	alert("게시글등록폼 완료");
				    } 
				    
				    $('#ajaxlistform').remove();
				    $('#formcontent').html(result);
				    
				},
				error : function(request, status, error) {
					 // 서비스 실패 시 처리 할 내용
			    	alert("게시글등록폼 이동 실패");
				}
			}); //ajax종료 	
				
			return false;
			
			location.reload();
		});
		
		// 게시물초기값 설정(page = 1)
		getPageList(1);
		
	  	// 게시물목록페이징
	    function getPageList(page) {
	
	    	$.getJSON("${path}/modules/board/ajaxlist/" + page , function(data) {
	    		
	    		var str = "";
	    		var categoryname="";
	    		var category="";
	    		
               	// 공지게시물출력
	            $(data.noticelist).each(function() {
	            	
					var depth = this.depth;
					var category = this.category_idx;
	            	
	            	if (depth > 0) {
		               var icon = "<i class='fas fa-angle-double-right'>&nbsp;";
		            } else {
		            	var icon = "";
		            }
	            	 
	            	if (depth > 0) {
	            		for (var i = 0; i <= depth; i++) {
	                    	var tab ="<span>&nbsp;</span>";
	            		}
	            	} else {
	            		var tab ="";
	            	}
	            	 
	            	if (this.hit >= 100) {
	            		var hit ="<span class='hit'>HIT</span>";
	            	} else {
	            		var hit = "";
	            	}
	            	
	            	if (this.notice > 0){
	            		var mark = "<span><spring:message code='bbs.list.notice'/></span>";
	            	} else {
	            		var index = index; //3번방법
	            		// 전체게시물수 - (페이지당 레코드 수 * (현재페이지수-1)) nowPage의 초기값이 1일때 -1을 해준다.
	            		var cum = ${pageMaker.totalCount} - (10 * (page-1));
	               		var cumN = (cum-index) - ${pageMaker.noticeCount};
	            	}
	            	
	             	// 카테고리 출력
		    		$(data.categoryname).each(function() {
		    			for (var i = 0; i <= this.category_idx; i++) {
	    					if(this.category_idx == category){
								categoryname = this.title;
		            		}
		        		}
		    		});   
                
	            	str += 	"<tr>" + 
	            			"<td width='5%' class='text-center'><label><input type='checkbox' name='check' value=" + this.board_idx + "/></label></td>" + 
	            			"<td width='5%' class='text-center'>" + mark + "</td>" + 
	            			"<td width='10%'class='text-center'>" + categoryname + "</td>" + 
	            			"<td width='40%' class='text-left'>" + tab + icon + "<a href='ajaxread.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=" + this.board_idx + "' >" + tab + this.title + hit + "</a></td>" + 
	            			"<td width='10%' class='text-center'>" + this.name + "</td>" + 
	            			"<td width='10%' class='text-center'>" + formatDate(this.regdate) + "</td>" + 
	            			"<td width='5%' class='text-center'>" + this.filecnt + "</td>" + 
	            			"<td width='5%' class='text-center'>" + this.vote + "</td>" + 
	            			"<td width='5%' class='text-center'>" + this.hit + "</td>" + 
	            			"<td width='5%' class='text-center'><a href='ajaxdelete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=" + this.board_idx + "'>삭제</a></td>" +
	            			"</tr>";
	            });
               	
	          	//게시물출력
	            $(data.list).each(function(index) {
	            	
					var depth = this.depth;
					var category = this.category_idx;
	            	
	            	if (depth > 0) {
		               var icon = "<i class='fas fa-angle-double-right'>&nbsp;";
		            } else {
		            	var icon = "";
		            }
	            	 
	            	if (depth > 0) {
	            		for (var i = 0; i <= depth; i++) {
	                    	var tab ="<span>&nbsp;</span>";
	            		}
	            	} else {
	            		var tab ="";
	            	}
	            	 
	            	if (this.hit >= 100) {
	            		var hit ="<span class='hit'>HIT</span>";
	            	} else {
	            		var hit = "";
	            	}
	            	
	            	if (this.notice > 0){
	            		var mark = "<spring:message code='bbs.list.notice'/></span>";
	            	} else {
	            		var index = index; //3번방법
	            		// 전체게시물수 - (페이지당 레코드 수 * (현재페이지수-1)) nowPage의 초기값이 1일때 -1을 해준다.
	            		var cum = ${pageMaker.totalCount} - (10 * (page-1));
	               		var cumN = (cum-index) - ${pageMaker.noticeCount};
	            	}	            	
	            	
	             	// 카테고리 출력
		    		$(data.categoryname).each(function() {
		    			
		    			for (var i = 0; i <= this.category_idx; i++) {
	    					if(this.category_idx == category){
								categoryname = this.title;
		            		}
		        		}
		    		});   
	            	
	            	str += "<tr>" + 
	            			"<td width='5%' class='text-center'><label><input type='checkbox' name='check' value=" + this.board_idx + "/></label></td>" + 
	            			"<td width='5%' class='text-center'>" + cumN + "</td>" + 
	            			"<td width='10%'class='text-center'>" + categoryname + "</td>" + 
	            			"<td width='40%' class='text-left'>" + tab + icon + "<a href='ajaxread.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=" + this.board_idx + "' >" + tab + this.title + hit + "</a></td>" + 
	            			"<td width='10%' class='text-center'>" + this.name + "</td>" + 
	            			"<td width='10%' class='text-center'>" + formatDate(this.regdate) + "</td>" + 
	            			"<td width='5%' class='text-center'>" + this.filecnt + "</td>" + 
	            			"<td width='5%' class='text-center'>" + this.vote + "</td>" + 
	            			"<td width='5%' class='text-center'>" + this.hit + "</td>" + 
	            			"<td width='5%' class='text-center'><a href='delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&board_idx=" + this.board_idx + "'>삭제</a></td>";
	            			"</tr>";
	            });
	            
	            $("#boardlist").html(str);
            	
            	// 페이징처리 
	            printPaging(data.pageMaker);
	        });
    			
	    }
	  	  	
	  
	  	// 날짜변경포맷
	    function formatDate(date) {
	        var d = new Date(date),
	            month = '' + (d.getMonth() + 1),
	            day = '' + d.getDate(),
	            year = d.getFullYear();

	        if (month.length < 2) 
	            month = '0' + month;
	        if (day.length < 2) 
	            day = '0' + day;

	        return [year, month, day].join('-');
	    }
	    
	
	    //페이징함수 
	    function printPaging(pageMaker) {
	
	        var str = "";
	
	        if (pageMaker.prev) {
	            str += "<li><a href='" + (pageMaker.page) + "'><i class='fa fa-angle-double-left' aria-hidden='true'></i></a></li>";
	            str += "<li><a href='" + (pageMaker.startPage - 1) + "'><i class='fa fa-angle-left' aria-hidden='true'></i></a></li>";
	        }
	
	        for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
	            var strClass = pageMaker.criteria.page == i ? 'class=active' : '';
	            str += "<li><a href='" + i + "' " + strClass + ">" + i + "</a></li> ";
	        }
	
	        if (pageMaker.next && pageMaker.endPage > 0) {
	            str += "<li><a href='" + (pageMaker.endPage + 1) + "'><i class='fa fa-angle-right' aria-hidden='true'></i></a></li>";
	            str += "<li><a href='" + (pageMaker.totalPage) + "'><i class='fa fa-angle-double-right' aria-hidden='true'></i></a></li>";
	        }
	
	        $(".pagination").html(str);
	
	        //페이징 번호클릭시 처리 
	        var replyPage = 1;
	
	        $(".pagination").on("click", "li a", function(event) {
	            event.preventDefault();
	            replyPage = $(this).attr("href");
	            getPageList(replyPage);
	        });
	    }

});

</script>
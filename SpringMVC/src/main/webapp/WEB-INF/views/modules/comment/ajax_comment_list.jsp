<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="commentVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script src="<c:url value="/resources/js/my_jquery.js"/>" type="text/javascript" charset="UTF-8"></script>  
<!-- 
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img02"></div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                	-->
                	<!-- 글작성폼 및 목록 시작 -->
                    <article>  
                        <div class="row">
                            <div class="col-md-12">                            
                            
                               <h2>Comment<!--<spring:message code="bbs.title.write"/>--></h2>
                               <form method="post" id="writeForm" name="writeForm" >
                                    <fieldset>
                                        <legend><spring:message code="bbs.table.legend"/></legend>
                                        <table summary="<spring:message code="bbs.table.summary.write"/>" class="board_detail">
                                            <caption><spring:message code="bbs.table.caption"/></caption>
                                            <colgroup>
                                                <col width="20%" />
                                                <col width="30%" />
                                                <col width="20%" />
                                                <col width="30%" />
                                            </colgroup>
                                            <tbody>
                                            	<tr>
                                                    <th><label for="userid"><spring:message code="label.userid"/></label></th>
                                                    <td class="text-left"><input name="userid" id="userid" type="text" placeholder="UserID" class="wfull"/> <form:errors path="userid" /></td>
                                                    <th><label for="pass"><spring:message code="label.pass"/></label></th>
                                                    <td class="text-left"><input name="pass" id="pass" type="password" placeholder="Password" class="wfull"/> <form:errors path="pass" /> </td>
                                                </tr>
                                                <tr>
                                                    <th><label for="name"><spring:message code="label.name"/></label></th>
                                                    <td class="text-left"><input name="name" id="name" type="text"  placeholder="Name" class="wfull"/> <form:errors path="name" /></td>
                                                    <th><label for="email"><spring:message code="label.email"/></label></th>
                                                    <td class="text-left"><input name="email" id="email" type="text" placeholder="Email" class="wfull"/> <form:errors path="email" /></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="10" class="text-left">
                                                        <textarea name="content" id="content" placeholder="Content"></textarea><form:errors path="content"/>
                                                        <script>
                                                            CKEDITOR.replace('content',{
                                                            	height:150,
                                                            	toolbarGroups : [
                                                            		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
                                                            		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
                                                            		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
                                                            		{ name: 'forms', groups: [ 'forms' ] },
                                                            		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
                                                            		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
                                                            		{ name: 'links', groups: [ 'links' ] },
                                                            		{ name: 'insert', groups: [ 'insert' ] },
                                                            		{ name: 'styles', groups: [ 'styles' ] },
                                                            		{ name: 'colors', groups: [ 'colors' ] },
                                                            		{ name: 'tools', groups: [ 'tools' ] },
                                                            		{ name: 'others', groups: [ 'others' ] },
                                                            		{ name: 'about', groups: [ 'about' ] }
                                                            	],
                                                            	
                                                            	removeButtons : 'Source,Save,NewPage,ExportPdf,Preview,Print,Templates,Find,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Replace,PasteText,PasteFromWord,Image,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,CopyFormatting,RemoveFormat,Blockquote,CreateDiv,JustifyLeft,JustifyCenter,JustifyRight,JustifyBlock,BidiLtr,BidiRtl,Language,Styles,TextColor,BGColor,ShowBlocks,Maximize,Format,Font,FontSize'
                                                            });
                                                        </script>
                                                     </td>
                                                </tr>                                               
                                                <tr>
                                                    <th><label for="code"><spring:message code="label.code"/></label></th>
                                                    <td colspan="3" class="text-left">
                                                        <img id="captchaImg" src="${path}/modules/comment/captchaImg.do" />
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
												<li><input type="button" value="<spring:message code="button.create"/>" id="writeBtn"/></li>												
											</ul>
										</nav>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                        
                        <div id="replies"></div>
                        <nav class="paging-group">
                            <ul class="pagination"></ul>
                        </nav>
                    </article>
                    <!-- 글작성폼 및 목록 종료 -->
                    <!--
                </section>
            </div>
        </div>
    </div>
</div>
-->


<script type="text/javascript">
	$(document).ready(function() {
	
	    var board_idx = ${board_idx};
	
	    //초기화
	    getPageList(1);
	
	    //댓글목록
	    function getCommentList() {
	
	        $.getJSON("${path}/modules/comment/ajaxlist/all/" + board_idx, function(data) {
	
	            var str = "";
	
	            $(data).each(function() {
	                str += "<div class='row'>" +
	                    "<div class='col-sm-12 col-md-12 col-lg-12'>" +
	                    "<ul class='content-data-1'>" +
	                    "<li data-rno='" + this.comment_idx + "'>" +
	                    "<div class='text-left'>" +
	                    "<h1 class='title'><p class='modifyname' style='font-weight:400;'>" + this.name + "</p></h1>" +
	                    "<div class='modifycontent'>" + this.content + "</div>" +
	                    "<h3 class='desc text-left' style='padding-top:20px;'>" + this.regdate + "</h3>" +
	                    "<input type='button' value='수정하기' class='modal-open-btn'> " +
	                    "<input type='button' value='삭제하기' id='deleteBtn'> " +
	                    "<input type='button' value='댓글달기' id='replyBtn'>" +
	                    "</div>" +
	                    "</li>" +
	                    "</ul>" +
	                    "</div>" +
	                    "</div>" +
	                    "<hr>";
	            });
	
	            $("#replies").html(str);
	
	        });
	    }
	
	    //댓글목록페이징
	    function getPageList(page) {
	
	        $.getJSON("${path}/modules/comment/ajaxlist/" + board_idx + "/" + page, function(data) {
	
	            var str = "";
	
	            $(data.list).each(function() {
	
	                if (this.depth > 0) {
	                    var icon = "<i class='fas fa-comment-alt'></i>&nbsp;";
	                } else {
	                    var icon = "";
	                }

	                str += "<div class='row'>" +
	                    "<div class='col-sm-12 col-md-12 col-lg-12'>" +
	                    "<ul class='content-data-1'>" +
	                    "<li data-rno='" + this.comment_idx + "'>" +
	                    "<div class='text-left'>" +
	                    "<h1 class='title'><p class='modifyname' style='font-weight:400;'>" + icon + this.name + "</p></h1>" +
	                    "<div class='modifycontent'>" + this.content + "</div>" +
	                    "<h3 class='desc text-left' style='padding-top:20px;'>" + this.regdate + "</h3>" +
	                    "<input type='button' value='수정하기' id='modifyBtn'> " +
	                    "<input type='button' value='삭제하기' id='deleteBtn'> " +
	                    "<input type='button' value='댓글달기' id='replyBtn'>" +
	                    "</div>" +
	                    "</li>" +
	                    "</ul>" +
	                    "</div>" +
	                    "</div>" +
	                    "<hr>";
	            });
	
	            $("#replies").html(str);
	
	            //페이징 
	            printPaging(data.pageMaker);
	
	        });
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
		
		//댓글등록    	
		$("#writeBtn").on("click",function(){

			var board_idx = ${board_idx};
			
			var isValid = $("#writeForm").validate().form();
			
			if (isValid == true){ //true 반환 
	    		
	   			CKupdate();
				    
			    //화면입력값 변수처리
			    var userid = $("#userid").val();
			    var pass = $("#pass").val();
			    var name = $("#name").val();
			    var email = $("#email").val();
			    var content = $("#content").val();
					
					//ajax
				    $.ajax({
				    	type: "POST",
				        url: "${path}/modules/comment/ajaxInsert",
				        headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
				        dataType: "text",
				        data: JSON.stringify({ // stringify는 json개체를 string개체로 변환
				        userid: userid,
				        pass: pass,
				        name: name,
				        email: email,
				        content: content,
				        board_idx: board_idx
				    }),
				    success: function(result1) {
					    //서비스 성공 시 처리 할 내용
					    if (result1 == "insertSuccess") {
					      	alert("댓글등록 완료");
					    }
					    //댓글목록출력
					    getPageList(1);
	
					    //댓글입력폼 초기화
					    $("#userid").val("");
					    $("#pass").val("");
					    $("#name").val("");
					    $("#email").val("");
					    $("#answer").val("");           
					    CKreset(); 
	
				    },
				    error: function(request, status, error) {
				        // 서비스 실패 시 처리 할 내용
				    	alert("댓글등록 실패");
				    }
				}); //ajax종료 	
	
				return false;
		   } 
	
		});

		 //댓글목록에서 수정하기 버튼 클릭시 - window.open실행 
		$("#replies").on("click", "#modifyBtn", function() {
	    	//화면입력값 변수처리
	        var comment = $(this).parent().parent();
	        var comment_idx = comment.attr("data-rno");
	    	//console.log(comment_idx);
			openModify(comment_idx);
	    });
	    
	    function openModify(val) {	
		    var comment_idx = val;    	 
	        var _width = '910';
	        var _height = '550';
	     
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var _left = Math.ceil(( window.screen.width - _width )/2);
	        var _top = Math.ceil(( window.screen.height - _height )/2); 
	     
	        window.open('/modules/comment/ajaxmodify.do?comment_idx=' + comment_idx + '', '댓글수정', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top +', location=no, resizable=no' );
	    }
	
	    //댓글목록에서 수정하기 버튼 클릭시 - 모달창 실행 
	    /*
	    $("#replies").on("click", "#modifyBtn", function() {
			
	        // 모달창 뛰우기 
	        $('.modal-box').addClass('modal-on');
	        $('.modal-back').addClass('back-on');
	        $('body').addClass('body-lock');
	
	        var comment = $(this).parent().parent();
	        var comment_idx = comment.attr("data-rno");
	
	        //ajax통신
	        $.ajax({
	            type: "GET",
	            url: "${path}/modules/comment/ajaxlist/read/" + comment_idx,
	            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "GET" },
	            dataType: "json",
	            success: function(result) {	
	                //서비스 성공 시 처리 할 내용                  
	                $("#replycomment_idx").val(result.comment_idx);
	                $("#replyuserid").val(result.userid);
	                $("#replypass").val(result.pass);
	                $("#replyname").val(result.name);
	                $("#replyemail").val(result.email);
	                var html = $("#replyeditor").val(result.content);
	                CKEDITOR.instances['replyeditor'].setData(html);
	            },
	            error: function(request, status, error) {	
	                //서비스 실패 시 처리 할 내용              
	                alert("댓글보기 실패");
	            }
	        });
	    });
	    */
	
	    //모달창에서 수정버튼 클릭시 수정 처리 
	    $("#modifyBtn").on("click", function() {
	    	    	
	    	var isValid = $("#writeForm").validate().form();
			
			if (isValid == true){ //true 반환
				
		        CKupdate();
		
		        //화면입력값 변수처리
		        var comment_idx = $("#comment_idx").val();
		        var email = $("#email").val();
		        var content = $("#content").val();
		
		        //ajax통신
		        $.ajax({
		            type: "PUT",
		            url: "${path}/modules/comment/ajaxlist/modify/" + comment_idx,
		            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "PUT" },
		            dataType: "text",
		            data: JSON.stringify({ //stringify는 json개체를 string개체로 변환
		                comment_idx: comment_idx,
		                email: email,
		                content: content
		            }),
		            success: function(result) {		
		                //서비스 성공 시 처리 할 내용
		                if (result == "modifySuccess") {
		                    alert("댓글수정 완료");
		                    $('.modal-box').removeClass('modal-on');
		                    $('.modal-back').removeClass('back-on');
		                    $('body').removeClass('body-lock');
		                }		
		                //댓글목록출력
		                getPageList(1);
		            },
		            error: function(request, status, error) {	
		                //서비스 실패 시 처리 할 내용
		                alert("댓글수정 실패");
		            }
		        });
		        
	        	return false;
			} 
	    });
	
	    //댓글목록에서 삭제버튼 클릭 시 삭제처리  
	    $("#replies").on("click", "#deleteBtn", function() {
	
	        //화면입력값 변수처리
	        var comment = $(this).parent().parent();
	        var comment_idx = comment.attr("data-rno");
	
	        //ajax 통신
	        $.ajax({
	            type: "DELETE",
	            url: "${path}/modules/comment/ajaxlist/delete/" + comment_idx,
	            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "DELETE" },
	            dataType: "text",
	            data: JSON.stringify({
	                comment_idx: comment_idx
	            }),
	            success: function(result) {	
	                //서비스 성공 시 처리 할 내용
	                if (result == "deleteSuccess") {
	                    alert("댓글삭제 완료");
	                }	
	                //댓글목록출력
	                getPageList(1);
	            },
	            error: function(request, status, error) {	
	                // 서비스 실패 시 처리 할 내용
	                alert("댓글삭제 실패");
	            }
	        });
	    });

	  	//댓글목록에서 답글하기 버튼 클릭시 답글등록창 실행 - window.open 실행 
	    $("#replies").on("click", "#replyBtn", function() {
	    	//화면입력값 변수처리
	        var comment = $(this).parent().parent();
	        var comment_idx = comment.attr("data-rno");
	    	//console.log(comment_idx);
			openReply(comment_idx);
	    });
	    
	    function openReply(val) {	
		    var comment_idx = val;    	 
	        var _width = '910';
	        var _height = '550';
	     
	        // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	        var _left = Math.ceil(( window.screen.width - _width )/2);
	        var _top = Math.ceil(( window.screen.height - _height )/2); 
	     
	        window.open('/modules/comment/ajaxreply.do?comment_idx=' + comment_idx + '', '답글등록', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top +', location=no, resizable=no' );    
	    }
	    
	    //댓글목록에서 답글하기 버튼 클릭시 답글등록창 실행 - 모달창 실행 
	   	/*
	    $("#replies").on("click", "#replyBtn", function() {
	    	
	        // 모달창 뛰우기 
	        $('.modal-box').addClass('modal-on');
	        $('.modal-back').addClass('back-on');
	        $('body').addClass('body-lock');
	
	        var comment = $(this).parent().parent();
	        var comment_idx = comment.attr("data-rno");
	
	        //ajax통신
	        $.ajax({
	            type: "GET",
	            url: "${path}/modules/comment/ajaxlist/read/" + comment_idx,
	            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "GET" },
	            dataType: "json",
	            success: function(result) {
	
	                //서비스 성공 시 처리 할 내용                  
	                $("#replycomment_idx").val(result.comment_idx);
	                $("#replyparent").val(result.parent);
	                $("#replydepth").val(result.depth);
	                $("#replysortno").val(result.sortno);
	            },
	            error: function(request, status, error) {
	
	                //서비스 실패 시 처리 할 내용              
	                alert("댓글보기 실패");
	            }
	        });
	    });
	    */	  	
	
	    //모달창에서 답글버튼 클릭 시 답글등록 처리  
	    $("#replyBtn").on("click", function() {

	    	var board_idx = ${board_idx};
	    	
	        CKupdate();
	
	        //화면입력값 변수처리
	        var comment_idx = $("#replycomment_idx").val();
	        var parent = $("#replyparent").val();
	        var depth = $("#replydepth").val();
	        var sortno = $("#replysortno").val();
	        var userid = $("#replyuserid").val();
	        var pass = $("#replypass").val();
	        var name = $("#replyname").val();
	        var email = $("#replyemail").val();
	        var content = $("#replyeditor").val();
	
	        //ajax
	        $.ajax({
	            type: "POST",
	            url: "ajaxInsert",
	            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
	            dataType: "text",
	            data: JSON.stringify({ // stringify는 json개체를 string개체로 변환
	                comment_idx: comment_idx,
	                parent: parent,
	                depth: depth,
	                sortno: sortno,
	                userid: userid,
	                pass: pass,
	                name: name,
	                email: email,
	                content: content,
	                board_idx: board_idx
	            }),
	            success: function(result) {
	
	                //서비스 성공 시 처리 할 내용
	                if (result == "insertSuccess") {
	                    alert("답글등록 완료");
	                    $('.modal-box').removeClass('modal-on');
	                    $('.modal-back').removeClass('back-on');
	                    $('body').removeClass('body-lock');
	                }
	
	                //댓글목록출력
	                getPageList(1);
	
	                //화면입력폼 초기화 
	                $("#replyuserid").val("");
	                $("#replypass").val("");
	                $("#replyname").val("");
	                $("#replyemail").val("");
	                
	                CKreset();
	            },
	            error: function(request, status, error) {
	
	                // 서비스 실패 시 처리 할 내용
	                alert("댓글등록 실패");
	            }
	        });
	    });
	
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
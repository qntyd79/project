<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<validator:javascript formName="commentVO" staticJavascript="false" xhtml="true" cdata="false"/>

<c:import url="/WEB-INF/views/include/head.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-bg02-hidden">
                <section class="content"  style="width:900px;">
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                            
                            
                               <h2><spring:message code="bbs.title.reply"/></h2>
                               <form method="post" id="writeForm" name="writeForm" >
                               <input type="hidden" id="comment_idx" name="comment_idx" value="<c:out value="${commentVO.comment_idx}"/>"/>
			                   <input type="hidden" id="parent" name="parent" value="<c:out value="${commentVO.parent}"/>"/>
			                   <input type="hidden" id="depth" name="depth" value="<c:out value="${commentVO.depth}"/>"/>
			                   <input type="hidden" id="sortno" name="sortno" value="<c:out value="${commentVO.sortno}"/>"/>
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
                                                            	
                                                            	removeButtons : 'Source,Save,NewPage,ExportPdf,Preview,Print,Templates,Find,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Replace,PasteText,PasteFromWord,Image,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,CopyFormatting,RemoveFormat,Blockquote,CreateDiv,JustifyLeft,JustifyCenter,JustifyRight,JustifyBlock,BidiLtr,BidiRtl,Language,Styles,TextColor,BGColor,ShowBlocks,Maximize,Format,Font,FontSize',
                                                            	removePlugins : "exportpdf"
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
												<li><input type="button" value="<spring:message code="button.create"/>" id="replyBtn"/></li>												
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

<script type="text/javascript">
	$(document).ready(function() {		    
	
	    //???????????? 
	    $("#replyBtn").on("click", function() {

	    	var isValid = $("#writeForm").validate().form();
			
			if (isValid == true){ //true ?????? 
	
		        CKupdate();
		
		        //??????????????? ????????????
		        var comment_idx = $("#comment_idx").val();
		        var parent = $("#parent").val();
		        var depth = $("#depth").val();
		        var sortno = $("#sortno").val();
		        var userid = $("#userid").val();
		        var pass = $("#pass").val();
		        var name = $("#name").val();
		        var email = $("#email").val();
		        var content = $("#content").val();
		
		        //ajax
		        $.ajax({
		            type: "POST",
		            url: "ajaxInsert",
		            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
		            dataType: "text",
		            data: JSON.stringify({ // stringify??? json????????? string????????? ??????
		                comment_idx: comment_idx,
		                parent: parent,
		                depth: depth,
		                sortno: sortno,
		                userid: userid,
		                pass: pass,
		                name: name,
		                email: email,
		                content: content,
		                board_idx: 1
		            }),
		            success: function(result) {	
		                //????????? ?????? ??? ?????? ??? ??????
		                if (result == "insertSuccess") {
		                    alert("???????????? ??????");
		                    opener.document.location.reload();
		                    window.close();
		                }	               
		            },
		            error: function(request, status, error) {	
		                // ????????? ?????? ??? ?????? ??? ??????
		                alert("???????????? ??????");
		            }
		        });
		        return false;
		   	} 
	    });
	
	    //AJAX ??? ?????? ???????????? ????????? ??? CKEDITOR??? ?????? ??? textarea?????? ?????? ??????????????? ???????????? ????????????.
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


<!-- ?????????????????? ???????????? ???????????? 
<div class="modal-box" style="width:800px">
    <div class="modal-header">
        <h2>????????????</h2>
    </div>
    <div class="modal-content">
        <article>
            <div class="row">
                <div class="col-md-12">
                    <input type="hidden" id="replycomment_idx" name="replycomment_idx" />
                    <input type="hidden" id="replyparent" name="replyparent" />
                    <input type="hidden" id="replydepth" name="replydepth" />
                    <input type="hidden" id="replysortno" name="replysortno" />
                    <fieldset>
                        <legend>Board Write Form</legend>
                        <table summary="??????????????? ???????????? ????????????." class="table">
                            <caption>????????? : 2017???08???24??? ??????</caption>
                            <colgroup>
                                <col width="20%" />
                                <col width="30%" />
                                <col width="20%" />
                                <col width="30%" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><label for="userid"> ????????? </label></th>
                                    <td class="text-left"><input type="text" id="replyuserid" name="replyuserid"></td>
                                    <th><label for="pw"> ???????????? </label></th>
                                    <td class="text-left"><input type="password" id="replypass" name="replypass"></td>
                                </tr>
                                <tr>
                                    <th><label for="name"> ??????</label></th>
                                    <td class="text-left"><input type="text" id="replyname" name="replyname"></td>
                                    <th scope="row"><label for="email"> ????????? </label></th>
                                    <td class="text-left"><input type="text" id="replyemail" name="replyemail" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-left">
                                    	<textarea name="content" id="replyeditor"></textarea>
                                        <script>
                                            CKEDITOR.replace('replyeditor',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});                                                          
                                        </script>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <nav class="btn-group">
                            <ul>
                                <li><input type="button" value="????????????" id="replyBtn"></li>
                            </ul>
                        </nav>
                    </fieldset>
                </div>
            </div>
       		</div>
    </article>
    <div class="modal-footer">
        <div class="modal-close-btn">??????</div>
    </div>
</div>
<div class="modal-back"></div>
  -->
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
            <div class="content-full-img02"></div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                    <%@ include file="../../include/content_header.jsp"%>
                    <article>
                        <!-- 글작성폼 시작 -->
                        <div class="row">
                            <div class="col-md-12">
                                <h2>댓글쓰기</h2>
                                <fieldset>
                                    <legend>Board Write Form</legend>
                                    <table summary="기본게시판 보여주고 있습니다." class="table">
                                        <caption>등록일 : 2017년08월24일 기준</caption>
                                        <colgroup>
                                            <col width="20%" />
                                            <col width="30%" />
                                            <col width="20%" />
                                            <col width="30%" />
                                        </colgroup>
                                        <tbody>
                                            <tr>
                                                <th><label for="userid"> 아이디</label></th>
                                                <td class="text-left"><input type="text" id="userid" name="userid" placeholder="UserID"></td>
                                                <th><label for="pw"> 비밀번호 </label></th>
                                                <td class="text-left"><input type="password" id="pass" name="pass" placeholder="Password"></td>
                                            </tr>
                                            <tr>
                                                <th><label for="name"> 이름</label></th>
                                                <td class="text-left"><input type="text" id="name" name="name" placeholder="Name"></td>
                                                <th scope="row"><label for="email"> 이메일 </label></th>
                                                <td class="text-left"><input type="text" id="email" name="email" placeholder="Email" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="text-left">
                                                    <textarea name="content" id="editor" placeholder="Content"></textarea>
                                                    <script>
                                                        CKEDITOR.replace('editor',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});
                                                   </script>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <nav class="btn-group">
                                        <ul>
                                            <li><input type="button" value="등록하기" id="writeBtn" class="btn-large btn-block default"></li>
                                        </ul>
                                    </nav>
                                </fieldset>
                            </div>
                        </div>
                        <!-- 글작성폼 종료 -->
                        <!-- 글목록폼 시작 -->
                        <div id="replies"></div>
                        <!-- 글목록폼 종료 -->
                        <!-- 페이징 시작 -->
                        <nav class="paging-group">
                            <ul class="pagination"></ul>
                        </nav>
                        <!-- 페이징 종료 -->
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<%@ include file="ajax_comment_reply.jsp"%>
<script type="text/javascript">
$(document).ready(function() {

    var board_idx = 1;

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
                    "<h1 class='title'><p class='modifyname'>" + this.name + "</p></h1>" +
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
                    "<h1 class='title'><p class='modifyname'>" + icon + this.name + "</p></h1>" +
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
    $("#writeBtn").on("click", function() {

        CKupdate();

        //화면입력값 변수처리
        var userid = $("#userid").val();
        var pass = $("#pass").val();
        var name = $("#name").val();
        var email = $("#email").val();
        var content = $("#editor").val();

        //ajax
        $.ajax({
            type: "POST",
            url: "ajaxInsert",
            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
            dataType: "text",
            data: JSON.stringify({ // stringify는 json개체를 string개체로 변환
                userid: userid,
                pass: pass,
                name: name,
                email: email,
                content: content,
                board_idx: 1
            }),
            success: function(result) {

                //서비스 성공 시 처리 할 내용
                if (result == "insertSuccess") {
                    alert("댓글등록 완료");
                }

                //댓글목록출력
                getPageList(1);

                //댓글입력폼 초기화
                $("#userid").val("");
                $("#pass").val("");
                $("#name").val("");
                $("#email").val("");
                CKreset();
            },
            error: function(request, status, error) {
                // 서비스 실패 시 처리 할 내용
                alert("댓글등록 실패");
            }
        });
    });

    //댓글목록에서 수정하기 버튼 클릭시 
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

    //모달댓글수정
    $("#modifyBtn").on("click", function() {

        CKupdate();

        //화면입력값 변수처리
        var comment_idx = $("#replycomment_idx").val();
        var email = $("#replyemail").val();
        var content = $("#editor1").val();

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
    });

    //목록댓글삭제 
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

    //댓글목록에서 답글하기 버튼 클릭시 답글등록창 실행 
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

    //답글달기 
    $("#replyBtn").on("click", function() {

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
                board_idx: 1
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
    }




});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img02"></div>
            <div class="content-full-bg02-hidden">
                <section class="content">
                    <%@ include file="include/content_header.jsp"%>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <h2>글목록</h2>
                                <div class="articles">
                                    전체글 : <span>${pageMaker.totalCount}</span> 개 | 현재페이지 : <span>${pageMaker.criteria.page}</span>
                                    | 총페이지 : <span>${pageMaker.totalPage}</span>
                                </div>
                            </div>
                        </div>
                        <!-- 글작성폼 -->
                        <div class="row">
                            <div class="col-md-12">
                                <h2>글쓰기</h2>
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
                                                <th><label for="userid"> 아이디 </label></th>
                                                <td class="text-left"><input type="text" id="userid" name="userid" value="testid" placeholder="UserID"></td>
                                                <th><label for="pw"> 비밀번호 </label></th>
                                                <td class="text-left"><input type="password" id="pass" name="pass" value="1234" placeholder="Password"></td>
                                            </tr>
                                            <tr>
                                                <th><label for="name"> 이름</label></th>
                                                <td class="text-left"><input type="text" id="name" name="name" value="홍길동" placeholder="Name"></td>
                                                <th scope="row"><label for="email"> 이메일 </label></th>
                                                <td class="text-left"><input type="text" id="email" name="email" value="test@domain.com" placeholder="Email" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" class="text-left">
                                                	<textarea name="content" id="editor" placeholder="Content"></textarea>
                                                    <script>
                                                        CKEDITOR.replace('editor',{customConfig: '${path}/plugin/ckeditor4/full/custom-config.js'});
                                                    </script>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th><label for="code">자동등록방지</label></th>
                                                <td colspan="3" class="text-left"><input type="text" name="anti_robotCodeimg"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <nav class="btn-group">
                                        <ul>
                                            <li><input type="button" value="목록가기" onClick="location.href='list.do'"></li>
                                            <!--<li><input type="button" value="등록하기" onClick="Board_Write_Check();"></li> -->
                                            <li><input type="button" value="등록하기" id="writeBtn"></li>
                                        </ul>
                                    </nav>
                                </fieldset>
                            </div>
                        </div>
                        <!-- 글목록 -->
                        <div id="replies"></div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script type="text/javascript">
$(document).ready(function() {

    var board_idx = 1;

    // 댓글목록 초기화
    getCommentList();

    // 댓글목록 출력함수
    function getCommentList() {
        $.getJSON("${path}/replies/all/" + board_idx, function(data) {
            // console.log(data);
            // console.log(data.length);

            var str = "";

            $(data).each(function() {
                str += "<div class='row'>" +
                    "<div class='col-sm-12 col-md-12 col-lg-12'>" +
                    "<ul class='content-data-1'>" +
                    "<li>" +
                    "<div class='text-left'>" +
                    "<h1 class='title'>" +
                    "<a href='${path}/modules/comment/read.do${pageMaker.makeSearch(pageMaker.criteria.page)}&comment_idx=" + this.comment_idx + "'>" + this.name + "</a>" +
                    "<a href='${path}/modules/comment/modify.do${pageMaker.makeSearch(pageMaker.criteria.page)}&comment_idx=<c:out value='${row.comment_idx}'/>'>" +
                    "<span class='more'>수정</span></a>" +
                    "<a href='${path}/modules/comment/delete.do${pageMaker.makeSearch(pageMaker.criteria.page)}&comment_idx=<c:out value='${row.comment_idx}'/>'>" +
                    "<span class='more'>삭제</span></a>" +
                    "<a href='${path}/modules/comment/reply.do${pageMaker.makeSearch(pageMaker.criteria.page)}&comment_idx=<c:out value='${row.comment_idx}'/>'>" +
                    "<span class='more'>답글</span></a>" +
                    "</h1>" +
                    "<p>" + this.content + "</p>" +
                    "<h3 class='desc text-left'>" + this.regdate + '/' + this.comment_idx + "</h3>" +
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

    // 댓글등록 함수
    $("#writeBtn").click(function() {

        CKupdate();

        // 화면입력값 변수처리
        var userid = $("#userid");
        var pass = $("#pass");
        var name = $("#name");
        var email = $("#email");
        var content = $("#editor");

        var useridVal = userid.val();
        var passVal = pass.val();
        var nameVal = name.val();
        var emailVal = email.val();
        var contentVal = content.val();

        // ajax 통신
        $.ajax({
            type: "post",
            url: "${path}/replies",
            headers: { "Content-Type": "application/json", "X-HTTP-Method-Override": "POST" },
            dataType: "text",
            data: JSON.stringify({
                userid: useridVal,
                pass: passVal,
                name: nameVal,
                email: emailVal,
                content: contentVal,
                board_idx: 1
            }),
            success: function(result) {
                // 서비스 성공 시 처리 할 내용
                if (result == "regSuccess") {
                    alert("댓글 등록 완료");
                }

                // 댓글목록출력
                getCommentList();

                // 댓글입력폼 초기화
                //userid.val("");
                //pass.val("");
                //name.val("");
                //email.val("");
                CKreset();
            },
            error: function() {
                // 서비스 실패 시 처리 할 내용
                alert("댓글 등록 실패");
            }
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

});
</script>
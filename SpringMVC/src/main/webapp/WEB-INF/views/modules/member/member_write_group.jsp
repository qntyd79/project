<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<script type="text/javascript" src="<c:url value="validator.do"/>"></script>
<validator:javascript formName="memberVO" staticJavascript="false" xhtml="true" cdata="false"/>

<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    
                    
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="div-hcenter" style="width:600px;">
                                    <h2>회원가입</h2>
                                    <form>
                                        <fieldset>
                                            <div class="panel-box">
                                                <legend>Member Write Form</legend>
                                                <div class="panel-header">
                                                    <h3 class="panel-title"><i class="fas fa-file-alt"></i> 01. 고객님의 기본사항을 입력해 주세요. (필수항목)</h3>
                                                </div>
                                                <div class="thumbnail">
                                                    <img src="/resources/images/slide/slide01.jpg" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="name"> 회원아이디</label>
                                                    <input type="text" id="name" name="name" class="btn-block">
                                                    <input type="button" value="아이디중복검사" class="btn-block">
                                                </div>
                                                <div class="form-group">
                                                    <label for="pw"> 비밀번호 </label>
                                                    <input type="password" id="pass" name="pass" class="btn-block"> <span> 6~12자의 영문 소문자, 숫자만 사용할 수 있습니다.</span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="pw"> 비밀번호확인 </label>
                                                    <input type="password" id="pass" name="pass" class="btn-block">
                                                    <span> 다시한번 입력해 주세요</span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="pw"> 비밀번호 분실시 질문</label>
                                                    <select name="pass_ask" class="btn-block">
                                                        <option value='0' selected="selected">- 질문을 선택하여 주십시오-</option>
                                                        <option value="1">가장 인상깊었던 여행지는 </option>
                                                        <option value="2">나의보물 1호는 </option>
                                                        <option value="3">아버지 성함은 </option>
                                                        <option value="4">어머니 성함은 </option>
                                                        <option value="5">어릴적 별명은 </option>
                                                        <option value="6">나의 애완동물 이름은 </option>
                                                        <option value="7">좋아하는 동물은 </option>
                                                        <option value="8">좋아하는 색깔은 </option>
                                                        <option value="9">태어난 곳은 </option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="pw"> 비밀번호 분실시 답변 </label>
                                                    <input type="text" id="pass" name="pass" class="btn-block">
                                                    <span> 다시한번 입력해 주세요</span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="email"> 이메일 </label>
                                                    <input type="text" name="clientEmail1" title="개인메일계정 입력창" id="staff_email" value="" required="담당자 이메일을 입력해주세요." english class="btn-block" />
                                                    <input type="text" name="clientEmail2" title="메일관리업체" value="" required="담당자 이메일을 입력해주세요." english class="btn-block" />
                                                    <select itle="메일관리업체선택" class="btn-block">
                                                        <option>직접입력</option>
                                                        <option value="naver.com">naver.com</option>
                                                        <option value="hanmail.net">hanmail.net</option>
                                                        <option value="nate.com">nate.com</option>
                                                        <option value="hotmail.com">hotmail.com</option>
                                                        <option value="paran.com">paran.com</option>
                                                        <option value="yahoo.com">yahoo.com</option>
                                                        <option value="chol.com">chol.com</option>
                                                        <option value="dreamwiz.com">dreamwiz.com</option>
                                                        <option value="empal.com">empal.com</option>
                                                        <option value="freechal.com">freechal.com</option>
                                                        <option value="gmail.com">gmail.com</option>
                                                        <option value="hanafos.com">hanafos.com</option>
                                                        <option value="hanmir.com">hanmir.com</option>
                                                        <option value="hitel.net">hitel.net</option>
                                                        <option value="korea.com">korea.com</option>
                                                        <option value="lycos.co.kr">lycos.co.kr</option>
                                                        <option value="netian.com">netian.com</option>
                                                    </select>
                                                    <span>알찬 서비스 소식 및 이벤트을 전해드립니다.</span>
                                                </div>
                                                <div class="form-group">
                                                    <label for="pw">우편번호 </label>
                                                    <input type="text" id="pass" name="pass" class="btn-block">
                                                    <input type="text" id="pass" name="pass" class="btn-block">
                                                    <input type="button" value="우편번호검색" class="btn-block">
                                                </div>
                                                <div class="form-group">
                                                    <label for="homepage"> 주소 </label>
                                                    <input type="text" id="homepage" name="homepage" placeholder="www.domain.com" class="btn-block">
                                                </div>
                                                <div class="form-group">
                                                    <label for="title"> 상세주소 </label>
                                                    <input type="text" id="title" name="title" placeholder="제목을 입력해주세요" class="btn-block">
                                                </div>
                                                <div class="form-group">
                                                    <label for="date"> 전화번호 </label>
                                                    <select name="phone1" id="phone1" class="btn-block">
                                                        <option>선택</option>
                                                        <option value="02">02</option>
                                                        <option value="031">031</option>
                                                        <option value="032">032</option>
                                                        <option value="033">033</option>
                                                        <option value="041">041</option>
                                                        <option value="042">042</option>
                                                        <option value="043">043</option>
                                                        <option value="051">051</option>
                                                        <option value="052">052</option>
                                                        <option value="053">053</option>
                                                        <option value="054">054</option>
                                                        <option value="055">055</option>
                                                        <option value="061">061</option>
                                                        <option value="062">062</option>
                                                        <option value="063">063</option>
                                                        <option value="064">064</option>
                                                        <option value="070">070</option>
                                                    </select>
                                                    <input name="phone2" type="text" id="phone2" class="btn-block" />
                                                    <input name="phone3" type="text" id="phone3" class="btn-block" />
                                                </div>
                                                <div class="form-group">
                                                    <label for="date"> 핸드폰번호</label>
                                                    <select name="hphone1" id="hphone1" class="btn-block">
                                                        <option>선택</option>
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <option value="016">016</option>
                                                        <option value="017">017</option>
                                                        <option value="018">018</option>
                                                        <option value="019">019</option>
                                                    </select>
                                                    <input name="hphone2" type="text" id="hphone2" class="btn-block" />
                                                    <input name="hphone3" type="text" id="hphone3" class="btn-block" />
                                                </div>
                                                <nav class="btn-group">
                                                    <ul>
                                                        <li><input type="button" value="로그인" onclick="location.href='../../modules/login/member_login.html'"></li>
                                                        <li><input type="button" value="정보수정" onclick="location.href='../../modules/member/member_edit.html'"> </li>
                                                        <li><input type="button" value="회원탈퇴" onclick="location.href='../../modules/member/member_delete.html'"></li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>                        
                	</article>
                	
                	
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
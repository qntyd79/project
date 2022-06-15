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
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <c:import url="/WEB-INF/views/include/content_header.jsp"/>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <h2>회원실명인증</h2>
                                <form>
                                    <fieldset>
                                        <legend>Member Write Form</legend>
                                        <table summary="회원가입폼을 보여주고 있습니다." class="table">
                                            <colgroup>
                                                <col width="50%" />
                                                <col width="50%" />
                                            </colgroup>
                                            <tr>
                                                <td scope="row">
                                                    <div class="test-box last-child">
                                                        <div class="panel">
                                                            <p class="icon-top"><i class="fas fa-id-card-alt"></i></p>
                                                            <h1 class="title">공공아이핀</h1>
                                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원을 약속드립니다.</h2>
                                                            <div class="btn-group">
                                                                <input type="button" value="공공아이핀 인증하기">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="test-box last-child">
                                                        <div class="panel">
                                                            <p class="icon-top"><i class="fas fa-address-card"></i></p>
                                                            <h1 class="title">개인정보인증</h1>
                                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원을 약속드립니다.</h2>
                                                            <div class="btn-group">
                                                                <input type="button" value="개인정보 인증하기">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <nav class="btn-group">
                                            <ul>
                                                <li><input type="button" value="회원가입" onclick="location.href='agree.do'"></li>
                                                <li><input type="button" value="로그인" onclick="location.href='/modules/login/login.do'"></li>
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
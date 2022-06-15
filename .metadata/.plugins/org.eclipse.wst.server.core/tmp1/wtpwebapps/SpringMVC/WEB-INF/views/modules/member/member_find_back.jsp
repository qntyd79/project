<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="modal-box">
    <div class="modal-header">
        <h2>아이디/비밀번호찾기</h2>
    </div>
    <div class="modal-content">
        <article>
            <div class="row">
                <div class="col-md-12">
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
                                                <p class="icon-top"><i class="fas fa-address-card"></i></p>
                                                <h1 class="title">아이디찾기</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원을 약속드립니다.</h2>
                                                <div class="btn-group"><input type="button" value="아이디찾기"></div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="test-box last-child">
                                            <div class="panel">
                                                <p class="icon-top"><i class="fas fa-lock-open"></i></p>
                                                <h1 class="title">비밀번호찾기</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원을 약속드립니다.</h2>
                                                <div class="btn-group"><input type="button" value="비밀번호찾기"></div>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <nav class="btn-group">
                                <ul>
                                    <li><input type="button" value="회원가입" onclick="location.href='agree.do'"></li>
                                    <li><input type="button" value="로그인" onclick="location.href='login.do'"></li>
                                </ul>
                            </nav>
                        </fieldset>
                    </form>
                </div>
            </div>
        </article>
    </div>
    <div class="modal-footer">
        <div class="modal-close-btn">닫기</div>
    </div>
</div>
<div class="modal-back"></div>
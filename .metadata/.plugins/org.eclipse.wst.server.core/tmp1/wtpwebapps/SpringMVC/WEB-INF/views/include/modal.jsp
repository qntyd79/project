<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal-box">
    <div class="modal-header">
        <h2>아이디 중복검사</h2>
    </div>
    <div class="modal-content">
        <article>
            <div class="row">
                <div class="col-md-12">
                    <form>                        
                        <div class="form-group">
                            <label for="name"> 회원아이디</label>
                            <input type="text" id="name" name="name" class="btn-block">
                            <input type="button" value="아이디 중복검사" class="btn-large btn-block danger">
                        </div>
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
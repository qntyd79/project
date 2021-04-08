<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div class="video-box">
    <video muted autoplay loop id="video-full-bg">
        <!--  <source src="/jhbbs/images/wingtra.mp4" type="video/mp4"> -->
    </video>
</div>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                   <%@ include file="../include/content_header.jsp"%>
                    <article>
                        <h2>영어기초회화</h2>
                        <div class="lead">샘플로 제공되는 데이터베이스를 보실 수 있습니다.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-3">
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-1-thumb.jpg" />"/>
                                            <h1 class="title">UAV형 항공영상 수집</h1>
                                            <h2 class="subtitle">너 ~ 지 않아?</h2>
                                            <ul class="list">
                                                <li>예문</li>
                                                <li>예문</li>
                                                <li>예문</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-2-thumb.jpg" />"/>
                                            <h1 class="title">차량 장착용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">FOG타입의 고정밀 관성항법장치</h2>
                                            <ul class="list">
                                                <li>예문</li>
                                                <li>예문</li>
                                                <li>예문</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-3-thumb.jpg" />"/>
                                            <h1 class="title">드론 장착용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">드론용 MMS
                                            </h2>
                                            <ul class="list">
                                                <li>예문</li>
                                                <li>예문</li>
                                                <li>예문</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-4-thumb.jpg" />"/>
                                            <h1 class="title">UAV형 항공영상 수집</h1>
                                            <h2 class="subtitle">최대 40분 비행시간</h2>
                                            <ul class="list">
                                                <li>예문</li>
                                                <li>예문</li>
                                                <li>예문</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-5-thumb.jpg" />"/>
                                            <h1 class="title">실내용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">고정밀 IMU기반 관성항법시스템</h2>
                                            <ul class="list">
                                                <li>예문</li>
                                                <li>예문</li>
                                                <li>예문</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-6-thumb.jpg" />"/>
                                            <h1 class="title">MMS DATA 구축</h1>
                                            <h2 class="subtitle">영상정보, 점군정보, 위치정보 기반 데이터를 구축</h2>
                                            <ul class="list">
                                                <li>예문</li>
                                                <li>예문</li>
                                                <li>예문</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
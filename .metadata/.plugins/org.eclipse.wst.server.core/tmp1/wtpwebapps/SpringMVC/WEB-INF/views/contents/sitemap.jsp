<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                   <%@ include file="../include/content_header.jsp"%>
                    <article>
                        <h2>SiteMap</h2>
                        <div class="lead">샘플로 제공되는 데이터베이스를 보실 수 있습니다.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-4">
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-road fa-fw"></i></p>
                                            <h1 class="title">차량 장착용 파노라마 이미지 수집</h1>
                                            <h2 class="subtitle">nebula-DSLR은 Nikon D850 카메라에 대응하는 거리뷰 촬영 시스템</h2>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-street-view fa-fw"></i></p>
                                            <h1 class="title">차량 장착용 고정밀 MMS 수집</h1>
                                            <h2 class="subtitle">고정밀 관성항법장치와 LiDAR 센서가 완벽하게 결합되도록 개발된 제품</h2>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-layer-group"></i></p>
                                            <h1 class="title">드론 장착용 고정밀 MMS 수집</h1>
                                            <h2 class="subtitle">드론용 MMS에서 얻을 수 있는 최상의 데이터 획득이 가능
                                            </h2>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-chess-board"></i></p>
                                            <h1 class="title">UAV형 항공영상 수집</h1>
                                            <h2 class="subtitle">최대 40분 비행시간 최소GSD 0.7cm/px급 정사영상 확보</h2>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-database"></i></p>
                                            <h1 class="title">실내용 고정밀 MMS 수집</h1>
                                            <h2 class="subtitle">고정밀 IMU기반 관성항법시스템, SLAM 기반 실내매핑장치 대비 우수한 품질</h2>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-qrcode"></i></p>
                                            <h1 class="title">MMS DATA 구축</h1>
                                            <h2 class="subtitle">영상정보, 점군정보, 위치정보 기반 데이터를 활용한 공간정보구축</h2>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-calendar-alt"></i></p>
                                            <h1 class="title">MMS DATA 구축</h1>
                                            <h2 class="subtitle">영상정보, 점군정보, 위치정보 기반 데이터를 활용한 공간정보구축</h2>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <p class="icon-top"><i class="fas fa-chart-bar"></i></p>
                                            <h1 class="title">MMS DATA 구축</h1>
                                            <h2 class="subtitle">영상정보, 점군정보, 위치정보 기반 데이터를 활용한 공간정보구축</h2>
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
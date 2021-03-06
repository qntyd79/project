<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div id="slider-wrap">
    <div class="slider-box">
        <div class="slider">
            <div class="slider-left-btn">
                <a href="#"><i class="fas fa-angle-left fa-2x"></i></a>
            </div>
            <div class="slider-item">
                <div class='slider-caption'>
                    <h2 class="slider-title">Mobile Mapping System Real world data collecting tools</h2>
                    <h3 class="slider-desc">MMS 원천 기술 확보와 최고 성능의 장비 투입</h3>
                    <p class="slider-summary">도로/실내/항공 파노라마 및 정사영상/Point Cloud</p>
                    <section>
                        <article>
                            <div class="row">
                                <div class="col-md-12 col-sm-4">
                                    <ul class="content-panel-3">
                                        <li>
                                            <div class="panel text-center">
                                                <div class="icon-top"><i class="fas fa-road"></i></div>
                                                <h1 class="title">차량 장착용 파노라마 이미지 수집</h1>
                                                <h2 class="subtitle">nebula-DSLR는 DSLR 전자셔터 모드가 적용 된 파노라마 이미지 수집장치로 교체용 카메라 보유가 필요없으며, 관성항법장치에 기반한 좌표 자세값 획득이 가능합니다.</h2>
                                                <h3 class="desc"></h3>
                                                <h4 class="summary summary-last-child"><a href="/jhbbs/contents/solution01.jsp">자세히보기</a></h4>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="panel text-center">
                                                <div class="icon-top"><i class="fas fa-street-view"></i></div>
                                                <h1 class="title">차량 장착용 고정밀 모바일 매핑 수집</h1>
                                                <h2 class="subtitle">nebula-LP는 FOG타입의 고정밀 관성항법장치와 LiDAR센서가 완벽하게 결합되어 있으며 동기화 모듈 연산 및 데이터 수집용 연산모듈을 모두 내장하고 있습니다.</h2>
                                                <h3 class="desc"></h3>
                                                <h4 class="summary summary-last-child"><a href="/jhbbs/contents/solution02.jsp">자세히보기</a></h4>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="panel text-center">
                                                <div class="icon-top"><i class="fas fa-layer-group"></i></div>
                                                <h1 class="title">드론 장착용 고정밀 모바일 매핑 수집</h1>
                                                <h2 class="subtitle">nebula-AP+는 GPS 단절구간과 자성을 띠는 구조물의 영향을 적게 받으며 결과적으로 동급의 드론용 MMS에서 얻을 수 있는 최상의 데이터 획득이 가능합니다.</h2>
                                                <h3 class="desc"></h3>
                                                <h4 class="summary summary-last-child"><a href="/jhbbs/contents/solution03.jsp">자세히보기</a></h4>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-sm-4">
                                    <ul class="content-panel-3">
                                        <li>
                                            <div class="panel text-center">
                                                <div class="icon-top"><i class="fas fa-chess-board"></i></div>
                                                <h1 class="title">UAV형 항공영상 수집</h1>
                                                <h2 class="subtitle">WingtraOne은 최대 40분의 비행시간과 최소 GSD 0.7cm/px급의 정사영상을 확보할 수 있으며, GSD 3cm/px급으로 최대 4.0㎢의 면적 촬영이 가능합니다.</h2>
                                                <h3 class="desc"></h3>
                                                <h4 class="summary summary-last-child"><a href="/jhbbs/contents/solution04.jsp">자세히보기</a></h4>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="panel text-center">
                                                <div class="icon-top"><i class="fas fa-qrcode"></i></div>
                                                <h1 class="title">실내용 고정밀 모바일 매핑 수집</h1>
                                                <h2 class="subtitle">TIMMS는 업계 유일의 GPS나 SLAM을 사용하지 않는 고정밀 IMU 기반의 관성 항법 시스템을 적용하고 있으며 우수한 품질의 매핑 데이터를 균일하게 획득할수 있습니다.</h2>
                                                <h3 class="desc"></h3>
                                                <h4 class="summary summary-last-child"><a href="/jhbbs/contents/solution05.jsp">자세히보기</a></h4>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="panel text-center">
                                                <div class="icon-top"><i class="fas fa-database"></i></div>
                                                <h1 class="title">고정밀 모바일 매핑 기반 DATA 구축</h1>
                                                <h2 class="subtitle">차량용 수집장비 및 실내용 수집장비로 수집한 데이터를 활용하여 후처리 프로세싱을 거쳐 영상정보, 점군정보, 위치정보 기반 데이터를 구축할수 있습니다.</h2>
                                                <h3 class="desc"></h3>
                                                <h4 class="summary summary-last-child"><a href="/jhbbs/contents/solution06.jsp">자세히보기</a></h4>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </article>
                    </section>
                </div>
                <div class="slider-img">
                    <img src="/resources/images/slide/slide05.jpg">
                </div>
                <!-- <div class="slider-video">                      
                       <video muted autoplay loop>
                           <source src="/jhbbs/images/wingtra.mp4" type="video/mp4">
                       </video>
                    </div> -->
            </div>
            <div class="slider-right-btn">
                <a href="#"><i class="fas fa-angle-right fa-2x"></i></a>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
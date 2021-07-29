<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="slider-wrap">
    <div class="slider-box">
        <div class="slider">
            <div class="slider-left-btn">
                <a href="#"><i class="fas fa-angle-left fa-2x"></i></a>
            </div>
            
            <div class="bxslider">
                <div class="slider-item">
                    <div class='slider-caption'>
                        <h2 class="slider-title">Index Capturing reality in minutes using photogrammetric</h2>
                        <h3 class="slider-desc">Desktop and cloud image processing</h3>
                        <h4 class="slider-summary">The leading photogrammetry software for professional drone mapping Try for free</h4>
                        <section>
                            <article>
                                <div class="row">
                                    <div class="col-md-12">
                                        <ul class="content-panel-3">
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-road"></i></div>
                                                    <h1 class="title">차량 장착용 파노라마 이미지 수집</h1>
                                                    <h2 class="subtitle">nebula-DSLR는 DSLR 전자셔터 모드가 적용 된 파노라마 이미지 수집장치로 교체용 카메라 보유가 필요없으며, 관성항법장치에 기반한 좌표 자세값 획득</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution01.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-street-view"></i></div>
                                                    <h1 class="title">차량 장착용 고정밀 모바일 매핑 수집</h1>
                                                    <h2 class="subtitle">nebula-LP는 FOG타입의 고정밀 관성항법장치와 LiDAR센서가 완벽하게 결합되어 있으며 동기화 모듈 연산 및 데이터 수집용 연산모듈을 내장하고 있습니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution02.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-layer-group"></i></div>
                                                    <h1 class="title">드론 장착용 고정밀 모바일 매핑 수집</h1>
                                                    <h2 class="subtitle">nebula-AP+는 GPS 단절구간과 자성을 띠는 구조물의 영향을 적게 받으며 결과적으로 동급의 드론용 MMS에서 얻을 수 있는 최상의 데이터 획득이 가능합니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution03.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <ul class="content-panel-3">
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-chess-board"></i></div>
                                                    <h1 class="title">UAV형 항공영상 수집</h1>
                                                    <h2 class="subtitle">WingtraOne은 최대 40분의 비행시간과 최소 GSD 0.7cm/px급의 정사영상을 확보할 수 있으며, GSD 3cm/px급으로 최대 4.0㎢의 면적 촬영이 가능합니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution04.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-qrcode"></i></div>
                                                    <h1 class="title">실내용 고정밀 모바일 매핑 수집</h1>
                                                    <h2 class="subtitle">TIMMS는 업계 유일의 GPS나 SLAM을 사용하지 않는 고정밀 IMU 기반의 관성 항법 시스템을 적용하고 있으며 매핑 데이터를 균일하게 획득할수 있습니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution05.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-database"></i></div>
                                                    <h1 class="title">고정밀 모바일 매핑 기반 DATA 구축</h1>
                                                    <h2 class="subtitle">차량용 수집장비 및 실내용 수집장비로 수집한 데이터를 활용하여 후처리 프로세싱을 거쳐 영상정보, 점군정보, 위치정보 기반 데이터를 구축할수 있습니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution06.dol"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </article>
                        </section>
                    </div>
                    <div class="slider-img">
                        <img src="/resources/images/slide/slide03.jpg"/>
                    </div>
                </div>
                <div class="slider-item">   
                    <div class='slider-caption'>
                        <h2 class="slider-title">Index Plan and control drone flights using only your mobile</h2>
                        <h3 class="slider-desc">Pix4Dcapture flies the biggest brands in the market
                        </h3>
                        <h4 class="slider-summary">Free drone flight planning app for optimal 3D mapping and modeling</h4>
                        <section>
                            <article>
                                <div class="row">
                                    <div class="col-md-12">
                                        <ul class="content-panel-3">
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-road"></i></div>
                                                    <h1 class="title">차량 장착용 파노라마 이미지 수집</h1>
                                                    <h2 class="subtitle">nebula-DSLR는 DSLR 전자셔터 모드가 적용 된 파노라마 이미지 수집장치로 교체용 카메라 보유가 필요없으며, 관성항법장치에 기반한 좌표 자세값 획득</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution01.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-street-view"></i></div>
                                                    <h1 class="title">차량 장착용 고정밀 모바일 매핑 수집</h1>
                                                    <h2 class="subtitle">nebula-LP는 FOG타입의 고정밀 관성항법장치와 LiDAR센서가 완벽하게 결합되어 있으며 동기화 모듈 연산 및 데이터 수집용 연산모듈을 내장하고 있습니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution02.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-layer-group"></i></div>
                                                    <h1 class="title">드론 장착용 고정밀 모바일 매핑 수집</h1>
                                                    <h2 class="subtitle">nebula-AP+는 GPS 단절구간과 자성을 띠는 구조물의 영향을 적게 받으며 결과적으로 동급의 드론용 MMS에서 얻을 수 있는 최상의 데이터 획득이 가능합니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution03.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <ul class="content-panel-3">
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-chess-board"></i></div>
                                                    <h1 class="title">UAV형 항공영상 수집</h1>
                                                    <h2 class="subtitle">WingtraOne은 최대 40분의 비행시간과 최소 GSD 0.7cm/px급의 정사영상을 확보할 수 있으며, GSD 3cm/px급으로 최대 4.0㎢의 면적 촬영이 가능합니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution04.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-qrcode"></i></div>
                                                    <h1 class="title">실내용 고정밀 모바일 매핑 수집</h1>
                                                    <h2 class="subtitle">TIMMS는 업계 유일의 GPS나 SLAM을 사용하지 않는 고정밀 IMU 기반의 관성 항법 시스템을 적용하고 있으며 매핑 데이터를 균일하게 획득할수 있습니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution05.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="panel text-center">
                                                    <div class="icon-top"><i class="fas fa-database"></i></div>
                                                    <h1 class="title">고정밀 모바일 매핑 기반 DATA 구축</h1>
                                                    <h2 class="subtitle">차량용 수집장비 및 실내용 수집장비로 수집한 데이터를 활용하여 후처리 프로세싱을 거쳐 영상정보, 점군정보, 위치정보 기반 데이터를 구축할수 있습니다.</h2>
                                                    <h3 class="desc"></h3>
                                                    <h4 class="summary summary-last-child"><a href="<c:url value="/contents/solution06.do"/>">자세히보기</a></h4>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                  -->
                            </article>
                        </section>
                    </div>
                    <div class="slider-img">
                       <img src="/resources/images/slide/slide05.jpg"/>
                    </div>
                </div>
            </div>
            
            <div class="slider-right-btn">
                <a href="#"><i class="fas fa-angle-right fa-2x"></i></a>
            </div>
        </div>
    </div>
</div>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01-hidden"></div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <div class="modal-box">
                        <div class="modal-header">
                            <h1>Modal Title Insert</h1>
                        </div>
                        <div class="modal-content">
                            <article>
                                <div class="row">
                                    <div class="col-md-12">
                                        <p>Modal Content Insert</p>
                                    </div>
                                </div>
                            </article>
                        </div>
                        <div class="modal-footer">
                            <div class="modal-close-btn">닫기</div>
                        </div>
                    </div>
                    <div class="modal-back"></div>
                </section>
                <div class="toggle-box">
                    <button class="toggle-btn"><i class="fa fa-chevron-up" aria-hidden="true"></i></button>
                    <article class="toggle-content">
                        <h2>Welcome to Innomaps</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <%@ include file="include/gnb.jsp"%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-clipboard"></i></div>
                                        <h1 class="title">채용문의</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="모달창" class="modal-open-btn">
                                            <input type="button" value="자세히보기" class="modal-open-btn">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-desktop"></i></div>
                                        <h1 class="title">채용문의</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-braille"></i></div>
                                        <h1 class="title">채용문의</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box last-child">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-server"></i></div>
                                        <h1 class="title">채용문의</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top:-1px;">
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-calendar-alt"></i></div>
                                        <h1 class="title">일정관리</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-share-alt-square"></i></div>
                                        <h1 class="title">사진관리</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-cloud"></i></div>
                                        <h1 class="title">클라우드</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box last-child">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-database"></i></div>
                                        <h1 class="title">데이터베이스</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/include/footer.jsp"/>
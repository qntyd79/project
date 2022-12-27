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
                   <%@ include file="/WEB-INF/views/include/content_header.jsp"%>
                    <article>
                        <h2>Solution</h2>
                        <div class="lead">MMS 관련 뛰어난 가격 경쟁력과 효율적인 유지보수를 지원하며 다양한 하드웨어와 소프트웨어 자체 개발이 가능하여<BR>다양한 고객니즈에 차별화 된 서비스로 최적의 맞춤솔루션을 제공합니다.
                        </div>
                    </article>
                    <article>
                        <div class="gnb-box">
                            <nav class="gnb">
                               <ul>
                                    <li><a href="<c:url value="${path}/contents/solution01.do"/>"><i class="fas fa-user-lock"></i> nebula-DSLR</a></li>
                                    <li><a href="<c:url value="${path}/contents/solution02.do"/>"><i class="fas fa-address-card"></i> nebula-LP</a></li>
                                    <li><a href="<c:url value="${path}/contents/solution03.do"/>"><i class="fas fa-desktop"></i> nebula-AP+</a></li>
                                    <li><a href="<c:url value="${path}/contents/solution04.do"/>"><i class="fas fa-sitemap"></i> WingtraOne</a></li>
                                    <li><a href="<c:url value="${path}/contents/solution05.do"/>"><i class="fas fa-users"></i> TIMMS</a></li>
                                    <li><a href="<c:url value="${path}/contents/solution06.do"/>"><i class="fas fa-map"></i> Orbit</a></li>
                                </ul>
                            </nav>
                        </div>
                        <h2>Data Collecting Devices</h2>
                        <h3>가. TIMMS : 실내용 고정밀 모바일 매핑 수집장치</h3>
                        <div class="lead">TIMMS는 업계 유일의 GPS나 SLAM을 사용하지 않는 고정밀 IMU 기반의 관성 항법 시스템을 적용하고 있으며, 타사의 GPS나
                            SLAM 기반의 실내 매핑 장치에 비해 우수한 품질의 매핑 데이터를 균일하게 획득할수 있습니다.<br>
                            LiDAR와 360도 파노라마 이미지를 모두 제공하며 실제 환경에 가까운 모델 생성이 가능하며
                            TIMMS의 제작사인 Applanix 사로부터 국내 유일하게 공인교육을 받은 전문 인력을 보유, 전문적인 TIMMS의 운용 및 지원합니다.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/timms.jpg"/>"  class="img-border" />
                                    <h4 class="caption">Applanix AP-20E / FARO / Ladybug5</h4>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="test-box-none">
                                    <div class="panel text-left">
                                        <h2 class="title">TIMMS</h2>
                                        <h3 class="subtitle">실내용 고정밀 모바일 매핑 수집장치</h3>
                                        <p>TIMMS는 업계 유일의 GPS나 SLAM을 사용하지 않는 고정밀 IMU 기반의 관성 항법 시스템을 적용, 타사의 GPS나 SLAM 기반의 실내 매핑 장치에 비해 우수한 품질의 매핑 데이터를 균일하게 획득 가능합니다.</p>
                                        <P>TIMMS는 LiDAR와 360도 파노라마 이미지를 모두 제공하며 실제 환경에 가까운 모델의 생성 이 가능합니다. 책상, 의자, 계단, 문, 비치된 각종 시설물을 포함하므로 실제 건물, 지형 시설물의 상태 수집에 최상의 선택이 됩니다.</p>
                                        <P>다음과 같은 용도에 활용을 추천합니다.</p>
                                        <h3 class="subtitle bold">Key facts</h3>
                                        <ul class="list">
                                            <li>공장 및 공장 설비</li>
                                            <li>고층 사무실, 주거 및 정부 건물</li>
                                            <li>공항, 기차역 및 기타 교통 시설</li>
                                            <li>음악 홀, 극장, 강당 및 기타 공공 행사 공간</li>
                                        </ul>                                       
                                    </div>
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
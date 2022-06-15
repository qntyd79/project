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
                        <h2>Services</h2>
                        <h3>가. Data Collecting Devices</h3>
                        <div class="lead">국내 MMS 맞춤제작 기업으로 세계시장에서 경쟁할 수 있는 최상의 MMS장비를 제작, 공급 및 기술 지원 서비스를 지원합니다.<BR>
                            MMS 장비개발 제작에 축적된 개발 및 운영 경험으로 다양한 고객사 환경을 고려한 맞춤형 장비 제작 서비스를 제공합니다.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-3">
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/nebula-DSLR/1.jpg" />"/>
                                            <h1 class="title">nebula-DSLR</h1>
                                            <h1 class="title">차량 장착용 파노라마 이미지 수집</h1>
                                            <h2 class="subtitle">nebula-DSLR은 Nikon D810과 Nikon D850 카메라에 대응하는 거리뷰 촬영 시스템개발 및 수집</h2>
                                            <!-- <ul class="list">
                                                <li>Nikon D850 카메라 기반 고화질 영상 (4575만 화소)</li>
                                                <li>Applanix AP-20E의 고정밀 GNSS/INS DATA</li>
                                                <li>정확한 거리 산정을 위한 DMI 활용</li>
                                            </ul> -->
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" onclick="location.href='../contents/solution01.do'" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/16_nebra_lp/1.jpg" />"/>
                                            <h1 class="title">nebula-LP</h1>
                                            <h1 class="title">차량 장착용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">FOG타입의 고정밀 관성항법장치와 LiDAR 센서가 완벽하게 결합되도록 개발된 제품</h2>
                                            <!-- <ul class="list">
                                                <li>8,000/20,000/40,000px 등 다양한 해상도의 거리뷰/실내뷰 구축</li>
                                                <li>최대 ISO 감도 25600의 안정된 영상 취득(D810 최대 ISO 감도 12800)</li>
                                                <li>도보촬영을 위한 사진 전문가 투입</li>
                                            </ul> -->
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" onclick="location.href='../contents/solution02.do'" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/01_DRONE-MMS/5.jpg" />"/>
                                            <h1 class="title">nebula-AP+</h1>
                                            <h1 class="title">드론 장착용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">드론용 MMS에서 얻을 수 있는 최상의 데이터 획득이 <bR>가능한 장비 제작 및 데이터 수집</h2>
                                            <!-- <ul class="list">
                                                <li>DJI Phantom4 PRO, Inspire2 등 촬영 환경에 적합한 UAV 투입</li>
                                                <li>8,000/20,000px의 항공뷰 구축</li>
                                                <li>항공뷰 촬영을 위한 국방부 승인과 서비스를 위한 보안성 검토 실시</li>
                                            </ul> -->
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" onclick="location.href='../contents/solution03.do'" />
                                            </div>
                                        </div>
                                    </li>
                                    <!-- <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/11_TI-CAMERA/1-1.jpg"  />"/>
                                            <h1 class="title">nebula-Omni</h1>
                                            <h2 class="subtitle text-left">UAV를 활용하여 항공뷰가 필요한 특정지역을 고도 100m 전후로 1회 비행, 3노드 내외 촬영
                                            </h2>
                                            <ul class="list">
                                                <li>DJI Phantom4 PRO, Inspire2 등 촬영 환경에 적합한 UAV 투입</li>
                                                <li>8,000/20,000px의 항공뷰 구축</li>
                                                <li>항공뷰 촬영을 위한 국방부 승인과 서비스를 위한 보안성 검토 실시</li>
                                            </ul>
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" onclick="location.href='../contents/solution04.do'" />
                                            </div>
                                        </div>
                                    </li> -->
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/17_wingtra/thumbnail.jpg" />"/>
                                            <h1 class="title">WingtraOne</h1>
                                            <h1 class="title">UAV형 항공영상 수집</h1>
                                            <h2 class="subtitle">최대 40분 비행시간 최소GSD 0.7cm/px급 정사영상 확보<BR>GSD3cm/px급 최대 4.0㎢ 면적 촬영</h2>
                                            <!-- <ul class="list">
                                                <li>DJI Phantom4 PRO, Inspire2 등 촬영 환경에 적합한 UAV 투입</li>
                                                <li>8,000/20,000px의 항공뷰 구축</li>
                                                <li>항공뷰 촬영을 위한 국방부 승인과 서비스를 위한 보안성 검토 실시</li>
                                            </ul> -->
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" onclick="location.href='../contents/solution04.do'" />
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/14_applanix/thumbnail2.jpg"/>"/>
                                            <h1 class="title">TIMMS</h1>
                                            <h1 class="title">실내용 고정밀 모바일 매핑 수집</h1>
                                            <h2 class="subtitle">고정밀 IMU기반 관성항법시스템, SLAM 기반 실내매핑장치 대비 우수한 품질의 데이터 획득</h2>
                                            <!-- <ul class="list">
                                                <li>DJI Phantom4 PRO, Inspire2 등 촬영 환경에 적합한 UAV 투입</li>
                                                <li>8,000/20,000px의 항공뷰 구축</li>
                                                <li>항공뷰 촬영을 위한 국방부 승인과 서비스를 위한 보안성 검토 실시</li>
                                            </ul> -->
                                            <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" onclick="location.href='../contents/solution05.do'" />
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h3>나. Data Processing & Service Software</h3>
                        <div class="lead">Manage and optimize your mobile mapping data after capture using the powerful 3DM Content Manager.
                            Auto produce & update assets faster and richer than ever before based on the 3DM Feature Extraction portfolio.
                            Install the 3DM Publisher on-premises or activate your profile on 3dmapping.cloud to share mobile mapping projects over the internet, embed in corporate software, or to make them available via mobile devices.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-3">
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/3.jpg" />"/>
                                            <h1 class="title">3DM CONTENT MANAGER</h1>
                                            <h2 class="subtitle">Manage your data after capture</h2>
                                            <ul class="list">
                                                <li>MANAGE COMPANY-WIDE MAPPING DATA</li>
                                                <li>A FUNDAMENTAL TOOL FOR EVERY 3D MAPPING</li>
                                                <li>STRONG INDUSTRY SUPPORT</li>
                                            </ul>
                                            <!-- <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div> -->
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/17.jpg" />"/>
                                            <h1 class="title">3DM FEATURE EXTRACTION</h1>
                                            <h2 class="subtitle">Asset Modeling</h2>
                                            <ul class="list">
                                                <li>Velodyne HDL-32E, Quanergy M8 등</li>
                                                <li>Applanix AP-20E의 고정밀 항법장치 POSPac</li>
                                                <li>거리뷰 영상 및 Point Cloud 동시 취득</li>
                                            </ul>
                                            <!-- <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div> -->
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/13.jpg" />"/>
                                            <h1 class="title">3DM PUBLISHER</h1>
                                            <h2 class="subtitle">On-premises Solution</h2>
                                            <ul class="list">
                                                <li>Applanix TIMMS Indoor Mapping 장비 보유</li>
                                                <li>Ladybug Spherical Camera와 FARO LiDAR System</li>
                                                <li>23,000㎡/day이상 Mapping 가능</li>
                                            </ul>
                                            <!-- <div class="btn-group-m">
                                                <input type="button" value="자세히보기" class="info btn-block" />
                                            </div> -->
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
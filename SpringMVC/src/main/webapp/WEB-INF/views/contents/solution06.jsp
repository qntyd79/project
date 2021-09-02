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
                        <h2>Data Processing & Service Software</h2>
                        <h3>가. Orbit : 3DM Content Manager & Feature Extraction</h3>
                        <div class="lead">서버 기반 데이터 관리, 편집 솔루션 3D point cloud 데이터와 이미지 기반 서비스 지원, 웹 및 모바일 장치 지원, 플래시 또는 HTML5 지원합니다.</div>
                    </article>
                    <article>
                        <ul class="content-panel-2">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/23.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/24.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/25.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/26.png"/>"  class="img-border" />
                                </div>
                            </li>
                        </ul>
                    </article>
                    <article>
                        <h3>나. Orbit : 3DM Publisher</h3>
                        <div class="lead">데스크탑 기반의 데이터 관리, 편집, 추출 솔루션, 3D point cloud 데이터 및 이미지 관리, 모바일 매핑 프로젝트 공유 지원, 다양한 수집장비 설정에 맞춘 템플릿 지원합니다.</div>
                        <ul class="content-panel-2">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/13_obit/28.jpg"/>"  class="img-border" />
                                </div>
                                <div class="btn-group-m">
                                    <input type="button" value="샘플영상보기" class="info btn-block" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/14_applanix/5.jpg"/>"  class="img-border" />
                                </div>
                                <div class="btn-group-m">
                                    <input type="button" value="샘플영상보기" class="info btn-block" />
                                </div>
                            </li>
                        </ul>
                    </article>
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
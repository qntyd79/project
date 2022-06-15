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
                        <h2>Data Collecting Devices</h2>
                        <h3>가. nebula-AP+ : 드론 장착용 고정밀 모바일 매핑 수집장치</h3>
                        <div class="lead">nebula-AP+는 FOG타입의 고정밀 관성항법장치와 LiDAR 센서, 카메라가 완벽하게 결합된 드론 장착용 MMS(Mobile Mapping System)입니다. nebula-AP+는 GPS 단절구간과 자성을 띠는 구조물의 영향을 적게 받으며 결과적으로 동급의 드론용 MMS에서 얻을 수 있는 최상의 데이터 획득이 가능합니다. nebula-AP+의 운용은 간단한 교육만으로 가능하며 업계 표준포맷의 결과물은 다양한 후처리 소프트웨어의 활용을 가능하게 합니다.
                        </div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/01_DRONE-MMS/5.jpg"/>"  class="img-border" />
                                    <h4 class="caption">Applanix AP-20E / Velodyne HDL-32E / Sony CCD</h4>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="test-box-none">
                                    <div class="panel text-left">
                                        <h2 class="title">nebula-AP+</h2>
                                        <h3 class="subtitle">드론 장착용 고정밀 모바일 매핑 수집장치</h3>
                                        <p>nebula-AP+는 수평유지를 위한 짐벌과 LiDAR, Camera, FOG 타입의 INS, 데이터 처리 및 저장용 연산장치를 내장하고도 단지 5Kg의 무게를 가지고 있습니다.<br>
                                            이러한 장점은 시중의 드론을 이용해 고정밀 3D 시설,지형 정보 획득을 가능하게합니다. 모든 기능은 Wifi를 통해 제어되므로 현장에서는 데이터 수집에 집중할 수 있습니다.</p>
                                        <p>고객의 요청에 따라 별도의 센서와 카메라의 추가 장착을 지원합니다.</p>
                                        <h3 class="subtitle bold">Key facts</h3>
                                        <ul class="list">
                                            <li>LiDAR smoothly integrated with INS/GNSS unit</li>
                                            <li>Network RTK support</li>
                                            <li>Built-in gimbal</li>
                                            <li>Built-in Camera</li>
                                            <li>Built-in Applanix Ap-20E or AP40E</li>
                                            <li>Built-in Quanergy M8(400,000 point/sec) or Velodyne HDL-32E(650,000 point/sec)</li>
                                        </ul>
                                        <!--  <div class="btn-group-m">
                                           <input type="button" value="자세히보기" class="info btn-block" />
                                       </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h4 class="title">Product Specifications</h4>
                        <table class="table">
                            <caption>
                                장비스펙
                            </caption>
                            <colgroup>
                                <col width="20%">
                                <col width="20%">
                                <col width="60%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col"><label for="date">구분</label></th>
                                    <th scope="col">명칭</th>
                                    <th scope="col">규격</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>Camera</th>
                                    <th>Sony CCD</th>
                                    <td>
                                        <ul class="list">
                                            <li>35.9×23.9mm Full Frame CMOS</li>
                                            <li>유효화소수 : 4575만 화소</li>
                                            <li>최대 이미지 크기 : 8256×5504px</li>
                                            <li>최대 ISO : 25600 </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>GNSS/INS</th>
                                    <th>Applanix AP-20E</th>
                                    <td>
                                        <ul class="list">
                                            <li>No GNSS Outages (Post-Processed)
                                                <ul class="sublist">
                                                    <li>Position : 0.02~0.05m(X,Y)</li>
                                                    <li>Heading : 0.05deg</li>
                                                </ul>
                                            </li>
                                            <li>60s GNSS Outages (Post-Processed)
                                                <ul class="sublist">
                                                    <li>Position : 0.02~0.05m(X,Y)</li>
                                                    <li>Heading : 0.05deg</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>                               
                            </tbody>
                        </table>
                    </article>                    
                </section>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
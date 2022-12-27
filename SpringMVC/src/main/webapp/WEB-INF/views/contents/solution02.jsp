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
                        <h3>가. nebula-LP : 차량 장착용 고정밀 모바일 매핑 수집장치</h3>
                        <div class="lead">nebula-LP는 차량에 장착 가능한 MMS(Mobile Mapping System)로 FOG타입의 고정밀 관성항법장치와 LiDAR센서가 완벽하게 결합되어 있으며 동기화 모듈 연산 및 데이터 수집용 연산모듈을 모두 내장하고 있습니다. 작은 크기와 적은 전력 소모로 다양한 이동체에 손쉽게 장착할 수 있습니다. 전원과 DMI만 연결하면 바로 작동이 가능합니다. <br>고객의 요청에 따라 별도의 센서와 카메라의 추가 장착을 지원합니다.
                        </div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/16_nebra_lp/1.jpg"/>"  class="img-border" />
                                    <h4 class="caption">Applanix AP-20E / Velodyne HDL-32E / Ladybug5+</h4>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="test-box-none">
                                    <div class="panel text-left">
                                        <h2 class="title">nebula-LP</h2>
                                        <h3 class="subtitle">차량 장착용 고정밀 모바일 매핑 수집장치</h3>
                                        <p>nebula-LP는 차량에 장착 가능한 MMS(Mobile Mapping System)로 FOG타입의 고정밀 관성항법장치와 LiDAR센서가 완벽하게 결합되어 있으며 동기화 모듈 연산 및 데이터 수집용 연산모듈을 모두 내장하고 있습니다.<br>
                                            작은 크기와 적은 전력 소모로 다양한 이동체에 손쉽게 장착할 수 있습니다. 전원과 DMI만 연결하면 바로 작동이 가능합니다. 고객의 요청에 따라 별도의 센서와 카메라의 추가 장착을 지원합니다.</p>
                                        <p>고객의 요청에 따라 별도의 센서와 카메라의 추가 장착을 지원합니다.</p>
                                        <h3 class="subtitle bold">Key facts</h3>
                                        <ul class="list">
                                            <li>LiDAR smoothly integrated with INS/GNSS unit</li>
                                            <li>Network RTK support</li>
                                            <li>Built-in Applanix Ap-20E or AP40E</li>
                                            <li>Built-in Quanergy M8(400,000 point/sec)</li>
                                            <li>Support FLIR ladybug 5</li>
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
                                    <th>Ladybug5+</th>
                                    <td>
                                        <ul class="list">
                                            <li>Resolution : 2048 x 2448 </li>
                                            <li>Frame Rate : 30 FPS JPEG Compressed; 14.5 FPS Uncompressed </li>
                                            <li>Megapixels : 30 MP (5 MP x 6 sensors) </li>
                                            <li>Chroma : Color </li>
                                            <li>Sensor Name : Sony IMX264 </li>
                                            <li>Sensor Type : CMOS </li>
                                            <li>Readout Method : Global shutter </li>
                                            <li>Sensor Format : 2/3" </li>
                                            <li>Pixel Size : 3.45 µm </li>
                                            <li>Optics : 6 high quality 4.4 mm focal length lenses </li>
                                            <li>Field of View : 90% of full sphere </li>
                                            <li>Spherical Distance : Calibrated from 2 m to infinity</li>
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
                    <article>
                        <h3>나. nebula-LP : 차량 장착용 고정밀 모바일 매핑 수집장치 촬영</h3>
                        <div class="lead">nebula-LP는 2013년부터 항법시스템 개발용 데이터수집, 시설물관리용 지도 데이터 수집등 다양하게 실무에 투입되어 활용되어 왔습니다. 결과물은 업계표준 포맷을 지원하며 다양한 후처리 소프트웨어를 바로 사용할 수 있습니다.</div>
                        <ul class="content-panel-4">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/16_nebra_lp/thumbnail_sampledata.jpg"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/16_nebra_lp/thumbnail_sampledata2.jpg"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/16_nebra_lp/thumbnail_sampledata3.jpg"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/16_nebra_lp/thumbnail_sampledata4.jpg"/>"  class="img-border" />
                                </div>
                            </li>
                        </ul>
                        <ul class="content-panel-1">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/nebula-lp-03.png"/>"  class="img-border" />
                                </div>
                            </li>
                        </ul>
                        <ul class="content-panel-2">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/nebula-lp-01.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/nebula-lp-02.png"/>"  class="img-border" />
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
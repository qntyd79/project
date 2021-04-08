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
                        <div class="gnb-box">
                            <nav class="gnb">
                                <ul>
                                    <li><a href="<c:url value="/contents/solution01.do"/>"><i class="fas fa-user-lock"></i> nebula-DSLR</a></li>
                                    <li><a href="<c:url value="/contents/solution02.do"/>"><i class="fas fa-address-card"></i> nebula-LP</a></li>
                                    <li><a href="<c:url value="/contents/solution03.do"/>"><i class="fas fa-desktop"></i> nebula-AP+</a></li>
                                    <li><a href="<c:url value="/contents/solution04.do"/>"><i class="fas fa-sitemap"></i> WingtraOne</a></li>
                                    <li><a href="<c:url value="/contents/solution05.do"/>"><i class="fas fa-users"></i> TIMMS</a></li>
                                    <li><a href="<c:url value="/contents/solution06.do"/>"><i class="fas fa-map"></i> Orbit</a></li>
                                </ul>
                            </nav>
                        </div>
                        <h2>Data Collecting Devices</h2>
                        <h3>가. nebula-DSLR : 차량 장착용 파노라마 이미지 수집장치</h3>
                        <div class="lead">nebula-DSLR는 DSLR 전자셔터 모드가 적용 된 파노라마 이미지 수집장치로 교체용 카메라 보유가 필요없으며, 관성항법장치에 기반한 좌표 자세값 획득이 가능합니다. <br>
                            또한 이미지와 로그 파일이 페어링되어 단일미디어(SSD)에 저장, 페어링 작업 및 데이터 정리가 불필요합니다. 향후 5G등 네트워크망을 통해 데이터 자동 전송이 가능합니다.<br>
                            고객의 요청에 따라 별도의 센서와 카메라의 추가 장착을 지원합니다.
                        </div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/nebula-DSLR/1.jpg"/>" class="img-border" />
                                    <h4 class="caption">Applanix AP-20E / Nikon D850 / 10.5mm Lens</h4>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="test-box-none">
                                    <div class="panel text-left">
                                        <h2 class="title">nebula-DSLR</h2>
                                        <h3 class="subtitle">차량 장착용 파노라마 이미지 수집장치</h3>
                                        <p>nebula-DSLR는 DSLR 전자셔터 모드가 적용 된 파노라마 이미지 수집장치로 교체용 카메라 보유가 필요없으며, 관성항법장치에 기반한 좌표 자세값 획득이 가능합니다.</p>
                                        <p>또한 이미지와 로그 파일이 페어링되어 단일미디어(SSD)에 저장, 페어링 작업 및 데이터 정리가 불필요합니다. 향후 5G등 네트워크망을 통해 데이터 자동 전송이 가능합니다.</p>
                                        <p>고객의 요청에 따라 별도의 센서와 카메라의 추가 장착을 지원합니다.</p>
                                        <h3 class="subtitle bold">Key facts</h3>
                                        <ul class="list">
                                            <li>DSLR 전자셔터 모드 적용</li>
                                            <li>내구성향상, 자체500만회 테스트</li>
                                            <li>좌표정확도 향상, 10cm이내</li>
                                            <li>Firmware와 DSLR PC control mode 동시 지원</li>
                                            <li>Wifi를 통한 컨트롤</li>
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
                                    <th>Nikon D850</th>
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
                                <tr>
                                    <th>System</th>
                                    <th>nebula-DSLR</th>
                                    <td>
                                        <ul class="list">
                                            <li>거리 또는 시간별 Trigger 신호 발생</li>
                                            <li>A, S, P, M 등 카메라 촬영 모드 변경</li>
                                            <li>촬영 영상의 실시간 모니터링 및 SSD 저장</li>
                                            <li>조도센서를 이용한 카메라 노출 통합 제어</li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th>산출물</th>
                                    <th>NSpherical Image 위치정보</th>
                                    <td>
                                        <ul class="list">
                                            <li>최대 16000×8000px</li>
                                            <li>GNSS Data, INS data</li>
                                        </ul>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </article>
                    <article>
                        <h3>나. nebula-DSLR : 차량 장착용 파노라마 이미지 수집장치 촬영</h3>
                        <div class="lead">거리뷰 촬영은 DMI의 정확한 거리측정으로 촬영간격을 10m로 유지하며, 고정밀
                            항법장치인 Applanix AP-20E로 부터 위도, 경도, 고도 등의 위치정보와 Roll, Pitch, Yaw 등의 카메라 자세정보를 취득합니다.
                            유효 화소수 4575만 화소인 Nikon D850 DSLR 카메라를 이용한 8256×5504px 사이즈의 고화질과 적정노출의 안정적 원본
                            데이터 취득을 위한 조도센서 기반의 자동 카메라 제어가 가능합니다.</div>
                        <ul class="content-panel-2">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/loadview01.png"/>" class="img-border" />
                                    <h4 class="caption">거리뷰 쵤영영상</h4>
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/loadview02.png"/>" class="img-border" />
                                    <h4 class="caption">거리뷰 쵤영영상</h4>
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
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
                        <h3>가. WingtraOne : UAV형 항공영상 수집장비</h3>
                        <div class="lead">WingtraOne은 스위스에서 개발된 항공 사진측량과 Mapping을 위한 수직이착륙(VTOL-Vertical Take Off & Landing)형의 고정익 UAV로 ㈜씨투엘이큅먼트에서 국내 보급을 담당하고 있습니다. WingtraOne은 최대 40분의 비행시간과 최소 GSD 0.7cm/px급의 정사영상을 확보할 수 있으며, GSD 3cm/px급으로 최대 4.0㎢의 면적 촬영이 가능합니다.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/17_wingtra/1.jpg"/>"  class="img-border" />
                                    <h4 class="caption">Sony RX1RII / 35mm Lens / 42MP</h4>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="test-box-none">
                                    <div class="panel text-left">
                                        <h2 class="title">WingtraOne</h2>
                                        <h3 class="subtitle">UAV형 항공영상 수집장비</h3>
                                        <p>WingtraOne PPK drone performs professional aerial surveys that combine broad coverage, high resolution and ultra precise accuracy. For example, in a single one-hour flight, the WingtraOne can cover 130 ha (320 ac), which is equal to 240 football fields and deliver maps at GSDs below 1 cm/px (0.4 in/px) with absolute accuracy down to 1 cm (0.4 in).</p>
                                        <p>Its VTOL design allows the WingtraOne to take-off like a helicopter and transitions into forward cruise flight to reach the speed of fixed-wing airplanes. In order to land, the WingtraOne switches back to hover flight and descends vertically</p>
                                        <!-- <p>More information on <a href="http://www.wingtra.com" target="_blank">www.wingtra.com</a></p> -->
                                        <h3 class="subtitle bold">Key facts</h3>
                                        <ul class="list">
                                            <li>Down to 0.7cm/px (0.3 in/px) GSD</li>
                                            <li>Down to 1cm absolute accuracy</li>
                                            <li>Covers 400ha at 3cm/px(988ac at 1.2in/px) GSD</li>
                                            <li>Hands-off: truly safe & easy to use</li>
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
                                    <th>Sony RX1R II</th>
                                    <td>
                                        <ul class="list">
                                            <li>Technical specification : 35 mm lens, Full-frame sensor, 42 MP</li>
                                            <li>Main quality features : Ultra-high quality, best coverage to GSD ratio, sub-cm GSD</li>
                                            <li>Camera weight(incl. mount) : 575g (1.27lb)</li>
                                            <li>GSD Range : 0.7-25cm/px / 0.28-9.8in/px</li>
                                            <li>Coverage at Lowest GSD* : 100ha (at0.7cm/px) at 57m flight altitude 247ac (at1.18in/px) at 188ft flight altitude</li>
                                            <li>Coverage at 120m/394 feet* : 210ha (at1.5 cm/px) 520ac (at0.61 in/px)</li>
                                        </ul>
                                    </td>
                                </tr>                               
                            </tbody>
                        </table>
                    </article>
                    <article>
                        <h3>나. WingtraOne : UAV형 항공영상 수집장비 촬영</h3>
                        <div class="lead">김포, 판교, 별내, 동탄 등 전국적으로 산재한 소규모 신도시 개발 지역에 대한 항공영상의 갱신 주기를 단축시킬 수 있습니다.<br>
                            Sony RX1R II(4200만 화소)의 미러리스 카메라와 1회 40분 비행으로 GSD 3㎝급으로 4㎢의 넓은 면적 촬영이 가능하며, 필요 시 GPS 측량 기반의 대공표지 설치로 정확도 향상시킬 수 있으며 고화질이 항공영상 촬영이 가능합니다.
                        </div>
                        <ul class="content-panel-3">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/17_wingtra/2.jpg"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/17_wingtra/3.jpg"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="http://c2l-equipment.com/images/products/17_wingtra/5.jpg"/>"  class="img-border" />
                                </div>
                            </li>
                        </ul>
                    </article>                   
                    <article>
                        <h4>2. 대전 동구 일원</h4>
                        <ul class="content-panel-2">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/3/1.png" />"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/3/3.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/3/4.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/3/5.png"/>"  class="img-border" />
                                </div>
                            </li>
                        </ul>
                    </article>
                    <article>
                        <h4>3. 대전 유성구 일원</h4>
                        <ul class="content-panel-2">
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/1/1.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/1/3.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/1/4.png"/>"  class="img-border" />
                                </div>
                            </li>
                            <li>
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/Wingtra-Pix4D/1/5.png"/>"  class="img-border" />
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
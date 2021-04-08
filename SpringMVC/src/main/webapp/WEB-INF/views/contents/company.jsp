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
                        <h2>About us</h2>
                        <div class="lead">2D, 3D 데이터 수집 및 처리, 항법, 이미지 프로세싱 등 다양한 지식과 프로젝트경험을 가진 전문 개발 인력으로 구성.<br>
                            주요 사업영역은 건설, 토목, 재해, 재난관리를 위한 지형 및 시설물 데이터 수집장비(하드웨어) 개발 그리고 변환 소프트웨어 개발.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-clipboard"></i></div>
                                        <h1 class="title">MMS 기반 서비스를 위한 <br>솔루션 공급 및 컨설팅</h1>
                                        <div class="subtitle">통합 후처리 및 보정 솔루션 제공<br>
                                            공간정보 추출 및 가공 솔루션 제공<br>
                                            서비스 솔루션 제공 및 각종 컨설팅 제공</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-road"></i></div>
                                        <h1 class="title">MMS 데이터 수집 및 공간정보 <br>가공 성과품 공급</h1>
                                        <div class="subtitle">통지상, 공중, 실내 MMS 수집<br>
                                            수집 데이터 가공 및 성과품 공급<br>
                                            수집 데이터 선별 및 성과품 공급</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="test-box last-child">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-clipboard"></i></div>
                                        <h1 class="title">MMS 구성 멀티센서 <br>개발 및 공급</h1>
                                        <div class="subtitle">DSLR 전방위 카메라 자체 개발 및 공급<br>
                                            Applanix 사의 GPS/INS 공급<br>
                                            Quanergy 사의 LiDAR 공급</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h3>Company</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <dl>
                                    <dt>회사명</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>주식회사 이노맵스</li>
                                        </ul>
                                    </dd>
                                    <dt>사업자등록번호</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>541-87-00195</li>
                                        </ul>
                                    </dd>
                                    <dt>대표자</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>이기형</li>
                                        </ul>
                                    </dd>
                                    <dt>설립일</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>2015년 08월11일</li>
                                        </ul>
                                    </dd>
                                    <dt>주소</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>본사 : 대구광역시 달성군 현풍면 테크노중앙대로 333 산학협력관 304-B호</li>
                                            <li>판교 : 경기도 성남시 분당구 판교역로 230 삼환하이펙스 B동 602호</li>
                                            <li>대전 : 대전광역시 유성구 문지동 문지로316번길 38-20 101호</li>
                                        </ul>
                                    </dd>
                                    <dt>전화번호</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>본사 : TEL. 053-611-6910 FAX. 053-611-6911</li>
                                            <li>판교 : TEL. 031-705-6910 FAX. 031-698-7859</li>
                                            <li>대전 : TEL. 042-861-6910 </li>
                                        </ul>
                                    </dd>
                                    <dt>보유기술</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>비전시스템을 이용한 위치 결정 장치 및 방법</li>
                                            <li>위치 계산 장치 및 방법</li>
                                            <li>스테레오카메라를 이용한 모바일맵핑 시스템 및 모바일맵핑 시스템의 포인트클라우드 생성방법</li>
                                        </ul>
                                    </dd>
                                    <dt>주요사업분야</dt>
                                    <dd>
                                        <ul class="list">
                                            <li>System Integration</li>
                                            <li>Virtual Reality & 멀티미디어 콘텐츠</li>
                                            <li>소프트웨어 개발</li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h3>History</h3>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-12">
                                <div class="accordion-box">
                                    <button class="accordion"><i class="fas fa-bars"></i> 2019</button>
                                    <div id="accordion1" class="accordion-content">
                                        <ul class="list">
                                            <li>한국항공우주연구원 충돌회피 유도 법칙 검증용 비행제어시스템 제작 <span class="badge">2018.06</span></li>
                                            <li>2017 국토교통기술대전 출품 <span class="badge">2018.05</span></li>
                                            <li>전자부품연구원 육-공 자율협력 임무수행을 위한 UAV센서 플랫폼 개발 <span class="badge">2018.04</span></li>
                                            <li>한국기계연구원 무인차량용(UGV) MMS제작(Nebula_LP) <span class="badge">2018.03</span></li>
                                            <li>씨이엔코퍼레이션 운영 솔루션 소프트웨어 개발 <span class="badge">2018.03</span></li>
                                            <li>이엔지정보기술 차량용 MMS제작(Nebula_LP) <span class="badge">2018.02</span></li>
                                            <li>한국항공우주연구원 무인항공기용(UAV) MMS제작(Nebula_AP) <span class="badge">2018.02</span></li>
                                        </ul>
                                    </div>
                                    <button class="accordion"><i class="fas fa-bars"></i> 2018</button>
                                    <div id="accordion2" class="accordion-content">
                                        <ul class="list">
                                            <li>한국항공우주연구원 충돌회피 유도 법칙 검증용 비행제어시스템 제작 <span class="badge">2017.06</span></li>
                                            <li>2017 국토교통기술대전 출품 <span class="badge">2017.05</span></li>
                                            <li>전자부품연구원 육-공 자율협력 임무수행을 위한 UAV센서 플랫폼 개발 <span class="badge">2017.04</span></li>
                                            <li>한국기계연구원 무인차량용(UGV) MMS제작(Nebula_LP) <span class="badge">2017.03</span></li>
                                            <li>씨이엔코퍼레이션 운영 솔루션 소프트웨어 개발 <span class="badge">2017.03</span></li>
                                            <li>이엔지정보기술 차량용 MMS제작(Nebula_LP) <span class="badge">2017.02</span></li>
                                            <li>한국항공우주연구원 무인항공기용(UAV) MMS제작(Nebula_AP) <span class="badge">2017.02</span></li>
                                        </ul>
                                    </div>
                                    <button class="accordion"><i class="fas fa-bars"></i> 2017</button>
                                    <div id="accordion3" class="accordion-content">
                                        <ul class="list">
                                            <li>한국항공우주연구원 충돌회피 유도 법칙 검증용 비행제어시스템 제작 <span class="badge">2017.06</span></li>
                                            <li>2017 국토교통기술대전 출품 <span class="badge">2017.05</span></li>
                                            <li>전자부품연구원 육-공 자율협력 임무수행을 위한 UAV센서 플랫폼 개발 <span class="badge">2017.04</span></li>
                                            <li>한국기계연구원 무인차량용(UGV) MMS제작(Nebula_LP) <span class="badge">2017.03</span></li>
                                            <li>씨이엔코퍼레이션 운영 솔루션 소프트웨어 개발 <span class="badge">2017.03</span></li>
                                            <li>이엔지정보기술 차량용 MMS제작(Nebula_LP) <span class="badge">2017.02</span></li>
                                            <li>한국항공우주연구원 무인항공기용(UAV) MMS제작(Nebula_AP) <span class="badge">2017.02</span></li>
                                        </ul>
                                    </div>
                                    <button class="accordion"><i class="fas fa-bars"></i> 2016</button>
                                    <div id="accordion4" class="accordion-content">
                                        <ul class="list">
                                            <li>한국항공우주연구원 충돌회피 유도 법칙 검증용 비행제어시스템 제작 <span class="badge">2017.06</span></li>
                                            <li>2017 국토교통기술대전 출품 <span class="badge">2017.05</span></li>
                                            <li>전자부품연구원 육-공 자율협력 임무수행을 위한 UAV센서 플랫폼 개발 <span class="badge">2017.04</span></li>
                                            <li>한국기계연구원 무인차량용(UGV) MMS제작(Nebula_LP) <span class="badge">2017.03</span></li>
                                            <li>씨이엔코퍼레이션 운영 솔루션 소프트웨어 개발 <span class="badge">2017.03</span></li>
                                            <li>이엔지정보기술 차량용 MMS제작(Nebula_LP) <span class="badge">2017.02</span></li>
                                            <li>한국항공우주연구원 무인항공기용(UAV) MMS제작(Nebula_AP) <span class="badge">2017.02</span></li>
                                        </ul>
                                    </div>
                                    <button class="accordion"><i class="fas fa-bars"></i> 2015</button>
                                    <div id="accordion5" class="accordion-content">
                                        <ul class="list">
                                            <li>한국항공우주연구원 충돌회피 유도 법칙 검증용 비행제어시스템 제작 <span class="badge">2017.06</span></li>
                                            <li>2017 국토교통기술대전 출품 <span class="badge">2017.05</span></li>
                                            <li>전자부품연구원 육-공 자율협력 임무수행을 위한 UAV센서 플랫폼 개발 <span class="badge">2017.04</span></li>
                                            <li>한국기계연구원 무인차량용(UGV) MMS제작(Nebula_LP) <span class="badge">2017.03</span></li>
                                            <li>씨이엔코퍼레이션 운영 솔루션 소프트웨어 개발 <span class="badge">2017.03</span></li>
                                            <li>이엔지정보기술 차량용 MMS제작(Nebula_LP) <span class="badge">2017.02</span></li>
                                            <li>한국항공우주연구원 무인항공기용(UAV) MMS제작(Nebula_AP) <span class="badge">2017.02</span></li>
                                        </ul>
                                    </div>
                                    <button class="accordion accordion-last"><i class="fas fa-bars"></i> 2014</button>
                                    <div id="accordion6" class="accordion-content accordion-content-last">
                                        <ul class="list">
                                            <li>한국항공우주연구원 충돌회피 유도 법칙 검증용 비행제어시스템 제작 <span class="badge">2017.06</span></li>
                                            <li>2017 국토교통기술대전 출품 <span class="badge">2017.05</span></li>
                                            <li>전자부품연구원 육-공 자율협력 임무수행을 위한 UAV센서 플랫폼 개발 <span class="badge">2017.04</span></li>
                                            <li>한국기계연구원 무인차량용(UGV) MMS제작(Nebula_LP) <span class="badge">2017.03</span></li>
                                            <li>씨이엔코퍼레이션 운영 솔루션 소프트웨어 개발 <span class="badge">2017.03</span></li>
                                            <li>이엔지정보기술 차량용 MMS제작(Nebula_LP) <span class="badge">2017.02</span></li>
                                            <li>한국항공우주연구원 무인항공기용(UAV) MMS제작(Nebula_AP) <span class="badge">2017.02</span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h3>Partners</h3>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-3">
                                    <li>
                                        <div class="panel text-center">
                                            <div class="thumbnail">
                                               <img src="<c:url value="http://c2l-equipment.com/images/company/3.jpg"/>"/>
                                            </div>
                                            <h1 class="title">Quanergy</h1>
                                            <h2 class="subtitle">LiDAR Sensors</h2>
                                            <h3 class="desc">Quanergy is the leading manufacturer of
                                                3D time-of-flight LiDAR sensors designed from the ground up to meet all four key commercialization criteria</h3>
                                            <h4 class="summary summary-last-child">http://quanergy.com</h4>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel text-center">
                                            <div class="thumbnail">
                                                <img src="<c:url value="http://c2l-equipment.com/images/company/1.jpg" />"/>
                                            </div>
                                            <h1 class="title">Applanix</h1>
                                            <h2 class="subtitle">Inertial Navigation System</h2>
                                            <h3 class="desc">When most organizations talk of being a global enterprise, the label is more figurative than literal. As a world leader in products and solutions </h3>
                                            <h4 class="summary summary-last-child">http://www.applanix.com</h4>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel text-center">
                                            <div class="thumbnail">
                                                <img src="<c:url value="http://c2l-equipment.com/images/company/2.jpg" />"/>
                                            </div>
                                            <h1 class="title">Orbit</h1>
                                            <h2 class="subtitle">GeoSpatial Technologies</h2>
                                            <h3 class="desc">orbit GeoSpatial Technologies provides product and serices to maximize the effective integration of geospatial data throughout your organization's workflows</h3>
                                            <h4 class="summary summary-last-child">http://www.orbitgt.com</h4>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel text-center">
                                            <div class="thumbnail">
                                                <img src="<c:url value="http://c2l-equipment.com/images/company/5.jpg" />"/>
                                            </div>
                                            <h1 class="title">Wingtra</h1>
                                            <h2 class="subtitle">VTOL Drone for Mapping & Surveying</h2>
                                            <h3 class="desc">Meet WingtraOne: brilliant image quality,
                                                greater coverage and usage simplicity make WingtraOne the best choice for commercial drone applications</h3>
                                            <h4 class="summary summary-last-child">https://wingtra.com</h4>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel text-center">
                                            <div class="thumbnail">
                                                <img src="<c:url value="http://c2l-equipment.com/images/company/6.jpg" />"/>
                                            </div>
                                            <h1 class="title">SeagullUAV</h1>
                                            <h2 class="subtitle">UAV Camera Control Systems</h2>
                                            <h3 class="desc">Seagull UAV is a Danish based company which was founded in 2015 with the passion of creating the best camera control systems</h3>
                                            <h4 class="summary summary-last-child">http://www.seagullUAV.com</h4>
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
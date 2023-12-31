<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
            <div class="content-full-img01">
                <div class="bgtitle">
                	<c:import url="/WEB-INF/views/include/content_header.jsp"/>
                </div>
            </div>
            <div class="content-full-bg01-hidden">
                <section class="content">
                    <article>
                        <h2>Scroll</h2>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="scroll-box">
                                    <ul class="scroll">
                                        <li rel="scroll1" class="active">Works</li>
                                        <li rel="scroll2">Paper</li>
                                        <li rel="scroll3">Contact</li>
                                    </ul>
                                    <div class="scroll-container">
                                        <div id="scroll1" class="scroll-content">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/slide/scroll-1.jpg" />"/>
                                            </div>
                                        </div>
                                        <div id="scroll2" class="scroll-content">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/slide/scroll-2.jpg" />"/>
                                            </div>
                                        </div>
                                        <div id="scroll3" class="scroll-content">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/slide/scroll-3.jpg" />"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <!-- 
                    <article>
                        <h2>WingtraOne</h2>
                        <div class="row">
                            <div class="col-sm12 col-md-12">
                                <div class="video-box">
                                    <video width="100%" muted controls autoplay loop class="video">
                                        <source src="images/wingtra.mp4" type="video/mp4">
                                      <source src="movie.ogg" type="video/ogg">
                                    </video>
                                    <iframe width="1920" height="1080" src="https://www.youtube.com/embed/KwkCgDMKTTs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                </div>
                            </div>
                        </div>
                    </article> -->
                    <article>
                        <h2>Accordion</h2>
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
                        <h2>Panel</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-lg-3">
                                <div class="test-box">
                                    <div class="panel">
                                        <div class="icon-top"><i class="fas fa-clipboard"></i></div>
                                        <h1 class="title">채용문의</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
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
                                        <div class="icon-top"><i class="fas fa-desktop"></i></div>
                                        <h1 class="title">채용문의</h1>
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
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
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
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
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
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
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
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
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
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
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
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
                                        <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                        <div class="btn-group">
                                            <input type="button" value="자세히보기">
                                            <input type="button" value="자세히보기">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>Tabs</h2>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="tabs-box">
                                    <ul class="tabs">
                                        <li rel="tab1" class="active">텝메뉴1</li>
                                        <li rel="tab2">텝메뉴2</li>
                                        <li rel="tab3">텝메뉴3</li>
                                    </ul>
                                    <div class="tab-container">
                                        <div id="tab1" class="tab-content">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/slide/work-1.jpg" />"/>
                                            </div>
                                        </div>
                                        <div id="tab2" class="tab-content">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/slide/work-2.jpg" />"/>
                                            </div>
                                        </div>
                                        <div id="tab3" class="tab-content">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/slide/work-3.jpg" />"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
            <div class="content-full-img03">
                <div class="bgtitle">
                	<c:import url="/WEB-INF/views/include/content_header.jsp"/>
                </div>
            </div>
            <div class="content-full-bg03-hidden">
                <section class="content">
                    <article>
                        <h2>content-data-1</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-data-1">
                                    <li>
                                        <div class="panel-left">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/portfolio/portfolios_0001.jpg" />"/>
                                            </div>
                                        </div>
                                        <div class="panel-right text-left">
                                            <h1 class="title">타이틀을 입력해주세요</h1>
                                            <h2 class="subtitle">유효한 라이센스가 있지만 라이센스의 동시 사용 수가 초과되었습니다. <Br>조직의 다른 사람이 귀하의 라이센스를 사용하고 있거나 소프트웨어가 올바르게 종료되지 않았으며 <br>라이센스가 온라인 라이센스 서버에 의해 공개되지 않았습니다.</h2>
                                            <h3 class="desc">포인트 클라우드 가져 오기는 포인트 클라우드 파일을 선택하면 자동으로 시작될 수 있으며, 컨텐츠 관리자를 사용하면 가져 오기를 작업 관리자에 위임 할 수 있습니다. </h3>
                                            <p>현재 작업 공간에서 열린 모든 데이터 세트가 DataSet List에 나열됩니다. 데이터 세트 목록에서 데이터 세트 사용자 이름 이 표시되고 가시성 을 설정할 수 있습니다. 그러나 DataSet List에서 훨씬 많은 데이터 세트 정보와 작업 을보고 관리 할 수 ​​있습니다.<br>
                                                포인트 클라우드 가져 오기는 포인트 클라우드 파일을 선택하면 자동으로 시작될 수 있으며, 컨텐츠 관리자를 사용하면 가져 오기를 작업 관리자에 위임 할 수 있습니다. </p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>content-data-2</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-data-2">
                                    <li>
                                        <div class=" text-left">
                                            <h1 class="title">채용문의</h1>
                                            <h2 class="subtitle text-left">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                            <h3 class="desc text-left">포인트 클라우드 가져 오기는 포인트 클라우드 파일을 선택하면 자동으로 시작될 수 있으며, 컨텐츠 관리자를 사용하면 가져 오기를 작업 관리자에 위임 할 수 있습니다.</h3>
                                            <h1 class="title">자주있는질문 <a href="#"><span class="more">더보기</span></a></h1>
                                            <hr>
                                            <ul class="list">
                                                <li><a href="#">데이터 세트 생성, 열기 및 제거</a></li>
                                                <li><a href="#">데이터 세트 컨텍스트 메뉴</a></li>
                                                <li><a href="#">DATASET 목록의 데이터 집합 작업</a></li>
                                                <li><a href="#">데이터 집합 목록 옵션 메뉴</a></li>
                                                <li><a href="#">데이터 세트 및 데이터 세트 목록</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class=" text-left">
                                            <h1 class="title">채용문의</h1>
                                            <h2 class="subtitle text-left">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                            <h3 class="desc text-left">포인트 클라우드 가져 오기는 포인트 클라우드 파일을 선택하면 자동으로 시작될 수 있으며, 컨텐츠 관리자를 사용하면 가져 오기를 작업 관리자에 위임 할 수 있습니다.</h3>
                                            <h1 class="title">자주있는질문 <a href="#"><span class="more">더보기</span></a></h1>
                                            <hr>
                                            <ul class="list">
                                                <li><a href="#">데이터 세트 생성, 열기 및 제거</a></li>
                                                <li><a href="#">데이터 세트 컨텍스트 메뉴</a></li>
                                                <li><a href="#">DATASET 목록의 데이터 집합 작업</a></li>
                                                <li><a href="#">데이터 집합 목록 옵션 메뉴</a></li>
                                                <li><a href="#">데이터 세트 및 데이터 세트 목록</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel-left">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/portfolio/portfolios_0002.jpg" />"/>
                                            </div>
                                        </div>
                                        <div class="panel-right text-left">
                                            <h1 class="title">InnoMaps</h1>
                                            <h2 class="subtitle">유효한 라이센스가 있지만 라이센스의 동시 사용 수가 초과되었습니다.</h2>
                                            <h3 class="desc">포인트 클라우드 가져 오기는 포인트 클라우드 파일을 선택하면 자동으로 시작될 수 있으며, 컨텐츠 관리자를 사용하면 가져 오기를 작업 관리자에 위임 할 수 있습니다.</h3>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel-left">
                                            <div class="thumbnail">
                                                <img src="<c:url value="/resources/images/portfolio/portfolios_0003.jpg" />"/>
                                            </div>
                                        </div>
                                        <div class="panel-right text-left">
                                            <h1 class="title">InnoMaps</h1>
                                            <h2 class="subtitle">유효한 라이센스가 있지만 라이센스의 동시 사용 수가 초과되었습니다.</h2>
                                            <h3 class="desc">포인트 클라우드 가져 오기는 포인트 클라우드 파일을 선택하면 자동으로 시작될 수 있으며, 컨텐츠 관리자를 사용하면 가져 오기를 작업 관리자에 위임 할 수 있습니다.</h3>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>content-data-3</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-data-3">
                                    <li>
                                        <div class="panel text-left">
                                            <h1 class="title">공지사항 <a href="#"><span class="more">더보기</span></a></h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h3 class="desc">기술개발을 지원합니다.</h3>
                                            <hr>
                                            <ul class="list">
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel text-left">
                                            <h1 class="title">공지사항 <a href="#"><span class="more">더보기</span></a></h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h3 class="desc">기술개발을 지원합니다.</h3>
                                            <hr>
                                            <ul class="list">
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel text-left">
                                            <h1 class="title">공지사항 <a href="#"><span class="more">더보기</span></a></h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h3 class="desc">기술개발을 지원합니다.</h3>
                                            <hr>
                                            <ul class="list">
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                                <li><a href="#">서버점검으로 인한 가동중지</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>content-data-4</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-data-4">
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0001.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0002.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0003.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0004.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0005.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0006.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0007.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/thumbnail_0008.jpg" />"/>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                </section>
            </div>
            <div class="content-full-img04">
            	<div class="bgtitle">
                	<c:import url="/WEB-INF/views/include/content_header.jsp"/>
                </div>
            </div>
            <div class="content-full-bg04-hidden">
                <section class="content">
                    <article>
                        <h2>content-panel-1</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-1">
                                    <li>
                                        <div class="panel">
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h3 class="desc">How the VTOL mapping drone WingtraOne works</h3>
                                            <h4 class="summary summary-last-child">올가을 출시</h4>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>content-panel-2</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-2">
                                    <li>
                                        <div class="panel">
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h3 class="desc">How the VTOL mapping drone WingtraOne works</h3>
                                            <h4 class="summary">올가을 출시</h4>
                                            <ul class="list">
                                                <li><a href="#">데이터 세트 생성, 열기 및 제거</a></li>
                                                <li><a href="#">데이터 세트 컨텍스트 메뉴</a></li>
                                                <li><a href="#">DATASET 목록의 데이터 집합 작업</a></li>
                                                <li><a href="#">데이터 집합 목록 옵션 메뉴</a></li>
                                                <li><a href="#">데이터 세트 및 데이터 세트 목록</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel">
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h3 class="desc">How the VTOL mapping drone WingtraOne works</h3>
                                            <h4 class="summary">올가을 출시</h4>
                                            <ul class="list">
                                                <li><a href="#">데이터 세트 생성, 열기 및 제거</a></li>
                                                <li><a href="#">데이터 세트 컨텍스트 메뉴</a></li>
                                                <li><a href="#">DATASET 목록의 데이터 집합 작업</a></li>
                                                <li><a href="#">데이터 집합 목록 옵션 메뉴</a></li>
                                                <li><a href="#">데이터 세트 및 데이터 세트 목록</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>content-panel-3</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-3">
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <div class="icon-top">
                                                    <i class="fas fa-satellite-dish"></i>
                                                </div>
                                                <h1 class="title">공지사항</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                                <h3 class="desc">How the VTOL mapping drone WingtraOne works</h3>
                                                <h4 class="summary summary-last-child">올가을 출시</h4>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <div class="icon-top">
                                                    <i class="fas fa-microchip"></i>
                                                </div>
                                                <h1 class="title">자주있는질문</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                                <h3 class="desc">How the VTOL mapping drone WingtraOne works</h3>
                                                <h4 class="summary summary-last-child">올가을 출시</h4>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <div class="icon-top">
                                                    <i class="fas fa-satellite"></i>
                                                </div>
                                                <h1 class="title">문의사항</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                                <h3 class="desc">How the VTOL mapping drone WingtraOne works</h3>
                                                <h4 class="summary summary-last-child">올가을 출시</h4>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>content-panel-4</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-4">
                                    <li>
                                        <div class="panel">
                                            <div class="icon-top"><i class="fas fa-bezier-curve"></i></div>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel">
                                            <div class="icon-top"><i class="fas fa-clone"></i></div>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel">
                                            <div class="icon-top"><i class="fas fa-object-group"></i></div>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="panel">
                                            <div class="icon-top"><i class="fas fa-swatchbook"></i></div>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-1-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="더보기">
                                                <input type="button" value="더보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-2-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="더보기">
                                                <input type="button" value="더보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-3-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="더보기">
                                                <input type="button" value="더보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-4-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <h4 class="summary">올가을 출시</h4>
                                            <div class="btn-group">
                                                <input type="button" value="더보기">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-5-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                            <div class="social-box">
                                                <a href="#"><i class="fab fa-facebook"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-google"></i></a>
                                                <a href="#"><i class="fab fa-linkedin"></i></a>
                                                <a href="#"><i class="fab fa-vimeo"></i></a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-6-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                            <div class="social-box">
                                                <a href="#"><i class="fab fa-facebook"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-google"></i></a>
                                                <a href="#"><i class="fab fa-linkedin"></i></a>
                                                <a href="#"><i class="fab fa-vimeo"></i></a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-7-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                            <div class="social-box">
                                                <a href="#"><i class="fab fa-facebook"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-google"></i></a>
                                                <a href="#"><i class="fab fa-linkedin"></i></a>
                                                <a href="#"><i class="fab fa-vimeo"></i></a>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/thumbnail/post-8-thumb.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="자세히보기">
                                            </div>
                                            <div class="social-box">
                                                <a href="#"><i class="fab fa-facebook"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                                <a href="#"><i class="fab fa-google"></i></a>
                                                <a href="#"><i class="fab fa-linkedin"></i></a>
                                                <a href="#"><i class="fab fa-vimeo"></i></a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </article>
                    <article>
                        <h2>content-panel-5</h2>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <ul class="content-panel-5">
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0001.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="더보기" class="btn-block">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0002.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="더보기" class="btn-block">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0003.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="더보기" class="btn-block">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0004.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="더보기" class="btn-block">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0005.jpg" />"/>
                                            <h1 class="title">채용문의1</h1>
                                            <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                            <div class="btn-group">
                                                <input type="button" value="더보기" class="btn-block">
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <h1 class="title">채용문의1</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                                <div class="icon-bottom"><i class="fas fa-pen-square"></i></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <h1 class="title">채용문의1</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                                <div class="icon-bottom"><i class="fas fa-download"></i></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <h1 class="title">채용문의1</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                                <div class="icon-bottom"><i class="fas fa-file-archive"></i></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <h1 class="title">채용문의1</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                                <div class="icon-bottom"><i class="fas fa-cogs"></i></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <div class="panel">
                                                <h1 class="title">채용문의1</h1>
                                                <h2 class="subtitle">Technical Architecture 컨설팅 시스템 구축 및 운영 지원 지속적인 제품, 서비스 지원</h2>
                                                <div class="icon-bottom"><i class="fas fa-comments"></i></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0006.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0007.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0008.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0009.jpg" />"/>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="thumbnail">
                                            <img src="<c:url value="/resources/images/members/members_0010.jpg" /> "/>
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
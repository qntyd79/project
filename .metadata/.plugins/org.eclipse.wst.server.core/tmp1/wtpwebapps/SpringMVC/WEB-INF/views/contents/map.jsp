<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/head.jsp"/>
<!DOCTYPE html>
<html lang="kor">

<body>
    <div id="preloader">
        <div id="status"></div>
    </div>
    <div id="wrap">
        <div id="header-wrap">
            <div class="header-box">
                <header class="header" style="height:0;">
                    <!-- <? include ('../include/gnb.html');?> -->
                    <!-- <div class="logo-box">
                        <h1 class="logo"><a href="/jhbbs/index.html"><img src="/jhbbs/images/logo/logo.png" width="150px" /></a></h1>
                    </div> -->
                </header>
                <header class="map-header" style="min-width:1280px;" >
                    <div class="logo-box" style="background: #333;">
                        <h1 class="logo">
                            <a href="index.do" style="color: #fff;">GIS공간정보서비스</a>
                        </h1>
                    </div>
                    <div class="mnb-box">
                        <nav class="mnb">
                            <ul>
                                <li><a><i class="fas fa-chevron-left" aria-hidden="true"></i><br>이전</a></li>
                                <li><a><i class="fas fa-chevron-right" aria-hidden="true"></i><br>다음</a></li>
                                <li><a><i class="fas fa-arrows-alt" aria-hidden="true"></i><br>전체보기</a></li>
                                <li><a class="zoom-in"><i class="fas fa-search-plus" aria-hidden="true"></i><br>확대</a></li>
                                <li><a class="zoom-out"><i class="fas fa-search-minus" aria-hidden="true"></i><br>축소</a></li>
                                <li><a class="addLand"><i class="fas fa-info-circle" aria-hidden="true"></i><br>지적도</a></li>
                                <li><a><i class="fas fa-bars" aria-hidden="true"></i><br>거리</a></li>
                                <li><a><i class="fas fa-object-ungroup" aria-hidden="true"></i><br>면적</a></li>
                                <li><a class="resetLocation"><i class="fas fa-sync-alt"></i><br>초기화</a></li>
                                <li><a><i class="fas fa-dot-circle"></i><br>도근점</a></li>
                                <li><a><i class="far fa-dot-circle"></i><br>지적삼각점</a></li>
                                <li><a><i class="fas fa-plus-circle"></i><br>삼각보조점</a></li>
                                <li><a><i class="far fa-plus-square"></i><br>복합기준점</a></li>
                                <li><a class="currentLocation"><i class="fas fa-map-marker" aria-hidden="true"></i><br>내위치</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>
            </div>
        </div>
        <div id="content-wrap">
            <div class="clearfix">
                <div id="aside-wrap">
                	<button class="toggle-btn" value="open"><i class="fas fa-chevron-right" aria-hidden="true"></i></button>
                    <div class="aside-menu-box">
                        <nav class="aside-menu">
                            <ul>
                                <li><a class="zoom-in"><i class="fas fa-search-plus" aria-hidden="true"></i><br>확대</a></li>
                                <li><a class="zoom-out"><i class="fas fa-search-minus" aria-hidden="true"></i><br>축소</a></li>
                                <li><a class="addLand"><i class="fas fa-info-circle" aria-hidden="true"></i><br>지적도</a></li>
                                <li><a class="resetLocation"><i class="fas fa-sync-alt"></i><br>초기화</a></li>
                                <li><a class="currentLocation"><i class="fas fa-map-marker" aria-hidden="true"></i><br>내위치</a></li>
                            </ul>
                        </nav>
                    </div>
                    
                    <div class="aside-box">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="tabs-box">
                                        <!--tab start-->
                                        <ul class="tabs">
                                            <li class="active" rel="tab1">통합검색</li>
                                            <li rel="tab2">상세검색</li>
                                            <li rel="tab3">기초구역</li>
                                            <!--<li rel="tab4">알림게시판</li>-->
                                        </ul>
                                        <div class="tab-container">
                                            <div id="tab1" class="tab-content">
                                                <ul class="content-data-1">
                                                    <li>
                                                        <div class="panel text-left">
                                                            <h1 class="title">통합검색</h1>
                                                            <form>
                                                                <fieldset>
                                                                    <legend>Borad Write Form</legend>
                                                                    <input type="text" id="name" name="name" style="width: 100%;"> <input type="button" value="검색" / class="default" style="width: 100%; margin-top: 10px;">
                                                                    <p style="padding-top: 10px;">예) 서울 강남구 삼성동 25/ 종로구
                                                                        경희궁 1길 / 종로구 이마빌딩</p>
                                                                </fieldset>
                                                            </form>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div id="tab2" class="tab-content">
                                                <ul class="subtabs">
                                                    <li class="active" rel="subtab1">도로명주소</li>
                                                    <li rel="subtab2">지번</li>
                                                    <li rel="subtab3">건물명</li>
                                                </ul>
                                                <div class="subtab-container">
                                                    <div id="subtab1" class="subtab-content">
                                                        <ul class="content-data-1">
                                                            <li>
                                                                <div class="panel text-left">
                                                                    <form>
                                                                        <fieldset>
                                                                            <legend>Borad Write Form</legend>
                                                                            <label for="attach"> 시도 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 시군구 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 도로명 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 건물번호 </label> <input type="text" id="name" name="name" style="width: 50px;">
                                                                            - <input type="text" id="name" name="name" style="width: 50px;"> 번 <input type="button" value="검색" class="default" style="width: 100%; margin-top: 10px;">
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div id="subtab2" class="subtab-content">
                                                        <ul class="content-data-1">
                                                            <li>
                                                                <div class="panel text-left">
                                                                    <form>
                                                                        <fieldset>
                                                                            <legend>Borad Write Form</legend>
                                                                            <label for="attach"> 시도 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 시군구 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 읍면동 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 리 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 번지 </label> <input type="checkbox" name="notice" value="1" id="notice">
                                                                            산 <input type="text" id="name" name="name" style="width: 50px;"> - <input type="text" id="name" name="name" style="width: 50px;">
                                                                            번 <input type="button" value="검색" class="default" style="width: 100%; margin-top: 10px;">
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div id="subtab3" class="subtab-content">
                                                        <ul class="content-data-1">
                                                            <li>
                                                                <div class="panel text-left">
                                                                    <form>
                                                                        <fieldset>
                                                                            <legend>Borad Write Form</legend>
                                                                            <label for="attach"> 시도 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 시군구 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 읍면동 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 건물명 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <input type="button" value="검색" class="default" style="width: 100%; margin-top: 10px;">
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="tab3" class="tab-content">
                                                <ul class="subtabs">
                                                    <li class="active" rel="subtab11">법정동/행정동</li>
                                                    <li rel="subtab22">교차로/도로</li>
                                                    <li rel="subtab33">개발지역</li>
                                                </ul>
                                                <div class="subtab-container">
                                                    <div id="subtab11" class="subtab-content">
                                                        <ul class="content-data-1">
                                                            <li>
                                                                <div class="panel text-left">
                                                                    <form>
                                                                        <fieldset>
                                                                            <legend>Borad Write Form</legend>
                                                                            <label for="attach"> 시도 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 시군구 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 읍명동 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 본번/부번 </label> <input type="checkbox" name="notice" value="1" id="notice">
                                                                            산 <input type="text" id="name" name="name" style="width: 50px;"> - <input type="text" id="name" name="name" style="width: 50px;">
                                                                            번 <input type="button" value="검색" class="default" style="width: 100%; margin-top: 10px;">
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div id="subtab22" class="subtab-content">
                                                        <ul class="content-data-1">
                                                            <li>
                                                                <div class="panel text-left">
                                                                    <form>
                                                                        <fieldset>
                                                                            <legend>Borad Write Form</legend>
                                                                            <label for="attach"> 시도 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 시군구 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 읍면동 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 교차로명 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <input type="button" value="검색" class="default" style="width: 100%; margin-top: 10px;">
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div id="subtab33" class="subtab-content">
                                                        <ul class="content-data-1">
                                                            <li>
                                                                <div class="panel text-left">
                                                                    <form>
                                                                        <fieldset>
                                                                            <legend>Borad Write Form</legend>
                                                                            <label for="attach"> 시도 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 시군구 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 읍면동 </label> <input type="text" id="name" name="name" style="width: 100%;">
                                                                            <label for="attach"> 개발지역명 </label> <input type="text" id="name" name="name" style="width: 100%;"> <input type="button" value="검색" class="default" style="width: 100%; margin-top: 10px;">
                                                                        </fieldset>
                                                                    </form>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--tab end-->
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="content-data-1">
                                        <li>
                                            <div class="panel text-left">
                                                <h1 class="title">검색결과 <a href="#"><span class="more">총2건</span></a></h1>
                                                <ul class="list">
                                                    <li><a href="#">대전광역시 서구 둔산중로 지하 55 (둔산동)</a> <i class="fa fa-map-marker" aria-hidden="true"></i></li>
                                                    <li><a href="#">대전광역시 서구 둔산로 100 (둔산동)</a> <i class="fa fa-map-marker" aria-hidden="true"></i></li>
                                                    <li><a href="#">대전광역시 서구 둔산로 100 (둔산동)</a> <i class="fa fa-map-marker" aria-hidden="true"></i></li>
                                                    <li><a href="#">대전광역시 서구 둔산로 100 (둔산동)</a> <i class="fa fa-map-marker" aria-hidden="true"></i></li>
                                                    <li><a href="#">대전광역시 서구 둔산로 100 (둔산동)</a> <i class="fa fa-map-marker" aria-hidden="true"></i></li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="content-data-1">
                                        <li>
                                            <div class="panel text-left">
                                                <h1 class="title">
                                                    공지사항 <a href="#"><span class="more">더보기</span></a>
                                                </h1>
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
                            <hr>
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="content-data-1">
                                        <li>
                                            <div class="panel text-left">
                                                <h1 class="title">
                                                    자주있는질문 <a href="#"><span class="more">더보기</span></a>
                                                </h1>
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
                    </div>
                </div>
                <div id="map-wrap">
                    <div class="map-box">
                            <div id="map" class="map"></div>
                            <div id="mouseLocation"></div>
                            <div id="layerTree">
                                <ul>
                                    <li id="layer0">
                                        <input id="visible0" class="visible" type="checkbox" /><span> OpenStreetMap</span>
                                        <fieldset>
                                            <input class="opacity" type="range" min="0" max="1" step="0.01" />
                                        </fieldset>
                                    </li>
                                    <li id="layer1">
                                        <input id="visible1" class="visible" type="checkbox" /><span> BingMap</span>
                                        <fieldset>
                                            <input class="opacity" type="range" min="0" max="1" step="0.01" />
                                            <select id="layerSelect">
                                                <option value="RoadOnDemand" selected>Road (dynamic)</option>
                                                <option value="Road">Road (static)</option>
                                                <option value="Aerial">Aerial</option>
                                                <option value="AerialWithLabels">Aerial with labels</option>
                                            </select>
                                            <!-- <ul>
                                                        <li>
                                                            <fieldset id="layer10">
                                                                <input id="visible10" class="visible" type="checkbox" /><span>Aerial</span>
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer11">
                                                                <input id="visible11" class="visible" type="checkbox" /><span>AerialWithLabels</span>
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer12">
                                                                <input id="visible12" class="visible" type="checkbox" /><span>Road</span>
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer13">
                                                                <input id="visible13" class="visible" type="checkbox" /><span>RoadOnDemand</span>
                                                            </fieldset>
                                                        </li>
                                                    </ul> -->
                                        </fieldset>
                                    </li>
                                    <li id="layer2">
                                        <input id="visible2" class="visible" type="checkbox" /><span> VworldMap</span>
                                        <fieldset>
                                            <input class="opacity" type="range" min="0" max="1" step="0.01" />
                                            <select id="vworldlayerSelect">
                                            	<option value="Base" selected>Base</option>
                                                <option value="Satellite">Satellite</option>                                               
                                                <option value="Hybrid">Hybrid</option>
                                                <option value="gray">gray</option> 
                                                <option value="midnight">midnight</option>                                               
                                            </select>
                                        </fieldset>
                                    </li>
                                    <li id="layer3">
                                        <input id="visible3" class="visible" type="checkbox" /><span> BaseMapGroup</span>
                                        <fieldset>
                                            <input class="opacity" type="range" min="0" max="1" step="0.01" />
                                            <!--
                                             <select id="layerSelect1">
                                                        <option value="RoadOnDemand" selected>Road (dynamic)</option>
                                                        <option value="Road"  >Road (static)</option>                                               
                                                        <option value="Aerial">Aerial</option>
                                                        <option value="AerialWithLabels">Aerial with labels</option>                                               
                                                    </select>
                                                      -->
                                        </fieldset>
                                    </li>
                                    <!--
                                    <li id="layer4" style="height:200px; overflow:scroll;">
                                            <input id="visible4" class="visible" type="checkbox" /><span> 주제도</span>
                                                <fieldset>
                                                    <input class="opacity" type="range" min="0" max="1"
                                                        step="0.01" />
                                                    <ul>
                                                        <li>
                                                            <fieldset id="layer40">
                                                                <input id="visible40" class="visible" type="checkbox" /><span>지역</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer41">
                                                                <input id="visible41" class="visible" type="checkbox" /><span>시군구</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer42">
                                                                <input id="visible42" class="visible" type="checkbox" /><span>읍면동</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer43">
                                                                <input id="visible43" class="visible" type="checkbox" /><span>공원</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer44">
                                                                <input id="visible44" class="visible" type="checkbox" /><span>호수</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer45">
                                                                <input id="visible45" class="visible" type="checkbox" /><span>연속지적도</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer46">
                                                                <input id="visible46" class="visible" type="checkbox" /><span>건물군</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer47">
                                                                <input id="visible47" class="visible" type="checkbox" /><span>도로</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer48">
                                                                <input id="visible48" class="visible" type="checkbox" /><span>건물</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer49">
                                                                <input id="visible49" class="visible" type="checkbox" /><span>교량</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer410">
                                                                <input id="visible410" class="visible" type="checkbox" /><span>터널</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer411">
                                                                <input id="visible411" class="visible" type="checkbox" /><span>도로중심선</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer412">
                                                                <input id="visible412" class="visible" type="checkbox" /><span>철도</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer413">
                                                                <input id="visible413" class="visible" type="checkbox" /><span>철도역</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer414">
                                                                <input id="visible414" class="visible" type="checkbox" /><span>지하철</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer415">
                                                                <input id="visible415" class="visible" type="checkbox" /><span>지하철역</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer416">
                                                                <input id="visible416" class="visible" type="checkbox" /><span>지하철출입구</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer417">
                                                                <input id="visible417" class="visible" type="checkbox" /><span>교차로</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                        <li>
                                                            <fieldset id="layer418">
                                                                <input id="visible418" class="visible" type="checkbox" /><span>도시가스</span>
                                                                <input class="opacity" type="range" min="0" max="1"
                                                                    step="0.01" />
                                                            </fieldset>
                                                        </li>
                                                    </ul>
                                                </fieldset>
                                                </li>
                                       -->           
                                    <li id="layer4"><input id="visible4" class="visible" type="checkbox" /><span> TileGrid</span>
                                        <fieldset>
                                            <input class="opacity" type="range" min="0" max="1" step="0.01" />
                                        </fieldset>
                                    </li>
                                </ul>
                            </div>
                            <!--
                            <div id="mapButton">
                                <nav class="btn-group">
                                    <ul>
                                        <li>
                                            <input type="button" value="내위치확인">
                                        </li>
                                        <li>
                                            <input type="button" value="글보기">
                                        </li>
                                        <li>
                                            <input type="button" value="글작성">
                                        </li>
                                        <li>
                                            <input type="button" value="글수정">
                                        </li>
                                        <li>
                                            <input type="button" value="글삭제">
                                        </li>
                                        <li>
                                            <input type="button" value="글삭제">
                                        </li>
                                        <li>
                                            <input type="button" value="글삭제">
                                        </li>
                                        <li>
                                            <input type="button" value="글삭제">
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                            -->
							                  
                    </div>
                </div>
            </div>
        </div>
        <div id="footer-wrap" style="display:none;">
            <div class="map-footer">
                <!-- <div class="logo-box" style="background: #333;">
                    <h1 class="logo">
                        <a href="../index.html" style="color: #fff;">GIS공간정보서비스</a>
                    </h1>
                </div> -->
                <div class="address-box">
                    <div class="address">
                        <article>
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="company-info">
                                        주소 : 대구광역시 달성군 현풍면 테크노중앙대로 333, 304-B호 <br>
                                        TEL : 053-611-6910 / FAX : 053-611-6911 / E-mail : webmaster@test.com
                                        <br> COPYRIGHT 2019 IDREAMFACTORY ALL RIGHTS RESERVED.
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <nav class="social-box float-right">
                                        <ul>
                                            <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fab fa-google"></i></a></li>
                                            <li><a href="#"><i class="fab fa-linkedin"></i></a></li>
                                            <li><a href="#"><i class="fab fa-vimeo"></i></a></li>
                                            <li><a href="#"><i class="fab fa-yahoo"></i></a></li>
                                            <li><a href="#"><i class="fab fa-snapchat-ghost"></i></a></li>
                                            <!-- <li><a href="#"><i class="fab fa-skype"></i></a></li>
                                            <li><a href="#"><i class="fab fa-android"></i></a></li>
                                            <li><a href="#"><i class="fab fa-dribbble"></i></a></li>
                                            <li><a href="#"><i class="fab fa-vimeo"></i></a></li>
                                            <li><a href="#"><i class="fab fa-tumblr"></i></a></li>
                                            <li><a href="#"><i class="fab fa-vine"></i></a></li>
                                            <li><a href="#"><i class="fab fa-foursquare"></i></a></li>
                                            <li><a href="#"><i class="fab fa-stumbleupon"></i></a></li>
                                            <li><a href="#"><i class="fab fa-flickr"></i></a></li>
                                            <li><a href="#"><i class="fab fa-yahoo"></i></a></li>
                                            <li><a href="#"><i class="fab fa-reddit"></i></a></li>
                                            <li><a href="#"><i class="fab fa-rss"></i></a></li>
                                            <li><a href="#"><i class="fab fa-android"></i></a></li> -->
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--#wrap-->
</body>

</html>
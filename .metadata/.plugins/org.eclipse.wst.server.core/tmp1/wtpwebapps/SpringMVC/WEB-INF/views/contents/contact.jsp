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
                        <h2>Contact</h2>
                        <div class="lead">고객과의 깊은 신뢰를 가장 중요한 자산으로 생각하고 차별화 된 제품과 고객만족을 위한 기업이 되도록 항상 최선의 노력을 하겠습니다.<br>
                            문의사항 및 궁금증을 빠르게 해결해 드리겠습니다.</div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/map.png" />" class="img-border"/>
                                </div>
                            </div>
                        </div>
                    </article>
                    <article>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel text-left">
                                    <h2 class="title">(주)이노맵스(Innomaps Co., Ltd.)</h2>
                                    <ul class="list">
                                        <li>본사 : 대구광역시 달성군 현풍면 테크노중앙대로 333 산학협력관 304-B호 / TEL. 053-611-6910 FAX. 053-611-6911</li>
                                        <li>판교 : 경기도 성남시 분당구 판교역로 230 삼환하이펙스 B동 602호 / TEL. 031-705-6910 FAX. 031-698-7859</li>
                                        <li>대전 : 대전광역시 유성구 문지동 문지로316번길 38-20 101호 / TEL. 042-861-6910</li>
                                    </ul>
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
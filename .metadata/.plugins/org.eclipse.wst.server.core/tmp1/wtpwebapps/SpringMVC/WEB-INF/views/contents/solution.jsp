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
                        <h2>Solution</h2>
                        <div class="lead">MMS 관련 뛰어난 가격 경쟁력과 효율적인 유지보수를 지원하며 다양한 하드웨어와 소프트웨어 자체 개발이 가능하여<BR>다양한 고객니즈에 차별화 된 서비스로 최적의 맞춤솔루션을 제공합니다.
                        </div>
                    </article>
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
                        <div class="row">
                            <div class="col-md-12">
                                <div class="thumbnail">
                                    <img src="<c:url value="/resources/images/innomaps/solution.png"/>"  class="img-border" />
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
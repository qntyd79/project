<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/views/include/header.jsp"/>

<div id="container-wrap">
    <div class="clearfix">
        <div class="content-box">
                <section class="content">
                    <article>                    
                        <div class="row">
                            <div class="col-md-12">
                            	<div class="div-center-box" style="background:#ffffff;">
                            		<div class="div-vcenter" style="padding:10px; border:1px solid #e1e1e1;">
		                                <h1 class="text-center">HTTP ERROR <c:out value="${code}"/></h1>
										<h2 class="content-subtitle"><i class="fa fa-warning text-red"></i><c:out value="${exception.getMessage()}"/></h2>				
										<h3 class="text-center">요청하신 페이지를 찾을 수 없습니다.</h3>
									</div>
								</div>
                            </div>
                        </div>                        
                    </article>                    
                </section>
        </div>
    </div>
</div>
				
<c:import url="/WEB-INF/views/include/footer.jsp"/>		
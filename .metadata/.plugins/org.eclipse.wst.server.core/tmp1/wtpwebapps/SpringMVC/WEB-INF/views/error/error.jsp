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
        <div class="content-full-img02"></div>
                <section class="content">
                    <article>                    
                        <div class="row">
                            <div class="col-md-12">
                            
							<h1 class="text-center">SYSTEM ERROR</h1>
							<h2 class="content-subtitle"><i class="fa fa-warning text-red"></i><c:out value="${exception.getMessage()}"/></h2>
							<ul>
								<c:forEach items="${exception.getStackTrace()}" var="stack">
								<li><p>${stack.toString()}</p></li>
								</c:forEach>
							</ul>							
                            </div>
                        </div>                        
                    </article>                    
                </section>
        </div>
    </div>
</div>
				
<c:import url="/WEB-INF/views/include/footer.jsp"/>		
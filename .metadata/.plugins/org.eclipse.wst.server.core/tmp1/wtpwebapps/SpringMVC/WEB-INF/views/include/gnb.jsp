<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="gnb-box">
	<nav class="gnb">
		<ul>
			<c:if test="${sessionScope.isAdmin == null && kakaoinfo == null && naverinfo == null && googleinfo == null}">
				<li><a href="${path}/modules/member/loginfull.do"><i class="fas fa-user-lock"></i> 로그인</a></li>
				<li><a href="${path}/modules/member/agree.do"><i	class="fas fa-address-card"></i> 회원가입</a></li>
				<li><a href="${path}/modules/member/find.do"><i class="fas fa-address-card"></i> 아이디/비밀번호찾기</a></li>
			</c:if>
			<!-- 사이트 로그인 -->
			<c:if test="${sessionScope.isAdmin != null}">
				<li><a href="#" class="cursornone">${sessionScope.isAdmin.name}님 환영합니다.</a></li>
				<li><a href="${path}/modules/member/read.do?member_idx=${sessionScope.isAdmin.member_idx}"> <i class="fas fa-desktop"></i> 회원정보</a></li>
				<li><a href="${path}/modules/member/logout.do"><i class="fas fa-user-lock"></i> 로그아웃 </a></li>
			</c:if>
			<!-- 카카오 로그인 -->
			<c:if test="${kakaoinfo != null}">
				<li><a href="#" class="cursornone"> <img src="${path}/resources/images/icon/kakaoicon.png" width="20px"/> ${name}님 환영합니다.</a>				
				</li>
				<li><a href="${path}/modules/member/read.do?member_idx=${sessionScope.isAdmin.member_idx}"> <i class="fas fa-desktop"></i> 회원정보</a></li>
				<li><a href="${path}/modules/member/kakaologout"><i class="fas fa-user-lock"></i> 로그아웃 </a><li>
			</c:if>
			<!-- 네이버 로그인 -->
			<c:if test="${naverinfo != null}">
				<li><a href="#" class="cursornone"> <img src="${path}/resources/images/icon/navericon.png" width="20px"/> ${name}님 환영합니다.</a>				
				</li>
				<li><a href="${path}/modules/member/read.do?member_idx=${sessionScope.isAdmin.member_idx}"> <i class="fas fa-desktop"></i> 회원정보</a></li>
				<li><a href="${path}/modules/member/naverlogout"><i class="fas fa-user-lock"></i> 로그아웃 </a><li>
			</c:if>
			<c:if test="${googleinfo != null}">
				<li><a href="#" class="cursornone"> <img src="${path}/resources/images/icon/googleicon.png" width="20px"/> ${name}님 환영합니다.</a>				
				</li>
				<li><a href="${path}/modules/member/read.do?member_idx=${sessionScope.isAdmin.member_idx}"> <i class="fas fa-desktop"></i> 회원정보</a></li>
				<li><a href="${path}/modules/member/googlelogout"><i class="fas fa-user-lock"></i> 로그아웃 </a><li>
			</c:if>
			<li><a href="${path}/contents/sitemap.do"><i class="fas fa-sitemap"></i> 사이트맵</a></li>
			<li><a href="${path}/modules/board/list.do"><i class="fas fa-users"></i> 고객센터</a></li>
			<li><a href='#'
				onclick='javascript:openNewMapPanelBrowser();'><i class="fas fa-map"></i> 지도서비스</a></li>
		</ul>
		<a href="#" id="pull"><i class="fas fa-bars"></i></a>
	</nav>
</div>

<script type="text/javascript">

function openNewMapPanelBrowser(){
	var sWidth = screen.availWidth;
	var sHeight = screen.availHeight;
	window.open('/contents/map.do', '지도서비스', 'width='+sWidth+',height='+sHeight+',left=0,top=0, menubar=no,status=no,directiories=no');
}
</script>
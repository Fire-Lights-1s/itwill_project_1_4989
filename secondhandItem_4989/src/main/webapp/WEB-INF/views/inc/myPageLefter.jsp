<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="side-nav" style="padding-top: 0;">
	<div style="background-color: #4E229E; color: white; height: 80px; border-radius: 7px 7px 0 0; display: flex; justify-content: center; align-items: center;">
		<h3>My Page</h3>
	</div>
	<ul id="sideNavLinks" style="font-size: 20px; font-weight: 500;">
		<li><a class="nav-link" href="${pageContext.request.contextPath}/my/profile" style=" color: #372161;">내 프로필</a></li>
		<li><a class="nav-link" href="${pageContext.request.contextPath}/my/payPoint" style=" color: #372161;">4989 페이</a></li>
		<li><a class="nav-link" href="${pageContext.request.contextPath}/my/zzim" style=" color: #372161;">찜 목록</a></li>
		<li><a class="nav-link" href="${pageContext.request.contextPath}/my/sell" style=" color: #372161;">판매 내역</a></li>
		<li><a class="nav-link" href="${pageContext.request.contextPath}/my/buy" style=" color: #372161;">구매 내역</a></li>
		<li><a class="nav-link" href="${pageContext.request.contextPath}/my/purchlist" style=" color: #372161;">매입 신청 내역</a></li>
		<li><a class="nav-link" href="${pageContext.request.contextPath}/my/infoCheck" style=" color: #372161;">정보 수정</a></li>
	</ul>
</aside>
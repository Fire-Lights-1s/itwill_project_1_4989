<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>@@@님의 프로필</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}">홈 </a> >
   			<a href="${pageContext.request.contextPath}/product/seller">dfagfadqweqdasd님의 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/product/seller">dfagfadqweqdasd님의 프로필</a>
		</div>
	</header>
	<div class="content-container">
<aside class="side-nav">
	<h1>dfagfadqweqdasd님의 페이지</h1>
	<br>
	<ul>
		<li><a href="${pageContext.request.contextPath}/product/sellerHistory">판매 내역</a></li>
	</ul>
</aside>
		<div class="main-container-side-profile">
		<main>
			<h2>dfagfadqweqdasd님의 프로필</h2>
			<div class="profile-circle-div">
				<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-circle">
			</div>
			<p class="profile-nickname">${memberDTO.nickname}닉네임</p>
			<p class="profile-nickname">누적 거래 횟수</p>
			<p class="profile-nickname">7</p>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
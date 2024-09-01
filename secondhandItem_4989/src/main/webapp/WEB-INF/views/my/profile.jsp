<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 프로필</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<div class="content-container">
		<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div id="main-container-side">
		<main>
			<h2>내 프로필</h2>
			<a href="#">회원 정보 수정</a>
			<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-circle">
			<p>닉네임</p>
			<p>누적 거래 횟수</p>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
			<h1>내 프로필</h1>
			<div class="edit-info">
				<a href="#">회원 정보 수정</a>
			</div>
			<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-circle">
			<p class="profile-nickname">닉네임</p>
			<p class="profile-nickname">누적 거래 횟수</p>
			<p class="profile-nickname">7</p>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
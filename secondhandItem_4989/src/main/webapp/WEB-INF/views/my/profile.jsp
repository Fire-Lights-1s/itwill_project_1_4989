<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 프로필</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile" style="color: #372161;">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile" style="color: #372161;">내 프로필</a>
		</div>
	</header>
	<div class="content-container">
		<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			<h2>내 프로필</h2>
			<div class="profile-circle-div">
				<img src="${pageContext.request.contextPath}/resources/upload/${memberDTO.profile_img}" class="profile-circle">
			</div>
			<p class="profile-nickname">${memberDTO.nickname}</p>
			<p class="profile-nickname">누적 거래 횟수</p>
			<p class="profile-nickname">${memberDTO.allTX}</p>
			<p class="profile-nickname" style="font-size: 24px;"><span style="color: gold;">★</span>${memberDTO.rating}</p>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script>
	const navLinks = document.querySelectorAll('#sideNavLinks .nav-link');
	const currentUrl = window.location.pathname;
	navLinks.forEach(link => {
	    if (link.getAttribute('href') === currentUrl) {
	        link.classList.add('active-link');
	    }
	});
</script>

</body>
</html>
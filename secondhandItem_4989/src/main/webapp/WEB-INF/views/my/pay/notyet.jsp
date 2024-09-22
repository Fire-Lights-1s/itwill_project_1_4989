<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>4989 페이</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
</head>
<body>
	<jsp:include page="../../inc/header.jsp"></jsp:include>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile" style="color: #372161;">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/payPoint" style="color: #372161;">4989 페이</a>
		</div>
	</header>
	<section>
		<div class="content-container">
			<jsp:include page="../../inc/myPageLefter.jsp"></jsp:include>
			<div class="main-container-payPoint">
				<div style="display:flex; width:100%; height:100%; justify-content:center; align-items:center;">
					<img src="${pageContext.request.contextPath}/resources/img/notyet.png" style="display:block; width:50%;">
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../../inc/footer.jsp"></jsp:include>
</body>
</html>
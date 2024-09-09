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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pay.css">
</head>
<body>
	<jsp:include page="../../inc/header.jsp"></jsp:include>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/paypoint">4989 페이</a>
		</div>
	</header>
	<section>
		<div class="content-container">
			<jsp:include page="../../inc/myPageLefter.jsp"></jsp:include>
			<div class="main-container-payPoint">
				<div id="payPoint">
					<div id="pay_member">
						<div>
							<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg">
						</div>
						<div>
							<p>${memberDTO.nickname} 님</p>
							<p>${memberDTO.member_id}</p>
						</div>
					</div>
					<div id="pay_descript">
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
				<div id="TXList">
					
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../../inc/footer.jsp"></jsp:include>
</body>
</html>
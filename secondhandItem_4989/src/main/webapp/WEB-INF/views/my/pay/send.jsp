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
</head>
<body>
	<jsp:include page="../../inc/header.jsp"></jsp:include>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/payPoint">4989 페이</a>
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
						<div>
							<img alt="" src="${pageContext.request.contextPath}/resources/img/Logo_C.png">
							<a href="${pageContext.request.contextPath}/my/payAccount">
								내 계좌
							</a>
						</div>
						<div>
							<p>0 원</p>
						</div>
						<div>
							<a href="${pageContext.request.contextPath}/my/payCharge">충전하기</a>
							<a href="${pageContext.request.contextPath}/my/paySend">송금하기</a>
						</div>
					</div>
				</div>
				<div id="TXList">
					<div class="select_items">
						<a class="type_select form-control" href="#" onclick="">전체 내역</a>
						<ul class="drop-menu">
	                        <li><a onclick="">전체 내역</a></li>
	                        <li><a onclick="">구매 내역</a></li>
	                        <li><a onclick="">판매 내역</a></li>
	                    </ul>
					</div>
					<div class="TX_item">
						<div class="img">
							<img alt="" src="">
						</div>
						<div class="desc">
							<p>2024-09-09</p>
							<p>중고 노트북 거래</p>
							<p>500,000 원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../../inc/footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입 신청하기 : 4989</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/purchaseStyle.css">
<style>

.content-container {
	background-color: white;
}

#info-img img {
	width: 100%;
}


</style>
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

<header>
   	<div id="menu-name">
		매입신청 > 서비스 소개
	</div>
</header>
<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">

      <jsp:include page="inc_side.jsp"></jsp:include>

<!-- 본문영역 시작 -->
	<div id="main-container-side">
  	  <main>
  	  
		<br>
		<h1 style="text-align:center;">매입 서비스 소개</h1>
  	 	<br>
  	  <div style="text-align:right; padding-right:100px;">
  	  <a href="${pageContext.request.contextPath}/my/purchase"><button id="submit_form" style="width:200px;">나의 매입 신청내역 확인</button></a>
  	  </div>
		<div id="info-img" style="padding:0; margin:30px auto; width:900px;">
			<img src="${pageContext.request.contextPath }/resources/img/purchase_001.png"
			alt="4989 매입 서비스는 4989가 직접 고객의 전자제품을 최적의 가격에 매입하는 서비스입니다.">
			<img src="${pageContext.request.contextPath }/resources/img/purchase_002.png"
			alt="매입절차: 고객 신청/접수 - 상담/검수 - 매입대금 입금">
			<img src="${pageContext.request.contextPath }/resources/img/purchase_003.png"
			alt="매입서비스 이용 시 유의사항: 정해진 품목만 매입, 본인 소유 정품만 매입, 기기 데이터는 고객이 미리 백업,
			신청 등급기준과 다른 경우 해당 매입신청건은 취소, 택배 반송의 경우 착불, 기기보험은 고객이 직접 해지,
			문의처는 고객센터(1000-0001, help@4989.com)">
			
		</div>

	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
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

h1, h3 { text-align:center; }

.content-container {
	background-color: white;
}

.side-nav ul {
	height: 300px;
}

</style>
</head>
<body>

  <jsp:include page="../../inc/header.jsp"></jsp:include>

<header>
   	<div id="menu-name">
		매입신청 > 매입 신청하기
	</div>
</header>
<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">

      <jsp:include page="../inc_side.jsp"></jsp:include>

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	
	  <main>
		<br><br><br><br><br>
		<div style="text-align:center;">
		<p>매입 신청이 완료되었습니다. </p>
		<p>제품이 신청일로부터 7영업일 내에 도착하지 않으면 신청이 자동으로 취소되오니 주의해주시기 바랍니다.</p>
		<br><br>
		<div id="service-center-box">
            <p><strong>택배/방문접수처: 4989 매입서비스센터</strong><br>
               [주소] 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br>
               [전화번호] 051-000-0000 &nbsp; &nbsp; [운영시간] 09:00-17:00 (주말, 공휴일 제외)
            </p>
        </div>
		<br><br><br>
		<a href="${pageContext.request.contextPath}/my/purchlist"><button id="submit_form">매입 신청내역 확인</button></a>
		</div>
		<br><br><br><br><br><br>
	  </main>
	  
	</div>
</div>
</section>

<!-- 본문영역 끝 -->
  
  <jsp:include page="../../inc/footer.jsp"></jsp:include>
  
</body>
</html>
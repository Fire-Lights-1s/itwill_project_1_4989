<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<style>
h1 { text-align:center;}

.content-container {
	background-color: white;
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

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<h1>매입 서비스 소개</h1>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
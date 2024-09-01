<!-- 사이드 영역과 본문페이지를 작성할 때, 
	<aside></aside> 사이에 사이드 영역을<main></main> 사이에 본문을 입력하여 사용해주세요.  -->
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
</head>
<body>

<jsp:include page="inc/header.jsp"></jsp:include>

<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">
	<!-- 사이드 메뉴 시작 -->
      <aside class="side-nav">
        <h5>사이드메뉴영역</h5>
        <br>
        <br>
        <ul>
            <li><a href="#">메뉴 1</a></li>
            <li><a href="#">메뉴 2</a></li>
            <li><a href="#">메뉴 3</a></li>
            <li><a href="#">메뉴 4</a></li>
        </ul>
      </aside>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<h1>본문 영역</h1>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="inc/footer.jsp"></jsp:include>


</body>
</html>
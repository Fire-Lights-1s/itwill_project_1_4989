
<!-- 사이드 영역이 없는 본문페이지를 작성할 때, <main></main> 사이에 내용 입력하여 사용해주세요.  -->

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

  <section>
	<div id="main-container">
	  <main>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<h1>본문 영역</h1>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



	  </main>
	</div>
  </section>
  
  <jsp:include page="inc/footer.jsp"></jsp:include>
  
</body>
</html>


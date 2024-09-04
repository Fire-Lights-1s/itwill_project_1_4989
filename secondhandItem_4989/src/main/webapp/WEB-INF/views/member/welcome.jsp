<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/welcome.css">
<script>
function redirectToMain() {
    window.location.href = '${pageContext.request.contextPath}/member/login';
}
</script>
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			회원가입 완료
		</div>
   </header>
   
   
  <section>
	<div id="main-container">
	  <main>


<div class="container">
        <h1>회원가입이 완료되었습니다.</h1>
        <p>4989에 오신것을 환영합니다.</p>
    	<button type="button" class="main-page-button" onclick="redirectToMain()">쇼핑하러 가기</button>
    </div>



	  </main>
	</div>
  </section>
    
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
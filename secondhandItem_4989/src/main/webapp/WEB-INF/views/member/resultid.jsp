<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/resultid.css">
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			아이디 찾기
		</div>
   </header>
   
  <section>
	<div id="main-container">
	  <main>


 <div class="container">
        <h1>아이디 찾기</h1>
        <div class="message">
            고객님의 정보로 가입된 아이디입니다.
        </div>
        <div class="user-id">
          ${sessionScope.member_id} <!-- 여기에 서버에서 가져온 사용자 아이디가 들어갑니다. -->
          <% out.println(session.getAttribute("member_id")); %>
        </div>
        <div class="buttons">
            <button onclick="location.href='findpass'">비밀번호 찾기</button>
            <button onclick="location.href='login'">로그인 하기</button>
        </div>
    </div>



	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
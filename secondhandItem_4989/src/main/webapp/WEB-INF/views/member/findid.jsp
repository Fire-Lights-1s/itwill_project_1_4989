<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/findid.css">
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
        <p>회원가입 시 입력한 정보를 입력해주세요.</p>
        <form action="findidPro" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>
            <div class="form-group">
                 <label for="email">이메일</label>
                <input type="email" id="email" name="email" placeholder="abcd@efgh.com" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">휴대폰 번호</label>
                <input type="text" id="phone" name="phone" placeholder="01012345678" maxlength="11" required>
            </div>
            <button type="submit" class="btn">아이디 찾기</button>
        </form>
    </div>


	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
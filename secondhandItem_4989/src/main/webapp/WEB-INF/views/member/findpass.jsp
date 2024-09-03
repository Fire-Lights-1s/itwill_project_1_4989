<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/findpass.css">
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			비밀번호 찾기
		</div>
   </header>
   
  <section>
	<div id="main-container">
	  <main>


<div class="container">
        <h1>비밀번호 찾기</h1>
        <p>회원가입시 입력한 정보를 입력해주세요.</p>
        <form action="findPassword.jsp" method="post">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" placeholder="아이디" required>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>
            <div class="form-group">
                <label for="idNumber">주민등록번호</label>
                <input type="text" id="idNumber" name="idNumber" placeholder="주민등록번호 13자리" required>
            </div>
            <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <input type="text" id="phone" name="phone" placeholder="01012345678" required>
            </div>
            <button type="submit" class="submit-btn">비밀번호 찾기</button>
        </form>
    </div>


	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
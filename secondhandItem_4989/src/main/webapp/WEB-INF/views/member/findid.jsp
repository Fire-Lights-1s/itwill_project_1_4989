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

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			메뉴(현재 페이지의 대메뉴: 마이페이지, 매입신청 등) 이름
		</div>
   </header>
   
  <section>
	<div id="main-container">
	  <main>


 <div class="container">
        <h1>아이디 찾기</h1>
        <p>회원가입 시 입력한 정보를 입력해주세요.</p>
        <form action="findId.jsp" method="post">
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>
            <div class="form-group">
                <label for="idNumber">주민등록번호</label>
                <input type="text" id="jumin" name="jumin" placeholder="주민등록번호 13자리" maxlength="13" required>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/social.css">
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			소셜회원가입
		</div>
   </header>
   
  <section>
	<div id="main-container">
	  <main>


  <div class="container">
        <h2>회원정보를 입력해주세요</h2>
        <form action="submitForm.jsp" method="post">
            <div class="nickname-group">
                <label for="nickname">닉네임</label>
                <div class="input-group">
                    <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                    <button type="button" class="check-btn" onclick="checkDuplicate()">중복 확인</button>
                </div>
            </div>

            <label for="idNumber">주민등록번호</label>
            <input type="text" id="idNumber" name="idNumber" placeholder="주민등록번호 13자리" maxlength="13" required>

            <label for="phone">휴대폰 번호</label>
            <input type="tel" id="phone" name="phone" placeholder="01012345678" required>

            <label for="email">이메일</label>
            <input type="email" id="email" name="email" placeholder="abcd@efgh.com" required>

            <div class="checkbox-group">
                <label><input type="checkbox" name="terms" required> 4989 이용약관(필수)</label><br>
                <label><input type="checkbox" name="privacy" required> 개인정보 수집 이용 동의(필수)</label><br>
                <label><input type="checkbox" name="identityProtection" required> 휴대폰 본인확인서비스(필수)</label><br>
                <label><input type="checkbox" name="location" required> 위치정보 이용약관 동의(필수)</label><br>
                <label><input type="checkbox" name="marketing"> 마케팅 수신 동의(선택)</label><br>
                <label><input type="checkbox" name="ad"> 개인정보 광고활용 동의(선택)</label><br>
            </div>

            <button type="submit" class="submit-btn">인증하기</button>
        </form>
    </div>


	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>

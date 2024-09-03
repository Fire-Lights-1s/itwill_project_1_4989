<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4989 회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/join.css">
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			회원가입
		</div>
   </header>
   
  <section>
	<div id="main-container">
	  <main>

<div class="container">
        <h1>회원정보를 입력해주세요</h1>
        <form action="yourActionUrl" method="post">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" placeholder="아이디" required>
                <button type="button" class="check-btn">중복 확인</button>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" placeholder="비밀번호" required>
                <p>영문자, 숫자, 특수문자 중 2가지 이상 사용하여 8자 이상으로 입력해주세요.</p>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                <button type="button" class="check-btn">중복 확인</button>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>
            <div class="form-group">
                <label for="residentRegNumber">주민등록번호</label>
                <input type="text" id="residentRegNumber" name="residentRegNumber" maxlength="13" placeholder="주민등록번호 13자리" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">휴대폰 번호</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="01012345678" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" placeholder="abcd@efgh.com" required>
            </div>
            <div class="form-group">
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement1" name="agreement1" required>
                    <label for="agreement1">4989 이용약관 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement2" name="agreement2" required>
                    <label for="agreement2">개인정보 수집 이용 동의 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement3" name="agreement3" required>
                    <label for="agreement3">휴대폰 본인확인서비스 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement4" name="agreement4" required>
                    <label for="agreement4">위치정보 이용약관 동의 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="marketing" name="marketing">
                    <label for="marketing">마케팅 수신 동의 (선택)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="advertising" name="advertising">
                    <label for="advertising">개인정보 광고활용 동의 (선택)</label>
                </div>
            </div>
            <button type="submit" class="submit-button">인증하기</button>
        </form>
    </div>

	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>4989 로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<script>
       function redirectToJoin() {
           window.location.href = '${pageContext.request.contextPath}/member/join'; // 회원가입 페이지로 이동
       }
       
       function redirectToSocial() {
           window.location.href = '${pageContext.request.contextPath}/member/social'; // 소셜회원가입 페이지로 이동
       }
   </script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			로그인
		</div>
   </header>
   
  <section>
	<div id="main-container">
	  <main>
    <div class="login-container">
        <h1>4989에 오신 것을 환영합니다.</h1>
        <form action="loginPro" method="post">
            <div class="input-group">
                <label for="member_id">아이디</label>
                <input type="text" id="member_id" name="member_id" placeholder="아이디">
            </div>
            <div class="input-group">
                <label for="pass">비밀번호</label>
                <input type="password" id="pass" name="pass" placeholder="비밀번호">
            </div>
             <div class="checkbox-login-group">
                <div class="checkbox-group">
                    <label><input type="checkbox" name="rememberId"> 아이디 기억하기</label>
                    <label><input type="checkbox" name="autoLogin"> 자동 로그인</label>
                </div>
                <button type="submit" class="login-bttn">로그인</button>
            </div>
            <div class="links">
                <a href="${pageContext.request.contextPath }/member/findid">아이디 찾기</a>
                <a href="${pageContext.request.contextPath }/member/findpass">비밀번호 찾기</a>
            </div>
            <button type="button" class="signup-btn" onclick="redirectToJoin()">회원가입</button>
           
            <button type="button" class="kakao-btn" onclick="redirectToSocial()">카카오톡으로 시작하기</button>
           
            <button type="button" class="naver-btn" id="naver_id_login">네이버로 시작하기</button>
			<script type="text/javascript">
	var naver_id_login = new naver_id_login("i_o3Jb0ojMsUwp5niV4T", "http://localhost:8080/secondhand4989/member/social");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 3,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	</script>

        </form>
    </div>

	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
  
  
</body>
</html>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script>
        function redirectToSocial() {
            window.location.href = 'social'; // 회원가입 페이지로 이동
        }
    </script>

<script>
        function redirectToJoin() {
            window.location.href = 'join'; // 회원가입 페이지로 이동
        }
    </script>
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
           
           <%
    // 애플리케이션 클라이언트 아이디
    String clientId = "i_o3Jb0ojMsUwp5niV4T"; 
    
    // 네이버 로그인 후 리다이렉트될 URI (수정된 부분)
    String redirectURI = URLEncoder.encode("http://localhost:8080/secondhand4989/member/call", "UTF-8");
    
    // state 값을 랜덤하게 생성 (보안 목적으로 사용)
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString(32); 
    
    // 네이버 OAuth2 인증 URL 생성
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI; // 인코딩된 리다이렉트 URI 사용
    apiURL += "&state=" + state; // 동적으로 생성된 state 값 사용
    
    // 세션에 state 값 저장
    session.setAttribute("state", state);
  %> 
           
              <!-- 네이버 로그인 버튼 -->
  			<a href="<%= apiURL %>"><img width="200" height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>

        </form>
    </div>

	  </main>
	</div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
  
  
</body>
</html>
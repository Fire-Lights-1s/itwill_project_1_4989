<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버 로그인</title>
  </head>
  <body>
  <%
    // 애플리케이션 클라이언트 아이디
    String clientId = "i_o3Jb0ojMsUwp5niV4T"; 
    
    // 네이버 로그인 후 리다이렉트될 URI (수정된 부분)
    String redirectURI = URLEncoder.encode("http://c1d2405t2.itwillbs.com/secondhandItem_4989/member/call", "UTF-8");
    
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
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  
  </body>
</html>

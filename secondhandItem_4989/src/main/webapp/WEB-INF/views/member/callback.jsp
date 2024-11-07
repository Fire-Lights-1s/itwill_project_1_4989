<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버 로그인</title>
  </head>
  <body>
<%
    // 애플리케이션 클라이언트 아이디와 시크릿값
    String clientId = "i_o3Jb0ojMsUwp5niV4T";
    String clientSecret = "4nsEAmGBri";

    // 네이버에서 전달받은 코드와 상태값
    String code = request.getParameter("code");
    String state = request.getParameter("state");

    // redirectURI 설정
    String redirectURI = URLEncoder.encode("http://c1d2405t2.itwillbs.com/secondhandItem_4989/member/call", "UTF-8");

    // 네이버 OAuth2.0 토큰 발급 요청 URL 구성
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;

    String access_token = "";
    String refresh_token = "";

    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection) url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();

      if (responseCode == 200) {
        // 토큰 발급 성공 시 결과를 /member/result로 리다이렉트하고 값 전달
        session.setAttribute("responseResult", res.toString()); // 세션에 결과 저장
        response.sendRedirect("result1"); // /member/result로 리다이렉트
      }
    } catch (Exception e) {
      System.out.println(e);
    }
  %>
  </body>
</html>

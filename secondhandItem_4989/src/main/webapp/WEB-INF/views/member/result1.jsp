<%@page import="java.util.Map"%>
<%@page import="com.itwillbs.controller.ApiExamMemberProfile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.itwillbs.controller.ApiExamMemberProfile" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String token = (String) session.getAttribute("responseResult");
String real_token = ApiExamMemberProfile.getAccessToken(token);
System.out.println(real_token);

// 토큰을 이용해 API 호출
Map<String, Object> profileInfo = ApiExamMemberProfile.getUserProfile(real_token);
out.println("asd = " + profileInfo);
/*
{"resultcode":"00",
 "message":"success",
 "response":{
	"id":"C_6Us6RqyDiA2VkRFM2G-ucYY1vKsUO1NMT5gKfZovA",
	"name":"\uc774\ud0dc\uc644"
	}
}
*/



// 프로필 정보 출력
out.println("<h2>네이버 회원 프로필 정보</h2>");
out.println("<p> 이름 : " + profileInfo.get("name") + "</p>");
out.println("<p>" + profileInfo.get("id"));
out.println("<pre>" + profileInfo + "</pre>");
out.println(profileInfo.get("email"));

session.setAttribute("member_id", profileInfo.get("id"));
session.setAttribute("name", profileInfo.get("name"));
session.setAttribute("email", profileInfo.get("email"));
%>
<%
response.sendRedirect("callPro");
%>
</body>
</html>
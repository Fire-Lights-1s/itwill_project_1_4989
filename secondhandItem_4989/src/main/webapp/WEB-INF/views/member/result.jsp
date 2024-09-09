<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//     // 세션에서 저장된 결과값을 가져와 출력
//     String responseResult = (String) session.getAttribute("responseResult");
	
// out.println("<h2>네이버 로그인 결과</h2>");
// out.println("<p>" + responseResult + "</p>");

// 	response.sendRedirect("http://localhost:8080/secondhand4989/member/call");
// //     if (responseResult != null) {
// //       out.println("<h2>네이버 로그인 결과</h2>");
// //       out.println("<p>" + responseResult + "</p>");
      
// //     } else {
// //       out.println("<p>결과값이 없습니다.</p>");
// //     }
  out.println(session.getAttribute("email"));
  %>
  

</body>
</html>
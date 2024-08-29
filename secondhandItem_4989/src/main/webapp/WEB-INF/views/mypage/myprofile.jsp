<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
div {width:600px;
	 height:500px;}
h2 {float:left;}
a {float:right;
   text-decoration:none;}
</style>
<meta charset="UTF-8">
<title>내 프로필</title>
</head>
<body>
<div>
	<h2>내 프로필</h2>
	<a href="#">회원 정보 수정</a>
	<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg">
	<p>닉네임</p>
	<p>누적 거래 횟수</p>
</div>
<jsp:include page="../includeMenu/myPageLefter.jsp"></jsp:include>
</body>
</html>
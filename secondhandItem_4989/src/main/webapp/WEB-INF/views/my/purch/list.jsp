<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매입 신청내역 : 4989</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/purchaseStyle.css">
</head>
<body>
<jsp:include page="../../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/purchlist">매입 신청내역</a>
		</div>
	</header>
	<div class="content-container">
		<jsp:include page="../../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			
			
			
		<br>
		<h1 style="text-align:center;">매입 신청내역</h1>
  	 	<br>
  	 	<br>
  	 	<div id="purchlist" style="height:600px; align-items: center; border:1px solid black;"> 
  	 		테이블 들어갈 자리
  	 		<table>
  	 			<tr>
  	 				<th>접수번호</th>
  	 				<th>매입제품</th>
  	 				<th>등급</th>
  	 				<th>신청일자</th>
  	 				<th>처리상태</th>
  	 			</tr>
  	 			<tr>
  	 				<td> </td>
  	 				<td> </td>
  	 				<td> </td>
  	 				<td> </td>
  	 				<td> </td>
 				</tr>
  	 		</table>
 		</div>
 		<br>
 		<div style="text-align:right; padding-right:50px;">
		<a href="${pageContext.request.contextPath}/purchase/register"><button id="submit_form">매입 신청하기</button></a>
		</div>
			
			
		</main>
		</div>
	</div>
</section>
<jsp:include page="../../inc/footer.jsp"></jsp:include>
</body>
</html>
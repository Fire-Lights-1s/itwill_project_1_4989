<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_Editing_by_sub.css?">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatStyle.css?">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<script src="${pageContext.request.contextPath }/resources/js/script.js"></script>

</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div id="main-container">
		<div id="container">
			<table>
				<tr>
					<td>
						<div id="chatList">
							<div id="searchBar">
							<a class="type_select" href="#" onclick="">
							전체 목록
							</a>
							<input type="text" id="search_bar">
							</div>	
							<div id="chatRoomList"></div>	
						</div>
					</td>
					<td>
						<div id="chatRoom">
						
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
  <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
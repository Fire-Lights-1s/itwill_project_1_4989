<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatStyle.css">
</head>
<body>
	<header></header>
	<div id="window">
		<div id="container">
		<table>
			<tr>
				<td>
					<div id="chatList">
						<div id="searchBar">
						<a class="type_select" href="#">
						    <span></span>
						    <span></span>
						    <span></span>
						</a>
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
	<footer></footer>
</body>
</html>
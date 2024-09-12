<%@page import="java.sql.Timestamp"%>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4989 채팅</title>
<jsp:useBean id="current" class="java.util.Date" />
<c:set var="sessionUID" value="${sessionScope.member_id }"></c:set>
<c:set var="chatRoomDTO" value="${chatRoomDTO }"></c:set>

<script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
<script type="text/javascript" th:inline="javascript">
	let sessionUserId = '<c:out value="${sessionUID}"/>';
	let objChatRoomDTO = '<c:out value="${chatRoomDTO}"/>'.replaceAll("&#034;", "\"");
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css?">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatStyle.css?">
<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> -->
<script src="${pageContext.request.contextPath }/webjars/sockjs-client/1.1.2/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/stomp-websocket/2.3.3/stomp.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/chatScript.js"></script>
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<section>
	<div id="main-container-chat">
		<div id="container">
			<div id="chatList">
				<div class="flexBoxRow">
					<div id="items_select" class="items">
						<a class="type_select form-control" href="#" onclick="">전체 목록</a>
						<ul class="drop-menu">
	                        <li><a onclick="">전체 목록</a></li>
	                        <li><a onclick="">구매 채팅</a></li>
	                        <li><a onclick="">판매 채팅</a></li>
	                    </ul>
					</div>
					<input type="search" id="searchText" placeholder="제목을 입력하세요">
					<button class="search-btn">
						<img alt="search" src="${pageContext.request.contextPath }/resources/img/icon/search.png">
					</button>
				</div>	
				<div id="chatTotalRoom">
					<c:forEach var="chatRoom" items="${chatRoomDTOList }">
					<div id="${chatRoom.chat_room_id }" onclick="connect('<c:out value="${chatRoom}"/>');">
						<div class="profile">
							<img alt="" src="${chatRoom.product_img1 }">
						</div>
						<div class="chatDescript">
							<div class="chatContnet">
								<p>${chatRoom.title }</p>
								<p>${chatRoom.seller_id } -> ${chatRoom.buyer_id }</p>
								<p>${chatRoom.message }</p>
							</div>
							<div>
								<c:if test="${(current.time - chatRoom.send_time.time) / (1000 * 60 * 60 * 24) < 1 }">
									<p><fmt:formatDate pattern="hh:mm" value="${chatRoom.send_time}"/></p>
								</c:if>
								<c:if test="${(current.time - chatRoom.send_time.time) / (1000 * 60 * 60 * 24) >= 1 }">
									<p><fmt:formatDate pattern="MM-dd hh:mm" value="${chatRoom.send_time}"/></p>
								</c:if>
<!-- 								<p class="alamIcon">1</p> -->
							</div>
						</div>
					</div>
					</c:forEach>
				</div>	
			</div>
			<div id="chatRoom">
				<div id="productInfo" class="flexBoxRow">
					<div>
						<img alt="product" src="">
					</div>
					<div>
						<h3></h3>
						<p></p>
						<p></p>
						<p></p>
					</div>
					<div>
						<p></p>
						<button></button>
					</div>
					<div id="productLoading" class="box">
						<div class="loader10"></div>
					</div>
				</div>
				<div id="chatContent">
				</div>
				<div id="inputMessage" class="flexBoxRow">
					<button>
						<img alt="" src="${pageContext.request.contextPath }/resources/img/icon/plus_icon.png">
					</button>
					<textarea id="message"></textarea>
					<button onclick="sendChat()">
						<img alt="" src="${pageContext.request.contextPath }/resources/img/icon/chat_send.png">
					</button>
				</div>
			</div>
		</div>
	</div>
	</section>
  <jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4989 채팅</title>
<c:set var="sessionUID" value="${sessionScope.member_id }"></c:set>
<c:set var="chatRoomDTO" value="${chatRoomDTO }"></c:set>

<script type="text/javascript" th:inline="javascript">
	let sessionUserId = '<c:out value="${sessionUID}"/>';
	let objChatRoomDTO = '<c:out value="${chatRoomDTO}"/>'.replaceAll("&#034;", "\"");
	let chatRoomJSON = JSON.parse(objChatRoomDTO);
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css?">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatStyle.css?">
<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> -->
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
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
					<div id="testRoom1" onclick="connect($(this).attr('id'));">
						<div class="profile">
							<img alt="" src="">
						</div>
						<div class="chatDescript">
							<div class="chatContnet">
								<p>채팅방 제목</p>
								<p>채팅방 내용</p>
							</div>
							<div>
								<p>오후 2:40</p>
								<p class="alamIcon">1</p>
							</div>
						</div>
					</div>
					<div id="testRoom2" onclick="connect($(this).attr('id'));">
						<div class="profile">
							<img alt="" src="">
						</div>
						<div class="chatDescript">
							<div class="chatContnet">
								<p>채팅방 제목</p>
								<p>채팅방 내용</p>
							</div>
							<div>
								<p>오후 2:40</p>
								<p></p>
							</div>
						</div>
					</div>
				</div>	
			</div>
			<div id="chatRoom">
				<div id="productInfo" class="flexBoxRow">
					<div>
						<img alt="product" src="">
					</div>
					<div>
						<h3>거래 상품명</h3>
						<p>거래 상품명</p>
						<p>거래 상품명</p>
						<p>거래 상품명</p>
					</div>
					<div>
						<p>거래 주소</p>
						<button>구매하기</button>
					</div>
				</div>
				<div id="chatContent">
					<div class="reciveMessage">
						<p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd asdasdasdasdasdasdasdasdasdasdasdasda</p>
						<p>오후 2:40</p>
					</div>
					<div class="sendMessage">
						<p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd asdasdasdasdasdasdasdasdasdasdasdasdasd</p>
						<p>오후 2:40</p>
					</div>
					<div class="sendMessage">
						<p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd asdasdasdasdasdasdasdasdasdasdasdasdasd</p>
						<p>오후 2:40</p>
					</div>
					<div class="reciveMessage">
						<p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd asdasdasdasdasdasdasdasdasdasdasdasda</p>
						<p>오후 2:40</p>
					</div>
					<div class="reciveMessage">
						<p>asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd asdasdasdasdasdasdasdasdasdasdasdasda</p>
						<p>오후 2:40</p>
					</div>
				
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
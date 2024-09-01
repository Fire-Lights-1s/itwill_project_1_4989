<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../inc/bootstrapLink.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_Editing_by_sub.css?">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatStyle.css?">
<script src="${pageContext.request.contextPath }/resources/js/script.js"></script>

</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<div id="main-container-chat">
		<div id="container">
			<div id="chatList">
				<div class="flexBox ">
					<a class="type_select form-control" href="#" onclick="">전체 목록</a>
					<input type="search" id="searchText" placeholder="제목을 입력하세요">
					<button class="search-btn">
						<img alt="search" src="${pageContext.request.contextPath }/resources/img/icon/search.png">
					</button>
				</div>	
				<div id="chatTotalRoom">
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
					<div>
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
				</div>	
			</div>
			<div id="chatRoom">
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
	</div>
  <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
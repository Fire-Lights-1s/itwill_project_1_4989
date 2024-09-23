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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css?">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/chatStyle.css?">

<!-- <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/sockjs-client/1.1.2/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath }/webjars/stomp-websocket/2.3.3/stomp.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/chatScript.js"></script>
</head>
<body>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<header>
        <div id="menu-name">채팅</div>
    </header>
	<section>
	<div id="main-container-chat">
		<div id="container">
			<div id="chatList">
				<div class="flexBoxRow">
					<div id="items_select" class="items">
						<a class="type_select form-control bg-purple" href="#" onclick="">전체 목록</a>
						<ul class="drop-menu ">
	                        <li><a onclick="" class="bg-purple">전체 목록</a></li>
	                        <li><a onclick="" class="bg-purple">구매 채팅</a></li>
	                        <li><a onclick="" class="bg-purple">판매 채팅</a></li>
	                    </ul>
					</div>
					<input type="search" id="searchText" placeholder="제목을 입력하세요">
					<button class="search-btn">
						<img alt="search" src="${pageContext.request.contextPath }/resources/img/icon/search.png">
					</button>
				</div>	
				<div id="chatTotalRoom">
					<c:forEach var="chatRoom" items="${chatRoomDTOList }">
					<div id="${chatRoom.chat_room_id }" onclick="connect(`<c:out value="${chatRoom}"/>`);">
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
						<p></p>
						<p></p>
						<p></p>
						<p></p>
					</div>
					<div>
						<p></p>
						<div>
							<button id="trade-btn" class="bg-purple" data-toggle="modal" data-target="#reviewModal"></button>
							<button id="openReportModal" class="bg-purple" data-toggle="modal" data-target="#reportModal">신고하기</button>
						</div>
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
					<textarea id="message" onkeyup="enterkey()"></textarea>
					<button onclick="sendChat()">
						<img alt="" src="${pageContext.request.contextPath }/resources/img/icon/chat_send.png">
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 신고하기 모달 -->
    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reportModalLabel">신고하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="reportForm">

                        <!-- Textarea for report details -->
                        <div class="accordion-subject"><b>신고 대상</b></div>
                        <label id="reportM"><input type="radio" name="reportType" value="회원" checked>회원</label>
                        <label id="reportP"><input type="radio" name="reportType" value="상품">상품</label>
                        <div class="accordion-subject"><b>신고 내용</b></div>
                        <textarea class="form-control" placeholder="상품 신고 사유를 입력해주세요" id="report_contents" name="report_contents" required></textarea>

                        <!-- Submission button -->
                        <button type="button" class="btn btn-primary mt-3 bg-purple" id="reportBtn">상품 신고</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 후기작성 모달 -->
    <div id="reviewModal" class="modal fade"  tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
    	<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
                    <h5 class="modal-title" id="reportModalLabel">구매 후기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
					<div style="overflow:hidden;">
						<img id="modalImage" src="">
			    	</div>
			    	<form action="${pageContext.request.contextPath}/my/reviewPro" method="post">
						<div class="starRating">
							<div class="stars" data-name="quality">
								<label for="quality">품&emsp;&emsp;질 :</label>
							    <span class="star" data-value="1">★</span>
							    <span class="star" data-value="2">★</span>
							    <span class="star" data-value="3">★</span>
							    <span class="star" data-value="4">★</span>
							    <span class="star" data-value="5">★</span>
							</div>
							<div class="stars" data-name="price">
					    		<label for="price">가&emsp;&emsp;격 :</label>
							    <span class="star" data-value="1">★</span>
							    <span class="star" data-value="2">★</span>
							    <span class="star" data-value="3">★</span>
							    <span class="star" data-value="4">★</span>
							    <span class="star" data-value="5">★</span>
							</div>
						    <div class="stars" data-name="punctuality">
								<label for="punctuality">시간 약속 :</label>
							    <span class="star" data-value="1">★</span>
							    <span class="star" data-value="2">★</span>
							    <span class="star" data-value="3">★</span>
							    <span class="star" data-value="4">★</span>
							    <span class="star" data-value="5">★</span>
						    </div>
						    <div class="stars" data-name="manner" >
								<label for="manner">매&emsp;&emsp;너 :</label>
							    <span class="star" data-value="1">★</span>
							    <span class="star" data-value="2">★</span>
							    <span class="star" data-value="3">★</span>
							    <span class="star" data-value="4">★</span>
							    <span class="star" data-value="5">★</span>
						    </div>
						</div>
						<input type="hidden" id="qualityRating" name="qualityRating" value="1">
						<input type="hidden" id="priceRating" name="priceRating" value="1">
						<input type="hidden" id="punctualityRating" name="punctualityRating" value="1">
						<input type="hidden" id="mannerRating" name="mannerRating" value="1">
			      		<textarea class="reviewText" name="reviewText" rows="4" cols="50" placeholder="후기 내용"></textarea><br>
			      		<input type="hidden" id="productId" name="productId" value="">
			      		<button type="submit" class="btn btn-primary mt-3 bg-purple">작성 완료</button>
			    	</form>
		    	</div>
			</div>
		</div>
	</div>
	</section>
  <jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>
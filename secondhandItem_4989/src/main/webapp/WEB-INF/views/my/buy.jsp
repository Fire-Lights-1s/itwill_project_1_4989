<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/buy">구매 내역</a>
		</div>
	</header>
	<div class="content-container">
	<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			<h2>구매 내역</h2>
			<div class="profile-a">
				<a href="#">가격 순 |</a>
				<a href="#">날짜 순</a>
			</div>
			<div class="profile-item-list">
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 중
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">구매 확정</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : &emsp;&emsp;
						1개월전
					</div>
				</div>
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 완료
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">후기 작성</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 완료
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">후기 작성</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 완료
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">후기 작성</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 완료
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">후기 작성</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 완료
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">후기 작성</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 완료
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">후기 작성</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							구매 완료
						</div>
					</div>
					<div class="profile-item-name">
						Galaxy Note3<br>
						800,000원
					</div>
					<div class="profile-item-review">
						<a href="#">후기 작성</a>&emsp;&emsp;
						<a href="#">판매자와 채팅</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
			</div>
			<div class="pagination">
				<a href="#" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></a>
				<c:if test="${pageDTO.currentPage > 1}">
<!-- 				처음 페이지 아닌 경우 이전 버튼 보이기 -->
					<a href="#" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="#"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="#"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
<!-- 				마지막 페이지 아닌 경우 다음 페이지 보이기 -->
					<a href="#" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음"></a>
				</c:if>
				<a href="#" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막"></a>
			</div>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
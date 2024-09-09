<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>판매 내역</title>
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
   			<a href="${pageContext.request.contextPath}/my/sell">판매 내역</a>
		</div>
	</header>
	<div class="content-container">
	<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			<h2>판매 내역</h2>
			<div class="profile-a">
				<button id="priceSortBtn" style="display:inline-block;">가격 순</button>
				<button id="orderSortBtn" style="display:inline-block;">날짜 순</button>
<!-- 				<a href="#" id="priceSortBtn">가격 순 |</a> -->
<!-- 				<a href="#" id="dateSortBtn">날짜 순</a> -->
			</div>
			<div class="profile-item-list">
			<c:forEach var="productDTO" items="${productList}">
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-item-image">
						<div class="profile-item-image-cover">
							판매 중
						</div>
					</div>
					<div class="profile-item-name" title="${productDTO.product_name}">
						${productDTO.product_name}<br>
						${productDTO.product_price}원
					</div>
					<div class="profile-item-review">
						<a href="#">구매자 후기</a>&emsp;&emsp;
						<a href="#">판매 취소</a>
					</div>
					<div class="profile-item-review">
						평점 : 4.7&emsp;&emsp;
						1개월전
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="pagination">
				<a href="${pageContext.request.contextPath}/my/sell?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></a>
				<c:if test="${pageDTO.currentPage > 1}">
<!-- 				처음 페이지 아닌 경우 이전 버튼 보이기 -->
					<a href="${pageContext.request.contextPath}/my/sell?pageNum=${pageDTO.currentPage - 1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="${pageContext.request.contextPath}/my/sell?pageNum=${i}"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="${pageContext.request.contextPath}/my/sell?pageNum=${i}"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
<!-- 				마지막 페이지 아닌 경우 다음 페이지 보이기 -->
					<a href="${pageContext.request.contextPath}/my/sell?pageNum=${pageDTO.currentPage + 1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음"></a>
				</c:if>
				<a href="${pageContext.request.contextPath}/my/sell?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막"></a>
			</div>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
<script>

	let isPriceAscending = true;
	let isOrderAscending = true;
	
	function sortItems(sortBy) {
	    const itemsContainer = document.querySelector('.profile-item-list');
	    const items = Array.from(document.querySelectorAll('.profile-item-list-piece'));
	
	    items.sort((a, b) => {
	        if (sortBy === 'price') {
	            const priceA = parseInt(a.dataset.price);
	            const priceB = parseInt(b.dataset.price);
	            return isPriceAscending ? priceA - priceB : priceB - priceA;
	        } else if (sortBy === 'order') {
	            const dateA = new Date(a.dataset.date);
	            const dateB = new Date(b.dataset.date);
	            return isOrderAscending ? dateA - dateB : dateB - dateA;
	        }
	    });
	
	    // 정렬된 항목을 다시 표시
	    items.forEach(item => itemsContainer.appendChild(item));
	
	    // 정렬 순서 토글
	    if (sortBy === 'price') isPriceAscending = !isPriceAscending;
	    if (sortBy === 'order') isOrderAscending = !isOrderAscending;
	}
	
	document.getElementById('priceSortBtn').addEventListener('click', () => sortItems('price'));
	document.getElementById('orderSortBtn').addEventListener('click', () => sortItems('order'));

</script>
</body>
</html>
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

function fetchDataAndSort(sortBy) {
    fetch('${pageContext.request.contextPath}/my/sell') // 서버에서 데이터 가져오기
        .then(response => response.json())
        .then(data => {
            if (sortBy === 'price') {
                data.sort((a, b) => isPriceAscending ? a.price - b.price : b.price - a.price);
                isPriceAscending = !isPriceAscending;
            } else if (sortBy === 'order') {
                data.sort((a, b) => isOrderAscending ? new Date(a.date) - new Date(b.date) : new Date(b.date) - new Date(a.date));
                isOrderAscending = !isOrderAscending;
            }
            displayItems(data); // 정렬된 데이터 표시
        })
        .catch(error => console.error('Error fetching data:', error));
}

function displayItems(items) {
    const container = document.querySelector('.profile-item-list');
    container.innerHTML = ''; // 기존 항목 제거
    items.forEach(item => {
        container.innerHTML += `
            <div class="item">
                <p>가격: ${item.price}</p>
                <p>등록 날짜: ${item.date}</p>
            </div>`;
    });
}

document.getElementById('priceSortBtn').addEventListener('click', () => fetchDataAndSort('price'));
document.getElementById('orderSortBtn').addEventListener('click', () => fetchDataAndSort('order'));

</script>
</body>
</html>
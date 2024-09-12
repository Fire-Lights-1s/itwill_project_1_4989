<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>찜 목록</title>
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
   			<a href="${pageContext.request.contextPath}/my/zzim">찜 목록</a>
		</div>
	</header>
	<div class="content-container">
	<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			<h2>찜 목록</h2>
			<div class="profile-a">				
				<c:if test="${empty param.sort}">				
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=priceAsc">가격 순 |</a>
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=dateAsc">날짜 순&nbsp;&nbsp;&nbsp;</a><br>
				</c:if>
				<c:if test="${param.sort eq 'priceDesc'}">
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=priceAsc">가격 순 |</a>
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=dateDesc">날짜 순&nbsp;&nbsp;&nbsp;</a><br>
				</c:if>
				<c:if test="${param.sort eq 'priceAsc'}">
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=priceDesc">가격 순 |</a>
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=dateDesc">날짜 순&nbsp;&nbsp;&nbsp;</a><br>
				</c:if>
				<c:if test="${param.sort eq 'dateDesc'}">
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=priceDesc">가격 순 |</a>
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=dateAsc">날짜 순&nbsp;&nbsp;&nbsp;</a><br>
				</c:if>
				<c:if test="${param.sort eq 'dateAsc'}">
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=priceDesc">가격 순 |</a>
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=dateDesc">날짜 순&nbsp;&nbsp;&nbsp;</a><br>
				</c:if>
				<br>
			</div>
			<div class="profile-item-list">
			<c:forEach var="productDTO" items="${productList}">
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}" class="profile-item-image">
							<div class="profile-item-image-cover3">
								관심 물품
							</div>
						<img src="${pageContext.request.contextPath}/resources/img/btn_zzim.png" class="profile-item-image-zzim">
					</div>
					<div class="profile-item-name" title="${productDTO.product_name}">
						${productDTO.product_name}<br>
						${productDTO.product_price}원
					</div>
					<div class="profile-item-review1">
						<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage}&sort=${pageDTO.sort}&nozzim=${productDTO.product_id}">찜 취소</a>
					</div>
					<div class="profile-item-review" data-date="${productDTO.created_datetime}">
<!-- 						평점 : 4.7&emsp;&emsp; -->
						<div class="zzim-time" style="display: inline;">
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="pagination">
				<a href="${pageContext.request.contextPath}/my/zzim?pageNum=1&sort=${pageDTO.sort}" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></a>
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage - 1}&sort=${pageDTO.sort}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${i}&sort=${pageDTO.sort}"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${i}&sort=${pageDTO.sort}"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.currentPage + 1}&sort=${pageDTO.sort}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음"></a>
				</c:if>
				<a href="${pageContext.request.contextPath}/my/zzim?pageNum=${pageDTO.pageCount}&sort=${pageDTO.sort}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막"></a>
			</div>
		</main>
		</div>
	</div>
</section>
<!-- querySelector('.profile-item-review') -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
<script>

document.addEventListener('DOMContentLoaded', function() {
    function formatTimeAgo(date) {
        const now = new Date();
        const diffInSeconds = Math.floor((now - date) / 1000);
        const diffInMinutes = Math.floor(diffInSeconds / 60);
        const diffInHours = Math.floor(diffInMinutes / 60);
        const diffInDays = Math.floor(diffInHours / 24);
        const diffInMonths = Math.floor(diffInDays / 30);
        const diffInYears = Math.floor(diffInDays / 365);
        if (diffInDays < 30) {
        	if(diffInHours < 24) {
        		if(diffInMinutes < 60) {
        			return diffInMinutes.toString() + "분 전";
        		}
        		return diffInHours.toString() + "시간 전";
        	}
        	return diffInDays.toString() + "일 전";
        } else if (diffInDays >= 30 && diffInDays < 365) {
            return diffInMonths.toString() + "달 전";
        } else {
            return diffInYears.toString() + "년 전";
        }
    }

    const reviewElements = document.querySelectorAll('.profile-item-review');
    reviewElements.forEach(function(element) {
        const dateStr = element.getAttribute('data-date');
        const date = new Date(dateStr);
        if (!isNaN(date.getTime())) {
            const timeAgo = formatTimeAgo(date);
            const timeElement = element.querySelector('.zzim-time');
            if (timeElement) {
                timeElement.textContent = timeAgo;
            }
        }
    });
});

</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매 내역</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script> --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<style>

textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
  }
  
.modal {
  display: none;
  text-align: center;
  position: fixed;
  z-index: 1; 
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
  background-color: #fefefe;
  margin: 8% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 500px;
  max-width: 80%;
  height: 750px;
  max-height: 80vh;
  overflow: auto;
  box-sizing: border-box;
}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  text-align: right;
}

.close:hover, .close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.stars {
display: inline-block;
}

.star {
  font-size: 24px;
  cursor: pointer;
  color: gray;
}

.star.selected {
  color: gold;
}

.star.active {
    color: gold;
}
</style>

</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile" style="color: #372161;">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/buy" style="color: #372161;">구매 내역</a>
		</div>
	</header>
	<div class="content-container">
	<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
		<div id="reviewModal" class="modal" style="display: none;">
			<div class="modal-content">
				<span class="close">&times;</span>
				<h2 style="margin-bottom: 20px;">구매 후기</h2>
				<div style="float: left; overflow:hidden;">
					<img id="modalImage" src="" style="width: 50%; height: 300px; object-fit: cover !important; margin-bottom: 20px;">
		    	</div>
		    	<form action="${pageContext.request.contextPath}/my/reviewPro" method="post">
					<div class="starRating">
					<label for="quality">품&emsp;&emsp;질 :</label>
						<div class="stars" data-name="quality" style="display: inline-block;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
						</div><br>
				    <label for="price">가&emsp;&emsp;격 :</label>
						<div class="stars" data-name="price" style="display: inline-block;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
						</div><br>
					<label for="punctuality">시간 약속 :</label>
					    <div class="stars" data-name="punctuality" style="display: inline-block;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
					    </div><br>
					<label for="manner">매&emsp;&emsp;너 :</label>
					    <div class="stars" data-name="manner" style="display: inline-block; margin-bottom: 20px;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
					    </div>
					</div>
					<input type="hidden" id="qualityRating" name="qualityRating" value="1">
					<input type="hidden" id="priceRating" name="priceRating" value="1">
					<input type="hidden" id="punctualityRating" name="punctualityRating" value="1">
					<input type="hidden" id="mannerRating" name="mannerRating" value="1">
		      		<textarea class="reviewText" name="reviewText" rows="4" cols="50" placeholder="후기 내용"></textarea><br>
		      		<input type="hidden" id="productId" name="productId" value="">
		      		<button type="submit">작성 완료</button>
		    	</form>
			</div>
		</div>
		<div id="reviewComModal" class="modal" style="display: none;">
			<div class="modal-content">
				<span class="close">&times;</span>
				<h2 style="margin-bottom: 20px;">구매 후기</h2>
				<div style="float: left; overflow:hidden;">
					<img id="modalComImage" src="" style="width: 50%; height: 300px; object-fit: cover !important; margin-bottom: 20px;">
		    	</div>
					<div class="starRating">
					<label for="quality">품&emsp;&emsp;질 :</label>
						<div class="stars" data-name="quality" style="display: inline-block;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
						</div><br>
				    <label for="price">가&emsp;&emsp;격 :</label>
						<div class="stars" data-name="price" style="display: inline-block;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
						</div><br>
					<label for="punctuality">시간 약속 :</label>
					    <div class="stars" data-name="punctuality" style="display: inline-block;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
					    </div><br>
					<label for="manner">매&emsp;&emsp;너 :</label>
					    <div class="stars" data-name="manner" style="display: inline-block; margin-bottom: 20px;">
						    <span class="star" data-value="1">☆</span>
						    <span class="star" data-value="2">☆</span>
						    <span class="star" data-value="3">☆</span>
						    <span class="star" data-value="4">☆</span>
						    <span class="star" data-value="5">☆</span>
					    </div>
					</div>
		      		<textarea id="reviewText1" name="reviewText" rows="4" cols="50" readonly></textarea><br>
			</div>
		</div>
			<h2>구매 내역</h2>
			<div class="profile-a">				
				<c:if test="${empty param.sort}">
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=priceAsc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=dateAsc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'priceDesc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=priceAsc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=dateDesc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'priceAsc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=priceDesc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=dateDesc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'dateDesc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=priceDesc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=dateAsc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<c:if test="${param.sort eq 'dateAsc'}">
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=priceDesc&sale=${pageDTO.sale}'">가격 순</button>
					<button onclick="location.href='${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage}&sort=dateDesc&sale=${pageDTO.sale}'">날짜 순</button>
				</c:if>
				<br>
				<button onclick="location.href='${pageContext.request.contextPath}/my/buy?sort=dateDesc&sale=pro'">구매 진행 중</button>
				<button onclick="location.href='${pageContext.request.contextPath}/my/buy?sort=dateDesc&sale=com'">구매 완료</button>
			</div>
			<div class="profile-item-list">
			<c:forEach var="productDTO" items="${productList}">
				<div class="profile-item-list-piece">
					<div class="profile-item-image-div">
						<img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}" class="profile-item-imagesell"
						data-image-src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}" data-product-id="${productDTO.product_id}">
					</div>
					<div class="profile-item-image-div">
					<c:if test="${productDTO.trade_status eq '예약 중'}">
						<div class="profile-item-image-cover1">
							구매 진행 중
						</div>
					</c:if>
					<c:if test="${productDTO.trade_status eq '거래 완료' or productDTO.trade_status eq '후기 작성 완료'}">
						<div class="profile-item-image-cover2">
							구매 완료
						</div>	
					</c:if>
					<div class="profile-item-name" title="${productDTO.product_name}">
						<h5>${productDTO.product_name}</h5>
					</div>
					<div class="profile-item-name1" title="${productDTO.product_price}">
						<h5><fmt:formatNumber value="${productDTO.product_price}" type="number" pattern="#,###"/>원</h5>
					</div>
					<div class="profile-item-review2" data-date="${productDTO.created_datetime}">
<!-- 						평점 : 4.7&emsp;&emsp; -->
						<div class="zzim-time" style="display: inline;">
						</div>
					</div>
					<div class="profile-item-review4">
						<c:if test="${productDTO.trade_status eq '예약 중'}">
							<button>판매자와 채팅</button>
						</c:if>
						<c:if test="${productDTO.trade_status eq '거래 완료'}">
							&emsp;<button class="reviewBtn">후기 작성</button>&emsp;
						</c:if>
						<c:if test="${productDTO.trade_status eq '후기 작성 완료'}">
							&emsp;<button class="reviewComBtn" style="background-color: #0040FF;" data-content="${productDTO.review_content}" data-reviewQ="${productDTO.review_quality}" 
						    data-reviewP="${productDTO.review_price}" data-reviewT="${productDTO.review_time}" data-reviewM="${productDTO.review_manner}">나의 후기</button>&emsp;
						</c:if>
					</div>
					<div class="profile-item-detail1">
							<a href="${pageContext.request.contextPath}/product/detail?product_id=${productDTO.product_id}">상품 상세 보기</a>
					</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div class="pagination1">
				<a href="${pageContext.request.contextPath}/my/buy?pageNum=1&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></a>
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage - 1}&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></a>
				</c:if>
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="${pageContext.request.contextPath}/my/buy?pageNum=${i}&sort=${pageDTO.sort}&sale=${pageDTO.sale}"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="${pageContext.request.contextPath}/my/buy?pageNum=${i}&sort=${pageDTO.sort}&sale=${pageDTO.sale}"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.currentPage + 1}&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음"></a>
				</c:if>
				<a href="${pageContext.request.contextPath}/my/buy?pageNum=${pageDTO.pageCount}&sort=${pageDTO.sort}&sale=${pageDTO.sale}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막"></a>
			</div>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script>
	function updateStarRating(category, value) {
	    const starsCom = document.querySelectorAll('.stars[data-name="' + category + '"] .star');
	    starsCom.forEach(star => {
	        const starValue = parseInt(star.getAttribute('data-value'), 10);
	        console.log(starValue);
	        if (starValue <= value) {
	            star.classList.add('active');
	        } else {
	            star.classList.remove('active');
	        }
	    });
	}
	const modalImage = document.querySelector("#modalImage");
	const modalComImage = document.querySelector("#modalComImage");
	const productIdInput = document.querySelector("#productId");
	const modal = document.querySelector("#reviewModal");
	const modalCom = document.querySelector("#reviewComModal");
	const span = document.getElementsByClassName("close")[0];
	const span2 = document.getElementsByClassName("close")[1];
	
	document.querySelectorAll('.reviewBtn').forEach(function(btn) {
		btn.onclick = function(event) {
			document.querySelectorAll('.stars').forEach(function(starGroup) {
			    const stars = starGroup.querySelectorAll('.star');
			    const hiddenInputId = starGroup.getAttribute('data-name') + 'Rating';
			    const hiddenInput = document.getElementById(hiddenInputId);

			    stars.forEach(function(star, index) {
			      star.addEventListener('click', function() {
			        // 선택된 별까지 색상 변경
			        stars.forEach(function(s, i) {
			          if (i <= index) {
			            s.classList.add('selected');
			          } else {
			            s.classList.remove('selected');
			          }
			        });
			        hiddenInput.value = star.getAttribute('data-value');	
			      });
			    });
			  });
			const productElement = event.target.closest('.profile-item-list-piece');
            const img = productElement.querySelector('img.profile-item-imagesell');
            const imageSrc = img.getAttribute('data-image-src');
            const productId = img.getAttribute('data-product-id');
            modalImage.src = imageSrc;
            productIdInput.value = productId;
			modal.style.display = "block";
		}
	});
	
	document.querySelectorAll('.reviewComBtn').forEach(function(btn) {
		btn.onclick = function(event) {
			const productElement = event.target.closest('.profile-item-list-piece');
            const img = productElement.querySelector('img.profile-item-imagesell');
            const imageSrc = img.getAttribute('data-image-src');
            const productId = img.getAttribute('data-product-id');
            const reviewContent = event.target.getAttribute('data-content');
            document.querySelector('#reviewText1').value = reviewContent;
            modalComImage.src = imageSrc;
            productIdInput.value = productId;
            updateStarRating('quality', parseInt(event.target.getAttribute('data-reviewQ'), 10));
            updateStarRating('price', parseInt(event.target.getAttribute('data-reviewP'), 10));
            updateStarRating('punctuality', parseInt(event.target.getAttribute('data-reviewT'), 10));
            updateStarRating('manner', parseInt(event.target.getAttribute('data-reviewM'), 10));
			modalCom.style.display = "block";
		}
	});
	
	// 닫기 버튼(X)을 클릭하면 모달을 닫기
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	span2.onclick = function() {
		  modalCom.style.display = "none";
		}
	
	// 모달 외부를 클릭하면 모달을 닫기
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	window.onclick = function(event) {
		  if (event.target == modalCom) {
		    modalCom.style.display = "none";
		  }
		}
</script>

<script>

document.addEventListener('DOMContentLoaded', function() {
	// 구매 후기 별모양 이벤트
	
	
	// 물품 등록 시간 가져오기
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

    const reviewElements = document.querySelectorAll('.profile-item-review2');
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
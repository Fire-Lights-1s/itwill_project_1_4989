<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>판매상품 상세</title>

<!-- jQuery and Bootstrap -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<!-- CSS 파일 경로 -->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/trade.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/productDetail.css">

<script
	src="${pageContext.request.contextPath }/resources/js/zzimScript.js"
	defer></script>

</head>
<body>

	<jsp:include page="../inc/header.jsp"></jsp:include>

	<header>
		<div id="menu-name">상품 상세</div>
	</header>

	<section>
		<c:set var="productDTO" value="${productDTO}" />
		<div id="main-container">

			<main>
<main>
				<!-- 상품 상세 정보 및 이미지 영역 -->
				<div class="container">
					<!-- 이미지 영역 -->
					<div class="image-box">
						<!-- 메인 이미지 -->
						<div class="main-image">
							<img
								src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}"
								alt="#" style="width: 100%; display: block;" class="mx-auto"
								id="current" onclick="imageModal(this)">
						</div>



						<!-- 썸네일 이미지들 -->

						<div class="thumbnail-images">
							<img
								src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}"
								class="img" alt="#" style="height: 100px;"
								onclick="switchMainImage(this)"> <img
								src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img2}"
								class="img" alt="#" style="height: 100px;"
								onclick="switchMainImage(this)"> <img
								src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img3}"
								class="img" alt="#" style="height: 100px;"
								onclick="switchMainImage(this)"> <img
								src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img4}"
								class="img" alt="#" style="height: 100px;"
								onclick="switchMainImage(this)"> <img
								src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img5}"
								class="img" alt="#" style="height: 100px;"
								onclick="switchMainImage(this)">
						</div>


						<!-- 상품 상세 정보 -->
						<div class="details-box">
							<div class="card">
								<!-- 기존 상세 정보 -->
								<div class="product-title" id="category-name"
									style="font-size: 14px; color: #888;"></div>
								<div class="product-title">${productDTO.product_name}</div>
								<div class="product-price" id="product-price"></div>
								<div class="product-meta">
									<span class="meta-item">${productDTO.elapsedTime}</span> <span
										class="meta-item">찜 <span id="like_count">${productDTO.like_count}</span></span>
									<span class="meta-item">조회수 ${productDTO.view_count}</span>
								</div>
								<hr>

								<!-- 거래 지역, 거래 방식, 결제방식. null일 경우 해당 버튼이 아예 안 뜨게  -->
								<div class="button-container" style="display: flex; gap: 10px;">
									<c:if test="${not empty productDTO.trade_area}">
										<button class="button" type="button">${productDTO.trade_area}</button>
									</c:if>
									<c:if test="${not empty productDTO.trade_method}">
										<button class="button" type="button">${productDTO.trade_method}</button>
									</c:if>
									<c:if test="${not empty productDTO.pay_method}">
										<button class="button" type="button">${productDTO.pay_method}</button>
									</c:if>
								</div>

								<!-- 판매자 정보 및 결제 방식 -->
								<br>
								<div class="product-info">
									<strong> 판매자 </strong><a
										href="${pageContext.request.contextPath}/your/seller?otherUser=${productDTO.seller_id}"
										class="button">${sellerNickname}</a>
								</div> 


								<!-- 판매자와 로그인한 사용자가 같으면 상품수정, 삭제 가능-->
								<c:if test="${productDTO.seller_id == sessionScope.member_id}">
									<div class="button-group">
										<a
											href="${pageContext.request.contextPath}/product/update?product_id=${productDTO.product_id}"
											class="button"> 상품 수정 </a> <a
											href="${pageContext.request.contextPath}/product/delete?product_id=${productDTO.product_id}"
											class="button"> 상품 삭제 </a>
								</c:if>


								<!-- 버튼 그룹 -->
								<div class="button-group"
									style="display: flex; align-items: center; gap: 10px;">
									<div class="zzim-button"
										data-product_id="${productDTO.product_id }"
										data-nickname="${sessionScope.nickname}" style="bottom: 50%;">♥</div>
									<button class="button" id="startChat">채팅하기</button>
									<button class="button" id="openReportModal" data-toggle="modal"
										data-target="#reportModal">신고하기</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 별도 컨테이너로 상품 설명 추가 -->
					<div class="product-desc">
						<!-- 새로운 컨테이너 -->
						<div class="product-desc">
							<div class="card">
								<strong>상품 정보</strong><br> <span>${productDTO.product_desc}</span>
							</div>
						</div>
					</div>
			</main>

			<%-- <!-- 상품 상세 정보 및 이미지 영역 -->
<div class="container">
    <!-- 이미지 영역 -->
    <div class="image-box">
        <!-- 메인 이미지 (크게 출력) -->
        <div class="main-image">
             <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}"
             alt="#" style="width: 100%; display: block;" class="mx-auto" onclick="imageModal(this)">
        </div>

        <!-- 썸네일 이미지들 (작게 출력) -->
        <div class="thumbnail-images"> 
            <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img2}" 
            class="img" alt="#" style="height: 100px;" onclick="switchMainImage(this)"> 
            <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img3}" 
            class="img" alt="#" style="height: 100px;" onclick="switchMainImage(this)"> 
            <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img4}" 
            class="img" alt="#" style="height: 100px;" onclick="switchMainImage(this)"> 
            <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img5}" 
            class="img" alt="#" style="height: 100px;" onclick="switchMainImage(this)"> 
        </div>
    </div>

    <!-- 상품 상세 정보 -->
    <div class="details-box">
        <div class="card">
            <!-- 카테고리 한글 변환 및 글씨 크기 작게 적용 -->
            <div class="product-title" id="category-name" style="font-size: 14px; color: #888;"></div>
            <div class="product-title">${productDTO.product_name}</div>
            <!-- 상품 가격 (1000원 단위로 , 추가) -->
            <div class="product-price" id="product-price"></div>
            <div class="product-meta">
                <span class="meta-item">${productDTO.elapsedTime}</span>
                <!-- 찜, 조회수 개수 -->
                <span class="meta-item">찜 <span id="like_count">${productDTO.like_count}</span></span>
                <span class="meta-item">조회수 ${productDTO.view_count}</span>
            </div>
            <br>
            <hr>
            <br>

            <!-- 거래 지역, 거래 방식, 결제방식 -->
            <div class="button-container" style="display: flex; gap: 10px;">
                <button class="button" type="button">${productDTO.trade_area}</button>
                <button class="button" type="button">${productDTO.trade_method}</button>
                <button class="button" type="button">${productDTO.pay_method}</button>
            </div>
            <br>

            <!-- 판매자 정보 및 결제 방식 -->
            <div class="product-info">
                <strong>판매자 </strong>
                <a href="${pageContext.request.contextPath}/your/seller?otherUser=${productDTO.seller_id}" class="button"> ${productDTO.seller_id} </a>
                <br><br>

                <!-- 판매자와 로그인한 사용자가 같으면 '상품 수정' 버튼 추가 -->
                <c:if test="${productDTO.seller_id == sessionScope.member_id}">
                    <a href="${pageContext.request.contextPath}/product/update?product_id=${productDTO.product_id}" class="button"> 상품 수정 </a>
                </c:if>

            </div>

            <!-- 버튼 그룹 -->
            <div class="button-group" style="display: flex; align-items: center; gap: 10px;">
                <!-- 찜하기 버튼 -->
                <div class="zzim-button" data-product_id="${productDTO.product_id }" data-member_id="${sessionScope.member_id }" style="bottom: 50%;">♥</div>
                <button class="button" id="startChat">채팅하기</button>
                <button class="button" id="openReportModal" data-toggle="modal" data-target="#reportModal">신고하기</button>
            </div>
        </div>
    </div>
</div>
      

				<!-- 상품 설명 -->
				<div class="details-box">
					<h3>상품 정보</h3>
					<pre>
					<p>${productDTO.product_desc}
					</p></pre>
				</div>
	
			</main> --%>
			<!-- 신고하기 모달 -->
			<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
				aria-labelledby="reportModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="reportModalLabel">신고하기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="reportForm">
								<!--                                 Checkbox for selecting report type
                                <div class="form-check">
                                  <input class="form-check-input" type="checkbox" value="상품" id="productReport" name="report_type" onclick="onlyOneCheckbox(this.id)">
                                    <label class="form-check-label" for="productReport">상품 신고</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="회원" id="memberReport" name="report_type" onclick="onlyOneCheckbox(this.id)">
                                    <label class="form-check-label" for="memberReport">회원 신고</label>
                                </div> -->

								<!-- Textarea for report details -->
								<div class="accordion-subject">
									<b>신고 내용</b>
								</div>
								<textarea class="form-control" placeholder="상품 신고 사유를 입력해주세요"
									id="report_contents" name="report_contents" required></textarea>

								<!-- Submission button -->
								<button type="button" class="btn btn-primary mt-3"
									id="reportBtn" onclick="submitReport()">상품 신고</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<!-- 신고 내용 서버로 보내기 -->
	<script>
		function submitReport() {
			var reportContents = $("#report_contents").val();
			var reporterId = "${sessionScope.member_id}";
			var reporteeId = "${productDTO.seller_id}";
			var reportedItemId = "${productDTO.product_id}";
			var reportType = "상품"; // 고정값

			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/product/report",
				data : {
					reporter_id : reporterId,
					reportee_id : reporteeId,
					reported_item_id : reportedItemId,
					report_type : reportType,
					report_contents : reportContents
				},
				success : function(response) {
					if (response.success) {
						alert("신고가 접수되었습니다.");
						$('#reportModal').modal('hide');
					} else {
						alert("신고 접수 중 오류가 발생했습니다.");
					}
				},
				error : function() {
					alert("서버 통신 중 오류가 발생했습니다.");
				}
			});
		}
	</script>
	<!-- 메인 이미지 클릭 시 모달 창 -->
	<script>
		function imageModal(image) {
			console.log($(image).attr("src"));
			let modal = $("#myModal");
			$(".modal-content").attr("src", $(image).attr("src"));
			modal.show();
		}
	</script>

	<!-- 썸네일을 클릭하면 메인 이미지를 교체  -->
	<script>
		function switchMainImage(thumbnail) {
			const mainImage = document.getElementById('current');
			mainImage.src = thumbnail.src;
		}
	</script>




	<!-- 이미지가 로드되지 않으면 숨기기 -->
	<script>
		document.querySelectorAll('.thumbnail-images img').forEach(
				function(image) {
					image.onerror = function() {
						this.style.display = 'none'; // 이미지 로딩에 실패하면 숨김
					};
				});
	</script>

	<!-- 모든 이미지를 새로운 팝업 창에서 띄우는 함수 -->
	<script>
		function openPopup() {
			var images = document.querySelectorAll('.images img');
			var imageSrcs = [];

			images.forEach(function(image) {
				imageSrcs.push(image.src);
			});

			var popupWindow = window.open('', '_blank', 'width=900,height=620');
			popupWindow.document
					.write('<div style="display:flex; flex-direction: row;">');

			imageSrcs
					.forEach(function(src) {
						popupWindow.document
								.write('<img src="' + src + '" style="width: 540px; height: 540px; margin-right: 10px; margin-top : 20px;">');
					});

			popupWindow.document.write('</div>');
			popupWindow.document.close();
		}
	</script>
	<!-- 해당 이미지를 팝업 창에 단독으로 표시 -->
	<script>
		function imagePopup(src) {
			var newWindow = window.open('', '_blank', 'width=800,height=600');
			newWindow.document
					.write('<html><head><title>Image</title></head><body style="background-color: black; margin: 0; display: flex; justify-content: center; align-items: center;"><img src="'
							+ src
							+ '" style="max-width: 100%; max-height: 100%;"></body></html>');
		}
	</script>

	<!-- 카테고리 영문 변환 -->
	<script type="text/javascript">
		// 카테고리 영문명을 한글로 변환하는 함수
		function convertCategoryToKorean(categoryName) {
			const categories = {
				"phone" : "휴대폰",
				"tablet" : "태블릿",
				"watch" : "스마트워치",
				"computer" : "PC / 노트북",
				"acc" : "PC주변기기",
				"game" : "게임기기",
				"etc" : "기타"
			};
			return categories[categoryName] || categoryName; // 변환 실패 시 원본 반환
		}

		// 1000단위로 콤마를 추가하는 함수
		function formatPrice(price) {
			return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}

		// JSP에서 넘어온 서버 측 카테고리명
		const categoryName = "${productDTO.category_name}";
		// JSP에서 넘어온 서버 측 상품 가격
		const productPrice = "${productDTO.product_price}";

		// 카테고리명을 변환한 후, HTML 요소에 삽입
		document.getElementById('category-name').textContent = convertCategoryToKorean(categoryName);
		// 상품 가격을 1000단위로 포맷한 후, HTML 요소에 삽입
		document.getElementById('product-price').textContent = formatPrice(productPrice)
				+ "원";
	</script>

	<!-- 채팅 관련 자바스크립트 -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<script type="text/javascript">
		let chatRoomBuyerID = '<c:out value="${sessionScope.member_id}"/>';
		let chatRoomProductID = '<c:out value="${productDTO.product_id}"/>';
		let chatRoomSellerID = '<c:out value="${productDTO.seller_id}"/>';
		let chatRoomTitle = '<c:out value="${productDTO.product_name}"/>';
	</script>
	<script
		src="${pageContext.request.contextPath }/resources/js/go_to_chat.js"></script>
</body>
</html>

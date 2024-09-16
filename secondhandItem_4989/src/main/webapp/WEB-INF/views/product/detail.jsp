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
    <script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <!-- 추가된 스타일 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/productDetail.css">

    <script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script>

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
<!-- 상품 상세 정보 및 이미지 영역 -->
<div class="container">
    <!-- 이미지 영역 -->
    <div class="image-box">
        <div class="card">
            <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}" alt="Product Image">
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
				<div class="product-description">
					<h3>상품 정보</h3>
					<p>${productDTO.product_desc}</p>
				</div>
	
			</main>
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
                                <!-- Checkbox for selecting report type -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="상품" id="productReport" name="reportType" onclick="onlyOneCheckbox(this.id)">
                                    <label class="form-check-label" for="productReport">상품 신고</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="회원" id="memberReport" name="reportType" onclick="onlyOneCheckbox(this.id)">
                                    <label class="form-check-label" for="memberReport">회원 신고</label>
                                </div>

                                <!-- Textarea for report details -->
                                <div class="accordion-subject"><b>상세 내용</b></div>
                                <textarea class="form-control" placeholder="신고내용을 직접 입력해주세요" id="reportContents" name="reportContents" required></textarea>

                                <!-- Submission button -->
                                <button type="button" class="btn btn-primary mt-3" id="reportBtn" onclick="submitReport()">신고 하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
			
		</div>
	</section>

<script>
// 신고하기
function onlyOneCheckbox(id) {
    var checkboxes = document.getElementsByName('reportType');
    checkboxes.forEach((item) => {
        if (item.id !== id) item.checked = false;
    });
}

function submitReport() {
    var reportType = document.querySelector('input[name="reportType"]:checked').value;
    var reportContents = document.getElementById('reportContents').value;

    // Implement AJAX call to send data to server
    $.ajax({
        url: '/path/to/server/endpoint',  // Change this URL to your server endpoint
        type: 'POST',
        data: {
            reportType: reportType,
            reportContents: reportContents
        },
        success: function(response) {
            alert('신고가 접수되었습니다.');
            $('#reportModal').modal('hide');
        },
        error: function(error) {
            alert('신고 접수에 실패하였습니다. 다시 시도해주세요.');
        }
    });
}

</script>

	<!-- 자바스크립트 함수 추가 -->
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

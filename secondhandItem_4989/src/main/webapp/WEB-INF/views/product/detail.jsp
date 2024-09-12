<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 상세</title>
    <script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<!--     index의 찜 등록/취소 -->
	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <!-- CSS -->
    <style>
    
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            align-items: stretch; /* 높이 맞추기 */
        }
        .image-box {
        flex: 1; /* .details-box와 동일한 높이 */
        padding-right: 20px;
        box-sizing: border-box;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .image-box img {
        height: 100%; /* .image-box의 높이에 맞춤 */
        width: auto; /* 비율을 유지하면서 넓이를 자동으로 조정 */
        max-width: 100%; /* 부모의 넓이를 넘지 않도록 설정 */
        object-fit: contain; /* 이미지를 비율에 맞춰 조정 */
        border-radius: 8px;
    }

        .details-box {
            width: 60%;
        }
        .card {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .product-price {
            font-size: 28px;
            font-weight: bold;
            color: #000;
            margin-bottom: 20px;
        }
        .product-meta {
            font-size: 14px;
            color: #888;
            margin-bottom: 10px;
        }
        .meta-item {
            margin-right: 10px;
        }
        .product-info {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .tag {
            display: inline-block;
            padding: 5px 10px;
            background-color: #eee;
            border-radius: 5px;
            margin-right: 5px;
            font-size: 14px;
        }
        .button-group {
            display: flex;
            margin-top: 20px;
        }
        .button {
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 10px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .product-description {
            margin-top: 20px;
        }
        .divider {
            margin: 20px 0;
            border-bottom: 1px solid #ccc;
        }
        .info-button {
            display: inline-block;
            padding: 10px 20px;
            margin-right: 10px;
            border: 1px solid #007bff;
            background-color: white;
            color: #007bff;
            border-radius: 5px;
            cursor: pointer;
        }
        .info-button:hover {
            background-color: #007bff;
            color: white;
        }
    </style>

</head>
<body>

    <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
        <div id="menu-name">
            상품 상세
        </div>
    </header>
    
    <section>
    	<c:set var="productDTO" value="${productDTO}"/>
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
                <span class="meta-item">1시간 전</span>
                <span class="meta-item">조회수 20</span>
                <span class="meta-item">찜 5</span>
              </div>
              <br>
              <hr>
              
     <br>			
<!-- 판매자 정보 및 결제 방식 -->
<div class="product-info">
    <strong>거래 방식 </strong> 
    <button class="button" type="button">${productDTO.trade_method}</button><br>
    <br>
    <strong>판매자 </strong> 
    <a href="${pageContext.request.contextPath}/your/seller/${productDTO.seller_id}" class="button">
        ${productDTO.seller_id}
    </a><br> <br>
    <strong>결제 방식 </strong> 
    <button class="button" type="button">${productDTO.pay_method}</button>
</div>

              <!-- 버튼 그룹 -->
              <div class="button-group">
                <button class="button" id="startChat">채팅하기</button>
                <button class="button" id="">찜하기</button>
                <button class="button" id="">신고하기</button>
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
    </div>
  </section>

  <jsp:include page="../inc/footer.jsp"></jsp:include>

  <!-- 자바스크립트 함수 추가 -->
  <script type="text/javascript">
    // 카테고리 영문명을 한글로 변환하는 함수
    function convertCategoryToKorean(categoryName) {
        const categories = {
            "phone": "휴대폰",
            "tablet": "태블릿",
            "watch": "스마트워치",
            "computer": "PC / 노트북",
            "acc": "PC주변기기",
            "game": "게임기기",
            "etc": "기타"
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
    document.getElementById('product-price').textContent = formatPrice(productPrice) + "원";
  </script>

  <!-- 채팅 관련 자바스크립트 -->
  <jsp:include page="../inc/footer.jsp"></jsp:include>
	<script type="text/javascript">
	let chatRoomBuyerID = '<c:out value="${sessionScope.member_id}"/>';
	let chatRoomProductID = '<c:out value="${productDTO.product_id}"/>';
	let chatRoomSellerID = '<c:out value="${productDTO.seller_id}"/>';
	let chatRoomTitle = '<c:out value="${productDTO.product_name}"/>';
	</script>
	<script src="${pageContext.request.contextPath }/resources/js/go_to_chat.js"></script>
</body>
</html>

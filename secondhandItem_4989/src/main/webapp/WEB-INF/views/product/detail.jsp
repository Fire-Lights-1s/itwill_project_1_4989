<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
    
    <!-- 필요한 스타일 삽입 -->
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
        }
        .image-box {
            width: 40%;
            padding-right: 20px;
        }
        .image-box img {
            width: 100%;
            height: auto;
            border-radius: 8px;
            object-fit: cover;
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
                <div class="container">
                    <!-- 이미지 영역 -->
                    <div class="image-box">
                        <div class="card">
                            <img src="${productDTO.product_img1}" alt="Product Image">
                        </div>
                    </div>

                    <!-- 상품 상세 정보 영역 -->
                    <div class="details-box">
                        <div class="card">
                            <div class="product-title">${productDTO.product_name}</div>
                            <div class="product-price">${productDTO.product_price}</div>
                            <div class="product-meta">
                                <span class="meta-item">1시간 전</span>
                                <span class="meta-item">조회수 20</span>
                                <span class="meta-item">찜 5</span>
                            </div>
                            
                            <!-- 찜 아래 구분선 추가 -->
                            <div class="divider"></div>

                            <!-- 거래 지역 및 방식 버튼 -->
                            <div class="product-info">
                                <button class="info-button">부산광역시</button>
                               
                                
                            </div>

                            <!-- 판매자 정보 및 결제 방식 (일반 텍스트) -->
                            <div class="product-info">
                                <strong>판매자 정보:</strong>${productDTO.seller_id}<br>
                                <strong>결제 방식:</strong> ${productDTO.pay_method}
                            </div>

                            <!-- 버튼 그룹 -->
                            <div class="button-group">
                                <button class="button">채팅하기</button>
                                <button class="button">찜하기</button>
                                <button class="button">신고하기</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 상품 설명 -->
                <div class="product-description">
                    <h3>상품 정보</h3>
                    <p>${productDTO.product_desc }</p>
                </div>

            </main>
        </div>
    </section>

    <jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>

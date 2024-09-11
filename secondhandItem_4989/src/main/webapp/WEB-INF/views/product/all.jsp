<!-- 사이드 영역과 본문페이지를 작성할 때, 
	<aside></aside> 사이에 사이드 영역을<main></main> 사이에 본문을 입력하여 사용해주세요.  -->
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script>

</head>
	<style>	

	
	</style>

<body>

<jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			카테고리 전체
		</div>
   </header>

<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">
	<!-- 사이드 메뉴 시작 -->
      <aside>
      	<div id="selector-container">
        <div id="selector-title">판매상품 골라보기</div>
        <div id="selector-content">
        <ul id="category" class="selector-list">
        	<li class="group-title">카테고리</li>
            <li class="selector"><a href="#">전체</a></li>
            <li class="selector"><a href="#">휴대폰</a></li>
            <li class="selector"><a href="#">태블릿</a></li>
            <li class="selector"><a href="#">스마트워치</a></li>
            <li class="selector"><a href="#">PC / 노트북</a></li>
            <li class="selector"><a href="#">PC주변기기</a></li>
            <li class="selector"><a href="#">게임기기</a></li>
            <li class="selector"><a href="#">기타</a></li>
        </ul>
        <hr>
        <ul id="status" class="selector-list">
        	<li class="group-title">거래상태</li>
            <li class="selector"><input type="checkbox" name="trade" value="able">거래 가능 &nbsp;&nbsp;
            <input type="checkbox" name="trade" value="disable">거래 불가</li> <!-- = 예약중, 거래완료 -->
		</ul>
		<hr>
		<ul id="method" class="selector-list">
			<li class="group-title">거래방법</li>
            <li class="selector"><input type="checkbox" name="method" value="직거래">직거래 &nbsp;&nbsp;
            <input type="checkbox" name="method" value="택배">택배</li>
		</ul>
		<hr>
		<ul id="payment" class="selector-list">
			<li class="group-title">결제수단</li>
            <li class="selector"><input type="checkbox" name="pay" value="페이">페이 &nbsp;&nbsp;&nbsp;
            <input type="checkbox" name="pay" value="현금">현금</li>
		</ul>
		<hr>
		<ul id="price" class="selector-list">
			<li class="group-title">가격</li>
            <li class="selector"><a href="#">전체</a></li>
            <li class="selector"><a href="#">0원(나눔)</a></li>
            <li class="selector"><a href="#">10만원 이하</a></li>
            <li class="selector"><a href="#">10만원 초과 30만원 이하</a></li>
            <li class="selector"><a href="#">30만원 초과 50만원 이하</a></li>
            <li class="selector">직접 입력</li>
            <li><input id="price_min" type="number" name="price_min"> ~ <input id="price_max" type="number" name="price_max">
            <button id="price_selector">적용</button></li>
		</ul>
		</div>
		</div>
      </aside>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>

    <div class="container">
        <!-- Sorting Filters -->
        <h2 class="page-title">상품 목록</h2>
            <div class="filter-row" style="align-items:right;">
                <button onclick="sortNewest()">최신순</button>
                <button onclick="sortPriceHighToLow()">높은가격순</button>
                <button onclick="sortPriceLowToHigh()">낮은가격순</button>
            </div>

<!-- 상품 목록 시작: 부트스트랩 적용 -->
        <div style="width:100%; margin:0 auto;" class="py-5 bg-light">
        <div class="container px-1 px-lg-1 mt-1" style="margin-top:100px;">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                
		<c:set var="size" value="${fn:length(productList)}" />
		<c:forEach var="i" begin="0" end="${size - 1}">
			<c:set var="product" value="${productList[i]}" />
			<c:set var="elapsedTime" value="${elapsedTimeList[i]}" />
			<div class="col-12 col-md-6 col-lg-3 mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <c:if test="${empty product.product_img1 || product.product_img1 eq '' }">
                        <img class="card-img-top img-height-fix" src="https://i.namu.wiki/i/tgJKui-B3sVdzHzJ_P2oLzBdPRihL7X4Jj5W9e7ReG6k9qcBRF-NuCmcM-j37ikoyBu7c_hq3P7juN3AnYlp0jiS3OD8wmaFC3SzSRHXOmTpxNdUrXcTs3ARbONhDcYAMbbMw7niOSM3khaPh7_DGQ.webp" alt="..." />
                        </c:if>
                        <c:if test="${!empty product.product_img1 && product.product_img1 ne '' }">
                        <img class="card-img-top img-height-fix" src="${pageContext.request.contextPath }/resources/upload/${product.product_img1 }" alt="..." />                        
                        </c:if>
                        <!-- 페이 뱃지 -->
                    <c:if test="${product.pay_method eq '페이' }">
                        <div class="badge text-white position-absolute" style="background-color: #4e229e; top: 0.5rem; right: 0.5rem">PAY</div>
                    </c:if>
                    	<!-- 찜하기 버튼 -->
                    	<div class="zzim-button position-absolute" data-product_id="${product.product_id }" data-member_id="${sessionScope.member_id }" style="bottom: 50%; right: 1rem">♥</div>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">
                                <c:choose>
								    <c:when test="${fn:length(product.product_name) > 25}">
								        ${fn:substring(product.product_name, 0, 25)}...
								    </c:when>
								    <c:otherwise>
								        ${product.product_name}
								    </c:otherwise>
								</c:choose>
                                </h5>
                                <!-- 가격 -->
                                <h5><fmt:formatNumber value="${product.product_price }" type="number"/>원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">${product.trade_method }
                                <c:if test="${product.trade_method eq '직거래'}">(   )</c:if></small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">${elapsedTime }</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/product/detail?product_id=${product.product_id}">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
       </c:forEach>
	</div>
	</div>
	</div>
	</div>

	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>

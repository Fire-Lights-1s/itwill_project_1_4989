<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록 : 4989</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/listStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        const contextPath = '${pageContext.request.contextPath}';
    </script>
</head>
<body>

<jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			상품 목록
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
        <div id="default"><a href="${pageContext.request.contextPath}/product">필터 초기화</a></div>
        <ul id="category-list" class="selector-list">
        	<li class="group-title">카테고리</li>
            <li class="selector selected" data-value="all">전체</li>
            <li class="selector" data-value="phone">휴대폰</li>
            <li class="selector" data-value="tablet">태블릿</li>
            <li class="selector" data-value="watch">스마트워치</li>
            <li class="selector" data-value="computer">PC / 노트북</li>
            <li class="selector" data-value="acc">PC주변기기</li>
            <li class="selector" data-value="game">게임기기</li>
            <li class="selector" data-value="etc">기타</li>
        </ul>
        <input type="hidden" id="category" value="all">
        <hr>
        <ul id="status" class="selector-checklist">
        	<li class="group-title">거래상태</li>
            <li class="check_selector"><input id="able" type="checkbox" name="trade" value="able" checked><label for="able">&nbsp;거래 가능</label> &nbsp;
            <input id="disable" type="checkbox" name="trade" value="disable"><label for="disable">&nbsp;거래 불가</label></li> <!-- = 예약중, 거래완료 -->
		</ul>
		<hr>
		<ul id="method" class="selector-checklist">
			<li class="group-title">거래방법</li>
            <li class="check_selector"><input id="direct" type="checkbox" name="method" value="직거래" checked><label for="direct">&nbsp;직거래</label> &nbsp;&nbsp;
            <input id="delivery" type="checkbox" name="method" value="택배" checked><label for="delivery">&nbsp;택배</label></li>
		</ul>
		<hr>
		<ul id="payment" class="selector-checklist">
			<li class="group-title">결제수단</li>
            <li class="check_selector"><input id="pay" type="checkbox" name="pay" value="페이" checked><label for="pay">&nbsp;페이</label> &nbsp;&nbsp;&nbsp;
            <input id="cash" type="checkbox" name="pay" value="현금" checked><label for="cash">&nbsp;현금</label></li>
		</ul>
		<hr>
		<ul id="price-list" class="selector-list">
			<li class="group-title">가격</li>
            <li class="selector selected" data-value="all">전체</li>
            <li class="selector" data-value="free">0원(나눔)</li>
            <li class="selector" data-value="under_10">10만원 이하</li>
            <li class="selector" data-value="under_30">10만원 초과 30만원 이하</li>
            <li class="selector" data-value="under_50">30만원 초과 50만원 이하</li>
            <li class="check_selector">직접 입력</li>
            <li><input id="price_min" type="number" name="price_min"> ~ <input id="price_max" type="number" name="price_max">
            <button type="button" id="price_selector">적용</button></li>
		</ul>
		<input type="hidden" id="price" value="all">
		</div>
		</div>
      </aside>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>
    <div id="scrollToTop" style="display: none;">▲ 맨 위로 이동</div>
    <div class="container">
        <!-- Sorting Filters -->
        <div id="sorting">
          <button class="sort_btn selected" data-value="latest">최신순</button>
          <button class="sort_btn" data-value="price_high_to">높은가격순</button>
          <button class="sort_btn" data-value="price_low_to">낮은가격순</button>
          <input type="hidden" id="sorted" value="latest">
		</div>

<!-- 상품 목록 시작: 부트스트랩 적용 -->
        <div id="product-list" style="width:100%; margin:15px auto;" class="py-5">
        <div class="container px-1 px-lg-1 mt-1" style="margin-top:100px;">
            <div id="product_container" class="row gx-4 gx-lg-5 justify-content-center">
                
		<c:set var="size" value="${fn:length(productList)}" />
		<c:if test="${size > 0}">
		<c:forEach var="i" begin="0" end="${size - 1}">
			<c:set var="product" value="${productList[i]}" />
			<c:set var="elapsedTime" value="${elapsedTimeList[i]}" />
			<div class="col-12 col-md-6 col-lg-3 mb-5">
                    <div class="card h-100" style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2)">
                        <!-- Product image-->
                        <c:if test="${product.trade_status ne '거래 가능' }">
                        	<img class="card-img-top img-height-fix" style="filter:brightness(0.3);" src="${pageContext.request.contextPath }/resources/upload/${product.product_img1 }" onerror="this.src='${pageContext.request.contextPath }/resources/img/default_image.png'"/>
                        	    <c:if test="${product.trade_status ne '예약 중'}">
                                    <div class="centered-text">거래 완료</div>
                                </c:if>
                                <c:if test="${product.trade_status eq '예약 중'}">
                                    <div class="centered-text">예약 중</div>
                                </c:if>
                            </c:if>
                        	<c:if test="${product.trade_status eq '거래 가능' }">
                        	<img class="card-img-top img-height-fix" src="${pageContext.request.contextPath }/resources/upload/${product.product_img1 }" onerror="this.src='${pageContext.request.contextPath }/resources/img/default_image.png'"/>
                       	</c:if>                        
                        <!-- 페이 뱃지 -->
                    <c:if test="${product.pay_method eq '페이' || product.pay_method eq '현금/페이'}">
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
                                    <c:if test="${product.trade_method eq '직거래' || product.trade_method eq '직거래/택배' || product.trade_method eq '택배/직거래'}">(${product.trade_area })</c:if></small>
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
       </c:if>
        <c:if test="${size == 0}">
            <div style="display:flex; width:100%; height:100%; justify-content:center; align-items:center;">
                <img src="${pageContext.request.contextPath}/resources/img/no_result.png" style="display:block; width:45%;">
            </div>
        </c:if>
	</div>
	</div>
        <c:if test="${isLastPage == false}">
	    <div id="load_more_container" style="text-align: center;">
            <button id="load_more" class="btn btn-outline-dark">더 보기</button>
        </div>
        </c:if>
	</div>
    </div>
	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/listScript.js"></script>

</body>
</html>

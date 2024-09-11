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
            <button id="price_selector">적용</button></li>
		</ul>
		<input type="hidden" id="price" value="all">
		</div>
		</div>
      </aside>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>

    <div class="container">
        <!-- Sorting Filters -->
        <div class="filter-row" style="align-items:right;">
          <button class="selected" onclick="sortNewest()">최신순</button>
          <button onclick="sortPriceHighToLow()">높은가격순</button>
          <button onclick="sortPriceLowToHigh()">낮은가격순</button>
		</div>
		<input type="hidden" id="order" value="all">

<!-- 상품 목록 시작: 부트스트랩 적용 -->
        <div id="product-list" style="width:100%; margin:0 auto;" class="py-5 bg-light">
        <div class="container px-1 px-lg-1 mt-1" style="margin-top:100px;">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                
		<c:set var="size" value="${fn:length(productList)}" />
		<c:if test="${size > 0}">
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
       </c:if>
        <c:if test="${size == 0}">
        <p>상품이 없습니다</p>
        </c:if>
	</div>
	</div>
	</div>
	</div>

	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->


<script>

// 카테고리 선택
window.addEventListener('load', function() {
	
	document.querySelectorAll('#category-list li.selector').forEach(function(item) {
	       item.addEventListener('click', function() {
	           // 모든 항목에서 'selected' 클래스 제거
	           document.querySelectorAll('#category-list li.selector').forEach(function(li) {
	               li.classList.remove('selected');
	           });
	           
	           // 클릭한 항목에 'selected' 클래스 추가
	           this.classList.add('selected');
	           
	           // hidden input 값 설정
	           document.getElementById('category').value = this.getAttribute('data-value');
	           
	           // 필터 적용 (비동기 요청)
	           applyFilters();
	       });
	   });

 // 가격대 선택
 document.querySelectorAll('#price-list li.selector').forEach(function(item) {
     item.addEventListener('click', function() {
         // 모든 항목에서 'selected' 클래스 제거
         document.querySelectorAll('#price-list li.selector').forEach(function(li) {
             li.classList.remove('selected');
         });
         
         // 클릭한 항목에 'selected' 클래스 추가
         this.classList.add('selected');
         
         // hidden input 값 설정
         document.getElementById('price').value = this.getAttribute('data-value');
         
         // 필터 적용 (비동기 요청)
         applyFilters();
     });
 });

    // 체크박스 필터링
    document.querySelectorAll('#selector-content input[type="checkbox"]').forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            applyFilters();
        });
    });

    // 맞춤 가격 필터 적용 버튼
    document.getElementById('price_selector').addEventListener('click', function() {
        applyFilters();
    });
    
    // 필터 적용 함수
    function applyFilters() {
        let selectedFilters = {}; // 필터 데이터를 담을 객체

        // 체크박스 선택 항목 수집
        document.querySelectorAll('#selector-content input[type="checkbox"]:checked').forEach(function(cb) {
            selectedFilters[cb.name] = selectedFilters[cb.name] || [];
            selectedFilters[cb.name].push(cb.value);
            
            // 거래방법 필터 그룹 확인
            if (cb.name === "method") {
                tradeMethodSelected = true;
            }
            
            // 결제수단 필터 그룹 확인
            if (cb.name === "pay") {
                paymentMethodSelected = true;
            }
        });

        if (!tradeMethodSelected || !paymentMethodSelected) {
            updateProductList(''); // 각 그룹에서 아무것도 선택되지 않으면 결과 비우기
            return; // 함수 종료
        }
  
        
        // 카테고리 선택 수집
        selectedFilters['category'] = document.getElementById('category').value;

        // 가격대 선택 수집
        selectedFilters['price'] = document.getElementById('price').value;

        // 맞춤 가격대 수집
        let minPrice = document.getElementById('price_min').value;
        let maxPrice = document.getElementById('price_max').value;
        if (minPrice) selectedFilters['minPrice'] = minPrice;
        if (maxPrice) selectedFilters['maxPrice'] = maxPrice;

        console.log(selectedFilters); // 최종 필터 데이터 확인 (비동기 요청 전에)
        
        const contextPath = "/secondhand4989";
        
        fetch(contextPath + '/product/filter', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(selectedFilters)
        })
        .then(response => response.text())
        .then(html => {
            updateProductList(html);
        });
    }
        
    // 상품 목록 업데이트 함수 (서버에서 받은 HTML을 DOM에 추가하는 방식)
    function updateProductList(productsHtml) {
    document.getElementById('product-list').innerHTML = productsHtml || '<p>결과가 없습니다.</p>';
	}
});

    

</script>

<jsp:include page="../inc/footer.jsp"></jsp:include>



</body>
</html>

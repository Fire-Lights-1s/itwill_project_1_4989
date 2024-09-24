<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>4989 : IT기기 중고거래플랫폼</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>

<body>
    <jsp:include page="inc/header.jsp"></jsp:include>


<main>
<!-- 슬라이더 시작 -->



<div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="mask flex-center">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-7 col-12 order-md-1 order-2">
                            <h4>맘편하게 <span style="color:yellow;">사구</span> <br>
                                간편하게 <span style="color:yellow;">팔구</span></h4><br>
                            <p>IT기기 중고거래 플랫폼 4989와 함께, 합리적인 테크 라이프를 즐기세요</p>
                        </div>
                        <div class="col-md-5 col-12 order-md-2 order-1"><img src="https://i.imgur.com/NKvkfTT.png" class="mx-auto" alt="slide"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="mask flex-center">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-7 col-12 order-md-1 order-2">
                            <h4>맘편하게 <span style="color:yellow;">사구</span> <br>
                                간편하게 <span style="color:yellow;">팔구</span></h4><br>
                            <p>IT기기 중고거래 플랫폼 4989와 함께, 합리적인 테크 라이프를 즐기세요</p> </div>
                        <div class="col-md-5 col-12 order-md-2 order-1"><img src="https://i.imgur.com/duWgXRs.png" class="mx-auto" alt="slide"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="mask flex-center">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-7 col-12 order-md-1 order-2">
                            <h4>맘편하게 <span style="color:yellow;">사구</span> <br>
                                간편하게 <span style="color:yellow;">팔구</span></h4><br>
                            <p>IT기기 중고거래 플랫폼 4989와 함께, 합리적인 테크 라이프를 즐기세요</p> </div>
                        <div class="col-md-5 col-12 order-md-2 order-1"><img src="https://i.imgur.com/DGkR4OQ.png" class="mx-auto" alt="slide"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" style="top:50%;" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span> </a>
    <a class="carousel-control-next" style="top:50%;" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span> </a>
</div>
<!--slide end-->


<!-- 상품 목록 시작: 부트스트랩 적용 -->
    <section style="background-color:#27224c;">
        <div style="width:80%; margin:0 auto;" class="py-5 bg-light">
        <h1 style="text-align: center; margin-top: 50px;"><b>인기 상품</b></h1>
        <h5 style="text-align: center; margin: 30px 0 80px 0;">바로 지금, 다른 사람들이 주목하고 있는 상품이에요!</h5>
        <div class="container px-1 px-lg-1 mt-1" style="margin-top:100px;">
            <div id="product_container" class="row gx-4 gx-lg-5 justify-content-center"> <!-- 카드가 정렬되는 그리드 -->
        
        <!-- 카드 시작 -->
		<c:set var="size" value="${fn:length(popList)}" />
		<c:forEach var="i" begin="0" end="${size - 1}">
			<c:set var="product" value="${popList[i]}" />
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
       <!-- 카드 끝 -->
      </div>
		<div style="text-align: center;">
            <button id="load_more" class="btn btn-outline-dark">더 보기</button>
        </div>
  </div>
     
</section>
<!-- 상품목록 끝 -->

<section class="guide">
 <div class="guide-container">
    <div class="guide-sidebar">
        <h2 style>4989 <br>이용자 가이드</h2>
        <p>4989가 처음이라면, 여기를 읽어보세요.</p>
    </div>
    <div class="accordion-container">
        <div class="accordion-item">
            <button class="accordion-button">4989는 뭐하는 곳인가요?</button>
            <div class="accordion-content">
                <p>IT/전자기기를 자유롭게 사고 팔 수 있도록 돕는 중고거래 플랫폼입니다.</p>
                <p>가입 후, 필요없는 제품은 팔고 관심있는 제품은 합리적인 가격에 구해보세요.</p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-button">어떻게 사고 팔 수 있나요?</button>
            <div class="accordion-content">
                <p><strong>사려면?</strong></p>
                ① 관심있는 상품을 키워드로 검색하거나 목록에서 둘러보고<br>
                ② 구매하고 싶은 상품이 있다면, 상품 상세페이지에서 판매자에게 채팅으로 문의<br>
                ③ 판매자와의 거래의사가 통하면, 사전에 정한 방식대로 물건과 대금을 교환<br><br>
                <p><strong>팔려면?</strong></p>
                ① '판매등록' 메뉴를 통해 팔려는 물품의 사진과 정보를 기재하여 게시<br>
                ② 구매의사가 있는 이용자와 채팅으로 대화<br>
                ③ 구매자와의 거래의사가 통하면, 사전에 정한 방식대로 물건과 대금을 교환<br><br>
                <p>※ 거래 참여는 가입(인증)한 회원만 가능합니다.</p>
            </div>
        </div>
        <div class="accordion-item">
            <button class="accordion-button">중고거래, 약속 잡고 흥정하기 너무 귀찮은데요?</button>
            <div class="accordion-content">
                <p>개인 간 중고거래에 피로를 느끼시거나 신속한 판매가 필요한 이용자분들을 위해 4989에서 직접 물품을 매입해드리고 있습니다.</p>
                <p>수요와 시세를 고려하여 미리 정한 품목과 가격에 따라 빠르고 투명하게 제품을 판매하실 수 있습니다.</p>
                <p>자세한 내용의 확인과 신청을 원하신다면 '매입신청' 메뉴를 이용해주세요.</p>
            </div>
        </div>
    </div>
</div>
</section>

</main>

<jsp:include page="inc/footer.jsp"></jsp:include>
    
<script>

// 이미지 슬라이드
$(document).ready(function() {
    $('#myCarousel').carousel({
        interval: 3000,
    });
});


//더보기 기능

const contextPath = '${pageContext.request.contextPath}';

let currentPage = 1;

$('#load_more').click(function() {
	
	currentPage++;
	
	$.ajax({
		url: contextPath + '/product/morelist',
		type: 'GET',
		data: { page: currentPage, listName: 'pop' },
		success: function(response) {
			if (response.products.length > 0) {
				for (let i = 0; i < response.products.length; i++) {
	                let product = response.products[i];
	                let elapsedTime = response.elapsedTimeList[i];
             	
	                //el과의 충돌 때문에 자바스크립트 변수 앞에 역슬래시 붙여야 함
             	let productHtml = `
             		 <div class="col-12 col-md-6 col-lg-3 mb-5">
                      <div class="card h-100">
                         <!-- Product image -->
                         \${product.product_img1 ?
                             `<img class="card-img-top img-height-fix" src="${pageContext.request.contextPath }/resources/upload/\${product.product_img1}" alt="Product Image" />` :
                             `<img class="card-img-top img-height-fix" src="https://i.namu.wiki/i/tgJKui-B3sVdzHzJ_P2oLzBdPRihL7X4Jj5W9e7ReG6k9qcBRF-NuCmcM-j37ikoyBu7c_hq3P7juN3AnYlp0jiS3OD8wmaFC3SzSRHXOmTpxNdUrXcTs3ARbONhDcYAMbbMw7niOSM3khaPh7_DGQ.webp" alt="Default Image" />`}

                         <!-- PAY Badge -->
                         \${product.pay_method === '페이' || product.pay_method === '현금/페이' ?
                             `<div class="badge text-white position-absolute" style="background-color: #4e229e; top: 0.5rem; right: 0.5rem">PAY</div>` : ''}

                         <!-- 찜하기 버튼 -->
                         <div class="zzim-button position-absolute" data-product_id="\${product.product_id}" data-member_id="${sessionScope.member_id }" style="bottom: 50%; right: 1rem">♥</div>

                         <!-- Product details -->
                         <div class="card-body pt-3">
                             <div class="text-center">
                                 <!-- 상품명 -->
                                 <h5 class="fw-bolder">
                                     \${product.product_name.length > 25 ? product.product_name.substring(0, 25) + '...' : product.product_name}
                                 </h5>
                                 <!-- 가격 -->
                                 <h5>\${new Intl.NumberFormat().format(product.product_price)}원</h5>
                                 <!-- 거래방법 (직거래 시 지역명) -->
                                 <small>\${product.trade_method}\${(product.trade_method === '직거래' || product.trade_method === '직거래/택배') ? ` (\${product.trade_area})` : ''}</small>
                                 <br>
                                 <!-- 경과시간 -->
                                 <small style="text-align:right;">\${elapsedTime}</small>
                             </div>
                         </div>

                         <!-- Product actions -->
                         <div class="card-footer pt-0 border-top-0 bg-transparent">
                             <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath }/product/detail?product_id=\${product.product_id}">상품 상세보기</a></div>
                         </div>
                     </div>
                 </div>`;
                 
                 $('#product_container').append(productHtml);
				}
				
				loadZzimStatus();
				selectZzim();

             if (response.isLastPage) {
                 $('#load_more').hide();
             }
         } else {
             $('#load_more').hide();            
         }
     }
 });
	
});


// 이용자가이드(아코디언) 동작
document.querySelectorAll('.accordion-button').forEach(button => {
    button.addEventListener('click', function() {
        const accordionItem = this.parentElement;
        accordionItem.classList.toggle('active');
    });
});

</script>


</body>
</html>
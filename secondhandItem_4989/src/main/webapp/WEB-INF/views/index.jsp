<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>4989 : IT기기 중고거래플랫폼</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
                                간편하게 <span style="color:yellow;">팔구</span></h4>
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
                                간편하게 <span style="color:yellow;">팔구</span></h4>
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
                                간편하게 <span style="color:yellow;">팔구</span></h4>
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
    <section style="background-color:#27224c">
        <div style="width:80%; margin:0 auto;" class="py-5 bg-light">
        <h1 style="text-align: center; margin-top: 50px;"><b>인기 상품</b></h1>
        <h5 style="text-align: center; margin: 30px 0 80px 0;">바로 지금, 다른 사람들이 주목하고 있는 상품이에요!</h5>
        <div class="container px-1 px-lg-1 mt-1" style="margin-top:100px;">
            <div class="row gx-4 gx-lg-5 justify-content-center"> <!-- 수정 -->
                
		<c:forEach var="popList" items="${popList}">
			<div class="col-12 col-md-6 col-lg-3 mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="${popList.product_img1 }" alt="..." />
                        <!-- 페이 뱃지 -->
                    <c:if test="${popList.pay_method eq '페이' }">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>
                    </c:if>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">${popList.product_name }</h5>
                                <!-- 가격 -->
                                <h5>${popList.product_price }</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">${popList.trade_method }
                                <c:if test="${popList.trade_method eq '직거래'}">(   )</c:if></small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
       </c:forEach>
                
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
    <!--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>-->
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
<!--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>-->
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
           
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <!--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>-->
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <!--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>-->
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
            
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <!--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>-->
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <!--                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>-->
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-3 mb-5">

                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- 페이 뱃지 -->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">PAY</div>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">상품명</h5>
                                <!-- 가격 -->
                                <h5>100,000원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">택배 / 직거래 (부산)</small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">1시간 전</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center;">
            <button type="button" class="btn btn-outline-dark">더 보기</button>
        </div>
        </div>
    </section>
    
<!-- 상품목록 끝 -->

    <div class="guide" style="height:300px;">
        <p style="line-height: 300px; text-align: center;">이용자 가이드 (나중에 넣기)</p>
    </div>

</main>

<jsp:include page="inc/footer.jsp"></jsp:include>
    
<script>
$(document).ready(function() {
    $('#myCarousel').carousel({
        interval: 3000,
    });
});

</script>

</body>
</html>
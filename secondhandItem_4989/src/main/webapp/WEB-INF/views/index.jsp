<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <nav>
        <div class="wrapper absolute-center ">
            <div class="logo"><a href="${pageContext.request.contextPath }">
            <img src="${pageContext.request.contextPath }/resources/img/Logo_BW2.png" style="height:25px;"></a></div>
            <ul class="nav-links">
                <li>
                    <a href="product/all" class="category_btn desktop-item" style="margin-right:20px;">三</a>
                    <ul class="drop-menu">
                        <li><a href="product/all">전체</a></li>
                        <li><a href="product/phone">휴대폰</a></li>
                        <li><a href="product/tablet">태블릿</a></li>
                        <li><a href="product/watch">스마트워치</a></li>
                        <li><a href="product/computer">PC/노트북</a></li>
                        <li><a href="product/acc">PC주변기기</a></li>
                        <li><a href="product/game">게임기기</a></li>
                        <li><a href="product/etc">기타</a></li>
                    </ul>
                </li>
                <li>
                    <div style="display: inline-block;">
                    <form action="product/search" method="get">
                        <input type="text" name="search" class="search" placeholder="원하는 상품을 검색해보세요">
                    </form>
                    </div>
                </li>
            </ul>
            
            <ul class="nav-links">
                <li><a href="product/register">판매등록</a></li>
                <li>
                    <a href="purchase/intro" class="desktop-item">매입신청</a>
                    <ul class="drop-menu">
                        <li><a href="purchase/intro">서비스 소개</a></li>
                        <li><a href="purchase/category">매입 신청하기</a></li>
                    </ul>
                </li>
                <li><a href="chat">채팅</a></li>
                <li>
                    <a href="my/profile" class="desktop-item">마이페이지</a>
                    <ul class="drop-menu">
                        <li><a href="my/profile">내 프로필</a></li>
                        <li><a href="my/pay/point">4989 페이</a></li>
                        <li><a href="my/zzim">찜 목록</a></li>
                        <li><a href="my/sell">판매내역</a></li>
                        <li><a href="my/buy">구매내역</a></li>
                        <li><a href="my/purch/list">매입신청내역</a></li>
                        <li><a href="my/info/check">정보 수정</a></li>
                    </ul>
                </li>
                <li style="width:30px;"></li>
                <li><a class="login-btn" href="member/login">로그인 / 회원가입</a></li>
            </ul>
        </div>
    </nav>


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
        <div class="container px-4 px-lg-5 mt-5" style="margin-top:100px;">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
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
                <div class="col mb-5">
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
                <div class="col mb-5">
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
                <div class="col mb-5">
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
        <div class="container px-4 px-lg-5 mt-5" style="margin-top:100px;">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
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
                <div class="col mb-5">
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
                <div class="col mb-5">
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
                <div class="col mb-5">
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
        <div class="container px-4 px-lg-5 mt-5" style="margin-top:100px;">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
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
                <div class="col mb-5">
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
                <div class="col mb-5">
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
                <div class="col mb-5">
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
<footer class="footer-distributed">

			<div class="footer-left">

				<img src="${pageContext.request.contextPath }/resources/img/Logo_BW2.png" style="height:30px;">

				<p class="footer-links">
					<a href="#" class="link-1">회사소개</a>
					
					<a href="#">이용약관</a>
				
					<a href="#">운영정책</a>
				
					<a href="#">개인정보처리방침</a>
					
					<a href="#">사이트맵</a>
				</p>

				<p class="footer-company-name">(주)4989 © 2024</p>
			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>4989(주) 사업자 정보</span>
					대표: 김사구   |   개인정보보호책임자: 이책임<br>
                    주소: 부산광역시 부산진구 동천로 109, 7층 (부전동)<br>
                    사업자번호: 000-00-00000   |   통신판매업신고: 2024-부산진구-0000<br>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>051-000-0000</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@company.com">help@4989.com</a></p>
				</div>

			</div>

			<div class="footer-right">

			<div style="width:400px; height:150px; border:1px solid white; padding:18px;">
               <div>고객센터 > 1000 - 0001</div>
               <p><br>- 운영시간: 9시~18시 (주말, 공휴일 휴무)</p>
               <div style="text-align: center; margin:0 auto;">
                   <p class="footer-links">
					<a href="cs/notice" class="link-1">공지사항</a>
					
					<a href="cs/faq">자주 묻는 질문</a>
				
					<a href="cs/inquiry">1:1 문의하기</a>
				</p>
               </div>
            </div>
				
			</div>

		</footer>
    
<script>
$(document).ready(function() {
    $('#myCarousel').carousel({
        interval: 3000,
    });
});

</script>

</body>
</html>
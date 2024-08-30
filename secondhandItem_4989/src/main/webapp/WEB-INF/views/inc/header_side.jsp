<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>4989 : IT기기 중고거래플랫폼</title>
    <link rel="stylesheet" href=${pageContext.request.contextPath }/resources/css/style.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://raw.githubusercontent.com/daneden/animate.css/master/animate.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    
    
    
</head>

<body>
    <nav>
        <div class="wrapper absolute-center ">
            <div class="logo"><a href="index.html"><img src="${pageContext.request.contextPath }/resources/img/Logo_BW2.png" style="height:25px;"></a></div>
            <ul class="nav-links">
                <li>
                    <a href="#" class="category_btn desktop-item" style="margin-right:20px;">三</a>
                    <input type="checkbox" class="invisible" id="showDrop">
                    <label for="showDrop" class="mobile-item">Dropdown Menu</label>
                    <ul class="drop-menu">
                        <li><a href="#">전체</a></li>
                        <li><a href="#">휴대폰</a></li>
                        <li><a href="#">태블릿</a></li>
                        <li><a href="#">스마트워치</a></li>
                        <li><a href="#">PC/노트북</a></li>
                        <li><a href="#">PC주변기기</a></li>
                        <li><a href="#">게임기기</a></li>
                        <li><a href="#">기타</a></li>
                    </ul>
                </li>
                <li>
                    <div style="display: inline-block;">
                    <form action="#" method="get">
                        <input type="text" name="search" class="search" style="" placeholder="원하는 상품을 검색해보세요">
                    </form>
                    </div>
                </li>
            </ul>
            <input type="radio" name="slider" class="invisible" id="menu-btn">
            <input type="radio" name="slider" class="invisible" id="close-btn">
            <ul class="nav-links">
                <label for="close-btn" class="btn close-btn"><i class="fas fa-times"></i></label>
                <li><a href="#">판매등록</a></li>
                <li>
                    <a href="#" class="desktop-item">매입신청</a>
                    <input type="checkbox" class="invisible" id="showDrop">
                    <label for="showDrop" class="mobile-item">Dropdown Menu</label>
                    <ul class="drop-menu">
                        <li><a href="#">서비스 소개</a></li>
                        <li><a href="#">매입 신청하기</a></li>
                    </ul>
                </li>
                <li><a href="#">채팅</a></li>
                <li>
                    <a href="#" class="desktop-item">마이페이지</a>
                    <input type="checkbox" class="invisible" id="showDrop">
                    <label for="showDrop" class="mobile-item">Dropdown Menu</label>
                    <ul class="drop-menu">
                        <li><a href="#">내 프로필</a></li>
                        <li><a href="#">4989 페이</a></li>
                        <li><a href="#">찜 목록</a></li>
                        <li><a href="#">판매내역</a></li>
                        <li><a href="#">구매내역</a></li>
                        <li><a href="#">매입신청내역</a></li>
                        <li><a href="#">정보 수정</a></li>
                    </ul>
                </li>
                <li style="width:30px;"></li>
                <li><a class="login-btn" href="#">로그인 / 회원가입</a></li>
            </ul>
            <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
        </div>
        </nav>
        <header>
        	<div id="menu-name">
    			메뉴 이름
    		</div>
       </header>
</body>
</html>
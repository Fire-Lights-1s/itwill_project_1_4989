<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>4989 관리자 메뉴</title>

    <!-- Fontfaces CSS-->
    <link href="${pageContext.request.contextPath }/resources/css/admin/sample/css/font-face.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath }/resources/css/admin/sample/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath }/resources/css/admin/sample/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="${pageContext.request.contextPath }/resources/css/admin/sample/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="${pageContext.request.contextPath }/resources/css/admin/sample/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    
    <!-- Main CSS-->
    <link href="${pageContext.request.contextPath }/resources/css/admin/sample/css/theme.css" rel="stylesheet" media="all">

	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const csMenu = document.querySelector('.js-arrow');
	    const subMenu = document.querySelector('.js-sub-list');

	    csMenu.addEventListener('click', function(e) {
	        e.preventDefault(); // 링크 이동 방지
	        if (subMenu.style.display === "none") {
	            subMenu.style.display = "block"; // 메뉴를 보이게 설정
	        } else {
	            subMenu.style.display = "none"; // 다시 숨기기
	        }
	    });
	});
	</script>

</head>

<body class="animsition">
    <div class="page-wrapper">
        
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a>
                    <img src="${pageContext.request.contextPath }/resources/img/Logo_C.png" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                    	<li>
                            <a href="${pageContext.request.contextPath}/admin/">
                                <i></i>관리자 홈</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/member">
                                <i></i>회원 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/trade">
                                <i></i>거래 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/purchase">
                                <i></i>매입신청 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/pay">
                                <i></i>페이 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/cs">
                                <i></i>신고 관리</a>
                        </li>
                        <li class="has-sub">
   						 <a class="js-arrow" href="#">
       							 <i></i>고객센터 관리
   									 </a>
   									 <ul class="list-unstyled navbar__sub-list js-sub-list" style="display: none;">
   								     <li><a href="${pageContext.request.contextPath}/admin/cs/notice">공지사항 관리</a></li>
    		  					  <li><a href="${pageContext.request.contextPath}/admin/cs/faq">FAQ 관리</a></li>
   			   					  <li><a href="${pageContext.request.contextPath}/admin/cs/inquiry">1:1문의 처리</a></li>
   							 </ul>
						</li>

                        
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                            <div class="header-button">
                             <a href="${pageContext.request.contextPath}/" class="btn-home">홈페이지로 가기</a>
        					<a href="${pageContext.request.contextPath}/member/logout" class="btn-logout">로그아웃</a>
<!--                             관리자 버튼(판매사이트로 이동&로그아웃) 추가 예정 -->
                            </div>
                        </div>
                    </div>
                </div>
            </header>
			 <!-- HEADER DESKTOP-->
			
			<div class="main-content">
            <!-- 본문내용은-->
			
			본문 내용 들어갈 자리
			
			
            <!-- 이 사이에 넣어주세요.-->
            </div>
            
            
            
            
            
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="vendor/slick/slick.min.js">
    </script>
    <script src="vendor/wow/wow.min.js"></script>
    <script src="vendor/animsition/animsition.min.js"></script>
    <script src="vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="vendor/circle-progress/circle-progress.min.js"></script>
    <script src="vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="js/main.js"></script>
</body>

</html>
<!-- end document-->

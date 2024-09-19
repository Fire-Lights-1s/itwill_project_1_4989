<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

	<jsp:include page="../../inc/cssLink.jsp"></jsp:include>
	<!-- 본인의 커스텀 css link 위치는 여기서부터 -->
	<link href="${pageContext.request.contextPath }/resources/css/admin/cspAdmin_table.css"  rel="stylesheet">
</head>
<body>
	<div class="page-wrapper">
        
        <!-- MENU SIDEBAR-->
        <jsp:include page="../../inc/menu_sidebar.jsp"></jsp:include>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
	        <jsp:include page="../../inc/header_in_page_container.jsp"></jsp:include>
			<!-- HEADER DESKTOP-->
			
			<div class="main-content">
            <!-- 본문내용은-->
            
    <div class="form-container">
        <h2>공지사항 수정</h2>
        <form action="${pageContext.request.contextPath }/admin/cs/editNotice" method="POST">
         	<div class="form-group">
                <label for="post-title">공지사항ID</label>
                <input type="text" id="id" name="notice_id" value="${noticeDTO.notice_id }" readonly>
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" id="title" name="notice_name" value="${noticeDTO.notice_name}" required>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea id="content" name="notice_cont" rows="10" required>${noticeDTO.notice_cont}</textarea>
            </div>
            <div class="button-group">
                <button type="button" class="submit-btn" onclick="window.history.back();">취소하기</button>
                <button type="submit" class="submit-btn">수정하기</button>
            </div>
        </form>
    </div>     
            
            <!-- 이 사이에 넣어주세요.-->
            </div>
			
			
        </div>
		<!-- END PAGE CONTAINER-->
    </div>
	<!-- END page-wrapper-->

    <jsp:include page="../../inc/jsLink.jsp"></jsp:include>
    <!-- 본인의 커스텀 js link 위치는 여기서부터 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/purchase_admin.js"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const menuItems = document.querySelectorAll('.has-sub .js-arrow');

        menuItems.forEach(menu => {
            menu.addEventListener('click', function(e) {
                e.preventDefault(); // 링크 이동 방지
                const subMenu = this.nextElementSibling; // 클릭한 메뉴의 바로 다음 하위 메뉴 선택
                subMenu.classList.toggle('show'); // show 클래스를 토글하여 보이기/숨기기
            });
        });
    });
	</script>
</body>
</html>
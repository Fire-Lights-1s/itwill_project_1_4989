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
          
     <div class="detail-container">
        <h2>${faqDTO.faq_id }번 자주 묻는 질문(FAQ) 내용 조회</h2>
        <div class="post-detail">
            <div class="post-group">
                <label for="post-title">FAQ ID</label>
                <p>${faqDTO.faq_id }</p>
            </div>
            <div class="post-group">
                <label for="post-title">자주 묻는 질문</label>
                <p>${faqDTO.faq_quest }</p>
            </div>
            <div class="post-group">
                <label for="post-content">답변</label>
                <pre>${faqDTO.faq_answer }</pre>
            </div>
        </div>

        <div class="button-group">
            <a href="${pageContext.request.contextPath }/admin/cs/faq" class="btn">목록으로</a>
            <a href="${pageContext.request.contextPath }/admin/cs/faq/edit?faq_id=${faqDTO.faq_id}" class="btn btn-edit">수정</a>
            <a href="${pageContext.request.contextPath }/admin/cs/faq/delete?faq_id=${faqDTO.faq_id}" class="btn btn-delete" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
        </div>
    </div>
            
            <!-- 이 사이에 넣어주세요.-->
            </div>
			
			
        </div>
		<!-- END PAGE CONTAINER-->
    </div>
	<!-- END page-wrapper-->

    <jsp:include page="../../inc/jsLink.jsp"></jsp:include>
    <!-- 본인의 커스텀 js link 위치는 여기서부터 -->
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
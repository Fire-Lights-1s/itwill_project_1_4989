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
				<div class="inquiry-view-container">
				    <table class="inquiry-view-table">
				        <tr>
				            <th>등록번호</th>
				            <td>${inquiryDTO.inquiry_id }</td>
				            <th>분류</th>
				            <td>${inquiryDTO.inquiry_type }</td>
				            <th>문의자</th>
				            <td>${inquiryDTO.member_id }</td>
				        </tr>
				        <tr>
				            <th>등록일자</th>
				            <td><fmt:formatDate value="${inquiryDTO.inquired_at}" pattern="yyyy-MM-dd"/></td>
				            <th>처리상태</th>
				            <td>
				            <c:choose>
				            	<c:when test="${inquiryDTO.replied_at != null && inquiryDTO.replied_at != ''}">
				            	답변완료
				            	</c:when>
				            	<c:otherwise>
				            	미답변
				            	</c:otherwise>
				            </c:choose>
				            </td>
				        </tr>
				        <tr>
				            <th>제목</th>
				            <td colspan="5">${inquiryDTO.inquiry_title }</td>
				        </tr>
				        <tr>
				            <th>내용</th>
				            <td colspan="5">${inquiryDTO.inquiry_contents }</td>
				        </tr>
				    </table>
				    
				    <div class="inquiry-reply-container">
				      <c:choose>
				    	<c:when test="${inquiryDTO.replied_at != null && inquiryDTO.replied_at != ''}">
				          <label for="reply-message"><fmt:formatDate value="${inquiryDTO.replied_at}" pattern="yyyy-MM-dd"/> 답변 완료</label>
				          <textarea id="reply-message" class="reply-textarea" readonly>${inquiryDTO.inquiry_reply }</textarea>
		            	</c:when>
				    	<c:otherwise>
				    	 <form action="${pageContext.request.contextPath}/admin/cs/inquiry/reply?inquiry_id=${inquiryDTO.inquiry_id}" method="post">
				          <label for="reply-message">답변 작성</label>
				          <textarea id="reply-message" class="reply-textarea" name="inquiry_reply"></textarea>
				          <div style="text-align:right;">
				         	 <button type="button" class="reply-submit-btn" onclick="window.history.back();">목록으로 돌아가기</button>
				           	 <button type="submit" class="reply-submit-btn">답변 등록</button>
		            	  </div>
		            	 </form>
		            	</c:otherwise>
		              </c:choose>
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
    
	const contextPath = '${pageContext.request.contextPath}/admin/cs/';
	$(document).ready(function(){
	    $("tr").off('click').on('click', function(){
			window.location.href = contextPath + 'inquirydetail?inquiry_id=' + $(this).data('inquiry-id');
	    });
	});
    
	</script>
</body>
</html>
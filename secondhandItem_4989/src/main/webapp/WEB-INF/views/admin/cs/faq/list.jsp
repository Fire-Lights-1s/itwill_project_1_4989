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
            <div class="container-fluid">
				<div class="col-lg-auto">
	                 <h2 class="title-1 m-b-25">자주 묻는 질문(FAQ) 관리</h2>
	                <div class="input-group mb-3 flex-right-50pct">
	                  <form action="${pageContext.request.contextPath }/admin/cs/faq" style="display:flex; margin-right:20px;">
					    <input type="text" class="form-control" name="search" placeholder="FAQ 제목, 내용으로 검색" aria-label="Recipient's username" aria-describedby="button-addon2" style="width:300px;">
					    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">
					  	  <img alt="검색" src="${pageContext.request.contextPath }/resources/img/icon/search.png">
					    </button>
					  </form>
					  <a href="${pageContext.request.contextPath }/admin/cs/faqform"><button id="write" type="button" class="btn btn-write">FAQ 등록</button></a>
					</div>
	                <div class="table-responsive table--no-card m-b-40">
	                    <table class="table table-borderless table-striped table-earning">
	                        <thead>
	                            <tr>
	                                <th id="faq_id" class="text-center">FAQ ID</th>
	                                <th id="faq_quest" class="text-center">제목</th>
	                                <th id="faq_answer" class="text-center">내용</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                        	<c:forEach var="faqList" items="${faqList }">
	                            <tr data-faq-id="${faqList.faq_id }">
	                                <td class="text-center">${faqList.faq_id}</td>
	                                <td class="text-center">
	                                <c:choose>
									    <c:when test="${fn:length(faqList.faq_quest) > 25}">
									        ${fn:substring(faqList.faq_quest, 0, 25)}...
									    </c:when>
									    <c:otherwise>
									        ${faqList.faq_quest}
									    </c:otherwise>
									</c:choose>
	                                </td>
	                                <td class="text-center">
	                                <c:choose>
									    <c:when test="${fn:length(faqList.faq_answer) > 25}">
									        ${fn:substring(faqList.faq_answer, 0, 25)}...
									    </c:when>
									    <c:otherwise>
									        ${faqList.faq_answer}
									    </c:otherwise>
									</c:choose>
	                                </td>
	                            </tr>
	                            </c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- pageDTO 활용해서 페이지 다루는 부분 추가 필요 -->
	                <!-- 페이지 전환 버튼 부분 -->
	                <div class="position-relative ">
			            <ul class="pagination justify-content-end">
			            <li class="page-item">
				    		<a class="page-link" href="${pageContext.request.contextPath}/admin/cs/faq?pageNum=1" aria-label="Go to First">
					      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></span>
					    	</a>
						</li>
						<c:if test="${pageDTO.currentPage > 10 }">
							<li class="page-item">
					    		<a class="page-link" href="${pageContext.request.contextPath}/admin/cs/faq?pageNum=${pageDTO.startPage - 1}" aria-label="Previous">
						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
						    	</a>
							</li>
						</c:if>
							<c:forEach var="page" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
								<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/cs/faq?pageNum=${page}"
								 ${pageDTO.currentPage eq page ? 'active':''}>${page }</a></li>
							</c:forEach>
						<c:if test="${pageDTO.currentPage + 10 <= pageDTO.pageCount }">
							<li class="page-item">
							  <a class="page-link" href="${pageContext.request.contextPath}/admin/cs/faq?pageNum=${pageDTO.endPage + 1}" aria-label="Next">
							    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
							  </a>
							</li>
						</c:if>
						<li class="page-item">
						  <a class="page-link" href="${pageContext.request.contextPath}/admin/cs/faq?pageNum=${pageDTO.pageCount}" aria-label="Next">
						    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span>
						  </a>
						</li>
						</ul>
					</div>
					<!-- 페이지 전환 버튼 부분 -->
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
    
    // 디테일페이지 이동
	const contextPath = '${pageContext.request.contextPath}/admin/cs/';
	$(document).ready(function(){
	    $("tr").off('click').on('click', function(){
			window.location.href = contextPath + 'faqdetail?faq_id=' + $(this).data('faq-id');
	    });
	});

	</script>
</body>
</html>
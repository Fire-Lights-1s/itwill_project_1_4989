<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

	<jsp:include page="../inc/cssLink.jsp"></jsp:include>
	<!-- 본인의 커스텀 css link 위치는 여기서부터 -->
	<link href="${pageContext.request.contextPath }/resources/css/admin/member/list.css"  rel="stylesheet">
</head>
<body>
	<div class="page-wrapper">
        
        <!-- MENU SIDEBAR-->
        <jsp:include page="../inc/menu_sidebar.jsp"></jsp:include>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
	        <jsp:include page="../inc/header_in_page_container.jsp"></jsp:include>
			<!-- HEADER DESKTOP-->
			
			<div class="main-content">
            <!-- 본문내용은-->
            <div class="container-fluid">
				<div class="col-lg-auto">
	                <h2 class="title-1 m-b-25">회원목록</h2>
	                <div class="input-group mb-3 flex-right-50pct">
					  <input type="text" class="form-control" placeholder="검색어 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary" type="button" id="button-addon2">
					  	<img alt="검색" src="${pageContext.request.contextPath }/resources/img/icon/search.png">
					  </button>
					</div>
	                <div class="table-responsive table--no-card m-b-40">
	                    <table class="table table-borderless table-striped table-earning">
	                        <thead>
	                            <tr>
	                                <th id="nickname">닉네임</th>
	                                <th id="member_id">유저ID</th>
	                                <th id="name">이름</th>
	                                <th id="email" class="text-right">이메일</th>
<!-- 	                                <th id="phone" class="text-right">전화번호</th> -->
	                                <th id="social_loginfo" class="text-right">로그인 정보</th>
	                              	<th id="created_at" class="text-right">가입일자</th>
	                              	<th id="is_withdrawn" class="text-right">탈퇴여부</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	            			<c:forEach var="member" items="${memberList}">
	                            <tr id="${member.member_id }" onclick="window.location.href='${pageContext.request.contextPath }/admin/member/details?member_id=${member.member_id}'">
	                                <td>${member.nickname }</td>
	                                <td>${member.member_id }</td>
	                                <td>${member.name }</td>
	                                <td>${member.email }</td>
<%-- 	                                <td class="text-right">${member.phone }</td> --%>
	                                <td class="text-right">${member.social_loginfo }</td>
	                                <td class="text-right"><fmt:formatDate value="${member.created_at}" pattern="yyyy-MM-dd"/></td>
	                                <td class="text-right">
	                                <c:choose>
								        <c:when test="${member.is_withdrawn == true}">
								            O
								        </c:when>
								        <c:otherwise>
								            X
								        </c:otherwise>
							    	</c:choose></td>
	                            </tr>
	          				</c:forEach>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- pageDTO 활용해서 페이지 다루는 부분 추가 필요 -->
	                <!-- 페이지 전환 버튼 부분 -->
	                <div class="position-relative ">
			            <ul class="pagination justify-content-end">
<!-- 							<li class="page-item"> -->
<%-- 					    		<a class="page-link" href="${pageContext.request.contextPath}/admin/member?pageNum=1&search=${pageDTO.search}" aria-label="Previous"> --%>
<%-- 						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="이전"></span> --%>
<!-- 						    	</a> -->
<!-- 							</li> -->
							<c:if test="${pageDTO.currentPage > 2}">
								<a class="page-link" href="${pageContext.request.contextPath}/admin/member?pageNum=${pageDTO.currentPage-1}&search=${pageDTO.search}" class="prevpage  pbtn">
								<img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="이전 페이지로 이동"></a>
							</c:if>
							
<!-- 							<li class="page-item"> -->
<!-- 					    		<a class="page-link" href="#" aria-label="Previous"> -->
<%-- 						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span> --%>
<!-- 						    	</a> -->
<!-- 							</li> -->
							<c:if test="${pageDTO.currentPage ne 1}">
								<a class="page-link" href="${pageContext.request.contextPath}/admin/member?pageNum=${pageDTO.currentPage-1}&search=${pageDTO.search}" class="prevpage  pbtn">
								<img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
							</c:if>
							
							<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
								<c:if test="${pageDTO.currentPage eq i}">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/member?pageNum=${i}&search=${pageDTO.search}"><span class="pagenum currentpage">${i}</span></a>
								</c:if>
								<c:if test="${pageDTO.currentPage ne i}">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/member?pageNum=${i}&search=${pageDTO.search}"><span class="pagenum">${i}</span></a>
								</c:if>
							</c:forEach>
							
<!-- 							<li class="page-item  active"><a class="page-link" href="#">1</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 							<li class="page-item"><a class="page-link" href="#">3</a></li> -->

								<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/member?pageNum=${pageDTO.currentPage+1}&search=${pageDTO.search}">
									<img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
								</c:if>
								
								<c:if test="${pageDTO.currentPage ne pageDTO.pageCount - 1}">
									<a class="page-link" href="${pageContext.request.contextPath}/admin/member?pageNum=${pageDTO.currentPage+1}&search=${pageDTO.search}">
									<img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
								</c:if>
								
								
								
								
<!-- 							<li class="page-item"> -->
<!-- 							  <a class="page-link" href="#" aria-label="Next"> -->
<%-- 							    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span> --%>
<!-- 							  </a> -->
<!-- 							</li> -->
<!-- 							<li class="page-item"> -->
<!-- 							  <a class="page-link" href="#" aria-label="Next"> -->
<%-- 							    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span> --%>
<!-- 							  </a> -->
<!-- 							</li> -->
						</ul>
					</div>
					<!-- 페이지 전환 버튼 부분 -->
	            </div>
            </div>
            <!-- 이 사이에 넣어주세요.-->
            </div>
			<!-- 모달 창  -->
			<div class="modal fade" id="csModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
			        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      <!-- 모달 창 메인 body -->
			      	모달 창 메인 body input 태그 넣어서 나머지 필요한 부분 구현 하시면 될 것 같습니다
			      	<div class="form-floating mb-3">
					  <label for="floatingInput">Email address</label>
					  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
					</div>
					<div class="form-floating">
					  <label for="floatingPassword">Password</label>
					  <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
					</div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-purple ">Save changes</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- end modal -->
        </div>
		<!-- END PAGE CONTAINER-->
    </div>
	<!-- END page-wrapper-->

    <jsp:include page="../inc/jsLink.jsp"></jsp:include>
    <!-- 본인의 커스텀 js link 위치는 여기서부터 -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/admin_cs.js"></script>
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
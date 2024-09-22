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
    <title>4989 관리자 신고 관리</title>

	<jsp:include page="../inc/cssLink.jsp"></jsp:include>
	<!-- 본인의 커스텀 css link 위치는 여기서부터 -->
	<link href="${pageContext.request.contextPath }/resources/css/admin/admin_table.css"  rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/admin/admin_report.css"  rel="stylesheet">
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
	                <h2 class="title-1 m-b-25">신고 관리 </h2>
	                <div class="input-group mb-3 flex-right-50pct">
	                <form action="../admin/report" method="get" class="input-group ">
					  <input type="text" class="form-control" id="search" name="search" value="${pageDTO.search }" placeholder="검색어 입력" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">
					  	<img alt="검색" src="${pageContext.request.contextPath }/resources/img/icon/search.png">
					  </button>
	                </form>
					</div>
	                <div class="table-responsive table--no-card m-b-40">
	                    <table class="table table-borderless table-striped table-earning">
	                        <thead>
	                            <tr>
	                                <th id="report_id">신고ID</th>
	                                <th id="reporter_id">신고자ID</th>
	                                <th id="reportee_id">신고대상ID</th>
	                                <th id="reported_item_id" class="text-right">신고상품ID</th>
	                                <th id="report_type" class="text-right">신고유형</th>
	                                <th id="report_contents" class="text-right">신고내용</th>
	                                <th id="reported_at" class="text-right">신고일시</th>
	                                <th id="report_status" class="text-right">처리상태</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	            			<c:forEach var="report" items="${reportList }">
	                            <tr id="${report.report_id }">
	                                <td>${report.report_id }</td>
	                                <td>${report.reporter_id }</td>
	                                <td>${report.reportee_id }</td>
	                                <td>${report.reported_item_id }</td>
	                                <td class="text-right">${report.report_type }</td>
	                                <td class="text-right">${report.report_contents }</td>
	                                <td class="text-right">${report.reported_at }</td>
	                                <td class="text-right">${report.report_status }</td>
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
								<c:if test="${empty pageDTO.search }">
					    		<a class="page-link" href="../admin/report?page=${1}" aria-label="Previous">
						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="이전"></span>
						    	</a>
								</c:if>
								<c:if test="${!empty pageDTO.search }">
					    		<a class="page-link" href="../admin/report?page=${1}&search=${pageDTO.search}" aria-label="Previous">
						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="이전"></span>
						    	</a>
								</c:if>
							</li>
			            	<!-- 페이지 한칸 씩 이동 -->
			            	<c:if test="${pageDTO.currentPage ne 1 }">
							<li class="page-item">
								<c:if test="${empty pageDTO.search }">
					    			<a class="page-link" href="../admin/report?page=${pageDTO.currentPage - 1}" aria-label="Previous">
						      		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
						    	</a>
							    </c:if>
								<c:if test="${!empty pageDTO.search }">
						    		<a class="page-link" href="../admin/report?page=${pageDTO.currentPage - 1}&search=${pageDTO.search}" aria-label="Previous">
							      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
						    	</a>
						    	</c:if>
							</li>
			            	</c:if>
			            	<!-- 페이지 번호로 이동 -->
							<c:forEach var="i" begin="${pageDTO.startPage }" 
								end="${pageDTO.endPage }" step="1">
								<c:if test="${pageDTO.currentPage eq i }">
									<c:if test="${empty pageDTO.search }">
										<li class="page-item  active"><a class="page-link" href="../admin/report?page=${i}">${i}</a></li>
									</c:if>
									<c:if test="${!empty pageDTO.search }">
										<li class="page-item  active"><a class="page-link" href="../admin/report?page=${i}&search=${pageDTO.search}">${i}</a></li>
									</c:if>
								</c:if>
								<c:if test="${pageDTO.currentPage ne i }">
									<c:if test="${empty pageDTO.search }">
										<li class="page-item"><a class="page-link" href="../admin/report?page=${i}">${i}</a></li>
									</c:if>
									<c:if test="${!empty pageDTO.search }">
										<li class="page-item"><a class="page-link" href="../admin/report?page=${i}&search=${pageDTO.search}">${i}</a></li>
									</c:if>
								</c:if>
							</c:forEach>
			            	<!-- 페이지 한칸 씩 이동 -->
							<c:if test="${pageDTO.currentPage ne pageDTO.pageCount }">
								<li class="page-item">
								<c:if test="${empty pageDTO.search }">
									  <a class="page-link" href="../admin/report?page=${pageDTO.currentPage + 1}" aria-label="Next">
									    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
									  </a>
								</c:if>
								<c:if test="${!empty pageDTO.search }">
									  <a class="page-link" href="../admin/report?page=${pageDTO.currentPage + 1}&search=${pageDTO.search}" aria-label="Next">
									    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
									  </a>
								</c:if>
								</li>
							</c:if>
							<li class="page-item">
							<c:if test="${empty pageDTO.search }">
							  <a class="page-link" href="../admin/report?page=${pageDTO.pageCount}" aria-label="Next">
							    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span>
							  </a>
							</c:if>
							<c:if test="${!empty pageDTO.search }">
							  <a class="page-link" href="../admin/report?page=${pageDTO.pageCount}&search=${pageDTO.search}" aria-label="Next">
							    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span>
							  </a>
							</c:if>
							</li>
						</ul>
					</div>
					<!-- 페이지 전환 버튼 부분 -->
	            </div>
            </div>
            <!-- 이 사이에 넣어주세요.-->
            </div>
			<!-- 모달 창  -->
			<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">신고 관리</h1>
			        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      <!-- 모달 창 메인 body -->
			      	<div class="form-floating mb-3">
					  <label for="report_id_modal">신고ID</label>
					  <input type="text" class="form-control-plaintext" id="report_id_modal" readonly>
			      	</div>
			      	<div class="form-floating d-flex flex-row mb-3">
				      	<div class="form-floating flex-fill mr-3">
							<label for="reporter_id_modal">신고자ID</label>
							<input type="text" class="form-control-plaintext" id="reporter_id_modal" readonly>
				      	</div>
				      	<div class="form-floating flex-fill ">
							<label for="report_type_modal">신고유형</label>
							<input type="text" class="form-control-plaintext" id="report_type_modal" placeholder="Password" readonly>
				      	</div>
					</div>
			      	<div class="form-floating d-flex flex-row mb-3">
						<div class="form-floating flex-fill mr-3">
							<label for="reportee_id_modal">신고대상ID</label>
							<input type="text" class="form-control-plaintext" id="reportee_id_modal" readonly>
						</div>
						<div class="form-floating flex-fill">
							<label for="reported_item_id_modal">신고상품ID</label>
							<input type="text" class="form-control-plaintext" id="reported_item_id_modal" placeholder="Password" readonly>
						</div>
					</div>
					<div class="form-floating d-flex flex-row mb-3">
						<div class="form-floating flex-fill">
							<label for="reported_at_modal">신고일시</label>
							<input type="text" class="form-control-plaintext" id="reported_at_modal" placeholder="Password" readonly>
						</div>
						<div class="form-floating flex-fill">
							<label for="report_status_modal">처리상태</label>
							<select class="custom-select " id="report_status_modal">
								<option value="접수">접수</option>
								<option value="처리 완료">처리 완료</option>
								<option value="해당 없음">해당 없음</option>
							</select>
						</div>
					</div>
					<div class="form-floating mb-3">
					  <label for="report_contents_modal">신고내용ID</label>
					  <textarea class="form-control" id="report_contents_modal"></textarea>
					</div>
					
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        <button type="button" class="btn btn-purple"  data-dismiss="modal" onclick="editReport()">Save changes</button>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/admin_cs_report.js"></script>
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
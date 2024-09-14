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

	<jsp:include page="../inc/cssLink.jsp"></jsp:include>
	<!-- 본인의 커스텀 css link 위치는 여기서부터 -->
	<link href="${pageContext.request.contextPath }/resources/css/admin/admin_table.css"  rel="stylesheet">
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
	                <h2 class="title-1 m-b-25">테이블 제목 </h2>
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
	                            <tr>
	                                <td>2018-09-29 05:57</td>
	                                <td>100398</td>
	                                <td>iPhone X 64Gb Grey</td>
	                                <td class="text-right">$999.00</td>
	                                <td class="text-right">1</td>
	                                <td class="text-right">$999.00</td>
	                                <td class="text-right">$999.00</td>
	                                <td class="text-right">$999.00</td>
	                            </tr>
	                            <tr>
	                                <td>2018-09-28 01:22</td>
	                                <td>100397</td>
	                                <td>Samsung S8 Black</td>
	                                <td class="text-right">$756.00</td>
	                                <td class="text-right">1</td>
	                                <td class="text-right">$756.00</td>
	                                <td class="text-right">$756.00</td>
	                                <td class="text-right">$756.00</td>
	                            </tr>
	                            <tr>
	                                <td>2018-09-27 02:12</td>
	                                <td>100396</td>
	                                <td>Game Console Controller</td>
	                                <td class="text-right">$22.00</td>
	                                <td class="text-right">2</td>
	                                <td class="text-right">$44.00</td>
	                                <td class="text-right">$44.00</td>
	                                <td class="text-right">$44.00</td>
	                            </tr>
	                            <tr>
	                                <td>2018-09-26 23:06</td>
	                                <td>100395</td>
	                                <td>iPhone X 256Gb Black</td>
	                                <td class="text-right">$1199.00</td>
	                                <td class="text-right">1</td>
	                                <td class="text-right">$1199.00</td>
	                                <td class="text-right">$1199.00</td>
	                                <td class="text-right">$1199.00</td>
	                            </tr>
	                            <tr>
	                                <td>2018-09-25 19:03</td>
	                                <td>100393</td>
	                                <td>USB 3.0 Cable</td>
	                                <td class="text-right">$10.00</td>
	                                <td class="text-right">3</td>
	                                <td class="text-right">$30.00</td>
	                                <td class="text-right">$30.00</td>
	                                <td class="text-right">$30.00</td>
	                            </tr>
	                            <tr>
	                                <td>2018-09-29 05:57</td>
	                                <td>100392</td>
	                                <td>Smartwatch 4.0 LTE Wifi</td>
	                                <td class="text-right">$199.00</td>
	                                <td class="text-right">6</td>
	                                <td class="text-right">$1494.00</td>
	                                <td class="text-right">$1494.00</td>
	                                <td class="text-right">$1494.00</td>
	                            </tr>
	                            <tr>
	                                <td>2018-09-24 19:10</td>
	                                <td>100391</td>
	                                <td>Camera C430W 4k</td>
	                                <td class="text-right">$699.00</td>
	                                <td class="text-right">1</td>
	                                <td class="text-right">$699.00</td>
	                                <td class="text-right">$699.00</td>
	                                <td class="text-right">$699.00</td>
	                            </tr>
	                            <tr>
	                                <td>2018-09-22 00:43</td>
	                                <td>100393</td>
	                                <td>USB 3.0 Cable</td>
	                                <td class="text-right">$10.00</td>
	                                <td class="text-right">3</td>
	                                <td class="text-right">$30.00</td>
	                                <td class="text-right">$30.00</td>
	                                <td class="text-right">$30.00</td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <!-- pageDTO 활용해서 페이지 다루는 부분 추가 필요 -->
	                <!-- 페이지 전환 버튼 부분 -->
	                <div class="position-relative ">
			            <ul class="pagination justify-content-end">
							<li class="page-item">
					    		<a class="page-link" href="#" aria-label="Previous">
						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="이전"></span>
						    	</a>
							</li>
							<li class="page-item">
					    		<a class="page-link" href="#" aria-label="Previous">
						      	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
						    	</a>
							</li>
							<li class="page-item  active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
							  <a class="page-link" href="#" aria-label="Next">
							    <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
							  </a>
							</li>
							<li class="page-item">
							  <a class="page-link" href="#" aria-label="Next">
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
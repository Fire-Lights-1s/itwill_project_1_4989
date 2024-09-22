<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/member/details.css">
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
            
            		<form action="${pageContext.request.contextPath}/my/infoUpdatePro" method="post" class="profile-update-form" name="fr" enctype="multipart/form-data">
			<div class="profile-circle-div">
				<img src="${pageContext.request.contextPath}/resources/upload/${memberDTO.profile_img}" class="profile-circle" id="profileImage">
				<label for="fileInput" class="custom-file-upload">
				    <img src="${pageContext.request.contextPath}/resources/img/btn_edit.png" class="profile-circle-edit" id="editIcon">
				</label>
				<input id="fileInput" type="file" accept="image/*" style="display:none;" name="file">
				<input type="hidden" name="oldfile" value="${memberDTO.profile_img}">
				<a href="#"><img src="${pageContext.request.contextPath}/resources/img/btn_cancel.png" class="profile-circle-cancel"></a>
			</div>
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="member_id" value="${memberDTO.member_id}" readonly>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="pass" value="${memberDTO.pass}" required readonly>                
                <p></p>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" value="${memberDTO.pass}" required readonly>
                <button type="button" onclick="removeReadonly()">비밀 번호 변경</button>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" value="${memberDTO.nickname}" required>
                <button type="button" id="nickBtn">중복 확인</button>
                <div id="nickCheck" class="form-group">
                </div>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="${memberDTO.name}" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">휴대폰 번호</label>
                <input type="tel" id="phoneNumber" name="phone" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" value="${memberDTO.phone}" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="${memberDTO.email}" required readonly>
            </div>
            <button type="submit" class="submit-button" onclick="updateCheck();">수정 완료</button>
        </form>
	
            
            
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
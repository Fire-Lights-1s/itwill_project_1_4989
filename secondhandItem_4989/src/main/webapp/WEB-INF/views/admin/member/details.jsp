<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>

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
<div class="container">
            <form action="${pageContext.request.contextPath}/admin/member/detailsPro" method="post" name="fr">
            <div class="profile-circle-div">
				<img src="${pageContext.request.contextPath}/resources/upload/${member.profile_img}" class="profile-circle" id="profileImage">
				<label for="fileInput" class="custom-file-upload">
				    <img src="${pageContext.request.contextPath}/resources/img/btn_edit.png" class="profile-circle-edit" id="editIcon">
				</label>
				<input id="fileInput" type="file" accept="image/*" style="display:none;" name="file">
				<input type="hidden" name="oldfile" value="${member.profile_img}">
				<a href="#"><img src="${pageContext.request.contextPath}/resources/img/btn_cancel.png" class="profile-circle-cancel"></a>
			</div>
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="member_id" name="member_id" value="${member.member_id}" placeholder="아이디" required>
                <button type="button" id="check-btn1" class="check-btn">중복 확인</button>
            </div>
            <div id = "checkedIdResult" name = "checkedIdResult"></div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="text" id="password" name="pass" value="${member.pass}" placeholder="비밀번호" required>
                <div id = "checkedPassResult" name = "checkedPassResult"></div>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" value="${member.nickname}" placeholder="닉네임" required>
                <button type="button" id="check-btn2" class="check-btn">중복 확인</button>
           	</div>
           	<div id = "checkedNickResult" name = "checkedNickResult"></div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" value="${member.name}" placeholder="이름" required>
                <div id = "checkedNameResult" name = "checkedNameResult"></div>
            </div>
            <div class="form-group">
                <label for="phoneNumber">휴대폰 번호</label>
                <input type="tel" id="phoneNumber" name="phone" value="${member.phone}" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="01012345678" required>
                <div id = "checkedPhoneResult" name = "checkedPhoneResult"></div>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="${member.email}" placeholder="abcd@efgh.com" required>
                <div id = "checkedEmailResult" name = "checkedEmailResult"></div>
            </div>
            
            
            
            <button type="submit" class="submit-button" onclick="updateCheck();" style="display: inline-block; position: relative;">수정 완료</button>
        </form>
        <c:if test="${!member.is_withdrawn}">
	        <form action="${pageContext.request.contextPath}/admin/member/deleteMember" method="post">
	        	<input type="hidden" name="user_id" value="${member.member_id}"> 
	            <button type="submit" class="userTal" onclick="userTal();" style="position: absolute; bottom: 20px; left: 350px; width: 100px; background-color: gray; height: 50px;">회원 탈퇴</button>
			</form>
		</c:if>
		<c:if test="${member.is_withdrawn}">
	        <form action="${pageContext.request.contextPath}/admin/member/resMember" method="post">
	        	<input type="hidden" name="user_id" value="${member.member_id}"> 
	            <button type="submit" class="userRes" onclick="userRes();" style="position: absolute; bottom: 20px; left: 350px; width: 100px; background-color: gray; height: 50px;">탈퇴 복구</button>
			</form>
		</c:if>
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
	

	<!-- 아이디 중복확인 -->
<script type="text/javascript">
$(function(){
	$('#check-btn1').click(function() {
// 		alert("asd")
		$.ajax({
			url:'${pageContext.request.contextPath}/member/idCheck',
			data:{'id':$('#member_id').val()},
			success:function(result){
				
				if (result == 'iddup'){
					result = "이미 존재하는 아이디입니다.";
					$('#checkedIdResult').html(result).css('color','red');
				} else {
					result = "사용가능한 아이디입니다.";
					$('#checkedIdResult').html(result).css('color','green');
				}
				
			}
			
		});
		
	});
});
</script>

<!-- 	회원 탈퇴 -->
<script type="text/javascript">
	function userTal(){
		const isConfirmed = confirm("정말로 회원 탈퇴를 하시겠습니까?");
	    if (!isConfirmed) {
	        event.preventDefault();
	    }
	}
	function userRes(){
		const isConfirmed = confirm("정말로 탈퇴 복구를 하시겠습니까?");
	    if (!isConfirmed) {
	        event.preventDefault();
	    }
	}
// 	document.querySelector('.userTal').addEventListener('click', function(event) {
// 	    const isConfirmed = confirm("정말로 회원 탈퇴를 하시겠습니까?");
// 	    if (!isConfirmed) {
// 	        event.preventDefault();
// 	    }
// 	});
// 	document.querySelector('.userRes').addEventListener('click', function(event) {
// 	    const isConfirmed = confirm("정말로 탈퇴 복구를 하시겠습니까?");
// 	    if (!isConfirmed) {
// 	        event.preventDefault();
// 	    }
// 	});
</script>

<!-- 닉네임 중복확인   -->
<script type="text/javascript">
$(function(){
	$('#check-btn2').click(function() {
//  		alert("asd")
		$.ajax({
			url:'${pageContext.request.contextPath}/member/nickCheck',
			data:{'nickname':$('#nickname').val()},
			success:function(result){
				
				if (result == 'nickdup'){
					result = "이미 존재하는 닉네임입니다.";
					$('#checkedNickResult').html(result).css('color','red');
				} else {
					result = "사용가능한 닉네임입니다.";
					$('#checkedNickResult').html(result).css('color','green');
				}
				
			}
			
		});
		
	});
});
</script>
	
	
</body>
</html>
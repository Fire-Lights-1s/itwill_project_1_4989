<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileUpdate.css">
<!-- 	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"> -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css"> --%>
<%-- 	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css"> --%>
<!-- 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" > -->
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script> --%>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile" style="color: #372161;">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/infoUpdate" style="color: #372161;">회원 정보 수정</a>
		</div>
	</header>
	<div class="content-container">
		<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			<h2>회원 정보 수정</h2>
			<div class="profile-a-update">
				<form action="${pageContext.request.contextPath}/my/deleteMem" method="post">
					<button type="submit" id="deleteButton">회원 탈퇴</button>
				</form>
			</div>
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
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script type="text/javascript">
	const pass1 = document.getElementById('password');
	const pass2 = document.getElementById('confirmPassword');
	const nickname = document.getElementById('nickname');
	const beforeNick = document.getElementById('nickname').value;
	const name = document.getElementById('name');
	const phone = document.getElementById('phoneNumber');
	const email = document.getElementById('email');
	
	function removeReadonly() {
        pass1.removeAttribute('readonly');
        pass2.removeAttribute('readonly');
		pass1.select();
	}
	function updateCheck() {
		if(pass1.value === "" || pass2.value === "") {
			alert("비밀번호를 입력해주세요.");
			event.preventDefault();
		}
		if(nickname.value === "") {
			alert("닉네임을 입력해주세요.");
			event.preventDefault();
		}
		if(nickname.value != beforeNick) {
			if(nickCheck.innerText == "" || nickCheck.innerText != "사용 가능한 닉네임입니다."){
				alert("닉네임 중복 확인해주세요.");
				event.preventDefault();
			}			
		}
		if(name.value === "") {
			alert("이름을 입력해주세요.");
			event.preventDefault();
		}
		if(phone.value === "") {
			alert("휴대폰 번호를 입력해주세요.");
			event.preventDefault();
		}
		if(email.value === "") {
			alert("이메일을 입력해주세요.");
			event.preventDefault();
		}
		
	}

	document.getElementById('fileInput').addEventListener('change', function(event) {
	    const file = event.target.files[0];
	    if (file) {
	        const reader = new FileReader();
	        reader.onload = function(e) {
	            document.getElementById('profileImage').src = e.target.result;
	        };
	        reader.readAsDataURL(file);
	    }
	});
	
	document.querySelector('.profile-circle-cancel').addEventListener('click', function(event) {
	    event.preventDefault();
	    const profileImage = document.getElementById('profileImage');
	    profileImage.src = '';
	});
	
	document.getElementById('deleteButton').addEventListener('click', function(event) {
	    const isConfirmed = confirm("정말로 회원 탈퇴를 하시겠습니까?");
	    if (!isConfirmed) {
	        event.preventDefault();
	    }
	});
</script>

<!-- 닉네임 중복 확인 -->
<script type="text/javascript">
$(function(){
	$('#nickBtn').click(function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/member/nickCheck',
			data:{'nickname':$('#nickname').val()},
			success:function(result){
				if(result == 'nickdup'){
					result = "이미 존재하는 닉네임입니다.";
					$('#nickCheck').html(result).css('color', 'red');
				}else{
					result = "사용 가능한 닉네임입니다.";
					$('#nickCheck').html(result).css('color', 'green');
				}					
			}
		});
	});
});
</script>

</body>
</html>
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
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/infoUpdate">회원 정보 수정</a>
		</div>
	</header>
	<div class="content-container">
		<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			<h2>회원 정보 수정</h2>
			<div class="profile-a">
					<a href="${pageContext.request.contextPath}/my/infoUpdate">회원 탈퇴</a>
			</div>
			<div class="profile-circle-div">
				<img src="${pageContext.request.contextPath}/resources/img/img_topplace01.jpg" class="profile-circle">
			</div>
		<form action="${pageContext.request.contextPath}/my/infoUpdatePro" method="post" class="profile-update-form" name="">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="member_id" value="${memberDTO.member_id}" readonly>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="pass" value="${memberDTO.pass}" required readonly>                
                <p>영문자, 숫자, 특수문자 중 2가지 이상 사용하여 8자 이상으로 입력해주세요.</p>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" value="${memberDTO.pass}" required readonly>
                <button type="button" onclick="removeReadonly()">비밀 번호 변경</button>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" value="${memberDTO.nickname}" required>
                <button type="button">중복 확인</button>
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
                <input type="email" id="email" name="email" value="${memberDTO.email}" required>
            </div>
            <button type="submit" class="submit-button">수정 완료</button>
        </form>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
<script type="text/javascript">
	function removeReadonly() {
		let pass1 = document.getElementById('password');
		let pass2 = document.getElementById('confirmPassword');
        pass1.removeAttribute('readonly');
        pass2.removeAttribute('readonly');
		pass1.value = "";
		pass2.value = "";
		pass1.focus();
	}
</script>
</body>
</html>
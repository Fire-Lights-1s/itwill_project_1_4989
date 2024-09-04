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
			
			
			
		<form action="#" method="post" class="profile-update-form">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" value="아이디" readonly>
                <button type="button">중복 확인</button>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" value="1234" required readonly>                
                <p>영문자, 숫자, 특수문자 중 2가지 이상 사용하여 8자 이상으로 입력해주세요.</p>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" value="1234" required readonly>
                <button type="button">비밀 번호 변경</button>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                <button type="button">중복 확인</button>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
            </div>
            <div class="form-group">
                <label for="phoneNumber">휴대폰 번호</label>
                <input type="tel" id="phoneNumber" name="phoneNumber" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="01012345678" required>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" placeholder="abcd@efgh.com" required>
            </div>
            <button type="submit" class="submit-button">수정 완료</button>
        </form>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
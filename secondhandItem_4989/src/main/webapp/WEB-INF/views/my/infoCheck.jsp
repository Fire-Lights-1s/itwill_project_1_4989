<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
    		<a href="${pageContext.request.contextPath}">홈 </a> >
    		<a href="${pageContext.request.contextPath}/my/profile">마이 페이지 </a> >
    		<a href="${pageContext.request.contextPath}/my/infoCheck">본인 확인</a>
		</div>
	</header>
	<div class="content-container">
		<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
		<h2>본인 확인</h2>
		<form action="${pageContext.request.contextPath}/my/infoCheckPro" method="post" class="login-container">
            <div class="input-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="member_id" placeholder="아이디">
            </div>
            <div class="input-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="pass" placeholder="비밀번호">
            </div>
            <button type="submit" class="login-bttn">확인</button>
        </form>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>
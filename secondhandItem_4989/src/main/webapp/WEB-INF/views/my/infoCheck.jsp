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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script> --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
    		<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
    		<a href="${pageContext.request.contextPath}/my/profile" style="color: #372161;">마이 페이지 </a> >
    		<a href="${pageContext.request.contextPath}/my/infoCheck" style="color: #372161;">본인 확인</a>
		</div>
	</header>
	<div class="content-container">
		<jsp:include page="../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
		<h2>본인 확인</h2>
		<form action="${pageContext.request.contextPath}/my/infoCheckPro" method="post" class="login-container" onsubmit="loginCheck();">
            <div class="input-group" style="width: 200px;">
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

<script>
	const navLinks = document.querySelectorAll('#sideNavLinks .nav-link');
	const currentUrl = location.pathname;
	navLinks.forEach(link => {
	    if (link.getAttribute('href') === currentUrl) {
	        link.classList.add('active-link');
	    }
	});
</script>

<script type="text/javascript">
	function loginCheck() {
		const pass = document.getElementById('password').value;
		if(pass === "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	}
</script>
</body>
</html>
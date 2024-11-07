<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${otherUserDTO.nickname}님의 프로필</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
<%-- 	<script src="${pageContext.request.contextPath }/resources/js/zzimScript.js" defer></script> --%>
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.0.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
   			<a href="${pageContext.request.contextPath}/your/seller?otherUser=${otherUserDTO.member_id}" style="color: #372161;">${otherUserDTO.nickname}님의 프로필</a>
		</div>
	</header>
	<div class="content-container">
<aside class="side-nav" style="padding-top: 0;">
	<div style="background-color: #4E229E; color: white; height: 80px; border-radius: 7px 7px 0 0; display: flex; justify-content: center; align-items: center;">
		<h3>판매자 페이지</h3>
	</div>
	<ul style="font-size: 20px; font-weight: 500;">
		<li><a href="${pageContext.request.contextPath}/your/seller?otherUser=${otherUserDTO.member_id}" style=" color: #372161; padding: 15px 15px; display: block; width: 200px; word-wrap: break-word;">${otherUserDTO.nickname}님의 프로필</a></li>
		<li><a href="${pageContext.request.contextPath}/your/sellerHistory?otherUser=${otherUserDTO.member_id}" style=" color: #372161; padding: 15px 15px; display: block;">판매 내역</a></li>
	</ul>
</aside>
		<div class="main-container-side-profile">
		<main>
			<h2>${otherUserDTO.nickname}님의 프로필</h2>
			<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="reportModalLabel">신고하기</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="reportForm" action="${pageContext.request.contextPath}/your/reportPro" method="post">
                                <div class="accordion-subject"><b>신고 내용</b></div>
                                <textarea class="form-control" placeholder="신고 사유를 입력해주세요" id="report_contents" name="report_contents" required></textarea>
                                <input type="hidden" value="${otherUserDTO.member_id}" name="otherUser">
                                <button type="submit" class="btn btn-primary mt-3" id="reportBtn">신고하기</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div style="text-align: right;">
            	<button class="button" id="openReportModal" data-toggle="modal" data-target="#reportModal" 
            	style="padding: 10px; border-radius: 10px; background-color: #4E229E; color: white; border: 1px solid #4E229E; cursor: pointer;">신고하기</button>
			</div>
			<div class="profile-circle-div">
				<img src="${pageContext.request.contextPath}/resources/upload/${otherUserDTO.profile_img}" class="profile-circle">
			</div>
			<p class="profile-nickname">${otherUserDTO.nickname}</p>
			<p class="profile-nickname">누적 거래 횟수</p>
			<p class="profile-nickname">${otherUserDTO.allTX}</p>
			<p class="profile-nickname" style="font-size: 24px;"><span style="color: gold;">★</span>${otherUserDTO.rating}</p>
		</main>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"></jsp:include>

<script type="text/javascript">
	function truncateText(selector, maxLength) {
	    const element = document.querySelector(selector);
	    const text = element.innerText;
	
	    if (text.length > maxLength) {
	      element.innerText = text.substring(0, maxLength) + "...";
	    }
	}
</script>

<script>
	const navLinks = document.querySelectorAll('#sideNavLinks .nav-link');
	const currentUrl = window.location.pathname;
	navLinks.forEach(link => {
	    if (link.getAttribute('href') === currentUrl) {
	        link.classList.add('active-link');
	    }
	});
</script>

<script>
function submitReport(){
	confirm("신고 접수 하시겠습니까?");
}
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/CsStyle.css">

<script>
	const contextPath = '${pageContext.request.contextPath}';
	<c:if test="${sessionScope.member_id == null || sessionScope.member_id == ''}">
	alert('로그인한 회원만 이용 가능한 기능입니다');
	window.location.href = contextPath + '/member/login';
	</c:if>
</script>

</head>
<body>

<jsp:include page="../inc/header.jsp"></jsp:include>

<header>
	<div id="menu-name">
		<a href="${pageContext.request.contextPath}">홈 </a> >
		<a href="${pageContext.request.contextPath}/cs/notice">고객센터 </a> >
		<a href="${pageContext.request.contextPath}/cs/inquiry">1:1문의</a>
	</div>
</header>

<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">
	<!-- 사이드 메뉴 시작 -->
      <jsp:include page="cs_sidenav.jsp"></jsp:include>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>

		<br>
		<h1 style="text-align:center;">1 : 1 문의</h1>
		<p class="guide-text">이용과 관련하여 궁금한 점이나 불편한 사항에 대해 말해주세요.<br>직접 확인하여 3영업일 내에 답변 드립니다.<br><strong>※ 문의를 남기기 전, '자주 묻는 질문'을 먼저 확인해주세요.</strong></p>
		<div class="inquiry-form-container">
		    <form name="inquiry_form" action="inquiry/submit" method="post" class="inquiry-form">
		        <div class="inquiry-form-row">
		        	<input type="hidden" name="member_id" value="${sessionScope.member_id }">
		            <label for="inquiry_type">• 분류</label>
		            <select id="inquiry_type" name="inquiry_type" class="inquiry-input">
		                <option selected disabled>선택</option>
		                <option value="이용문의">이용문의</option>
		                <option value="오류신고">오류신고</option>
		                <option value="서비스제안">서비스제안</option>
		                <option value="기타">기타</option>
		            </select>
		        </div>
		        <div class="inquiry-form-row">
		            <label for="inquiry-title">• 제목</label>
		            <input type="text" id="inquiry_title" name="inquiry_title" class="inquiry-input"/>
		        </div>
		        <div class="inquiry-form-row">
		            <label for="inquiry-contents">• 내용</label>
		            <textarea id="inquiry_contents" name="inquiry_contents" class="inquiry-textarea"></textarea>
		        </div>
		        <div class="inquiry-form-button-container">
		            <button id="submit_btn" type="submit" class="inquiry-submit-button">제출</button>
		        </div>
		    </form>
		</div>
		<a href="${pageContext.request.contextPath}/cs/inquirylist" style="text-decoration:none;"><button class="inquiry-check-button">내 문의내역 확인하기</button></a>

	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>

<script>

	document.getElementById('submit_btn').addEventListener('click', function (event) {

		event.preventDefault();

		const inquiry_type = document.forms['inquiry_form'].inquiry_type.value;
		const inquiry_title = document.getElementById('inquiry_title').value;
		const inquiry_contents = document.getElementById('inquiry_contents').value;

		if (inquiry_type == '선택') {
			alert('문의 유형을 선택해주세요.');
		} else if (inquiry_title == null || inquiry_title == '') {
			alert('문의글 제목을 적어주세요.');
		} else if (inquiry_contents == null || inquiry_contents == '') {
			alert('문의내용을 적어주세요.');
		} else {
			document.forms['inquiry_form'].submit();
		}

	});
</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<style>

h1, h3 { text-align:center; }

.content-container {
	background-color: white;
}

.side-nav ul {
	height: 300px;
}

.category-list ul {
    list-style-type: none; /* 기본 리스트 스타일 제거 */
    padding: 0;
    margin: 0 auto;
    text-align: center;
}

.category-list li {
	display: inline-block;
	width: 200px;
	height: 100px;
	line-height: 60px;
	margin: 10px;
	vertical-align: top;
    background-color: #000; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    padding: 20px 20px; /* 버튼 내부 여백 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 마우스 커서가 버튼처럼 보이게 설정 */
    text-align: center; /* 텍스트 가운데 정렬 */
    transition: background-color 0.3s; /* 호버 시 배경색 변화 효과 */
}

.category-list li:hover {
    background-color: #222; /* 호버 시 배경색 변화 */
}

.category-list li:active {
    background-color: #53308F; /* 클릭 시 배경색 변화 */
}

.category-list li a {
    text-decoration: none; /* 링크 밑줄 제거 */
    color: white; /* 링크 텍스트 색상 */
    display: block; /* li 전체가 클릭 가능하도록 설정 */
}



</style>
</head>
<body>

  <jsp:include page="../../inc/header.jsp"></jsp:include>

<header>
   	<div id="menu-name">
		매입신청 > 매입 신청하기
	</div>
</header>
<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">

      <jsp:include page="../inc_side.jsp"></jsp:include>

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>

		<br>
		<h1 style="text-align:center;">매입 신청하기</h1>
		
		<div id="ask" style="padding:20px; text-align:center; margin:50px auto;">
			<h3>어떤 제품을 가지고 계신가요?</h3>
		</div>
		
		<div class="category-list">
			<ul>
			<a href="#"><li>휴대폰</li></a>
			<a href="#"><li>태블릿</li></a>
			<a href="#"><li>스마트워치</li></a>
			<a href="#"><li>PC/노트북</li></a>
			<a href="#"><li>PC주변기기</li></a>
			<a href="#"><li>게임기기</li></a>
			<a href="#"><li>기타</li></a>
			</ul>
		</div>
		<br><br><br><br><br>



	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->
  
  <jsp:include page="../../inc/footer.jsp"></jsp:include>
  
</body>
</html>
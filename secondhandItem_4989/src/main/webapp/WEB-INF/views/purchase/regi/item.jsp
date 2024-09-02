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

th {
	background-color: #eee;
}

th, td {
	padding: 5px 10px;
}

.subheader {
	font-size: 0.7em;
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
		
		<h3 style="margin-top:50px;">제품과 등급을 선택해주세요</h3>
		
		<div id="ask" style="padding:20px; text-align:center; margin:50px auto;">	
			
			<form target="" method="get">
			<select id="select-category" onchange="updateList()" style="font-size:15px; padding:3px;">
				<option value="all">전체</option>
				<option value="phone">휴대폰</option>
				<option value="tablet">태블릿</option>
				<option value="watch">스마트워치</option>
				<option value="computer">PC/노트북</option>
				<option value="acc">PC주변기기</option>
				<option value="game">게임기기</option>
				<option value="etc">기타</option>
			</select>
			<input type="text" name="item" placeholder="제조사, 상품명으로 검색" style="font-size:15px; padding:3px;">
			<input type="submit" value="검색" style="font-size:15px; padding:3px 5px;">
			</form>
		</div>
		
		<div id="result">
		<table style="min-width:900px; margin:0 auto; text-align:center;">
		<tr>
			<th rowspan="2">제조사</th>
			<th rowspan="2">제품명</th>
			<th colspan="3">현재 기준 일반 매입가</th>
		<tr>
			<th>S등급<br><span class="subheader">사용감 없음, 기능 정상</span></th>
			<th>A등급<br><span class="subheader">외관 미세손상, 기능 정상</span></th>
			<th>B등급<br><span class="subheader">외관 파손, 기능 불량</span></th>
		</tr>
		<tr>
			<td>-</td>
			<td>+</td>
			<td><a href="form?name=name&expected_grade=s">10,000</a></td>
			<td><a href="form?name=name&expected_grade=s">10,000</a></td>
			<td><a href="form?name=name&expected_grade=s">10,000</a></td>
		</tr>
		
		</table>
		
		
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
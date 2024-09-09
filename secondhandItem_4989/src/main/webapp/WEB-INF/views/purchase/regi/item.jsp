<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입 신청하기 : 4989</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/purchaseStyle.css">
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

#result {
	border:solid black 1px;
	width: auto;
}

.pricebox a {
	text-decoration: none;
	color: black;
	font-weight: 800;
}

.pricebox:hover  {
	background-color: #eee;
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
		
		<h3 style="margin-top:50px;">제품과 등급을 선택해주세요 (매입가 클릭)</h3>
		
		<div id="ask" style="padding:20px; text-align:center; margin:30px auto;">		
		<form id="search_item" action="search" method="get">
			<select id="select-category" name="category_name" style="font-size:15px; padding:3px;">
				<option value="all">전체</option>
				<option value="phone" ${category_name == 'phone' ? 'selected="selected"' : ''}>휴대폰</option>
				<option value="tablet" ${category_name == 'tablet' ? 'selected="selected"' : ''}>태블릿</option>
				<option value="watch" ${category_name == 'watch' ? 'selected="selected"' : ''}>스마트워치</option>
				<option value="computer" ${category_name == 'computer' ? 'selected="selected"' : ''}>PC/노트북</option>
				<option value="acc" ${category_name == 'acc' ? 'selected="selected"' : ''}>PC주변기기</option>
				<option value="game" ${category_name == 'game' ? 'selected="selected"' : ''}>게임기기</option>
				<option value="etc" ${category_name == 'etc' ? 'selected="selected"' : ''}>기타</option>
			</select>
			<div id="search-box">
				<input type="text" id="search-text" name="query" placeholder="제조사, 상품명으로 검색">
				<button id="search-button" type="submit"><span>Search</span></button>
			</div>
		</form>
		</div>
			
		<div id="result">
		<table>
		<tr>
			<th rowspan="2" style="border-right:solid 1px #666;">제조사</th>
			<th rowspan="2" style="border-right:solid 1px #666;">제품명</th>
			<th colspan="3" style="border-bottom:solid 1px #666;">현재 기준 일반 매입가</th>
		<tr>
			<th>S등급<br><span class="subheader">사용감 없음, 기능 정상</span></th>
			<th>A등급<br><span class="subheader">외관 미세손상, 기능 정상</span></th>
			<th>B등급<br><span class="subheader">외관 파손, 기능 불량</span></th>
		</tr>
		<c:forEach var="items" items="${items}">
		<tr>
			<td style="border-right:solid 1px #666;">${items.item_maker }</td>
			<td style="border-right:solid 1px #666;">${items.pc_item_name }</td>
			<td class="pricebox"><a href="form?name=${items.pc_item_name }&grade=S&price=${items.price_s }"><fmt:formatNumber value="${items.price_s }" type="number"/>원</a></td>
			<td class="pricebox"><a href="form?name=${items.pc_item_name }&grade=A&price=${items.price_a }"><fmt:formatNumber value="${items.price_a }" type="number"/>원</a></td>
			<td class="pricebox"><a href="form?name=${items.pc_item_name }&grade=B&price=${items.price_b }"><fmt:formatNumber value="${items.price_b }" type="number"/>원</a></td>
		</tr>
		</c:forEach>
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
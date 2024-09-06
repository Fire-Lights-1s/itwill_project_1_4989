<!-- 사이드 영역과 본문페이지를 작성할 때, 
	<aside></aside> 사이에 사이드 영역을 <main></main> 사이에 본문을 입력하여 사용해주세요.  -->
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
    String productId = request.getParameter("productId");
    // productId에 해당하는 상품 정보를 데이터베이스에서 조회하는 로직 추가
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<!-- CSS 파일 링크 -->

</head>
	<style>	
	body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.container {
    width: 90%;
    margin: 0 auto;
    padding: 20px;
}

.header-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.filter-row {
    display: flex;
    gap: 10px;
}

.filter-row button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
}

.filter-row button:hover {
    background-color: #007bff;
}

.grid-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4 columns */
    gap: 20px;
}

.card {
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.card img {
    width: 200px;
    height: 200px;
    object-fit: cover;
    margin-bottom: 15px;
}

.card h3 {
    font-size: 18px;
    margin: 10px 0;
}

.card p {
    font-size: 14px;
    color: #555;
}

.card button {
    background-color: #28a745;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

.card button:hover {
    background-color: #218838;
}
	
	</style>

<body>

<jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			카테고리 전체
		</div>
   </header>

<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">
	<!-- 사이드 메뉴 시작 -->
      <aside class="side-nav">
        <h5>사이드메뉴영역</h5>
        <br>
        <br>
        <ul>
            <li><a href="#">메뉴 1</a></li>
            <li><a href="#">메뉴 2</a></li>
            <li><a href="#">메뉴 3</a></li>
            <li><a href="#">메뉴 4</a></li>
        </ul>
      </aside>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>
 

	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>

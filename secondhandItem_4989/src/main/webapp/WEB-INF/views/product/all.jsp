<!-- 사이드 영역과 본문페이지를 작성할 때, 
	<aside></aside> 사이에 사이드 영역을<main></main> 사이에 본문을 입력하여 사용해주세요.  -->
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script>
        function sortNewest() {
            // 최신순 정렬 기능
            console.log('Sorting by newest...');
        }

        function sortPriceHighToLow() {
            // 가격 높은 순 정렬 기능
            console.log('Sorting by price (high to low)...');
        }

        function sortPriceLowToHigh() {
            // 가격 낮은 순 정렬 기능
            console.log('Sorting by price (low to high)...');
        }
    </script>
</head>
<body>

    <div class="container">
        <!-- Sorting Filters -->
        <div class="header-row">
            <h2>상품 목록</h2>
            <div class="filter-row">
                <button onclick="sortNewest()">최신순</button>
                <button onclick="sortPriceHighToLow()">높은가격순</button>
                <button onclick="sortPriceLowToHigh()">낮은가격순</button>
            </div>
        </div>

        <!-- Product Cards Grid -->
        <div class="grid-container">
            <!-- Example of one card -->
            <div class="card">
                <img src="https://via.placeholder.com/200" alt="상품 이미지">
                <h3>상품명</h3>
                <p>가격: 100,000원</p>
                <p>거래방식: 택배 / 직거래 (서울)</p>
                <p>등록 시간: 1시간 전</p>
                <button>상세보기</button>
            </div>

            <div class="card">
                <img src="https://via.placeholder.com/200" alt="상품 이미지">
                <h3>상품명</h3>
                <p>가격: 200,000원</p>
                <p>거래방식: 택배 / 직거래 (부산)</p>
                <p>등록 시간: 2시간 전</p>
                <button>상세보기</button>
            </div>

            <div class="card">
                <img src="https://via.placeholder.com/200" alt="상품 이미지">
                <h3>상품명</h3>
                <p>가격: 150,000원</p>
                <p>거래방식: 택배 / 직거래 (인천)</p>
                <p>등록 시간: 3시간 전</p>
                <button>상세보기</button>
            </div>

            <div class="card">
                <img src="https://via.placeholder.com/200" alt="상품 이미지">
                <h3>상품명</h3>
                <p>가격: 300,000원</p>
                <p>거래방식: 택배 / 직거래 (대구)</p>
                <p>등록 시간: 4시간 전</p>
                <button>상세보기</button>
            </div>

            <!-- Add more cards as necessary -->
        </div>
    </div>	  
	  
	

	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>

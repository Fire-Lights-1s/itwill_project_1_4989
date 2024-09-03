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
</head>
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
	<div class="container">
        <!-- Sorting Filters -->
        <div class="filter-row">
            <button onclick="sortNewest()">최신순</button>
            <button onclick="sortOldest()">등록 기간이 오래된 순</button>
            <button onclick="sortPriceHighToLow()">고가순</button>
            <button onclick="sortPriceLowToHigh()">저가순</button>
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
                <button>상품 상세보기</button>
            </div>

            <div class="card">
                <img src="https://via.placeholder.com/200" alt="상품 이미지">
                <h3>상품명</h3>
                <p>가격: 200,000원</p>
                <p>거래방식: 택배 / 직거래 (부산)</p>
                <p>등록 시간: 2시간 전</p>
                <button>상품 상세보기</button>
            </div>

            <div class="card">
                <img src="https://via.placeholder.com/200" alt="상품 이미지">
                <h3>상품명</h3>
                <p>가격: 150,000원</p>
                <p>거래방식: 택배 / 직거래 (인천)</p>
                <p>등록 시간: 3시간 전</p>
                <button>상품 상세보기</button>
            </div>

            <div class="card">
                <img src="https://via.placeholder.com/200" alt="상품 이미지">
                <h3>상품명</h3>
                <p>가격: 300,000원</p>
                <p>거래방식: 택배 / 직거래 (대구)</p>
                <p>등록 시간: 4시간 전</p>
                <button>상품 상세보기</button>
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

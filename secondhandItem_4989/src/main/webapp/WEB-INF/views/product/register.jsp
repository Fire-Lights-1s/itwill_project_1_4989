<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 로그인한 사람만 상품 등록 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- postcode.v2.js 우편번호 서비스 기능을 가진 외부 자바스크립트 연결 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>물품등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS -->
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	width: 60%;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ddd;
	background-color: #f8f8f8;
	border-radius: 5px;
	margin-top: 50px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 8px;
}

input[type="text"], input[type="number"], select, textarea {
	width: 100%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

textarea {
	height: 100px;
}

.submit-btn {
	width: 100%;
	background-color: #007bff;
	color: white;
	border: none;
	padding: 15px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
}

.submit-btn:hover {
	background-color: #0056b3;
}

.image-upload {
	text-align: center;
	margin-bottom: 20px;
}

.image-upload img {
	width: 150px;
	height: 150px;
	border: 1px solid #ddd;
	background-color: #f8f8f8;
	padding: 20px;
	cursor: pointer;
}

.image-preview-container {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

.image-preview-container img {
	width: 200px;
	height: 200px;
	object-fit: cover;
	border: 1px solid #ddd;
	border-radius: 5px;
}
</style>

<!-- JavaScript -->
<script>
	//구입연도 '알 수 없음' 선택 함수
	function handleYearCheckbox() {
		var checkbox = document.getElementById("unknownCheckbox");
		var yearInput = document.getElementById("yearInput");

		// "알 수 없음" 체크 시 입력 필드 비활성화
		if (checkbox.checked) {
			yearInput.value = "unknown";
			yearInput.disabled = true;
		} else {
			yearInput.value = "";
			yearInput.disabled = false;
		}
	}

	// "알 수 없음" 체크박스 선택 시 구입연도 비활성화
	function handleYearCheckbox() {
		var checkbox = document.getElementById("unknownCheckbox");
		var yearInput = document.getElementById("yearInput");
		var yearSuffix = document.getElementById("yearSuffix");

		if (checkbox.checked) {
			yearInput.value = "unknown";
			yearInput.disabled = true;
			yearSuffix.style.display = "none";
		} else {
			yearInput.value = "";
			yearInput.disabled = false;
			yearSuffix.style.display = "inline";
		}
	}
	//연도 입력값이 4글자를 넘으면 자르고, 숫자만 입력하도록 제어
	function limitYearLength() {
		var yearInput = document.getElementById("yearInput");

		if (yearInput.value.length > 4) {
			yearInput.value = yearInput.value.slice(0, 4);
		}
	}
	// 이미지 클릭 시 파일 선택 창 열기
	document.getElementById('imagePreview').addEventListener('click',
			function() {
				document.getElementById('imageInput').click();
			});

	// 파일 선택 후 미리보기 이미지 업데이트
	function previewImage(event) {
		const reader = new FileReader();
		reader.onload = function() {
			const output = document.getElementById('imagePreview');
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
	}

	
</script>

</head>
<body>

	<jsp:include page="../inc/header.jsp"></jsp:include>

	<header>
		<div id="menu-name">물품등록</div>
	</header>

	<section>
		<div id="main-container">
			<main>
				<!-- 본문 영역 -->
	<div class="addBox">
		<form action="${pageContext.request.contextPath}/product/registerPro" 
						class="appform" method="post" name="fr"
						enctype="multipart/form-data">
						<hr style="border: 0; height: 3px; color: black;">
						<div class="container">
							<!-- 이미지 업로드 및 미리보기 영역 -->
							<div class="form-group image-upload">
								<label for="product_img1">사진 선택</label> 
								<input type="file" id="product_img1" name="product_img1">
							</div>


							<!-- 카테고리 등 다른 폼 요소 -->
							<div class="form-group inline-group">
								<label for="category_name">카테고리</label> <select
									id="category_name" name="category_name">
									<option value="" disabled selected>선택</option>
									<option value="phone">휴대폰</option>
									<option value="tablet">태블릿</option>
									<option value="watch">스마트워치</option>
									<option value="computer">PC / 노트북</option>
									<option value="acc">PC주변기기</option>
									<option value="game">게임기기</option>
									<option value="etc">기타</option>
								</select>
							</div>

							<div class="form-group inline-group">
								<label for="product_name">제품명</label> <input type="text"
									id="product_name" name="product_name"
									placeholder="브랜드명, 모델명 함께 입력해주세요.">
							</div>

							<div class="form-group inline-group">
								<label for="year_purchase">구입연도</label> <input type="number"
									id="year_purchase" name="year_purchase"
									placeholder="구입연도를 입력해주세요" min="1900" max="2024"
									style="flex: 1;" maxlength="4" oninput="limitYearLength()">

								<label style="margin-left: 10px;"> <input
									type="checkbox" id="unknownCheckbox"
									onclick="handleYearCheckbox()"> 알 수 없음
								</label>
							</div>

							<div class="form-group inline-group">
								<label for="product_price">판매 가격</label> <input type="number"
									id="product_price" name="product_price" placeholder="원"
									oninput="addPriceSuffix()">
							</div>

														<div class="form-group inline-group">
    <label for="post1">거래 지역</label>
    <input type="text" name="post1" id="post1" placeholder="우편번호">
    <input type="button" value="주소 검색" onclick="daum_address();" class="button_2">
</div>

<div class="form-group inline-group">
    <label for="addr1">기본주소</label>
    <input type="text" name="addr1" id="addr1" placeholder="기본주소">
    
<div class="form-group inline-group">
							<label for="trade_method">거래 방식</label> <select id="trade_method"
								name="trade_method">
								<option value="" disabled selected>선택</option>
								<option value="택배">택배</option>
								<option value="직거래">직거래</option>
								<option value="택배/직거래">택배/직거래</option>
							</select>
						</div>

						<div class="form-group inline-group">
							<label for="pay_method">결제 방식</label> <select id="pay_method"
								name="pay_method">
								<option value="" disabled selected>선택</option>
								<option value="현금">현금</option>
								<option value="페이">4989페이</option>
								<option value="현금/4989페이">현금/4989페이</option>
							</select>
						</div>

						<div class="form-group inline-group">
							<label for="product_desc">물품 상태</label>
							<textarea id="product_desc" name="product_desc"
								placeholder="물품 상태(미개봉/신품/중고), 하자 등 상세내용을 적어주세요."></textarea>
						</div>

						<div class="form-group">
							<button type="submit" class="submit-btn" value="save">등록하기</button>
						</div>
				</div>

    
</div>



				

						
				
				
				</form>
		</div>

<script>

function daum_address() {

	let themeObj = {
	   searchBgColor: "#0B65C8",
	   queryTextColor: "#FFFFFF"
	};
	
	new daum.Postcode({
	    oncomplete: function(data) {
	    console.log(data);	
	    
	    document.fr.post1.value = data.zonecode;
	    document.fr.post1.value = data.sido;
		document.fr.addr1.value = data.sigungu;
		document.fr.addr1.value = data.bname;
		
		document.fr.addr2.focus();	    	
	    },
				
		theme :	themeObj
	}).open();

}

</script>
		

		</main>
		</div>
	</section>

	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>


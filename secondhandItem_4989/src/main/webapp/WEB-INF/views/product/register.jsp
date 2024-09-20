<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 로그인한 사람만 상품 등록 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>판매등록</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/productRegister.css">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- postcode.v2.js 우편번호 서비스 기능을 가진 외부 자바스크립트 연결 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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

</script>



</head>
<body>

	<jsp:include page="../inc/header.jsp"></jsp:include>

	<header>
		<div id="menu-name">판매등록</div>
	</header>

	<section>
		<div id="main-container">
			<main>
				<!-- 본문 영역 -->
				<div class="addBox">
					<form
						action="${pageContext.request.contextPath}/product/registerPro"
						class="appform" method="post" name="fr"
						enctype="multipart/form-data">
						<hr style="border: 0; height: 3px; color: black;">
						<div class="container">

							<!-- 이미지 업로드 및 미리보기 영역 -->
							<div class="form-group image-upload">
								<!-- 파일 선택 버튼을 구분하여 표시 -->
								<label for="product_img1">파일1 선택</label> <input type="file"
									id="product_img1" name="product_img[]" class="file_upload">

								<label for="product_img2">파일2 선택</label> <input type="file"
									id="product_img2" name="product_img[]" class="file_upload">

								<label for="product_img3">파일3 선택</label> <input type="file"
									id="product_img3" name="product_img[]" class="file_upload">

								<label for="product_img4">파일4 선택</label> <input type="file"
									id="product_img4" name="product_img[]" class="file_upload">

								<label for="product_img5">파일5 선택</label> <input type="file"
									id="product_img5" name="product_img[]" class="file_upload">
							</div>

						</div>
						<!-- 이미지 미리보기 영역 추가 -->
						<div class="form-group image-preview-container">
							<!-- 미리보기 이미지들이 여기에 추가됩니다. -->
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

							<label style="margin-left: 10px;"> <input type="checkbox"
								id="unknownCheckbox" onclick="handleYearCheckbox()"> 알 수
								없음
							</label>
						</div>

						<div class="form-group inline-group">
							<label for="product_price">판매 가격</label> <input type="number"
								id="product_price" name="product_price" placeholder="원"
								oninput="addPriceSuffix()">
						</div>

						<div class="form-group inline-group">
							<label for="post1">거래 지역</label>
							<div style="display: flex; gap: 10px;">
								<!-- 주소 검색 버튼을 왼쪽으로 이동 -->
								<input type="button" value="주소 검색" onclick="daum_address();"
									class="addr-bttn">
								<!-- 		<input type="text" id="trade_area" name="trade_area" placeholder="시군구 코드"> -->
								<input type="text" id="sido" name="sido" placeholder="도/시 이름">
								<input type="text" id="sigungu" name="sigungu"
									placeholder="시/군/구 이름">
								<!-- 시와 구 합친 거래지역 값 저장 -->
								<input type="hidden" id="trade_area" name="trade_area">
							</div>
						</div>

						<br>
						<div class="form-group inline-group">
							<div class="form-group inline-group">
								<!-- 거래 방식과 결제 방식을 한 줄에 배치 -->
								<div style="display: flex; gap: 20px; width: 100%;">
									<div style="flex: 1;">
										<label for="trade_method">거래 방식</label> <select
											id="trade_method" name="trade_method">
											<option value="" disabled selected>선택</option>
											<option value="직거래">직거래</option>
											<option value="택배">택배</option>
											<option value="직거래/택배">직거래/택배</option>
										</select>
									</div>

									<div style="flex: 1;">
										<label for="pay_method">결제 방식</label> <select id="pay_method"
											name="pay_method">
											<option value="" disabled selected>선택</option>
											<option value="현금">현금</option>
											<option value="페이">페이</option>
											<option value="현금/페이">현금/페이</option>
										</select>
									</div>
								</div>
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

		<!-- 여러 파일 선택 후 미리보기 및 파일 누적 관리 -->
		<script>
document.addEventListener("DOMContentLoaded", function() {
    let uploadFiles = [];
    let dataTransfer = new DataTransfer(); // **노란색 주석: 선택한 파일 순서대로 누적 관리**

    function getImageFiles(event) {
        const files = event.currentTarget.files;
        
        //alert( files);
        // 선택된 파일들을 배열에 추가
        [...files].forEach(file => {
            uploadFiles.push(file);
            dataTransfer.items.add(file);  // **노란색 주석: dataTransfer에 파일 추가**
           
            
        });

        // 이놈 때문에 업로드 안한 파일명에 중복 이름 들어갔음!!
        //event.currentTarget.files = dataTransfer.files;

        // 미리보기 업데이트
        updateImagePreview();
    }

    function updateImagePreview() {
        const container = document.querySelector('.image-preview-container');
        container.innerHTML = ''; // 기존 미리보기 삭제

        uploadFiles.forEach((file, index) => {
            const reader = new FileReader();

            reader.onload = function(e) {
                const imgWrapper = document.createElement('div');
                imgWrapper.className = 'img-wrapper';

                const img = document.createElement('img');
                img.src = e.target.result;
                img.alt = '이미지 미리보기';
                img.style.width = '100px';
                img.style.height = '100px';

                const deleteButton = document.createElement('button');
                deleteButton.innerHTML = 'X';
                deleteButton.onclick = function() {
                    uploadFiles.splice(index, 1);  // 파일 배열에서 해당 파일 제거
                    dataTransfer.items.remove(index);  // **노란색 주석: DataTransfer에서 해당 파일 제거**
                    updateImagePreview();  // **노란색 주석: 미리보기 업데이트**
                };

                imgWrapper.appendChild(img);
                imgWrapper.appendChild(deleteButton);
                container.appendChild(imgWrapper);
            }

            reader.readAsDataURL(file);
        });
    }

    // 모든 파일 입력 요소에 동일한 이벤트 핸들러 연결
    const fileInputs = document.querySelectorAll('.file_upload');
    fileInputs.forEach(input => {
        input.addEventListener('change', getImageFiles);
    });
});


</script>
		<!-- 다음 주소 api				 -->
		<script>
					//다음 주소 api
					function daum_address() {

						let themeObj = {
							searchBgColor : "#0B65C8",
							queryTextColor : "#FFFFFF"
						};

						new daum.Postcode(
								{
									oncomplete : function(data) {
										console.log(data);

										// 시/도 및 구/군 값을 입력 필드에 설정
										document.getElementById('sido').value = data.sido;
										document.getElementById('sigungu').value = data.sigungu;
										/* document.getElementById('addr2')
												.focus(); // addr2 필드가 있을 경우 */
										//trade_area에 시/도 + 구/군 값을 합쳐서 설정		
										document.getElementById('trade_area').value = data.sido + " " + data.sigungu;
										// 창을 자동으로 닫음
							            document.getElementById("close").click();
												
									},

									theme : themeObj
								}).open();

					}
				
				</script>


		</main>
		</div>
	</section>

	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>
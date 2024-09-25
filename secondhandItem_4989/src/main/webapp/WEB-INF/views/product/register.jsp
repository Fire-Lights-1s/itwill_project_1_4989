
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- JavaScript -->

<script>
    const contextPath = '${pageContext.request.contextPath}';
    <c:if test="${sessionScope.member_id == null || sessionScope.member_id == ''}">
    alert('로그인한 회원만 이용 가능한 기능입니다');
    window.location.href = contextPath + '/member/login';
    </c:if>
</script>

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
<div class="container">
    <form action="${pageContext.request.contextPath}/product/registerPro" 
          method="post" class="appform" enctype="multipart/form-data" >

        <!-- 이미지 업로드 영역 -->
        <div class="form-group image-upload">
            <img src="${pageContext.request.contextPath}/resources/upload/register_upload.png"
                 id="uploadImage"
                 style="cursor: pointer; width: 150px; height: 150px;">
            <input type="file" id="product_img" name="product_img"
                   class="file_upload" accept=".jpg, .jpeg, .png, .gif" multiple
                   style="display: none;">
            <div id="previewContainer" class="image-preview-container"></div>
        </div>

        <!-- 카테고리 선택 -->
        <div class="form-group inline-group">
            <label for="category_name">카테고리</label>
            <select id="category_name" name="category_name">
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

        <!-- 제품명 입력 -->
        <div class="form-group inline-group">
            <label for="product_name">제품명</label>
            <input type="text" id="product_name" name="product_name"
                   placeholder="브랜드명, 모델명 함께 입력해주세요.">
        </div>

        <!-- 구입연도 입력 -->
        <div class="form-group inline-group">
            <label for="year_purchase">구입연도</label>
            <input type="number" id="year_purchase" name="year_purchase" 
                   placeholder="구입연도를 입력해주세요" min="1900" max="2024"
                   maxlength="4" oninput="limitYearLength()">
            <label style="margin-left: 10px;">
                <input type="checkbox" id="unknownCheckbox" onclick="handleYearCheckbox()"> 알 수 없음
            </label>
        </div>

        <!-- 판매 가격 입력 -->
        <div class="form-group inline-group">
            <label for="product_price">판매 가격</label>
            <input type="number" id="product_price" name="product_price" placeholder="원">
        </div>

        <!-- 거래 지역 입력 -->
        <div class="form-group inline-group">
            <label for="post1">거래 지역</label>
            <div style="display: flex; gap: 10px;">
                <input type="button" value="주소 검색" onclick="daum_address();" class="addr-bttn">
                <input type="text" id="sido" name="sido" placeholder="도/시 이름">
                <input type="text" id="sigungu" name="sigungu" placeholder="시/군/구 이름">
                <input type="hidden" id="trade_area" name="trade_area">
            </div>
        </div>

        <!-- 거래 방식 및 결제 방식 -->
        <div class="form-group inline-group">
            <div style="display: flex; gap: 20px; width: 100%;">
                <div style="flex: 1;">
                    <label for="trade_method">거래 방식</label>
                    <select id="trade_method" name="trade_method">
                        <option value="" disabled selected>선택</option>
                        <option value="직거래">직거래</option>
                        <option value="택배">택배</option>
                        <option value="직거래/택배">직거래/택배</option>
                    </select>
                </div>
                <div style="flex: 1;">
                    <label for="pay_method">결제 방식</label>
                    <select id="pay_method" name="pay_method">
                        <option value="" disabled selected>선택</option>
                        <option value="현금">현금</option>
                        <option value="페이">페이</option>
                        <option value="현금/페이">현금/페이</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- 물품 상태 입력 -->
        <div class="form-group inline-group">
            <label for="product_desc">물품 상태</label>
            <textarea id="product_desc" name="product_desc"
                      placeholder="물품 상태(미개봉/신품/중고), 하자 등 상세내용을 적어주세요."></textarea>
        </div>

        <!-- 등록 버튼 -->
        <div class="form-group">
            <button type="submit" class="submit-btn" value="save">등록하기</button>
        </div>
    </form>
</div>

<script>

$(document).ready(function() {

    // 이미지 파일 모을 배열 선언
    let selectedFiles = [];

    // 업로드이미지 클릭 시 파일 선택창 열기
    document.getElementById('uploadImage').addEventListener('click', function () {
        document.getElementById('product_img').click();
    })

    // 파일 선택 시 미리보기
    document.getElementById('product_img').addEventListener('change', function (event) {
        let files = event.target.files;
        let previewContainer = document.getElementById('previewContainer');
        let remainingSlots = 5 - selectedFiles.length;

        if (files.length > remainingSlots) {
            alert('최대 5개의 이미지만 첨부할 수 있습니다.');
            return;
        }

        // 들어온 파일 반복 처리
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            selectedFiles.push(file);   // 배열 추가

            // 미리보기 추가
            const reader = new FileReader();
            reader.onload = function (e) {
                const imgWrapper = document.createElement('div');
                imgWrapper.classList.add('imageItem'); // 이미지 래퍼에 스타일 적용

                const img = document.createElement("img");
                img.src = e.target.result;
                img.classList.add("imageSize"); // 이미지 크기 조정

                // 닫기 버튼 추가
                const closeButton = document.createElement("span");
                closeButton.classList.add("imageClose"); // 외부 CSS의 imageClose 클래스 적용
                closeButton.textContent = "X"; // X 텍스트 추가

                // 닫기 버튼 클릭 시 미리보기와 파일목록에서 삭제
                closeButton.addEventListener('click', function () {
                    previewContainer.removeChild(imgWrapper);
                    const fileIndex = selectedFiles.indexOf(file);
                    if (fileIndex > -1) {
                        selectedFiles.splice(fileIndex, 1);
                    }
                });

                // 이미지 래퍼에 이미지, 닫기 버튼 추가
                imgWrapper.appendChild(img);
                imgWrapper.appendChild(closeButton);
                previewContainer.appendChild(imgWrapper);
            };
            reader.readAsDataURL(file);
        }
        event.target.value = ''; // 파일 하나 선택하면 input 필드 초기화
    });

    $('form').on('submit', function (event) {
        event.preventDefault();

        let formData = new FormData(this);
        $.each(selectedFiles, function (i, file) {
            formData.append('product_img', file);
        });

        $.ajax({
            url: $(this).attr('action'),
            type: $(this).attr('method'),
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                alert('상품 등록이 완료되었습니다.');
                window.location.href = contextPath + '/product';
            },
            error: function (error) {
                alert('상품 등록에 실패했습니다.')
            }
        });
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
                        document.getElementById('trade_area').value = data.sido
                                + " " + data.sigungu;
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
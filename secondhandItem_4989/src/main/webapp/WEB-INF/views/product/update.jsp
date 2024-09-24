
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 로그인한 사람만 상품 등록 -->

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>판매상품 수정</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/productRegister.css">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- postcode.v2.js 우편번호 서비스 기능을 가진 외부 자바스크립트 연결 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    

    <!-- JavaScript -->
    <script>
        // 구입연도 '알 수 없음' 선택 함수
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

        // 연도 입력값이 4글자를 넘으면 자르고, 숫자만 입력하도록 제어
        function limitYearLength() {
            var yearInput = document.getElementById("yearInput");

            if (yearInput.value.length > 4) {
                yearInput.value = yearInput.value.slice(0, 4);
            }
        }

    </script>  


</head>

<body>
    <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
        <div id="menu-name">판매상품 수정</div>
    </header>

    <section>
        <div id="main-container">
            <main>
            
            <!-- 본문 영역 -->
 <div class="container">
    <form action="${pageContext.request.contextPath}/product/updatePro" 
          method="post" class="appform" enctype="multipart/form-data">
          
        <input type="hidden" name="product_id" value="${productDTO.product_id}">
        
        <!-- 이미지 업로드 영역 -->
        <div class="form-group image-upload">
            <img src="${pageContext.request.contextPath}/resources/upload/register_upload.png"
                 id="uploadImage" style="cursor: pointer; width: 150px; height: 150px;">
                 
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
                <option value="phone" ${productDTO.category_name == 'phone' ? 'selected' : ''}>휴대폰</option>
                <option value="tablet" ${productDTO.category_name == 'tablet' ? 'selected' : ''}>태블릿</option>
                <option value="watch" ${productDTO.category_name == 'watch' ? 'selected' : ''}>스마트워치</option>
                <option value="computer" ${productDTO.category_name == 'computer' ? 'selected' : ''}>PC / 노트북</option>
                <option value="acc" ${productDTO.category_name == 'acc' ? 'selected' : ''}>PC주변기기</option>
                <option value="game" ${productDTO.category_name == 'game' ? 'selected' : ''}>게임기기</option>
                <option value="etc" ${productDTO.category_name == 'etc' ? 'selected' : ''}>기타</option>
            </select>
        </div>

        <!-- 제품명 입력 -->
        <div class="form-group inline-group">
            <label for="product_name">제품명</label>
            <input type="text" id="product_name" name="product_name"
                   value="${productDTO.product_name}">
        </div>

        <!-- 구입연도 입력 -->
        <div class="form-group inline-group">
            <label for="year_purchase">구입연도</label>
            <input type="number" id="year_purchase" name="year_purchase" 
                   value="${productDTO.year_purchase}" min="1900" max="2024"
                   maxlength="4" oninput="limitYearLength()">
            <label style="margin-left: 10px;">
                <input type="checkbox" id="unknownCheckbox" onclick="handleYearCheckbox()"> 알 수 없음
            </label>
        </div>

        <!-- 판매 가격 입력 -->
        <div class="form-group inline-group">
            <label for="product_price">판매 가격</label>
            <input type="number" id="product_price" name="product_price" 
                   value="${productDTO.product_price}" placeholder="원">
        </div>

        <!-- 거래 지역 입력 -->
<div class="form-group inline-group">
    <label for="post1">거래 지역</label>
    <div style="display: flex; gap: 10px;">
     <input type="text" id="sido" name="sido" value="${sido}" placeholder="도/시 이름">
    <input type="text" id="sigungu" name="sigungu" value="${sigungu}" placeholder="시/군/구 이름">
<%--         <input type="button" value="주소 검색" onclick="daum_address();" class="addr-bttn">
        <input type="text" id="sido" name="sido" value="${sido}" placeholder="도/시 이름">
        <input type="text" id="sigungu" name="sigungu" value="${sigungu}" placeholder="시/군/구 이름">
        <input type="hidden" id="trade_area" name="trade_area" value="${productDTO.trade_area}">  --%>
    </div>
</div>


        <!-- 거래 방식 및 결제 방식 -->
        <div class="form-group inline-group">
            <div style="display: flex; gap: 20px; width: 100%;">
                <div style="flex: 1;">
                    <label for="trade_method">거래 방식</label>
                    <select id="trade_method" name="trade_method">
                        <option value="" disabled selected>선택</option>
                        <option value="직거래" ${productDTO.trade_method == '직거래' ? 'selected' : ''}>직거래</option>
                        <option value="택배" ${productDTO.trade_method == '택배' ? 'selected' : ''}>택배</option>
                        <option value="직거래/택배" ${productDTO.trade_method == '직거래/택배' ? 'selected' : ''}>직거래/택배</option>
                    </select>
                </div>
                <div style="flex: 1;">
                    <label for="pay_method">결제 방식</label>
                    <select id="pay_method" name="pay_method">
                        <option value="" disabled selected>선택</option>
                        <option value="현금" ${productDTO.pay_method == '현금' ? 'selected' : ''}>현금</option>
                        <option value="페이" ${productDTO.pay_method == '페이' ? 'selected' : ''}>페이</option>
                        <option value="현금/페이" ${productDTO.pay_method == '현금/페이' ? 'selected' : ''}>현금/페이</option>
                    </select>
             </div>
            </div>
        </div>
                   <!-- 물품 상태 입력 -->
                <div class="form-group inline-group">
                            <label for="product_desc">물품 상태</label>
                            <textarea id="product_desc" name="product_desc">${productDTO.product_desc}</textarea>
                        </div>

          <!-- 등록 버튼 -->
        <div class="form-group">
            <button type="submit" class="submit-btn" value="save">등록하기</button>
        </div>
    </form>
</div>


<script>

// 이미지 클릭 시 파일 선택 창 열기
document.getElementById('imagePreview').addEventListener('click',
 			function() {
 				document.getElementById('imageInput').click();
 			});
</script>

<!-- 파일 선택 후 업로드가 안되는 함수 -->
<script>

$(document).ready(function() {
    console.log("Document is ready!");

    $('#uploadImage').on('click', function () {
        console.log("Image clicked!");
        $('#product_img').click();  // 여기가 이미지 업로드를 위한 올바른 연결
    });

    $('#product_img').on('change', function(event) {
        console.log("File selected!");
        var files = event.target.files;
        var previewContainer = $('#previewContainer');
        var selectedFiles = [];  // 이 배열이 선언되어 있지 않아서 에러가 발생할 수 있음

        if (files.length > 5) {
            alert('You can only upload a maximum of 5 images.');
            return;
        }

        $.each(files, function(i, file) {
            var reader = new FileReader();
            reader.onload = function(e) {
                console.log("File read!");
                var imgWrapper = $('<div class="imageItem"></div>');
                var img = $('<img>').attr('src', e.target.result).addClass('imageSize');
                var closeButton = $('<span>').addClass('imageClose').text('X');

                closeButton.on('click', function() {
                    imgWrapper.remove();
                    selectedFiles.splice(selectedFiles.indexOf(file), 1);
                });

                imgWrapper.append(img).append(closeButton).appendTo(previewContainer);
            };
            reader.readAsDataURL(file);
            selectedFiles.push(file);  // 파일을 배열에 추가
        });

        this.value = ''; // Reset the input field after file selection.
    });
});

</script>



        </main>
    </div>
</section>

	<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>
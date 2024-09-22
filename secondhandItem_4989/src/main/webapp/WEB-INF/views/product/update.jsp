
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
        <div id="menu-name">상품 수정</div>
    </header>

    <section>
        <div id="main-container">
            <main>
                <div class="addBox">
                    <form action="${pageContext.request.contextPath}/product/updatePro" method="post" class="appform" enctype="multipart/form-data">
                        <input type="hidden" name="product_id" value="${productDTO.product_id}">

<!-- 이미지 업로드 및 미리보기 영역 -->
<div class="form-group image-upload">
    <label for="product_img">사진 변경</label>

<!-- 기존 이미지 미리보기 -->
<c:if test="${not empty productDTO.product_img1}">
    <div class="image-preview" data-image="${productDTO.product_img1}" style="position:relative; display:inline-block;">
        <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img1}" alt="이미지 미리보기1" style="width:100px;height:100px;">
        <button type="button" class="delete-button" onclick="deleteExistingImage('${productDTO.product_img1}')">
            X
        </button>
    </div>
</c:if>

<c:if test="${not empty productDTO.product_img2}">
    <div class="image-preview" data-image="${productDTO.product_img2}" style="position:relative; display:inline-block;">
        <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img2}" alt="이미지 미리보기2" style="width:100px;height:100px;">
        <button type="button" class="delete-button" onclick="deleteExistingImage('${productDTO.product_img2}')">
            X
        </button>
    </div>
</c:if>

<c:if test="${not empty productDTO.product_img3}">
    <div class="image-preview" data-image="${productDTO.product_img3}" style="position:relative; display:inline-block;">
        <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img3}" alt="이미지 미리보기3" style="width:100px;height:100px;">
        <button type="button" class="delete-button" onclick="deleteExistingImage('${productDTO.product_img3}')">
            X
        </button>
    </div>
</c:if>

<c:if test="${not empty productDTO.product_img4}">
    <div class="image-preview" data-image="${productDTO.product_img4}" style="position:relative; display:inline-block;">
        <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img4}" alt="이미지 미리보기4" style="width:100px;height:100px;">
        <button type="button" class="delete-button" onclick="deleteExistingImage('${productDTO.product_img4}')">
            X
        </button>
    </div>
</c:if>

<c:if test="${not empty productDTO.product_img5}">
    <div class="image-preview" data-image="${productDTO.product_img5}" style="position:relative; display:inline-block;">
        <img src="${pageContext.request.contextPath}/resources/upload/${productDTO.product_img5}" alt="이미지 미리보기5" style="width:100px;height:100px;">
        <button type="button" class="delete-button" onclick="deleteExistingImage('${productDTO.product_img5}')">
            X
        </button>
    </div>
</c:if>


    <!-- 새로운 이미지 업로드 -->
    <input type="file" id="product_img1" name="product_img[]" class="file_upload">
    <input type="file" id="product_img2" name="product_img[]" class="file_upload">
    <input type="file" id="product_img3" name="product_img[]" class="file_upload">
    <input type="file" id="product_img4" name="product_img[]" class="file_upload">
    <input type="file" id="product_img5" name="product_img[]" class="file_upload">
</div>

                        
                        <!-- 미리보기 이미지가 표시될 컨테이너 -->
                        <div class="form-group image-preview-container"></div>

                        <!-- 카테고리 등 다른 폼 요소 -->
                        <div class="form-group inline-group">
                            <label for="category_name">카테고리</label>
                            <select id="category_name" name="category_name">
                                <option value="" disabled selected>선택</option>
                                <option value="phone" ${productDTO.category_name == 'phone' ? 'selected' : ''}>휴대폰</option>
                                <option value="tablet" ${productDTO.category_name == 'tablet' ? 'selected' : ''}>태블릿</option>
                                <option value="watch" ${productDTO.category_name == 'watch' ? 'selected' : ''}>워치</option>
                                <option value="computer" ${productDTO.category_name == 'computer' ? 'selected' : ''}>PC / 노트북</option>
                                <option value="acc" ${productDTO.category_name == 'acc' ? 'selected' : ''}>PC 주변기기</option>
                                <option value="game" ${productDTO.category_name == 'game' ? 'selected' : ''}>게임기기</option>
                                <option value="etc" ${productDTO.category_name == 'etc' ? 'selected' : ''}>기타</option>
                            </select>
                        </div>

                        <div class="form-group inline-group">
                            <label for="product_name">제품명</label>
                            <input type="text" id="product_name" name="product_name" value="${productDTO.product_name}">
                        </div>

                        <div class="form-group inline-group">
                            <label for="year_purchase">구입연도</label>
                            <input type="number" id="year_purchase" name="year_purchase" value="${productDTO.year_purchase}">
                        </div>

                        <div class="form-group inline-group">
                            <label for="product_price">판매 가격</label>
                            <input type="number" id="product_price" name="product_price" value="${productDTO.product_price}">
                        </div>

                        <div class="form-group inline-group">
                            <label for="trade_area">거래 지역</label>
                            <div style="display: flex; gap: 10px;">
                                <input type="button" value="주소 검색" onclick="daum_address();" class="login-bttn">
                                <input type="text" id="sido" name="sido" placeholder="도/시 이름">
                                <input type="text" id="sigungu" name="sigungu" placeholder="시/군/구 이름">
                                <!-- 시와 구 합친 거래지역 값 저장 -->
                                <input type="hidden" id="trade_area" name="trade_area" value="${productDTO.trade_area}">
                            </div>
                        </div>

                        <div class="form-group inline-group">
                            <label for="trade_method">거래 방식</label>
                            <select id="trade_method" name="trade_method">
                                <option value="" disabled selected>선택</option>
                                <option value="택배" ${productDTO.trade_method == '택배' ? 'selected' : ''}>택배</option>
                                <option value="직거래" ${productDTO.trade_method == '직거래' ? 'selected' : ''}>직거래</option>
                                <option value="택배/직거래" ${productDTO.trade_method == '택배/직거래' ? 'selected' : ''}>택배/직거래</option>
                            </select>
                        </div>

                        <div class="form-group inline-group">
                            <label for="pay_method">결제 방식</label>
                            <select id="pay_method" name="pay_method">
                                <option value="" disabled selected>선택</option>
                                <option value="현금" ${productDTO.pay_method == '현금' ? 'selected' : ''}>현금</option>
                                <option value="페이" ${productDTO.pay_method == '페이' ? 'selected' : ''}>페이</option>
                            </select>
                        </div>

                        <div class="form-group inline-group">
                            <label for="product_desc">물품 상태</label>
                            <textarea id="product_desc" name="product_desc">${productDTO.product_desc}</textarea>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="submit-btn" value="save">수정하기</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </section>
    
<!-- 이미지 관련  -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    let uploadFiles = [];
    let dataTransfer = new DataTransfer(); // **선택한 파일 순서대로 누적 관리**
    let deletedImages = []; // **삭제된 기존 이미지를 관리할 배열**

    function getImageFiles(event) {
        const files = event.currentTarget.files;

        // 선택된 파일들을 배열에 추가
        [...files].forEach(file => {
            uploadFiles.push(file);
            dataTransfer.items.add(file);  // **dataTransfer에 파일 추가**
        });

        // 파일 입력 요소에 DataTransfer의 파일 리스트를 설정
        event.currentTarget.files = dataTransfer.files;  // **입력 요소에 누적된 파일 리스트 설정**

        // 미리보기 업데이트
        updateImagePreview();
    }

    function updateImagePreview() {
        const container = document.querySelector('.image-preview-container');
        container.innerHTML = ''; // 기존 미리보기 삭제

        uploadFiles.forEach((file) => {  // **index 매개변수 삭제**
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

                // **동적 인덱스 사용**
                deleteButton.onclick = function() {
                    const currentIndex = uploadFiles.indexOf(file);  // **현재 파일의 인덱스를 동적으로 계산**
                    if (currentIndex !== -1) {  // **해당 파일이 배열에 존재하는지 확인**
                        uploadFiles.splice(currentIndex, 1);  // **파일 배열에서 해당 파일 제거**
                        dataTransfer.items.remove(currentIndex);  // **DataTransfer에서 해당 파일 제거**
                        updateImagePreview();  // **미리보기 업데이트**
                    }
                };

                imgWrapper.appendChild(img);
                imgWrapper.appendChild(deleteButton);
                container.appendChild(imgWrapper);
            }

            reader.readAsDataURL(file);
        });
    }

 // **기존 이미지 삭제 기능 추가**
    function deleteExistingImage(imageName) {
    const existingImageElement = document.querySelector(`[data-image="${imageName}"]`);
    if (existingImageElement) {
        console.log("삭제할 이미지 찾음:", imageName); // 로그 추가
        existingImageElement.remove();  // 미리보기에서 이미지 삭제
    } else {
        console.log("이미지 찾지 못함:", imageName); // 로그 추가
    }
}

    // **서버에 삭제할 이미지를 전송하기 위한 히든 필드 설정**
    document.querySelector('form').addEventListener('submit', function() {
        const deletedImagesInput = document.createElement('input');
        deletedImagesInput.type = 'hidden';
        deletedImagesInput.name = 'deletedImages';
        deletedImagesInput.value = deletedImages.join(',');  // **삭제된 이미지를 문자열로 변환하여 전송**
        this.appendChild(deletedImagesInput);
    });

    // **모든 파일 입력 요소에 동일한 이벤트 핸들러 연결**
    const fileInputs = document.querySelectorAll('.file_upload');
    fileInputs.forEach(input => {
        input.addEventListener('change', getImageFiles);
    });
});
</script>
    
    
<!-- 주소 api  -->
    <script>
        // 다음 주소 API
        function daum_address() {
            let themeObj = {
                searchBgColor: "#0B65C8",
                queryTextColor: "#FFFFFF"
            };

            new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);
                    // 시/도 및 구/군 값을 입력 필드에 설정
                    document.getElementById('sido').value = data.sido;
                    document.getElementById('sigungu').value = data.sigungu;
                    // trade_area에 시/도 + 구/군 값을 합쳐서 설정
                    document.getElementById('trade_area').value = data.sido + " " + data.sigungu;
                    // 창을 자동으로 닫음
                    document.getElementById("close").click();
                },
                theme: themeObj
            }).open();
        }
    </script>

    <jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>

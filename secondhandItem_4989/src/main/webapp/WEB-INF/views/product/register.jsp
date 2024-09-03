<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>물품등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
        input[type="text"],
        input[type="number"],
        select,
        textarea {
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
            width: 200px;
            height: 200px;
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
        .imageItem {
            position: relative;
            display: inline-block;
        }
        .imageClose {
            position: absolute;
            top: 5px;
            right: 5px;
            background: red;
            color: white;
            border: none;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            cursor: pointer;
        }        
    </style>

<!--  이전 미리보기
    <script>
        function previewImages(event) {
            const files = event.target.files;
            const previewContainer = document.getElementById('imagePreviewContainer');
            previewContainer.innerHTML = ''; // 기존 이미지 초기화

            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const reader = new FileReader();

                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    previewContainer.appendChild(img);
                };

                reader.readAsDataURL(file);
            }
        }
    </script> -->
    
<!--     이미지 업로드, 미리보기 함수 정의 -->
    <script>
        function addFileInput() {
            document.getElementById('imageInput').click();
        }

        function setThumbnail(event) {
            const files = event.target.files;
            const previewContainer = document.getElementById('imagePreviewContainer');
            previewContainer.innerHTML = ''; // 기존 미리보기 초기화

            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const reader = new FileReader();

                reader.onload = function(e) {
                    const imageItem = document.createElement('div');
                    imageItem.classList.add('imageItem');

                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.classList.add('imageSize');

                    const removeButton = document.createElement('button');
                    removeButton.type = 'button';
                    removeButton.classList.add('imageClose');
                    removeButton.innerText = 'X';
                    removeButton.onclick = function() {
                        removeImage(imageItem);
                    };

                    imageItem.appendChild(img);
                    imageItem.appendChild(removeButton);
                    previewContainer.appendChild(imageItem);
                };

                reader.readAsDataURL(file);
            }
        }

        function removeImage(imageElement) {
            imageElement.remove();
        }
    </script>    
</head>
<body>

    <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
        <div id="menu-name">
            물품등록
        </div>
    </header>

    <section>
        <div id="main-container">
            <main>
<!-- 					  기존 이미지 미리보기 영역 (추후 삭제)
              <div class="addBox">
                    <form id="addForm" name="addForm" class="add-form" action="ProductRegistSuccess" method="post" enctype="multipart/form-data">
                        <hr style="border:0; height:3px; color:black;">
                        
                        <div class="container">
                            <div class="form-group image-upload">
                                <label for="imageInput">사진 선택</label>
                                <input type="file" id="imageInput" name="file" accept="image/*" multiple onchange="previewImages(event)">
                            </div> 
                           
                            <div id="imagePreviewContainer" class="image-preview-container">
                            </div>
	카테고리 시작 -->
              <div class="addBox">
                    <form id="addForm" name="addForm" class="add-form" action="ProductRegistSuccess" method="post" enctype="multipart/form-data">
                        <hr style="border:0; height:3px; color:black;">
                        
                        <div class="container">
                            <div class="form-group image-upload">
                                <label for="imageInput">사진 선택</label>
                                <input type="file" src="/src/main/webapp/resources/img/product/register_upload.png"id="imageInput" name="file" accept="image/*" multiple onchange="setThumbnail(event)">
                            </div> 
                           
                            <div id="imagePreviewContainer" class="image-preview-container">
                            </div>
                        </div>
                    </form>
                </div>	
	
                            <div class="form-group inline-group">
                                <label for="category">카테고리</label>
                                <select id="category" name="category">
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
                                <label for="product-name">제품명</label>
                                <input type="text" id="product-name" name="product-name" placeholder="브랜드명, 모델명 함께 입력해주세요.">
                            </div>

                            <div class="form-group inline-group">
                                <label for="year">구입연도</label>
                                <select id="year" name="year">
                                    <option value="" disabled selected>선택</option>
                                    <option value="unknown">알 수 없음</option>
                                    <option value="2024">2024</option>
                                    <option value="2023">2023</option>
                                    <option value="2022">2022</option>
                                    <!-- 필요한 연도 추가 -->
                                </select>
                            </div>

                    <div class="form-group inline-group">
                        <label for="price">판매 가격</label>
                        <input type="number" id="price" name="price" placeholder="원">
                    </div>

                    <div class="form-group inline-group">
                        <label for="region">거래 지역</label>
                        <select id="region" name="region">
                            <option value="" disabled selected>선택</option>
                            <option value="seoul">서울</option>
                            <option value="busan">부산</option>
                            <option value="incheon">인천</option>
                        </select>
                    </div>

                    <div class="form-group inline-group">
                        <label for="deal-method">거래 방식</label>
                        <select id="deal-method" name="deal-method">
                            <option value="" disabled selected>선택</option>
                            <option value="delivery">택배</option>
                            <option value="direct">직거래</option>
                            <option value="both">모두 가능</option>
                        </select>
                    </div>

                    <div class="form-group inline-group">
                        <label for="payment-method">결제 방식</label>
                        <select id="payment-method" name="payment-method">
                            <option value="" disabled selected>선택</option>
                            <option value="cash">현금</option>
                            <option value="pay">4989페이</option>
                            <option value="both">모두 가능</option>
                        </select>
                    </div>

                    <div class="form-group inline-group">
                        <label for="description">물품 상태</label>
                        <textarea id="description" name="description" placeholder="물품 상태(미개봉/신품/중고), 하자 등 상세내용을 적어주세요."></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="submit-btn" value="save">등록하기</button>
                    </div>
                </form>
            </div>

        </main>
    </div>
  </section>
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>


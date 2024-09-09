<!-- 백업 파일 -->

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

<!-- JavaScript 이미지 업로드, 미리보기 -->
<script>
    // 이미지 미리보기를 생성하는 함수
    function setThumbnail(event) {
        const files = event.target.files;
        const previewContainer = document.getElementById('imagePreviewContainer');
        previewContainer.innerHTML = ''; // 기존 미리보기 초기화

        if (files.length > 5) {
            alert("최대 5개의 이미지만 업로드할 수 있습니다.");
            return;
        }

        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            const reader = new FileReader();

            reader.onload = function(e) {
                const imageItem = document.createElement('div');
                imageItem.classList.add('imageItem');
                
                const img = document.createElement('img');
                img.src = e.target.result;
                img.classList.add('imageSize');
                img.style.width = "200px";  // 이미지 크기 조절
                img.style.height = "200px"; // 이미지 크기 조절
                img.style.objectFit = "cover"; // 이미지 비율 유지
                
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

    // 미리보기에서 이미지를 제거하는 함수
    function removeImage(imageElement) {
        imageElement.remove();
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
                <form id="addForm" name="addForm" class="add-form" action="${pageContext.request.contextPath}/product/registerPro" method="post" enctype="multipart/form-data">
                    <hr style="border:0; height:3px; color:black;">
                    <div class="container">
                        <!-- 이미지 업로드 및 미리보기 영역 -->
                        <div class="form-group image-upload">
                            <label for="imageInput">사진 선택</label>
                            <input type="file" id="imageInput" name="file" accept="image/*" multiple onchange="setThumbnail(event)">
                        </div>
                        
                        <div id="imagePreviewContainer" class="image-preview-container"></div>
                        
                        <!-- 카테고리 등 다른 폼 요소 -->
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
                        <!-- 더 많은 폼 요소들 추가 -->
                        <div class="form-group">
                            <button type="submit" class="submit-btn" value="save">등록하기</button>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </div>
</section>

<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>


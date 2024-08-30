<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 등록</title>
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
        input[type="radio"] {
            margin-right: 5px;
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
            width: 100%;
            text-align: center;
            margin-bottom: 20px;
        }
        .image-upload img {
            width: 150px;
            height: 150px;
            border: 1px solid #ddd;
            background-color: #f8f8f8;
            padding: 20px;
        }
        .inline-group {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .inline-group label {
            margin-right: 10px;
            width: 100px;
        }
        .inline-group input,
        .inline-group select {
            flex: 1;
        }
        .radio-group {
            display: flex;
            justify-content: flex-start;
            gap: 20px;
        }
    </style>
<!--     이미지 미리보기 -->
     <script>
        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function() {
                const output = document.getElementById('preview');
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
        </script>
</head>
<body>

<div class="container">
    <form action="/uploadImage" method="post" enctype="multipart/form-data">
        <div class="form-group image-upload">
            <img id="preview" src="https://via.placeholder.com/150" alt="이미지 미리보기">
            <br>
            <label class="upload-btn" for="imageInput">사진 선택</label>
            <input type="file" id="imageInput" name="file" accept="image/*" onchange="previewImage(event)">
        </div>
        
        <div class="form-group inline-group">
            <label for="category">카테고리</label>
            <select id="category" name="category">
                <option value="" disabled selected>선택</option>
                <option value="electronics">전자제품</option>
                <option value="fashion">패션</option>
                <option value="furniture">가구</option>
            </select>
        </div>

        <div class="form-group inline-group">
            <label for="product-name">제품명</label>
            <input type="text" id="product-name" name="product-name" placeholder="브랜드명, 모델명 함께 입력해주세요.">
        </div>

        <div class="form-group inline-group">
            <label for="year">구입연도</label>
            <input type="number" id="year" name="year" placeholder="2024" value="2024">
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

        <div class="form-group">
            <label>거래 방식</label>
            <div class="radio-group">
                <label><input type="radio" name="deal-method" value="delivery">택배</label>
                <label><input type="radio" name="deal-method" value="direct">직거래</label>
                <label><input type="radio" name="deal-method" value="all">모두 가능</label>
            </div>
        </div>

        <div class="form-group">
            <label>결제 방식</label>
            <div class="radio-group">
                <label><input type="radio" name="payment-method" value="cash">현금</label>
                <label><input type="radio" name="payment-method" value="pay">4989페이</label>
                <label><input type="radio" name="payment-method" value="all">모두 가능</label>
            </div>
        </div>

        <div class="form-group">
            <label for="description">물품 상태</label>
            <textarea id="description" name="description" placeholder="물품 상태(미개봉/신품/중고), 하자 등 상세내용을 적어주세요."></textarea>
        </div>

        <div class="form-group">
            <button type="submit" class="submit-btn">등록하기</button>
        </div>
    </form>
</div>

</body>
</html>

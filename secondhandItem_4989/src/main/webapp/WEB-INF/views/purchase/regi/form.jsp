<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<style>

h1, h3 { text-align:center; }

.content-container {
	background-color: white;
}

.side-nav ul {
	height: 300px;
}

</style>
</head>
<body>

  <jsp:include page="../../inc/header.jsp"></jsp:include>

<header>
   	<div id="menu-name">
		매입신청 > 매입 신청하기
	</div>
</header>
<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">

      <jsp:include page="../inc_side.jsp"></jsp:include>

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	
	  <main>

		<br>
		<h1 style="text-align:center;">매입 신청하기</h1>
		
		<h3 style="margin-top:50px;">신청 정보를 작성해주세요</h3>
		
		
	<div class="form-container">
    <div class="form-group">
        <label for="productName">매입제품</label>
        <span id="productName">아이폰14Pro 512GB</span>
    </div>

    <div class="form-group">
        <label for="grade">등급/매입가</label>
        <span id="grade">S / 900,000원</span>
        <p>※ 등급 및 매입가는 실제 검수 결과에 따라 달라질 수 있습니다.</p>
    </div>

    <div class="form-group">
        <label>발송 방법</label>
        <div class="radio-group">
            <label><input type="radio" name="shipping" value="courier" checked> 무료 택배 발송</label>
            <label><input type="radio" name="shipping" value="visit"> 센터 직접 방문</label>
        </div>
        <div class="info-box">
            <p><strong>4999 리퍼비시센터</strong><br>
               [주소] 부산광역시 부산진구 동천로 109 삼한골든게이트 7층<br>
               [문자안내] 051-000-0000<br>
               [운영시간] 09:00-17:00 (주말, 공휴일 제외)
            </p>
        </div>
    </div>

    <div class="form-group">
        <label for="bank">정산계좌등록</label>
        <div class="radio-group">
            <select id="bank" name="transfer_bank" style="max-height:100px; overflow-y:auto;">
                <option>은행명 선택</option>
                <option value="국민">국민</option>
                <option value="기업">기업</option>
                <option value="농협">농협</option>
                <option value="산업">산업</option>
                <option value="신한">신한</option>
                <option value="우리">우리</option>
                <option value="하나">하나</option>
                <option value="씨티">씨티</option>
                <option value="카카오">카카오</option>
                <option value="토스">토스</option>
                <option value="산림조합">산림조합</option>
                <option value="새마을금고">새마을금고</option>
                <option value="수협">수협</option>
                <option value="신협">신협</option>
                <option value="우체국">우체국</option>
                <option value="저축">저축</option>
                <option value="경남">경남</option>
                <option value="광주">광주</option>
                <option value="IM(대구)">IM(대구)</option>
                <option value="부산">부산</option>
                <option value="전북">전북</option>
                <option value="제주">제주</option>
            </select>
            <input type="text" id="accountNumber" placeholder="계좌번호(숫자만 입력)">
            <button>확인</button>
        </div>
    </div>

    <div class="checkbox-group">
        <label><input type="checkbox"> 매입 신청에 따른 유의사항 및 판매조건 확인</label>
        <label><input type="checkbox"> 개인정보 수집 및 이용 동의</label>
    </div>

    <div class="buttons">
        <button type="reset">다시 선택하기</button>
        <button type="submit">매입 신청</button>
    </div>
</div>
		
		
		
		
		
		


	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->
  
  <jsp:include page="../../inc/footer.jsp"></jsp:include>
  
</body>
</html>
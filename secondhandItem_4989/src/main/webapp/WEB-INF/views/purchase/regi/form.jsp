<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입 신청하기 : 4989</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/purchaseStyle.css">
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
		<h1 style="text-align:center; margin-bottom:50px;">매입 신청하기</h1>
		
	<div id="form-container">
	<form action="registerPurchase" method="post">
	<div id="center-input">
    <div class="form-group">
        <div id="label_title"><label for="productName">신청인 아이디</label></div>
        <input type="text" id="textform" name="member_id" value="${sessionScope.member_id}" readonly>
    </div>
    
    <div class="form-group">
        <div id="label_title"><label for="productName">매입제품</label></div>
        <input type="text" id="textform"name="pc_item_name" value="${pc_item_name }" style="width:400px;" readonly>
    </div>

    <div class="form-group">
        <div id="label_title"><label for="grade">등급/매입가</label></div>
        <input type="text" id="textform" name="expected_grade" value="${expected_grade }" style="width:60px; text-align:center;"readonly>
         / <input type="text" id="textform" name="expected_price" value="${expected_price }" style="width:100px; text-align:right;" readonly>원 
        <span class="info_span">※ 등급 및 매입가는 실제 검수 결과에 따라 달라질 수 있습니다.</span>
    </div>

    <div class="form-group">
        <div id="label_title"><label>발송 방법</label></div>
        <div class="radio-group">
            <input type="radio" name="shipping_method" value="택배"> 택배 발송 &nbsp;&nbsp;
            <input type="radio" name="shipping_method" value="방문"> 센터 직접 방문
        </div>
    </div>
  	<div class="form-group">
        <div id="label_title"> </div>
        <div id="service-center-box">
            <p><strong>4989 매입서비스센터</strong><br>
               [주소] 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br>
               [전화번호] 051-000-0000    	[운영시간] 09:00-17:00 (주말, 공휴일 제외)
            </p>
        </div>
    </div>

    <div class="form-group">
        <div class="select-group">
        <div id="label_title"><label for="bank">정산계좌등록</label></div>
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
            <input type="text" id="textform" name="transfer_account" placeholder="계좌번호(숫자만 입력)">
            <button id="account_confirm" onclick="">확인</button></div>
            </div>
            <div id="label_title"> </div>
            <p style="display:inline-block; margin:0;"><span class="info_span">※ 신청자 본인명의의 계좌만 등록 가능합니다.</span>
            <br><span class="info_span">※ 예상 등급과 동일하거나 높은 등급으로 판정되면 등록한 계좌로 자동 정산됩니다.</span></p>
            </div>
            <br>
            <div class="checkbox-group">
        	<label><input type="checkbox" required> 매입 신청에 따른 유의사항 및 판매조건 확인</label><br>
        	<label><input type="checkbox" required> 개인정보 수집 및 이용 동의</label>
    		</div>
            <br>
    		<div class="buttons">
        	<button id="reset" onclick="window.history.back();">다시 선택하기</button>
      	  	<button id="submit_form" type="submit">매입 신청</button>
   			 </div>
        </form>
    </div>
	<br><br><br>

    
	</div>
		
	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->
  
  <jsp:include page="../../inc/footer.jsp"></jsp:include>
  
</body>
</html>
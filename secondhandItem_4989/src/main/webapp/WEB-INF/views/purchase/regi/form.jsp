<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입 신청하기 : 4989</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/purchaseStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/modalStyle.css">
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
	
	<form action="registerPurchase" method="post" name="fr">
	<div id="center-input">
    <div class="form-group">
	    <input type="hidden" class="textform" name="member_id" value="${sessionScope.member_id}" readonly>
        <div id="label_title"><label for="productName">신청인 이름</label></div>
		<input type="text" id="member_name" name="member_name" value="${member_name }" readonly>
    </div>
    
    <div class="form-group">
        <div id="label_title"><label for="productName">매입제품</label></div>
        <input type="text" class="textform"name="pc_item_name" value="${pc_item_name }" style="width:400px;" readonly>
    </div>

    <div class="form-group">
        <div id="label_title"><label for="grade">등급/매입가</label></div>
        <input type="text" class="textform" name="expected_grade" value="${expected_grade }" style="width:60px; text-align:center;"readonly>
         / <input type="text" class="textform" name="expected_price" value="${expected_price}" style="width:100px; text-align:right;" readonly>원 
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
            <select id="bank_code" name="transfer_bank" style="max-height:100px; overflow-y:auto;" required>
                <option disabled selected>은행명 선택</option>
                <c:forEach var="banks" items="${banks}">
                <option value="${banks.bank_code }" >${banks.bank_name }</option>
                </c:forEach>
            </select>
            <input type="text" id="bank_account" class="textform" name="transfer_account" placeholder="계좌번호(숫자만 입력)" required>
            <button id="account_confirm" type="button">확인</button> &nbsp;&nbsp; <small><span id="account-checked" style="color:blue;"></span></small></div>
        </div>
        <div id="label_title"> </div>
        	<p style="display:inline-block; margin:0;"><span class="info_span">※ 신청자 본인명의의 계좌만 등록 가능합니다.</span>
        	<br><span class="info_span">※ 예상 등급과 동일하거나 높은 등급으로 판정되면 등록한 계좌로 자동 정산됩니다.</span></p>
        </div>
        <br>
        <div class="checkbox-group">
          <label><input type="checkbox" name="confirm"> 매입 신청에 따른 유의사항 및 판매조건 확인</label><br>
          <label><input type="checkbox" name="agree"> 개인정보 수집 및 이용 동의</label>
    	</div>
        <br>
    	<div class="buttons">
        	<button id="reset" type="button">다시 선택하기</button>
      	  	<button id="submit_form" type="submit">매입 신청</button>
   		 </div>
     </form>
    </div>
	<br><br><br>


<!-- 모달 창 -->
		<div id="cancel-modal" class="modal">
		    <div class="modal-content">
		        <p>정말 취소하시겠습니까?<br>지금까지 입력하신 내용이 모두 지워집니다.</p>
		        <button class="confirm" id="cancelConfirm">예 (취소)</button>
		        <button class="cancel" id="cancelCancel">아니오</button>
		    </div>
		</div>
		
		<div id="submit-modal" class="modal">
		    <div class="modal-content">
		        <p>위 내용대로 신청하시겠습니까?<br>매입신청 특성 상 수정이 불가능합니다.</p>
		        <button class="confirm" id="submitConfirm">예 (제출)</button>
		        <button class="cancel" id="submitCancel">아니오</button>
		    </div>
		</div>
		


  </main>

	</div>

	</div>

</section>

<!-- 본문영역 끝 -->
  
  <jsp:include page="../../inc/footer.jsp"></jsp:include>
  
  
  
<script>

// 다시 선택하기 누르면 나오는 모달창 컨트롤
const cancelModal = document.getElementById('cancel-modal');
const reset = document.getElementById('reset');
const cancelConfirm = document.getElementById('cancelConfirm');
const cancelCancel = document.getElementById('cancelCancel');  

	reset.addEventListener('click', function() {
		cancelModal.style.display = "block";
	})
	
	cancelConfirm.addEventListener('click', function() {
		window.history.back();
	})
	cancelCancel.addEventListener('click', function() {
		cancelModal.style.display = "none";
    });    

// 모달 창 밖을 클릭하면 모달 창 닫기
window.addEventListener('click', function(event) {
    if (event.target == cancelModal) {
        cancelModal.style.display = "none";
    }
});

const submitForm = document.getElementById('submit-form')

	// 기본: 제출 조건 미충족으로 설정
	let do_not_submit = true;
	
	// 계좌인증
	document.getElementById('account_confirm').addEventListener('click', function(event) {

	event.preventDefault();
	
	const bank_code = document.getElementById('bank_code').value;
	const bank_account = document.getElementById('bank_account').value;
	const member_name = document.getElementById('member_name').value;
    
	fetch('validate-account', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},	
		body: JSON.stringify({
			bank_code: bank_code,
			bank_account: bank_account,
			member_name: member_name
		})
	})
	.then(response => response.json())
	.then(data => {
		if (data.valid) {
			alert('인증 성공');
			document.getElementById('account-checked').innerText = "인증 완료";
			do_not_submit = false;
		} else {
			alert('인증 실패 / 올바르게 입력했는지 확인해주세요.');
			do_not_submit = true;
		}
	})
	.catch(error => console.error('Error:', error));
	});

	// 제출 조건 만족여부 체크, 제출버튼 활성화 여부 결정
	document.getElementById('submit_form').addEventListener('click', function(event) {
		
		event.preventDefault();
		
		const bank_account = document.getElementById('bank_account').value;
		const member_name = document.getElementById('member_name').value;
		const shipping_method = document.fr.shipping_method.value;
		
		
		if(member_name == null || member_name == '') {
			alert('올바른 사용자가 아닙니다. 다시 로그인해주세요.');
		} else if (shipping_method == null || shipping_method == '') {
			alert('발송방법을 선택해주세요.');
		} else if (bank_account == null || bank_account == '') {
			alert('매입대금을 받을 계좌를 입력하고 인증해주세요.');
		} else if(do_not_submit) {
			alert('계좌가 인증되지 않았습니다.');
		} else if(document.fr.confirm.checked == false) {
			alert('유의사항과 판매조건을 확인하셔야 합니다');
			document.fr.confirm.focus();
		} else if(document.fr.agree.checked == false) {
			alert('개인정보 수집 및 이용에 동의하셔야 합니다');
			document.fr.agree.focus();
		} else {
			
			const submitModal = document.getElementById('submit-modal');
			const submitConfirm = document.getElementById('submitConfirm');
			const submitCancel = document.getElementById('submitCancel');
			
			submitModal.style.display = "block";	
			
			submitConfirm.addEventListener('click', function() {
			    document.fr.submit();
			});
			
			submitCancel.addEventListener('click', function() {
			    submitModal.style.display = "none";
			});

			window.addEventListener('click', function(event) {
			    if (event.target == submitModal) {
			        submitModal.style.display = "none";
			    }
			});
		}
	});
	
</script>



  
</body>
</html>
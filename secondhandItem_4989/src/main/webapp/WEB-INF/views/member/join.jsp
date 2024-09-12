<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4989 회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/join.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>

  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			회원가입
		</div>
   </header>
   
  <section>
	<div id="main-container">
	  <main>

<div class="container">
        <h1>회원정보를 입력해주세요</h1>
        <form action="joinPro" method="post" name="fr">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="member_id" name="member_id" placeholder="아이디" required>
                <button type="button" id="check-btn1" class="check-btn">중복 확인</button>
                <div id = "checkedIdResult" name = "checkedIdResult"></div>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="pass" placeholder="비밀번호" required>
                <div id = "checkedPassResult" name = "checkedPassResult"></div>
            </div>
            <div class="form-group">
                <label for="confirmPassword">비밀번호 확인</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>
            	<div id = "checkedPassResult1" name = "checkedPassResult1"></div>
            </div>
            <div class="form-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                <button type="button" name="check-btn2" class="check-btn">중복 확인</button>
            	<div id = "checkedNickResult" name = "checkedNickResult"></div>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" id="name" name="name" placeholder="이름" required>
                <div id = "checkedNameResult" name = "checkedNameResult"></div>
            </div>
            <div class="form-group">
                <label for="phoneNumber">휴대폰 번호</label>
                <input type="tel" id="phoneNumber" name="phone" pattern="[0-9]{3}[0-9]{4}[0-9]{4}" placeholder="01012345678" required>
                <div id = "checkedPhoneResult" name = "checkedPhoneResult"></div>
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" placeholder="abcd@efgh.com" required>
                <div id = "checkedEmailResult" name = "checkedEmailResult"></div>
            </div>
            <div class="form-group">
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement1" name="agreement1" required>
                    <label for="agreement1">4989 이용약관 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement2" name="agreement2" required>
                    <label for="agreement2">개인정보 수집 이용 동의 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement3" name="agreement3" required>
                    <label for="agreement3">휴대폰 본인확인서비스 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="agreement4" name="agreement4" required>
                    <label for="agreement4">위치정보 이용약관 동의 (필수)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="marketing" name="marketing">
                    <label for="marketing">마케팅 수신 동의 (선택)</label>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="advertising" name="advertising">
                    <label for="advertising">개인정보 광고활용 동의 (선택)</label>
                </div>
            </div>
            <button type="submit" class="submit-button">인증하기</button>
        </form>
    </div>

	  </main>
	</div>
  </section>

<!-- 비밀번호 조건 -->
<script>
let checkedPassResult = false;

document.fr.pass.onblur = function() {

let pass = document.fr.pass.value; //입력받은 비밀번호값 변수에 저장
let hasNumber = /\d/; // 숫자가 포함되어 있는지 확인하는 정규식
let hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/; // 특수문자가 포함되어 있는지 확인하는 정규식
let hasLetter = /[a-zA-Z]/; // 영문자가 포함되어 있는지 확인하는 정규식

if(pass.length >= 8 && hasNumber.test(pass) && hasSpecialChar.test(pass) && hasLetter.test(pass)) {
	
	document.querySelector('#checkedPassResult').innerText = "사용가능한 비밀번호입니다.";
	document.querySelector('#checkedPassResult').style.color = "blue";
	document.querySelector('#checkedPassResult').style.fontWeight = "900";
// 	document.querySelector('#checkedPassResult').style.textAlign = "center";
	
	//id 규칙 검사 적합 여부를 저장하는 변수에 true값 저장
	
	
	} else if(document.fr.pass.value == "") {
		document.querySelector('#checkedPassResult').innerText = "비밀번호를 입력해주세요";
		document.querySelector('#checkedPassResult').style.color = "red";
		document.querySelector('#checkedPassResult').style.fontWeight = "900";
// 		document.querySelector('#checkedPassResult').style.textAlign = "center";
	
		//id 규칙 검사 적합 여부를 저장하는 변수에 true값 저장
	
	
	} else if(pass.length <= 8) {
		document.querySelector('#checkedPassResult').innerText = "8자 이상만 사용 가능합니다.";
		document.querySelector('#checkedPassResult').style.color = "red";
		document.querySelector('#checkedPassResult').style.fontWeight = "900";
// 		document.querySelector('#checkedPassResult').style.textAlign = "center";
	
	//id 규칙 검사 적합 여부를 저장하는 변수에 true값 저장
		

	} else  {
		document.querySelector('#checkedPassResult').innerText = "영문,숫자,특수문자가 반드시 포함되야 합니다.";
		document.querySelector('#checkedPassResult').style.color = "red";
		document.querySelector('#checkedPassResult').style.fontWeight = "900";
// 		document.querySelector('#checkedPassResult').style.textAlign = "center";
	
	
		
	}
}

</script>

<!-- 비밀번호 확인 조건 -->
<script>
let checkedPassResult1 = false;

	document.fr.confirmPassword.onblur = function() {
		
		let pass = document.fr.pass.value;
		let confirmPassword = document.fr.confirmPassword.value;
		
	if(confirmPassword == pass && confirmPassword != ""){
		document.querySelector('#checkedPassResult1').innerText = "비밀번호가 일치합니다.";
		document.querySelector('#checkedPassResult1').style.color = "blue";
		document.querySelector('#checkedPassResult1').style.fontWeight = "900";
		
	} else if(document.fr.confirmPassword.value == "") {
		document.querySelector('#checkedPassResult1').innerText = "비밀번호를 입력해주세요";
		document.querySelector('#checkedPassResult1').style.color = "red";
		document.querySelector('#checkedPassResult1').style.fontWeight = "900";
	
	
	} else {
		document.querySelector('#checkedPassResult1').innerText = "비밀번호가 일치하지 않습니다.";
		document.querySelector('#checkedPassResult1').style.color = "red";
		document.querySelector('#checkedPassResult1').style.fontWeight = "900";
		
	}
}

</script>

<!-- 이름 조건 -->
<script>
let checkedNameResult = false;

document.fr.name.onblur = function() {
	
	if(document.fr.name.value == ""){
		document.querySelector('#checkedNameResult').innerText = "이름을 입력해주세요.";
		document.querySelector('#checkedNameResult').style.color = "red";
		document.querySelector('#checkedNameResult').style.fontWeight = "900";
		
	} 
	else {
		document.querySelector('#checkedNameResult').innerText = "";
		document.querySelector('#checkedNameResult').style.color = "red";
		document.querySelector('#checkedNameResult').style.fontWeight = "900";
		
	}
}

</script>

<!-- 휴대폰번호 조건 -->
<script>
let checkedPhoneResult = false;

document.fr.phone.onblur = function() {
	
	let phone = document.fr.phone.value;
	let hasNumber = /\d/; // 숫자가 포함되어 있는지 확인하는 정규식
	
	if(phone.length ==11 && hasNumber.test(phone)){
		document.querySelector('#checkedPhoneResult').innerText = "";
		document.querySelector('#checkedPhoneResult').style.color = "red";
		document.querySelector('#checkedPhoneResult').style.fontWeight = "900";
		
	} else if(document.fr.phone.value == "") {
		document.querySelector('#checkedPhoneResult').innerText = "휴대폰 번호를 입력해주세요.";
		document.querySelector('#checkedPhoneResult').style.color = "red";
		document.querySelector('#checkedPhoneResult').style.fontWeight = "900";
		
	}
	
	else {
		document.querySelector('#checkedPhoneResult').innerText = "휴대폰 번호를 다시 확인해주세요.(11자리)";
		document.querySelector('#checkedPhoneResult').style.color = "red";
		document.querySelector('#checkedPhoneResult').style.fontWeight = "900";

	}
}

</script>

<!-- 이메일 조건 -->
<script>
let checkedEmailResult = false;

document.fr.email.onblur = function() {
	
	
	if(document.fr.email.value == ""){
		document.querySelector('#checkedEmailResult').innerText = "이메일을 입력해주세요.";
		document.querySelector('#checkedEmailResult').style.color = "red";
		document.querySelector('#checkedEmailResult').style.fontWeight = "900";
		
	} else {
		document.querySelector('#checkedEmailResult').innerText = "";
		document.querySelector('#checkedEmailResult').style.color = "blue";
		document.querySelector('#checkedEmailResult').style.fontWeight = "900";
		
	}
	
}

</script>


<!-- <div class="form-group"> -->
<!--                 <label for="userId">아이디</label> -->
<!--                 <input type="text" id="member_id" name="member_id" placeholder="아이디" required> -->
<!--                 <button type="button" id="check-btn1" class="check-btn">중복 확인</button> -->
<!--                 <div id = "checkedIdResult" name = "checkedIdResult"></div> -->
<!--             </div> -->

<script type="text/javascript">
$(function(){
	$('#check-btn1').click(function() {
// 		alert("asd")
		$.ajax({
			url:'${pageContext.request.contextPath}/member/idCheck',
			data:{'id':$('#member_id').val()},
			success:function(result){
				
				if (result == 'iddup'){
					result = "이미 존재하는 아이디입니다.";
					$('#checkedIdResult').html(result).css('color','red');
				} else {
					result = "사용가능한 아이디입니다.";
					$('#checkedIdResult').html(result).css('color','green');
				}
				
			}
			
		});
		
	});
});


</script>

  
  
  
  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>
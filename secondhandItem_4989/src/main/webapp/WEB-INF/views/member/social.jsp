<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소셜회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/social.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>



  <jsp:include page="../inc/header.jsp"></jsp:include>

    <header>
    	<div id="menu-name">
			소셜회원가입
		</div>
   </header>

  <section>
	<div id="main-container">
	  <main>



  <div class="container">
        <h2>회원정보를 입력해주세요</h2>
        <form action="socialPro" method="post" name="fr">
            <div class="nickname-group">
                <label for="nickname">닉네임</label>
                <div class="input-group">
                    <input type="text" id="nickname" name="nickname" placeholder="닉네임" required>
                    <button type="button" id="check-btn2" class="check-btn">중복 확인</button>
                </div>
                <div id = "checkedNickResult" name = "checkedNickResult"></div>
            </div>

			
            <label for="phone">휴대폰 번호</label>
            <input type="tel" id="phone" name="phone" placeholder="01012345678" required>
			<div id = "checkedPhoneResult" name = "checkedPhoneResult"></div>
			
			<br>
			
			
            <div class="checkbox-group">
                <label><input type="checkbox" name="terms" required> 4989 이용약관(필수)</label><br>
                <label><input type="checkbox" name="privacy" required> 개인정보 수집 이용 동의(필수)</label><br>
                <label><input type="checkbox" name="identityProtection" required> 휴대폰 본인확인서비스(필수)</label><br>
                <label><input type="checkbox" name="location" required> 위치정보 이용약관 동의(필수)</label><br>
                <label><input type="checkbox" name="marketing"> 마케팅 수신 동의(선택)</label><br>
                <label><input type="checkbox" name="ad"> 개인정보 광고활용 동의(선택)</label><br>
            </div>

            <button type="submit" class="submit-btn">인증하기</button>
        </form>
    </div>


	  </main>
	</div>
  </section>
  
<script>
// let checkedPhoneResult = false;

// document.fr.phone.onblur = function() {
	
// 	let phone = document.fr.phone.value;
// 	let hasNumber = /\d/; // 숫자가 포함되어 있는지 확인하는 정규식
	
// 	if(phone.length ==11 && hasNumber.test(phone)){
// 		document.querySelector('#checkedPhoneResult').innerText = "";
// 		document.querySelector('#checkedPhoneResult').style.color = "red";
// 		document.querySelector('#checkedPhoneResult').style.fontWeight = "900";
		
// 	} else if(document.fr.phone.value == "") {
// 		document.querySelector('#checkedPhoneResult').innerText = "휴대폰 번호를 입력해주세요.";
// 		document.querySelector('#checkedPhoneResult').style.color = "red";
// 		document.querySelector('#checkedPhoneResult').style.fontWeight = "900";
		
// 	} else {
// 		document.querySelector('#checkedPhoneResult').innerText = "휴대폰 번호를 다시 확인해주세요.(11자리)";
// 		document.querySelector('#checkedPhoneResult').style.color = "red";
// 		document.querySelector('#checkedPhoneResult').style.fontWeight = "900";

// 	}
// }

</script>
  
  <!-- 닉네임 중복확인   -->
<script type="text/javascript">
$(function(){
	$('#check-btn2').click(function() {
//   		alert("asd")
		$.ajax({
			url:'${pageContext.request.contextPath}/member/nickCheck',
			data:{'nickname':$('#nickname').val()},
			success:function(result){
				
				if (result == 'nickdup'){
					result = "이미 존재하는 닉네임입니다.";
					$('#checkedNickResult').html(result).css('color','red');
				} else {
					result = "사용가능한 닉네임입니다.";
					$('#checkedNickResult').html(result).css('color','green');
				}
				
			}
			
		});
		
	});
});
</script>


<!-- 휴대폰번호 중복확인 -->
<script type="text/javascript">
$(function(){
	$('#phone').blur(function() {
// 		alert("asd")
		$.ajax({
			url:'${pageContext.request.contextPath}/member/phoneCheck',
			data:{'Phone':$('#phone').val()},
			success:function(result){
				
				if (result == 'phonedup'){
					result = "이미 등록된 휴대폰번호입니다.";
					$('#checkedPhoneResult').html(result).css('color','red');
				} else {
					result = "사용가능한 휴대폰번호입니다.";
					$('#checkedPhoneResult').html(result).css('color','green');
				}
				
			}
			
		});
		
	});
});

</script>



  <jsp:include page="../inc/footer.jsp"></jsp:include>
  
</body>
</html>

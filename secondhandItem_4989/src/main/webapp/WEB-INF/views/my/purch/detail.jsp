<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>매입 신청내역 : 4989</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/profileStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/purchaseStyle.css">
</head>
<body>
<jsp:include page="../../inc/header.jsp"></jsp:include>
<section>
	<header>
		<div id="menu-name">
   			<a href="${pageContext.request.contextPath}">홈 </a> >
   			<a href="${pageContext.request.contextPath}/my/profile">마이 페이지 </a> >
   			<a href="${pageContext.request.contextPath}/my/purchlist">매입 신청내역</a>
		</div>
		
		<style>
		
		/* 모달 창 스타일 */
        .modal {
            display: none; /* 처음에는 숨김 */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
        }

        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 500px;
            text-align: center;
        }

        .close, .confirm, .cancel {
            margin: 10px;
            padding: 10px 20px;
            cursor: pointer;
        }

        .confirm {
            background-color: #4e229e;
            color: white;
        }

        .cancel {
            background-color: #4e229e;
            color: white;
        }
		
		</style>
	</header>
	<div class="content-container">
		<jsp:include page="../../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			
			
			
		<br>
		<h1 style="text-align:center;">매입 신청내역</h1>
  	 	<br>
  	 	<br>
  	 	<c:set var="detail" value="${detail }" />
  	 	<div id="purchdetail"> 
  	 		 <table>
        <tr>
            <th>신청번호</th>
            <td style="width:200px;">${detail.purchase_id}</td>
            <th>제품명</th>
            <td style="width:auto;">${detail.pc_item_name}</td>
        </tr>
        <tr>
            <th>등급</th>
            <td>${detail.expected_grade}</td>
            <th>가격</th>
            <td>${detail.expected_price} 원</td>
        </tr>
        <tr>
            <th>배송방법</th>
            <td>${detail.shipping_method}</td>
            <th>처리상태</th>
            <td>${detail.purchase_status}</td>
        </tr>
        <tr>
            <th>은행</th>
            <td>${detail.transfer_bank}</td>
            <th>계좌번호</th>
            <td>${detail.transfer_account}</td>
        </tr>
        <tr>
            <th>신청일자</th>
            <td colspan="3"><fmt:formatDate value="${detail.request_date }" pattern="yyyy-MM-dd"/></td>
        </tr>
    </table>
 		</div>
 		<br>
 		<div style="text-align:center;">
		<button id="reset" onclick="window.history.back();">목록으로 돌아가기</button>
		<c:if test="${detail.purchase_status ne '매입 취소' }"> &nbsp;&nbsp;
		<button id="submit_form">신청 취소하기</button>
		</c:if>
		</div>
			<br><br><br>
			
		<!-- 모달 창 -->
		<div id="myModal" class="modal">
		    <div class="modal-content">
		        <p>정말 취소하시겠습니까?<br>이미 제품을 보내셨다면 착불로 반송됩니다.</p>
		        <button class="confirm" id="confirmButton">예 (취소)</button>
		        <button class="cancel" id="cancelButton">아니오</button>
		    </div>
		</div>
		
			
		</main>
		</div>
	</div>
</section>
<jsp:include page="../../inc/footer.jsp"></jsp:include>

<script>

    // 링크와 버튼, 모달 요소 가져오기
    const submit_form = document.getElementById('submit_form');
    const modal = document.getElementById('myModal');
    const confirmButton = document.getElementById('confirmButton');
    const cancelButton = document.getElementById('cancelButton');

    // 버튼을 클릭하면 모달 창 열기
    submit_form.addEventListener('click', function() {
        modal.style.display = "block";
    });

    // '확인' 버튼을 클릭하면 링크로 이동
    confirmButton.addEventListener('click', function() {
        window.location.href = 'cancel?purchase_id=${detail.purchase_id}'; // 원하는 링크로 이동
    });

    // '취소' 버튼을 클릭하면 모달 창 닫기
    cancelButton.addEventListener('click', function() {
        modal.style.display = "none";
    });

    // 모달 창 밖을 클릭하면 모달 창 닫기
    window.addEventListener('click', function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    });
    
</script>


</body>
</html>
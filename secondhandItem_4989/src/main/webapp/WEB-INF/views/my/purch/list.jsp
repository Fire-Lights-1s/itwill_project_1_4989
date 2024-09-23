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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/carouselStyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main/animate.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
</head>
<body>
<jsp:include page="../../inc/header.jsp"></jsp:include>
<header>
	<div id="menu-name">
		<a href="${pageContext.request.contextPath}" style="color: #372161;">홈 </a> >
		<a href="${pageContext.request.contextPath}/my/profile" style="color: #372161;">마이 페이지 </a> >
		<a href="${pageContext.request.contextPath}/my/purchlist" style="color: #372161;">매입 신청내역</a>
	</div>
</header>
	
<section>
	<div class="content-container">
		<jsp:include page="../../inc/myPageLefter.jsp"></jsp:include>
		<div class="main-container-side-profile">
		<main>
			
			
			
		<br>
		<h1 style="text-align:center;">매입 신청내역</h1>
  	 	<br>
  	 	
  	 	<fieldset style="width:60%; margin:0 auto; padding:10px; border:solid #ccc 1px;">
		<legend style="width:auto; margin-left:5%; font-size:1em; font-weight:700; font-color:#ccc;"> < 매입 처리과정 ></legend>
		<div class="process-container">
	        <div class="process-step">신청 완료</div> →
	        <div class="process-step">검수 중</div> →
	        <div class="process-step">매입 완료</div>
	    </div>
	    <p style="text-align:center;"><small>* 처리 도중, 매입조건 미달 또는 신청자 희망에 의해 '매입 취소' 될 수도 있습니다.</small></p>
		</fieldset>
		
  	 	<div id="purchlist"> 

  	 		<table>
  	 			<tr>
  	 				<th>접수번호</th>
  	 				<th>매입제품</th>
  	 				<th>등급</th>
  	 				<th>신청일자</th>
  	 				<th>처리상태</th>
  	 			</tr>
  	 			<c:set var="list" value="${list }" />
  	 			<c:if test="${list == null || list.size() == 0 }">
  	 				<tr><td colspan="5" style="text-align:center;">매입 신청내역이 없습니다.</td></tr>
  	 			</c:if>
  	 			
  	 			<c:forEach var="list" items="${list}">
  	 			<tr>
  	 				<td>${list.purchase_id }</td>
  	 				<td><a href="purchdetail?purchase_id=${list.purchase_id }">${list.pc_item_name }</a></td>
  	 				<td>${list.expected_grade }</td>
  	 				<td><fmt:formatDate value="${list.request_date }" pattern="yyyy-MM-dd"/></td>
  	 				<td>${list.purchase_status }</td>
 				</tr>
 				</c:forEach>
  	 		</table>
 		</div>
 		
 		<c:if test="${list.size() > 0 }">
 		<div class="position-relative">
	    <ul class="pagination">
		    <li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/my/purchlist?pageNum=1" aria-label="Go to First">
		  		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></span>
		   		</a>
			</li>
		<c:if test="${pageDTO.currentPage > 10 }">
			<li class="page-item">
		  		<a class="page-link" href="${pageContext.request.contextPath}/my/purchlist?pageNum=${pageDTO.startPage - 1}" aria-label="Previous">
		   		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
		   		</a>
			</li>
		</c:if>
		<c:forEach var="page" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/my/purchlist?pageNum=${page}"
			${pageDTO.currentPage eq page ? 'active':''}>${page }</a></li>
		</c:forEach>
		<c:if test="${pageDTO.currentPage + 10 <= pageDTO.pageCount }">
			<li class="page-item">
			  <a class="page-link" href="${pageContext.request.contextPath}/my/purchlist?pageNum=${pageDTO.endPage + 1}" aria-label="Next">
			  <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
			  </a>
			</li>
		</c:if>
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/my/purchlist?pageNum=${pageDTO.pageCount}" aria-label="Next">
		 	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span>
			</a>
		</li>
      </ul>
	</div>
 		</c:if>
 		<br>
 		<div style="text-align:right; padding-right:100px;">
		<a href="${pageContext.request.contextPath}/purchase/register"><button id="submit_form">매입 신청하기</button></a>
		</div>
			<br><br><br><br><br>
			
		</main>
		</div>
	</div>
</section>
<jsp:include page="../../inc/footer.jsp"></jsp:include>
</body>
</html>
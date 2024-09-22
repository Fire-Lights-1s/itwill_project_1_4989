<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footerStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/CsStyle.css">
</head>
<body>

<jsp:include page="../inc/header.jsp"></jsp:include>

<header>
	<div id="menu-name">
		<a href="${pageContext.request.contextPath}">홈 </a> >
		<a href="${pageContext.request.contextPath}/cs/notice">고객센터 </a> >
		<a href="${pageContext.request.contextPath}/cs/inquiry">1:1문의</a>
	</div>
</header>

<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">
	<!-- 사이드 메뉴 시작 -->
      <jsp:include page="cs_sidenav.jsp"></jsp:include>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->	
	<div id="main-container-side">
	  <main>

		<br>
		<h1 style="text-align:center;">나의 1:1 문의내역</h1>
		<p class="guide-text">지금까지 남긴 1:1문의 내용과 답변을 확인하실 수 있습니다.<br>문의사항에 대한 답변은 3영업일 내에 처리하고 있습니다.<br></p>

		<div id="notice-list"> 
  	 		<table>
  	 			<tr>
  	 				<th>접수번호</th>
  	 				<th>유형</th>
  	 				<th>제목</th>
  	 				<th>등록일</th>
  	 				<th>답변일</th>
  	 			</tr>
  	 			<c:if test="${inquiryList == null || inquiryList.size() == 0 }">
  	 				<tr><td colspan="5" style="text-align:center;">1:1 문의내역이 없습니다.</td></tr>
  	 			</c:if>
  	 			
  	 			<c:forEach var="inquiryList" items="${inquiryList}">
  	 			<tr>
  	 				<td>${inquiryList.inquiry_id }</td>
  	 				<td>${inquiryList.inquiry_type }</td>
  	 				<td><a href="inquirydetail?inquiry_id=${inquiryList.inquiry_id }">
					<c:choose>
					    <c:when test="${fn:length(inquiryList.inquiry_title) > 25}">
					        ${fn:substring(inquiryList.inquiry_title, 0, 25)}...
					    </c:when>
					    <c:otherwise>
					        ${inquiryList.inquiry_title}
					    </c:otherwise>
					</c:choose>
					</a></td>
  	 				<td><fmt:formatDate value="${inquiryList.inquired_at }" pattern="yyyy-MM-dd"/></td>
  	 				<c:choose>
                 		<c:when test="${inquiryList.replied_at != null && inquiryList.replied_at != '' }">
                 		<td class="text-center"><fmt:formatDate value="${inquiryList.replied_at}" pattern="yyyy-MM-dd"/></td>
                		</c:when>
                		<c:otherwise>
                 		<td class="text-center">미답변</td>
                		</c:otherwise>
               		</c:choose>
 				</tr>
 				</c:forEach>
  	 		</table>
 		</div>

  <c:if test="${inquiryList.size() > 0 }">
	<div class="position-relative">
	    <ul class="pagination">
		    <li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/cs/inquirylist?pageNum=1" aria-label="Go to First">
		  		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></span>
		   		</a>
			</li>
		<c:if test="${pageDTO.currentPage > 10 }">
			<li class="page-item">
		  		<a class="page-link" href="${pageContext.request.contextPath}/cs/inquirylist?pageNum=${pageDTO.startPage - 1}" aria-label="Previous">
		   		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
		   		</a>
			</li>
		</c:if>
		<c:forEach var="page" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/cs/inquirylist?pageNum=${page}"
			${pageDTO.currentPage eq page ? 'active':''}>${page }</a></li>
		</c:forEach>
		<c:if test="${pageDTO.currentPage + 10 <= pageDTO.pageCount }">
			<li class="page-item">
			  <a class="page-link" href="${pageContext.request.contextPath}/cs/inquirylist?pageNum=${pageDTO.endPage + 1}" aria-label="Next">
			  <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
			  </a>
			</li>
		</c:if>
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/cs/inquirylist?pageNum=${pageDTO.pageCount}" aria-label="Next">
		 	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span>
			</a>
		</li>
      </ul>
	</div>
	</c:if>
	<br>
	<br>
	  <div class="inquiry-form-button-container">
  		<a href="${pageContext.request.contextPath}/cs/inquiry" style="text-decoration:none;"><button class="inquiry-submit-button">1:1문의하기</button></a>
	  </div>
	  </main>
	</div>
  </div>  
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>
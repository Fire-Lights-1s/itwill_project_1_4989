<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 : 4989</title>
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
		<a href="${pageContext.request.contextPath}/cs/notice">공지사항</a>
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
		<h1 style="text-align:center;">공지사항</h1>
		<p class="guide-text">4989 이용자분들에게 전하는 공지사항입니다.<br>각종 알림사항, 이벤트 정보, 서비스 점검일정 등을 안내드립니다.</p>

	<div id="notice-list"> 
  	 		<table>
  	 			<tr>
  	 				<th>공지번호</th>
  	 				<th>제목</th>
  	 				<th>등록일</th>
  	 			</tr>
  	 			<c:if test="${noticeList == null || noticeList.size() == 0 }">
  	 				<tr><td colspan="3" style="text-align:center;">등록된 공지사항이 없습니다.</td></tr>
  	 			</c:if>
  	 			
  	 			<c:forEach var="noticeList" items="${noticeList}">
  	 			<tr>
  	 				<td>${noticeList.notice_id }</td>
  	 				<td><a href="noticedetail?notice_id=${noticeList.notice_id }">
					<c:choose>
					    <c:when test="${fn:length(noticeList.notice_name) > 18}">
					        ${fn:substring(noticeList.notice_name, 0, 18)}...
					    </c:when>
					    <c:otherwise>
					        ${noticeList.notice_name}
					    </c:otherwise>
					</c:choose>
					</a></td>
  	 				<td><fmt:formatDate value="${noticeList.notice_date }" pattern="yyyy-MM-dd"/></td>
 				</tr>
 				</c:forEach>
  	 		</table>
 		</div>
 	
 	<c:if test="${noticeList.size() > 0 }">
	  <div class="position-relative">
	    <ul class="pagination">
		    <li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/cs/notice?pageNum=1" aria-label="Go to First">
		  		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></span>
		   		</a>
			</li>
		<c:if test="${pageDTO.currentPage > 10 }">
			<li class="page-item">
		  		<a class="page-link" href="${pageContext.request.contextPath}/cs/notice?pageNum=${pageDTO.startPage - 1}" aria-label="Previous">
		   		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
		   		</a>
			</li>
		</c:if>
		<c:forEach var="page" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/cs/notice?pageNum=${page}"
			${pageDTO.currentPage eq page ? 'active':''}>${page }</a></li>
		</c:forEach>
		<c:if test="${pageDTO.currentPage + 10 <= pageDTO.pageCount }">
			<li class="page-item">
			  <a class="page-link" href="${pageContext.request.contextPath}/cs/notice?pageNum=${pageDTO.endPage + 1}" aria-label="Next">
			  <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
			  </a>
			</li>
		</c:if>
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/cs/notice?pageNum=${pageDTO.pageCount}" aria-label="Next">
		 	<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="이전"></span>
			</a>
		</li>
      </ul>
	</div>
  </c:if>

	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>
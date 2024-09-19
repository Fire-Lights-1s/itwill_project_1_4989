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
		<a href="${pageContext.request.contextPath}/cs/notice">공지사항</a>
	</div>
</header>

<!-- 메뉴 아래 시작 -->
<section>
	<div class="content-container">
	<!-- 사이드 메뉴 시작 -->
      <aside class="side-nav">
        <h3>고객센터</h3>
        <br>
        <ul>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">자주 묻는 질문</a></li>
            <li><a href="#">1:1 문의</a></li>
        </ul>
      </aside>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>

		<br>
		<h1 style="text-align:center;">공지사항</h1>


	<div id="notice-list"> 
  	 		<table>
  	 			<tr>
  	 				<th>공지번호</th>
  	 				<th>제목</th>
  	 				<th>등록일</th>
  	 			</tr>
  	 			<c:set var="noticeList" value="${noticeList }" />
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



	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>
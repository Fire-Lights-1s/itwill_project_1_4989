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
      <jsp:include page="cs_sidenav.jsp"></jsp:include>

<!-- 사이드 메뉴 끝 -->

<!-- 본문영역 시작 -->
	<div id="main-container-side">
	  <main>

		<br>
		<h1 style="text-align:center;">공지사항</h1>

  	 	<c:set var="noticeDTO" value="${noticeDTO }" />
  	 	<div id="notice-detail"> 
  	 		 <table>
        <tr>
            <th>공지번호</th>
            <td style="width:150px;">${noticeDTO.notice_id}</td>
            <th>등록일</th>
            <td><fmt:formatDate value="${noticeDTO.notice_date}" pattern="yyyy-MM-dd"/></td>
            <th>작성자</th>
            <td>관리자</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="5" class="contents-left">${noticeDTO.notice_name}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5" class="contents-left"><pre>${noticeDTO.notice_cont}</pre></td>
        </tr>
    </table>
 		</div>
 		<br>
 		<div style="text-align:center;">
		<button id="reset" onclick="window.history.back();">목록으로 돌아가기</button>
		</div>



	  </main>
	</div>
  </div>
</section>

<!-- 본문영역 끝 -->

<jsp:include page="../inc/footer.jsp"></jsp:include>


</body>
</html>
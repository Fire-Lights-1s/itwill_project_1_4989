<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의내역 : 4989</title>
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
		<h1 style="text-align:center;">나의 1:1문의 내역</h1>

  	 	<div id="notice-detail"> 
  	 	<table>
        <tr>
            <th>접수번호</th>
            <td style="width:150px;">${inquiryDTO.inquiry_id}</td>
            <th>등록일</th>
            <td><fmt:formatDate value="${inquiryDTO.inquired_at}" pattern="yyyy-MM-dd"/></td>
            <th>문의유형</th>
            <td>${inquiryDTO.inquiry_type }</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="5" class="contents-left">${inquiryDTO.inquiry_title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="5" class="contents-left"><pre>${inquiryDTO.inquiry_contents}</pre></td>
        </tr>
    </table>
    
    <h2 style="text-align:center; margin:50px auto;">답변</h2>
    <c:choose>
 		<c:when test="${inquiryDTO.replied_at != null && inquiryDTO.replied_at != '' }">
	 		<table>
		        <tr>
		            <th>작성자</th>
		            <td style="width:150px;">관리자</td>
		            <th>등록일</th>
		            <td><fmt:formatDate value="${inquiryDTO.replied_at}" pattern="yyyy-MM-dd"/></td>
		        </tr>
		        <tr>
		            <th>답변 내용</th>
		            <td colspan="5" class="contents-left"><pre>${inquiryDTO.inquiry_reply}</pre></td>
		        </tr>
	    	</table>
 		
 		</c:when>
		<c:otherwise>
 		<p style="text-align:center; margin:20px auto;"><strong>아직 답변이 완료되지 않았습니다. 조금만 기다려주세요!</strong></p>
		</c:otherwise>
	</c:choose>
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
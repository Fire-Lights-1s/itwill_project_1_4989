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
		<a href="${pageContext.request.contextPath}/cs/faq">자주 묻는 질문</a>
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
		<h1 style="text-align:center;">자주 묻는 질문</h1>
		<p class="guide-text">이용자 분들이 자주 하는 질문을 모았습니다.<br>여기에서 해결되지 않은 궁금한 부분이 있다면 1:1문의를 이용해주세요.</p>
		<div class="accordion-board">
		<c:forEach var="faqList" items="${faqList }">
		  <div class="accordion-item">
		    <div class="accordion-title" onclick="toggleAccordion(this)">
		      Q. ${faqList.faq_quest }
		    </div>
		    <div class="accordion-content">
		      <div class="pre-area"><pre>A. ${faqList.faq_answer }</pre></div>
		    </div>
		  </div>
		</c:forEach>
		</div>
		
  <c:if test="${faqList.size() > 0 }">
	<div class="position-relative">
	    <ul class="pagination">
		    <li class="page-item">
				<a class="page-link" href="${pageContext.request.contextPath}/cs/faq?pageNum=1" aria-label="Go to First">
		  		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음"></span>
		   		</a>
			</li>
		<c:if test="${pageDTO.currentPage > 10 }">
			<li class="page-item">
		  		<a class="page-link" href="${pageContext.request.contextPath}/cs/faq?pageNum=${pageDTO.startPage - 1}" aria-label="Previous">
		   		<span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전"></span>
		   		</a>
			</li>
		</c:if>
		<c:forEach var="page" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/cs/faq?pageNum=${page}"
			${pageDTO.currentPage eq page ? 'active':''}>${page }</a></li>
		</c:forEach>
		<c:if test="${pageDTO.currentPage + 10 <= pageDTO.pageCount }">
			<li class="page-item">
			  <a class="page-link" href="${pageContext.request.contextPath}/cs/faq?pageNum=${pageDTO.endPage + 1}" aria-label="Next">
			  <span aria-hidden="true"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="이전"></span>
			  </a>
			</li>
		</c:if>
		<li class="page-item">
			<a class="page-link" href="${pageContext.request.contextPath}/cs/faq?pageNum=${pageDTO.pageCount}" aria-label="Next">
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

<script>
  function toggleAccordion(element) {
    const content = element.nextElementSibling;
    if (content.style.maxHeight) {
        content.style.maxHeight = null;
      } else {
        content.style.maxHeight = content.scrollHeight + "px";
      }
    }
</script>

</body>
</html>
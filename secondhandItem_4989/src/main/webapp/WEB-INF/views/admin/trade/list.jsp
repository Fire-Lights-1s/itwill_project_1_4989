<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>4989 관리자 메뉴</title>

<jsp:include page="../inc/cssLink.jsp"></jsp:include>

<!-- 본인의 커스텀 css link 위치는 여기서부터 -->
<link
	href="${pageContext.request.contextPath}/resources/css/admin/trade.css"
	rel="stylesheet">
</head>

<body>
<div class="page-wrapper">
    <!-- 사이드바 -->
    <jsp:include page="../inc/menu_sidebar.jsp"></jsp:include>

    <div class="page-container" >
        <header class="header-desktop">
            <div class="section__content section__content--p30">
                <div class="container-fluid">
                    <div class="header-wrap">
                        <div class="header-button">
                            <a href="${pageContext.request.contextPath}/" class="btn-home">홈페이지로 가기</a>
                            <a href="${pageContext.request.contextPath}/member/logout" class="btn-logout">로그아웃</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <div class="main-content">
            <h2 class="title-1 m-b-25">거래 관리</h2>

            <div class="input-group mb-3 flex-right-50pct">
                <form action="${pageContext.request.contextPath}/admin/trade" style="display: flex; align-items: center;">
                    <input type="text" class="form-control" name="search" placeholder="검색어 입력" aria-label="Search">
                    <button class="btn btn-outline-secondary" type="submit">
                        <img alt="검색" src="${pageContext.request.contextPath}/resources/img/icon/search.png">
                    </button>
                </form>
            </div>

            <div class="table-responsive table--no-card m-b-40">
                <table class="table table-borderless table-striped table-earning">
                    <thead>
                        <tr>
                            <th class="text-center">상품ID</th>
                            <th class="text-center">거래상태</th>
                            <th class="text-center">판매자ID</th>
                            <th class="text-center">구매자ID</th>
                            <th class="text-center">상품명</th>
                            <th class="text-center">상품등록일</th>
                            <th class="text-center">거래완료일</th>
                            <th class="text-center">상세보기</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="trade" items="${tradeList}">
                            <tr>
                                <td class="text-center">${trade.product_id}</td>
                                <td class="text-center">${trade.trade_status}</td>
                                <td class="text-center">${trade.seller_id}</td>
                                <td class="text-center">${trade.buyer_id}</td>
                                <td class="text-center"><c:choose>
                                        <c:when test="${fn:length(trade.product_name) > 10}">
                        ${fn:substring(trade.product_name, 0, 10)}...
                    </c:when>
                                        <c:otherwise>
                        ${trade.product_name}
                    </c:otherwise>
                                    </c:choose></td>
                                <!-- created_datetime 처리 -->
                                <td class="text-center"><c:choose>
                                        <c:when test="${not empty trade.created_datetime}">
                                            <%--                         <fmt:formatDate value="${trade.created_datetime}" pattern="yyyy-MM-dd HH:mm"/> --%>
                        ${trade.formattedCreatedDatetime} 
                    </c:when>
                                        <c:otherwise>
                        N/A
                    </c:otherwise>
                                    </c:choose></td>
                                <!-- transaction_end_date 처리 -->
                                <td class="text-center"><c:choose>
                                        <c:when test="${not empty trade.transaction_end_date}">
                                            <%--                         <fmt:formatDate value="${trade.transaction_end_date}" pattern="yyyy-MM-dd HH:mm"/> --%>
${trade.formattedTransactionEndDate}
                    </c:when>
                                        <c:otherwise>
                        N/A
                    </c:otherwise>
                                    </c:choose></td>
                                <td class="text-center"><a href="${pageContext.request.contextPath}/admin/tradeDetail?product_id=${trade.product_id}">
                                        <button class="details-button">상세보기</button>
                                </a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 페이지 전환 버튼 -->
            <div class="position-relative">
                <ul class="pagination justify-content-end">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trade?pageNum=1">
                            <img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="처음">
                    </a></li>
                    <c:if test="${pageDTO.currentPage > 10}">
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trade?pageNum=${pageDTO.startPage - 1}">
                                <img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전">
                        </a></li>
                    </c:if>
                    <c:forEach var="page" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trade?pageNum=${page}" ${pageDTO.currentPage eq page ? 'class="active"' : ''}>${page}</a></li>
                    </c:forEach>
                    <c:if test="${pageDTO.currentPage + 10 <= pageDTO.pageCount}">
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trade?pageNum=${pageDTO.endPage + 1}">
                                <img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음">
                        </a></li>
                    </c:if>
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/admin/trade?pageNum=${pageDTO.pageCount}">
                            <img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막">
                    </a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../inc/jsLink.jsp"></jsp:include>
</body>
</html>


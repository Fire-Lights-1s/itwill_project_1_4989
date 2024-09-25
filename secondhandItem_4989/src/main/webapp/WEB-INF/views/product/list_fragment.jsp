<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
    var isLastPage = ${isLastPage};
</script>

<div id="page-checker" data-is-last-page="${isLastPage}"></div>
<div class="container px-1 px-lg-1 mt-1" style="margin-top:100px;">
    <div id="product_container" class="row gx-4 gx-lg-5 justify-content-center">

        <c:set var="size" value="${fn:length(productList)}" />
        <c:if test="${size > 0}">
            <c:forEach var="i" begin="0" end="${size - 1}">
                <c:set var="product" value="${productList[i]}" />
                <c:set var="elapsedTime" value="${elapsedTimeList[i]}" />
                <div class="col-12 col-md-6 col-lg-3 mb-5">
                    <div class="card h-100" style="box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2)">
                        <!-- Product image-->
                        <c:if test="${product.trade_status ne '거래 가능' }">
                            <img class="card-img-top img-height-fix" style="filter:brightness(0.3);" src="${pageContext.request.contextPath }/resources/upload/${product.product_img1 }" onerror="this.src='${pageContext.request.contextPath }/resources/img/default_image.png'"/>
                            <c:if test="${product.trade_status ne '예약 중'}">
                                <div class="centered-text">거래 완료</div>
                            </c:if>
                            <c:if test="${product.trade_status eq '예약 중'}">
                                <div class="centered-text">예약 중</div>
                            </c:if>
                        </c:if>
                        <c:if test="${product.trade_status eq '거래 가능' }">
                            <img class="card-img-top img-height-fix" src="${pageContext.request.contextPath }/resources/upload/${product.product_img1 }" onerror="this.src='${pageContext.request.contextPath }/resources/img/default_image.png'"/>
                        </c:if>
                        <!-- 페이 뱃지 -->
                        <c:if test="${product.pay_method eq '페이' || product.pay_method eq '현금/페이'}">
                            <div class="badge text-white position-absolute" style="background-color: #4e229e; top: 0.5rem; right: 0.5rem">PAY</div>
                        </c:if>
                        <!-- 찜하기 버튼 -->
                        <div class="zzim-button position-absolute" data-product_id="${product.product_id }" data-member_id="${sessionScope.member_id }" style="bottom: 50%; right: 1rem">♥</div>
                        <!-- Product details-->
                        <div class="card-body pt-3">
                            <div class="text-center">
                                <!-- 상품명 -->
                                <h5 class="fw-bolder">
                                    <c:choose>
                                        <c:when test="${fn:length(product.product_name) > 25}">
                                            ${fn:substring(product.product_name, 0, 25)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${product.product_name}
                                        </c:otherwise>
                                    </c:choose>
                                </h5>
                                <!-- 가격 -->
                                <h5><fmt:formatNumber value="${product.product_price }" type="number"/>원</h5>
                                <!-- 거래방법 (직거래 시 지역명) -->
                                <small style="margin-top:5px;">${product.trade_method }
                                    <c:if test="${product.trade_method eq '직거래' || product.trade_method eq '직거래/택배' || product.trade_method eq '택배/직거래'}">(${product.trade_area })</c:if></small>
                                <br>
                                <!-- 경과시간 -->
                                <small style="text-align:right;">${elapsedTime }</small>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer pt-0 border-top-0 bg-transparent">
                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="${pageContext.request.contextPath}/product/detail?product_id=${product.product_id}">상품 상세보기</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${size == 0}">
            <div style="display:flex; width:100%; height:100%; justify-content:center; align-items:center;">
                <img src="${pageContext.request.contextPath}/resources/img/no_result.png" style="display:block; width:45%;">
            </div>
        </c:if>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<div class="custom-section">
<nav class="custom-nav-wrapper">
  <div class="nav-wrapper">
    <div class="logo"><a href="${pageContext.request.contextPath }"><img src="${pageContext.request.contextPath }/resources/img/Logo_BW2.png"></a></div>
    <ul class="nav-links">
      <li><a href="${pageContext.request.contextPath}/product" class="category_btn desktop-item">三</a>
        <ul class="drop-menu">
          <li><a href="${pageContext.request.contextPath}/product">전체</a></li>
          <li><a href="${pageContext.request.contextPath}/product?category=phone">휴대폰</a></li>
          <li><a href="${pageContext.request.contextPath}/product?category=tablet">태블릿</a></li>
          <li><a href="${pageContext.request.contextPath}/product?category=watch">스마트워치</a></li>
          <li><a href="${pageContext.request.contextPath}/product?category=computer">PC/노트북</a></li>
          <li><a href="${pageContext.request.contextPath}/product?category=acc">PC주변기기</a></li>
          <li><a href="${pageContext.request.contextPath}/product?category=game">게임기기</a></li>
          <li><a href="${pageContext.request.contextPath}/product?category=etc">기타</a></li>
        </ul>
      </li>
      <li>
        <div class="search-bar">
          <form action="${pageContext.request.contextPath}/product" method="get">
            <input type="text" id="search_bar" name="search" class="search" value="${search}" placeholder="원하는 상품을 검색해보세요">
          </form>
        </div>
      </li>
    </ul>
    
    <ul class="nav-links">
      <li><a href="${pageContext.request.contextPath}/product/register">판매등록</a></li>
      <li><a href="${pageContext.request.contextPath}/purchase/intro" class="desktop-item">매입신청</a>
        <ul class="drop-menu">
          <li><a href="${pageContext.request.contextPath}/purchase/intro">서비스 소개</a></li>
          <li><a href="${pageContext.request.contextPath}/purchase/register">매입 신청하기</a></li>
        </ul>
      </li>
      <li><a href="${pageContext.request.contextPath}/chat">채팅</a></li>
      <li>
        <a href="${pageContext.request.contextPath}/my/profile" class="desktop-item">마이페이지</a>
        <ul class="drop-menu">
          <li><a href="${pageContext.request.contextPath}/my/profile">내 프로필</a></li>
	      <li><a href="${pageContext.request.contextPath}/my/payPoint">4989 페이</a></li>
	      <li><a href="${pageContext.request.contextPath}/my/zzim">찜 목록</a></li>
	      <li><a href="${pageContext.request.contextPath}/my/sell">판매내역</a></li>
	      <li><a href="${pageContext.request.contextPath}/my/buy">구매내역</a></li>
	      <li><a href="${pageContext.request.contextPath}/my/purchlist">매입신청내역</a></li>
	      <li><a href="${pageContext.request.contextPath}/my/infoCheck">정보 수정</a></li>
        </ul>
      </li>
      <c:if test="${empty sessionScope.nickname }">
      <li><a class="login-btn" href="${pageContext.request.contextPath}/member/login">로그인 / 회원가입</a></li>
      </c:if>
      <c:if test="${!empty sessionScope.nickname }">
      <li>
      <a class="login-btn" href="${pageContext.request.contextPath}/my/profile">${sessionScope.nickname}님 접속 중</a>
      	<ul class="drop-menu">
      		<c:if test="${sessionScope.member_id eq 'admin' }">
      		<li><a href="${pageContext.request.contextPath}/admin/">관리자 홈</a></li>
      		</c:if>
              <li><a href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
          </ul>
      </li>
      </c:if>
    </ul>
  </div>
</nav>
</div>

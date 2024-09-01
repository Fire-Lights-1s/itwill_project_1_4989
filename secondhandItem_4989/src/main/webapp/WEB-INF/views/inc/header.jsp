<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <nav>
        <div class="wrapper absolute-center ">
            <div class="logo"><a href="${pageContext.request.contextPath }">
            <img src="${pageContext.request.contextPath }/resources/img/Logo_BW2.png" style="height:25px;"></a></div>
            <ul class="nav-links">
                <li>
                    <a href="product/all" class="category_btn desktop-item" style="margin-right:20px;">三</a>
                    <ul class="drop-menu">
                        <li><a href="product/all">전체</a></li>
                        <li><a href="product/phone">휴대폰</a></li>
                        <li><a href="product/tablet">태블릿</a></li>
                        <li><a href="product/watch">스마트워치</a></li>
                        <li><a href="product/computer">PC/노트북</a></li>
                        <li><a href="product/acc">PC주변기기</a></li>
                        <li><a href="product/game">게임기기</a></li>
                        <li><a href="product/etc">기타</a></li>
                    </ul>
                </li>
                <li>
                    <div style="display: inline-block;">
                    <form action="product/search" method="get">
                        <input type="text" name="search" class="search" placeholder="원하는 상품을 검색해보세요">
                    </form>
                    </div>
                </li>
            </ul>
            
            <ul class="nav-links">
                <li><a href="product/register">판매등록</a></li>
                <li>
                    <a href="purchase" class="desktop-item">매입신청</a>
                    <ul class="drop-menu">
                        <li><a href="purchase">서비스 소개</a></li>
                        <li><a href="purchase/category">매입 신청하기</a></li>
                    </ul>
                </li>
                <li><a href="chat">채팅</a></li>
                <li>
                    <a href="my/profile" class="desktop-item">마이페이지</a>
                    <ul class="drop-menu">
                        <li><a href="my/profile">내 프로필</a></li>
                        <li><a href="my/pay/point">4989 페이</a></li>
                        <li><a href="my/zzim">찜 목록</a></li>
                        <li><a href="my/sell">판매내역</a></li>
                        <li><a href="my/buy">구매내역</a></li>
                        <li><a href="my/purch/list">매입신청내역</a></li>
                        <li><a href="my/info/check">정보 수정</a></li>
                    </ul>
                </li>
                <li style="width:30px;"></li>
                <li><a class="login-btn" href="member/login">로그인 / 회원가입</a></li>
            </ul>
        </div>
    </nav>
    
       

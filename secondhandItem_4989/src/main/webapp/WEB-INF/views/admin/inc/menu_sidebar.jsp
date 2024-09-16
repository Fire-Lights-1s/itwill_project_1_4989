<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <a>
                    <img src="${pageContext.request.contextPath }/resources/img/Logo_C.png" alt="Cool Admin" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                    	<li>
                            <a href="${pageContext.request.contextPath}/admin/">
                                <i></i>관리자 홈</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/member">
                                <i></i>회원 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/trade">
                                <i></i>거래 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/purchase">
                                <i></i>매입신청 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/pay">
                                <i></i>페이 관리</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/report">
                                <i></i>신고 관리</a>
                        </li>
                        <li class="has-sub">
   						 <a class="js-arrow" href="#">
       							 <i></i>고객센터 관리
   									 </a>
   									 <ul class="list-unstyled navbar__sub-list js-sub-list" style="display: none;">
   								     <li><a href="${pageContext.request.contextPath}/admin/cs/notice">공지사항 관리</a></li>
    		  					  <li><a href="${pageContext.request.contextPath}/admin/cs/faq">FAQ 관리</a></li>
   			   					  <li><a href="${pageContext.request.contextPath}/admin/cs/inquiry">1:1문의 처리</a></li>
   							 </ul>
						</li>

                        
                    </ul>
                </nav>
            </div>
        </aside>
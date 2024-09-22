<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<aside class="side-nav" style="height: 270px; padding-top: 0;">
    <div style="background-color: #4E229E; color: white; height: 80px; border-radius: 7px 7px 0 0; display: flex; justify-content: center; align-items: center;">
        <h3>고객센터</h3>
    </div>
    <ul style="font-size: 20px; font-weight: 500;">
        <li><a href="${pageContext.request.contextPath}/cs/notice" style=" color: #372161;">공지사항</a></li>
        <li><a href="${pageContext.request.contextPath}/cs/faq" style=" color: #372161;">자주 묻는 질문</a></li>
        <li><a href="${pageContext.request.contextPath}/cs/inquiry" style=" color: #372161;">1:1 문의</a></li>
    </ul>
</aside>
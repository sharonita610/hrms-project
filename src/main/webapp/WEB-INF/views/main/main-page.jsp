<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="/assets/css/main-page.css">

<%@ include file="../main/include/header.jsp" %>
<!-- 메인 페이지 list 포함 css -->
<body>
<div id="body-wrapper">
    <%@ include file="include/left-banner.jsp" %>
    <section class="main-page-list">
        <div id="main-list">
            <div id="top-list">
                <ul>






                    <li class="title-list"><h1>공지사항</h1></li>
                    <li>공지사항</li>
                    <li>공지사항</li>
                </ul>
                <ul>
                    <li class="title-list"><h1>동호회</h1></li>
                    <li>동호회</li>
                    <li>동호회</li>
                </ul>
            </div>
            <div id="bottom-list">
                <ul>
                    <li class="title-list"><h1>메일</h1></li>
                    <li>메일</li>
                    <li>메일</li>
                </ul>
                <ul>
                    <li class="title-list"><h1>결재</h1></li>
                    <li>결재</li>
                    <li>결재</li>
                </ul>
            </div>
        </div>
    </section>
</div>
</body>

</html>
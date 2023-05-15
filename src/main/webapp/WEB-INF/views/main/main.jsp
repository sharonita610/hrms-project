<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>SAMJO SANGSA</title>
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/header.css">
    <link rel="stylesheet" href="/assets/css/fixed.css">
</head>
<body>
<header class="common_wrap">
    <section class="section-header">
        <div class="head">
            <ul>
                <li>
                    <div class="logo-img">
                        <a href="#">
                            <img src="/assets/img/samjo-logo.png" alt="로고">
                        </a>
                    </div>
                </li>
                <li>삼조상사에 오신 것을 환영합니다.</li>
                <li><a href="#">로그아웃</a></li>
            </ul>
        </div>
    </section>
</header>
<div class="mainwrap clearfix">
    <section class="section-sub-header">
        <div class="nav-bar">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">게시판</a></li>
                <li><a href="#">결재</a></li>
                <li><a href="#">메일</a></li>
                <li><a href="#">동호회</a></li>
            </ul>
        </div>
    </section>


    <section class="section-left-body">
        <div class="left-fix clearfix">
            <div class="line">
                <div class="information-box clearfix">
                    <ul id="profile">
                        <li id="photo"><a href="#">사원사진</a></li>
                    </ul>
                    <ul id="information">
                        <li>사원번호</li>
                        <li>이름</li>
                        <li>휴대폰번호</li>
                        <li>부서</li>
                        <li>직책</li>
                        <li>
                            <button id="change-info" type="submit">수정</button>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </section>
    <section class="calendar">
        <div id="calendar">
            <table>
                <tr>
                    <th colspan="7">
                        <button onclick="prevMonth()">&#8249;</button>
                        <span id="currentMonth"></span>
                        <button onclick="nextMonth()">&#8250;</button>
                    </th>
                </tr>
                <tr>
                    <th>일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th>토</th>
                </tr>
            </table>
        </div>
    </section>
</div>
<%--<script src="calendar.js"></script>--%>
<%--<script>--%>
<%--    var calendar = new Calendar({--%>
<%--        target: '#calendar',--%>
<%--        date: new Date(),--%>
<%--        onSelect: function(date) {--%>
<%--            console.log(date);--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

</body>
</html>
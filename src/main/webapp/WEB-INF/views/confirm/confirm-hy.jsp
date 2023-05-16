<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAMJO SANGSA</title>
</head>
<body>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- 기본세팅 css	-->
    <link rel="stylesheet" href="/assets/css/common.css">
    <!-- 헤더, 배너 고정 틀용 css -->
    <link rel="stylesheet" href="/assets/css/header-banner.css">
    <!-- 메인 페이지 list 포함 css -->
    <link rel="stylesheet" href="/assets/css/main-page.css">
    <link rel="stylesheet" href="/assets/css/confirm.css">
</head>
<body>
<header class="common_wrap">
    <section class="section-header">
        <div class="head">
            <ul>
                <li>
                    <div class="logo-img">
                        <a href="#">
                            <img src="/resources/static/assets/img/samjo-logo.png" alt="로고">
                        </a>
                    </div>
                </li>
                <li>삼조상사에 오신 것을 환영합니다.</li>
                <li><a href="#"><span id="logout-button">로그아웃</span></a></li>
            </ul>
        </div>
    </section>
    <section class="section-sub-header">
        <div class="nav-bar">
            <ul id="tabs">
                <li><a href="#">HOME</a></li>
                <li><a href="#">게시판</a></li>
                <li><a href="#">결재</a></li>
                <li><a href="#">메일</a></li>
                <li><a href="#">동호회</a></li>
            </ul>
        </div>
    </section>
</header>
<div id="body-wrapper">
    <section class="section-left-body">
        <div id="left-body">
            <div class="left-fix">
                <div class="information-box">
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
    <%--  section-left-body 왼쪽 고정 배너랑 flex 할 section 이름을 적어주세요  --%>
    <section class=" ">


        <%-- 여기에 코드를 넣어주세요~--%>


    </section>
</div>
</body>
</html>
</body>
</html>
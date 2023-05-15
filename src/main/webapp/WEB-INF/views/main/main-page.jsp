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
    <!-- 기본세팅 css	-->
    <link rel="stylesheet" href="/assets/css/common.css">
    <!-- 헤더, 배너 고정 틀용 css -->
    <link rel="stylesheet" href="/assets/css/header-banner.css">
    <!-- 메인 페이지 list 포함 css -->
    <link rel="stylesheet" href="/assets/css/main-page.css">
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
<!-- body-wrapper은 필수, 왼쪽 배너의 남은 부분을 나눠쓰기 위함 -->
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
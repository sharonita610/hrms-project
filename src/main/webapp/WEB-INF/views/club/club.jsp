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
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/header-banner.css">
    <link rel="stylesheet" href="/assets/css/main-page.css">
    <link rel="stylesheet" href="/assets/css/club.css">

</head>
<body>
<header class="common_wrap">
    <section class="section-header">
        <div class="head">
            <ul>
                <li>
                    <div class="logo-img">
                        <a href="#">
                            <img src="/img.png" alt="로고">
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
    <section class="section-club-board">
        <div id="club-contents">
            <div class="club-drop-down-btn">
                <button class="club-dropbtn"><span class="club-dropdown">클릭</span></button>
                <div class="club-drop-down-content">
                    <a href="#">전체보기</a>
                    <a href="#">내 동호회</a>
                </div>
            </div>
            <div id="club-board-list">
                <div class="club-card-wrapper">
                    <section class="club-card" data-bno="${c.clubBoardNo}">
                        <div class="club-card-info">
                            <ul>
                                <li><img src="#" alt=""></li>
                                <li>동호회명</li>
                                <!-- 가입하기 버튼 -->
                                <li>
                                    <button class="join">가입하기</button>
                                </li>
                            </ul>
                        </div>
                        <div class="club-card-content">
                            <ul>
                                <li>사진 || 영상</li>
                                <li>텍스트블라블라</li>
                            </ul>
                        </div>
                    </section>
                    <section class="club-card" data-bno="${c.clubBoardNo}">
                        <div class="club-card-info">
                            <ul>
                                <li><img src="#" alt="">사진</li>
                                <li>동호회명</li>
                                <!-- 가입하기 버튼 -->
                                <li>
                                    <button class="join">가입하기</button>
                                </li>
                            </ul>
                        </div>
                        <div class="club-card-content">
                            <ul>
                                <li>사진 || 영상</li>
                                <li>텍스트블라블라</li>
                            </ul>
                        </div>
                    </section>
                </div>
            </div>
            <div id="club-board-information">
                <div id="club-board-reply">
                    <div class="club-board-sort">
                        <div><a href="#">내게시글</a></div>
                        <div><a href="#">내동호회</a></div>
                        <div><a href="#">내가쓴댓글</a></div>
                    </div>
                    <div class="club-my-board">
                        <ul>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                            <li>리스트</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
</html>
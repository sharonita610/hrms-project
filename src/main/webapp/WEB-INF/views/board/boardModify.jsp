<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- 기본세팅 css	-->
     <link rel="stylesheet" href="/assets/css/common.css">
     <!-- 헤더, 배너 고정 틀용 css -->
     <link rel="stylesheet" href="/assets/css/header-banner.css">
     <!-- 메인 페이지 list 포함 css -->
     <link rel="stylesheet" href="/assets/css/main-page.css">
     <!-- boot-strap -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
         integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <title>게시판 글쓰기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }


        .detail-title {
            font-weight: 700;
            font-size: 50px;
            margin-bottom: 30px;
            letter-spacing: 20px;
        }

        .detail-part {
            margin-top: 100px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;

        }

        h1 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
        }

        .form-group textarea {
            width: 100%;
            height: 200px;
            padding: 10px;
            font-size: 16px;
        }

        .form-group button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #0d6efd;
            color: white;
            border: none;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0d6efd;
        }

        #content {
            resize: none;
        }

        /* 제목 css */
        #title {
            width: 776px;
            height: 40px;
        }

        .detail-button {
            display: flex;
            justify-content: end;
        }

        .detail-button #backToList {
            margin-right: 10px;
        }

        #replyContent {
            border: 1px solid #000;
        }
    </style>
</head>

<body>
    <div id="content-wrapper">
        <section class="detail-section">
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
            </div>
            <section class="detail-part">
                <section class="modify-part">
                    <section class="container">
                        <h1 class="detail-title">수정하기</h1>
                        <form action="/hrms/board-modify" method="post">
                            <div class="form-group">
                                <input type="hidden" name="boardNo" value="${m.boardNo}">
                                <label for="board">게시판</label>
                                <select id="board" name="bdType">
                             
                                        <option value="NOTICE">공지게시판</option>
                               
                               
                                        <option value="FREE">자유게시판</option>
                         
                                        <option value="NONAME">익명게시판</option>
                              
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="title" class="container">제목</label>
                                <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요"
                                    value='${m.bdTitle}' >
                            </div>
                            <div class="form-group">
                                <label for="content">내용</label>
                                <textarea id="content" name="bdContent" placeholder="내용을 입력하세요"
                                   >${m.bdContent}</textarea>
                            </div>
                            <div class="form-group detail-button">
                                <button id="backToList" type="button">목록</button>
                                <button type="submit">수정완료</button>
                                <!--   onclick="window.location.href='/hrms/board-list?boardPageNo=${s.boardPageNo}'" -->
                            </div>
                        </form>
                    </section>
                </section>
    </div>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <!-- ck editor -->
    <script src="https://cdn.tiny.cloud/1/2h0oiwycjeu5k9ts481odi4en2v8u1wf7k3zi3va3lw2j0uy/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
      tinymce.init({
        selector: '#mytextarea'
      });
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .save-part {
            margin-top: 200px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
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
            margin-bottom: 5px;
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
    </style>
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
    </div>
    <section class="save-part">

        <div class="container">
            <h1>게시글 작성</h1>
            <form action="/hrms/board-save" method="post">
                <div class="form-group">
                    <label for="board">게시판:</label>
                    <select id="board" name="bdType">
                        <option value="NOTICE">공지게시판</option>
                        <option value="FREE">자유게시판</option>
                        <option value="NONAME">익명게시판</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="title">제목:</label>
                    <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요" required>
                </div>
                <div class="form-group">
                    <label for="content">내용:</label>              
                    <!-- <textarea id="content" name="bdContent" placeholder="내용을 입력하세요" required> -->
                        <textarea id="mytextarea" name="bdContent"></textarea>
                    </textarea>
                </div>
                <div class="form-group">
                    <button id="backToList">목록</button>
                    <button type="submit">작성</button>
                </div>
            </form>
        </div>


    </section>
   


</body>

</html>
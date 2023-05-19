<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- boot-strap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <%@ include file="../main/include/header.jsp" %>
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
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <section class="detail-section">
            <section class="modify-part">
                <section class="container">
                    <h1 class="detail-title">수정하기</h1>
                    <form action="/hrms/board/board-modify" method="post">
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
                            <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요" value='${m.bdTitle}'>
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="bdContent" placeholder="내용을 입력하세요">${m.bdContent}</textarea>
                        </div>
                        <div class="form-group detail-button">
                            <button id="backToList" type="button" onclick="window.location.href='/hrms/board/board-list'" >목록</button>
                            <button type="submit">수정완료</button>
                            <!--   onclick="window.location.href='/hrms/board-list?boardPageNo=${s.boardPageNo}'" -->
                        </div>
                    </form>
                </section>
            </section>
        </section>
    </div>

</body>

</html>
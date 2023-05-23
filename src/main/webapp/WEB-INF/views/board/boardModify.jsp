<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <!-- boot-strap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!-- ck editor -->
    <script src="https://cdn.tiny.cloud/1/2h0oiwycjeu5k9ts481odi4en2v8u1wf7k3zi3va3lw2j0uy/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#mytextarea'
        });
    </script>

    <%@ include file="../main/include/header.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 800px;
        }

        .detail-section {
            width: 75%;
            margin: 10px auto;
            height: 1000px;
        }

        .detail-topbox {
            display: flex;
            justify-content: end;
        }

        .detail-title {
            font-weight: 700;
            font-size: 50px;
            line-height: 60px;
            letter-spacing: 50px;

        }

        .detail-part {
            margin: 50px auto;
        }

        .container-box {
            max-width: 1000px;
            height: fit-content;
            margin: 0 auto;
            border: 1px solid #000;
            padding: 20px
        }

        /* 게시글 title부분 */
        .btn-danger {
            margin-left: 210px;
            height: 60px;
            width: 120px;
            font-size: larger;
            font-weight: 600;
            letter-spacing: 5px;
            text-align: center;
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

        #title {
            width: 100%;
            height: 40px;
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

        /* content 영역 */
        #mytextarea {
            height: 600px;

        }

        /* 내용창 아래 버튼  수정 완료, 목록 버튼*/
        .detail-button {
            display: flex;
            justify-content: end;
        }

        .detail-button #backToList {
            margin-right: 10px;
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
                            <!-- <textarea id="content" name="bdContent" placeholder="내용을 입력하세요">${m.bdContent}</textarea> -->
                            <textarea id="mytextarea" name="bdContent" readonly>${m.bdContent}</textarea>
                        </div>
                        <div class="form-group detail-button">
                            <button id="backToList" type="reset">수정취소</button>
                            <!--  onclick="window.location.href='/hrms/board/board-list'" -->
                            <button type="submit">수정완료</button>
                            <!--   onclick="window.location.href='/hrms/board-list?boardPageNo=${s.boardPageNo}'" -->
                        </div>
                    </form>
                </section>
            </section>
        </section>
    </div>
    <script>
        const backToDetail = document.getElementById('backToList');
        backToDetail.onclick=()=>{
            // http://localhost:8888/hrms/board/board-detail/?boardNo=300&boardPageNo=1&bdType=NOTICE
            console.log('수정취소버튼클릭');
            window.location.href='/hrms/board/board-detail/?boardNo=${m.boardNo}&boardPageNo=1&bdType=${m.bdType}'
            }

    </script>

</body>

</html>
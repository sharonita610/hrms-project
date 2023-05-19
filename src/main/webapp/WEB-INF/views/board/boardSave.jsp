<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>

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
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <section class="save-part">

            <div class="container">
                <h1>게시글 작성</h1>
                <form action="/hrms/board/board-save" method="post">
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
                        <!-- </textarea> -->
                    </div>
                    <div class="form-group">
                        <button id="backToList">목록</button>
                        <button type="submit">작성</button>
                    </div>
                </form>
            </div>


        </section>

    </div>

</body>

</html>
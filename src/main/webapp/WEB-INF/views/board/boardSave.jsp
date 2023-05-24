<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
    <!-- boot-strap -->
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
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
            margin-top: 10px;
            height: 1000px;
            margin-left: 400px;
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


        .container h1 {
            text-align: center;
            font-size: 40px;
            font-weight: 700;
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

        .class-input {
            display: flex;
        }

        .title-input #title {
            width: 500px;
        }

        .title-input #serious {
            font-weight: 700;
            font-size: 1.2em;
        }

        #importantCheck {
            transform: scale(1.5);
            margin: 0px 10px;
        }
    </style>
</head>

<body>
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <section class="save-part">
            <section class="detail-section">
                <section class="modify-part">
                    <div class="container">
                        <h1>게시글 작성</h1>
                        <form action="/hrms/board/board-save" method="post">
                            <div class="form-group">
                                <c:if test="${login!=null}">
                                    <input type="hidden" name="empNo" value="${login.empNo}">
                                </c:if>
                                <label for="board">게시판:</label>
                                <select id="board" name="bdType">
                                    <option value="NOTICE">공지게시판</option>
                                    <option value="FREE">자유게시판</option>
                                    <option value="NONAME">익명게시판</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="title">제목:</label>
                                <div class="title-input">
                                    <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요" required>
                                    <c:if test="${login.roleCode=='11111'|| login.roleCode=='00000'}">
                                        <input name="important" id="importantCheck" type="checkbox" value="0"><span
                                            id="serious">중요</span>
                                    </c:if>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="content">내용:</label>
                                <!-- <textarea id="content" name="bdContent" placeholder="내용을 입력하세요" required> -->
                                <textarea id="mytextarea" name="bdContent"></textarea>
                                <!-- <textarea id="mytextarea" name="bdContent"></textarea> -->
                                <!-- </textarea> -->
                            </div>
                            <div class="form-group detail-button">
                                <button id="backToList" type="reset">목록</button>
                                <button type="submit">작성</button>
                            </div>
                        </form>
                    </div>
                </section>
            </section>

        </section>

    </div>

</body>
<script>
    function checkeBox() {
        $checkbox = document.getElementById('importantCheck');
        if ($checkbox){

            $checkbox.onclick = () => {
                if ($checkbox.checked) {
                    console.log("체크박스가 선택되었습니다.");
                    // 선택되었을 때 수행할 동작
                    $checkbox.value = 1;

                } else {
                    console.log("체크박스가 선택되지 않았습니다.");
                    $checkbox.value = 0;
                    // 선택되지 않았을 때 수행할 동작
                
                    // console.log('나오냐?');
                    // console.log($checkbox.value);

                }

            }
        }   
    }

    checkeBox();




    const $back = document.getElementById('backToList');
    $back.onclick = () => {
        window.location.href = '/hrms/board/board-list/'

    }
</script>

</html>
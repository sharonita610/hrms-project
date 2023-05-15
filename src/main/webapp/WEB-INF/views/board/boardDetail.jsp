<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <style>
        .write-wrapper {
            border: 1px solid #000;
            margin: 100px auto;
            width: 60vh;
            padding: 10px;
        }

        .write-wrapper .write-header {
            text-align: center;
            margin-bottom: 10px;
            font-size: 2em;
        }

        .write-wrapper .head-wrapper {
            display: flex;
            justify-content: start;
        }

        #content-label {
            display: block;
        }

        textarea {
            margin: 10px auto;
            resize: none;
            height: 200px;
            width: 400px;
        }

        .write-wrapper #buttons {
            display: flex;
            justify-content: end;

        }

        #buttons button {
            margin: 5px;

        }
    </style>
</head>

<body>

    <div class="write-wrapper">     
        <form action="/hrms/show-modify" method="post">
            <!-- <header class="write-header">글 쓰 기</header> -->
            <div class="head-wrapper">
                <input type="hidden" name="boardNo" value="${b.boardNo}">
                <label id="write-title">제목</label>
                <input name="bdTitle" value="${b.bdTitle}" readonly>
                <label id="bdTypeName">타입<label>
                        <select class="type" name="bdType" value="${b.bdType}">
                            <option value="NOTICE">공지 게시판</option>
                             <option value="FREE">자유 게시판</option>
                            <option value="NONAME">익명 게시판</option>
                        </select>
            </div>
            <label id="content-label">내용</label>
            <textarea name="bdContent" readonly>${b.bdContent}</textarea>
            <div id="buttons">
                <button type="submit">수정하기</button>
        </form>
        <button id="backToList">목록</button>

    </div>
    <script>

        function selectVal(){
            if('${b.bdType=NOTICE}')
            console.log('맞아');
        }



        const $type=document.querySelector('.type');
        function typeChange() {
            console.log($type.value);
            if($type.value='FREE'){
                console.log('맞아맞아');

            }
        }
        typeChange();
        

        const $toList = document.getElementById('backToList');
        $toList.onclick = function () {
            history.back();
        }

        selectVal();
    </script>

</body>

</html>
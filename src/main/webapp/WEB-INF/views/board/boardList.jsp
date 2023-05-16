<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>board-list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    </head>
<style>
    .board_area {
        margin: 100px;
        width: 80vh;
        text-align: center;

    }
    .board_area #board-title{
        text-align: center;
    }

    .board_area .list-table {
        margin: 5px auto;
        border: 1px solid #000;
    }

    .board_area .search {
        margin: 5px auto;
        text-align: center;
    }

    .board_area .showPage {
        display: flex;
        justify-content: center;
        margin: 5px auto;
    }

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

    .search-bar {
        display: flex;
        justify-content:center;
    }
</style>

<body>
    <!-- <%@ include file="../main/header-banner.jsp" %> -->


    <div class="board_area">

        <h1 id="board-title">공지사항</h1>
        <header class="search">
            <form class="form-inline" action="/hrms/board-list" method="get">
                <div class="search-bar">
                    <label for="category">카테고리:</label>
                    <select class="form-control mr-sm-2" id="category" name="boardType">
                        <option value="title">제목</option>
                        <option value="boardType">공지유형</option>
                        <option value="boardContent">내용</option>
                    </select>
                    <div class="search_box">
                        <input class="form-control mr-sm-2" type="search" id="search" placeholder="검색어를 입력하세요" aria-label="Search" name="boardKeyWord" maxlength="225"> <i id="keyboard"
                            class="fa fa-keyboard-o"></i>
                        <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">검색</button>
                    </div>
                </div>
            </form>
        </header>
        <button class="btn btn-outline-primary my-2 my-sm-0" type="button">새글 추가</button>


        <table class="table">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                </tr>
                <c:forEach var="a" items="${allList}">

                    <tr>
                        <tr>
                            <th scope="row">${a.boardNo}</th>
                            <td><a href="/hrms/board-detail/?boardNo=${a.boardNo}">${a.shortTitle}</a></td>
                            <td>${a.empNo}</td>
                            <td>${a.stringDate}</td>
                            <td>1</td>
                          </tr>

                    </tr>

                </c:forEach>
            </thead>
        </table>

        <nav class="showPage" aria-label="Page navigation example">
            <ul class="pagination">
                <a class="page-link" href="/hrms/board-list/?boardPageNo=1" aria-label="Previous"><span
                        aria-hidden="true">&laquo;</span>
                </a>
                <c:if test="${boardPageMaker.prev}">
                    <li class="page-item"><a class="page-link"
                            href="/hrms/board-list/?boardPageNo=${boardPageMaker.start-1}">Previous</a></li>
                </c:if>
                <c:forEach var="i" begin="${boardPageMaker.start}" end="${boardPageMaker.end}">
                    <li class="page-item"><a class="page-link" href="/hrms/board-list/?boardPageNo=${i}">${i}</a></li>
                </c:forEach>
                <c:if test="${boardPageMaker.next}">
                    <li class="page-item"><a class="page-link"
                            href="/hrms/board-list/?boardPageNo=${boardPageMaker.end+1}">Next</a></li>
                </c:if>
                <a class="page-link" href="/hrms/board-list/?boardPageNo=${boardPageMaker.final_page}"
                    aria-label="Next"><span aria-hidden="true">&raquo;</span>
                </a>
            </ul>
        </nav>
    </div>
    <script>
        //저장기능
        const $save = document.getElementById('save-Btn');
        $save.onclick = function () {
            window.location.href = '/hrms/board-save/'
        };

        //삭제기능
        const $cardWrapper = document.querySelector('.card-wrapper')
        // const $mainBox = document.querySelector('.main-box');

        // $cardWrapper.addEventListener('click', e => {
        //     if (e.target.matches('.main-box *')) {
        //         const $delBtn = e.target.closest('#delete-btn');
        //         window.location.href = $delBtn.dataset.href;
        //     }

        // })

        //디테일 기능

        // $cardWrapper.addEventListener('click', e => {
        //     if (e.target.matches('.main-box *')) {
        //         const $detail = e.target.closest('#detail-btn');
        //         window.location.href = $detail.dataset.href;
        //     }

        // })
    </script>



</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>board-list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>


<body>
    <!-- 검색바 -->
    <div class="container">
        <h1>검색 바</h1>

        <form class="form-inline" action="/hrms/board-list" method="get">
            <div class="form-group mr-sm-2">
                <label for="search">검색어:</label>
                <input class="form-control" type="search" id="search" placeholder="검색어를 입력하세요" aria-label="Search">
            </div>

            <div class="form-group mr-sm-2">
                <label for="category">카테고리:</label>
                <select class="form-control" id="category">
                    <option value="title">제목</option>
                    <option value="boardType">공지유형</option>
                    <!-- <option value="boardContent">내용</option> -->
                </select>
            </div>

            <button class="btn btn-primary" type="submit">검색</button>
        </form>
    </div>

    <!-- 게시판 -->
    <!-- <div class="container">
        <h1>게시판</h1>

        <table class="table">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${allList}">
                <tr>
                    <th scope="row">${a.boardNo}</th>
                    <td><a href="/hrms/board-detail/?boardNo=${a.boardNo}">${a.shortTitle}</a></td>
                    <td>${a.empNo}</td>
                    <td>${a.stringDate}</td>
                    <c:forEach var="a" items="${allList}">
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div> -->

    <!-- paging -->
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


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
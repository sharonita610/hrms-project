<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <%@ include file="../main/include/header.jsp" %>

    <!-- <link rel="stylesheet" href="/assets/css/board.css"> -->
    <style>
        .text{
            margin-left :50px;
            width: 70%;
        }
        .search {
            /* margin-left: 50px; */
            width: 100%;
        }

        #board-title {
            font-weight: 700;
            font-size: 30px;
        }

        .search-bar {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .search-bar select {
            flex: 1;
            margin-left: 300px;
            margin-right: 20px;
            /* 오른쪽에 10px의 공백 추가 */
        }

        .search-bar #search {
            flex: 3
        }

        .search-bar #search-button {
            flex: 1;
            margin-left: 20px;
            margin-right: 300px;
            /* 좌우에 10px의 공백 추가 */
        }

        .board_area .top-box {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .board_area .top-box #save-Btn {
            /* margin: 10px; */
            /* margin-right: 10px; */
            margin-bottom: 10px;

        }



        .showPage {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }



        .table {
            padding-left: 50px;
            text-align: center;
            line-height: 2em;
            height: 2em;

        }

        .table .table-top {
            background-color: #f5f5f5;
            font-weight: 600;
        }

        .table #boardNo {
            width: 100px;
        }

        .table #title {
            width: 250px;
        }

        .table #count {
            width: 100px;

        }

        .table #empNo {
            width: 120px;
        }

        .table #date {
            width: 200px;
        }

        .card-wrapper {
            height: 18px;
        }

        .table td,th {
            border: none;
            border-bottom: 1px solid #f4f4f4;
            
        }

        .replyConut {
            color: orangered;
        }

        .card-wrapper th,
        td {
            height: 2em;
            line-height: 2em;

        }

        .card-wrapper:hover {
            background-color: #f7f7f7;
        }

    </style>
</head>


<body>


    <!-- 게시판 시작 -->
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <section class="text">
            <div class="board_area">
                <div class="top-box">

                    <h1 id="board-title">공지 게시판</h1>

                    <button id="save-Btn" class="btn btn-outline-primary my-2 my-sm-0" type="button">새글
                        추가</button>

                </div>
                <table class="table">
                    <thead>
                        <tr class="table-top">
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                        <c:forEach var="a" items="${allList}">
                            <tr class="card-wrapper">

                                <th scope="row" id="boardNo">${a.boardNo}</th>
                                <td id="title">
                                    <a
                                        href="/hrms/board/board-detail/?boardNo=${a.boardNo}&boardPageNo=${boardPageMaker.boardPage.boardPageNo}&bdType=${a.bdType}">${a.shortTitle}
                                        <c:if test="${a.repNo!=0}">
                                            <span class="replyConut">[${a.repNo}]</span>
                                        </c:if>
                                    </a>
                                </td>
                                <td id="empNo">${a.empName}</td>
                                <td id="date">${a.stringDate}</td>
                                <td id="count">${a.viewCount}</td>

                            </tr>

                        </c:forEach>
                    </thead>
                </table>

                <nav class="showPage" aria-label="Page navigation example">
                    <ul class="pagination">
                        <a class="page-link" href="/hrms/board/board-list/?boardPageNo=1" aria-label="Previous"><span
                                aria-hidden="true">&laquo;</span>
                        </a>
                        <c:if test="${boardPageMaker.prev}">
                            <li class="page-item"><a class="page-link"
                                    href="/hrms/board/board-list/?boardPageNo=${boardPageMaker.start-1}">이전</a></li>
                        </c:if>
                        <c:forEach var="i" begin="${boardPageMaker.start}" end="${boardPageMaker.end}">
                            <li class="page-item"><a class="page-link" href="/hrms/board/board-list/?boardPageNo=${i}"
                                    data-pNo="${i}">${i}</a></li>
                        </c:forEach>
                        <c:if test="${boardPageMaker.next}">
                            <li class="page-item"><a class="page-link"
                                    href="/hrms/board/board-list/?boardPageNo=${boardPageMaker.end+1}">다음</a></li>
                        </c:if>
                        <a class="page-link" href="/hrms/board/board-list/?boardPageNo=${boardPageMaker.final_page}"
                            aria-label="Next"><span aria-hidden="true">&raquo;</span>
                        </a>
                    </ul>
                </nav>
            </div>
            <!-- 검색기능  -->
            <header class="search">
                <form class="form-inline" action="/hrms/board/board-list" method="get">
                    <div class="search-bar">
                        <select class="form-control mr-sm-2" id="category" name="boardType">
                            <option value="title">제목</option>
                            <option value="boardContent">내용</option>
                            <option value="empName">작성자</option>
                            <option value="titleAndContent">제목+내용</option>
                        </select>
                        <input class="form-control mr-sm-2" type="search" id="search" placeholder="검색어를 입력하세요"
                            aria-label="Search" name="boardKeyWord"> <i id="keyboard" class="fa fa-keyboard-o"></i>
                        <button class="btn btn-outline-primary my-2 my-sm-0" id="search-button"
                            type="submit">검색</button>
                    </div>
                </form>
            </header>

        </section>
    </div>
    <script>
        //저장기능
        const $save = document.getElementById('save-Btn');
        $save.onclick = function () {
            window.location.href = '/hrms/board/board-save/'
        };

        // const link = document.querySelector('.page-link');
        // link.onclick = () => {
        //     link.style.color = "red";
        // }


        function colorSwitch() {

            const curPageNum = '${boardPageMaker.boardPage.boardPageNo}'
            console.log(curPageNum);

            const $ul = document.querySelector('.pagination');



        }
        colorSwitch();



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
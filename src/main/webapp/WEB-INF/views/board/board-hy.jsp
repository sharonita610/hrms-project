<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAMJO SANGSA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!-- 기본세팅 css	-->
    <link rel="stylesheet" href="/assets/css/common.css">
    <!-- 헤더, 배너 고정 틀용 css -->
    <link rel="stylesheet" href="/assets/css/header-banner.css">
    <!-- 메인 페이지 list 포함 css -->
    <link rel="stylesheet" href="/assets/css/main-page.css">
    <link rel="stylesheet" href="/assets/css/board.css">
    <style>
        .search {

            margin-bottom: 50px;
        }
        #board-title{
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
            margin-right: 50px;
            margin-bottom: 10px;

        }



        .showPage {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }



        .table {
            padding-left: 200px;
            text-align: center;
            line-height: 1em;

        }
        .table .table-top{
            background-color: #f5f5f5;
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
            border-bottom: 1px solid #f4f4f4;
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

        <!-- 게시판 시작 -->

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
                            <tr>
                                <th scope="row" id="boardNo">${a.boardNo}</th>
                                <td id="title"><a href="/hrms/board-detail/?boardNo=${a.boardNo}">${a.shortTitle}</a>
                                </td>
                                <td id="empNo">${a.empNo}</td>
                                <td id="date">${a.stringDate}</td>
                                <td id="count">1</td>
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
                            <li class="page-item"><a class="page-link"
                                    href="/hrms/board-list/?boardPageNo=${i}">${i}</a></li>
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
            <!-- 검색기능  -->
            <header class="search">
                <form class="form-inline" action="/hrms/board-list" method="get">
                    <div class="search-bar">
                        <select class="form-control mr-sm-2" id="category" name="boardType">
                            <option value="title">제목</option>
                            <option value="boardContent">내용</option>
                            <option value="boardType">작성자</option>
                        </select>
                        <input class="form-control mr-sm-2" type="search" id="search" placeholder="검색어를 입력하세요"
                            aria-label="Search" name="boardKeyWord"> <i id="keyboard" class="fa fa-keyboard-o"></i>
                        <button class="btn btn-outline-primary my-2 my-sm-0" id="search-button"
                            type="submit">검색</button>

                    </div>

                </form>

            </header>

        </section>
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
    </div>
</body>

</html>
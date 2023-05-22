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
        .text {
            margin-left: 200px;
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


        /* 게시글 List */
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

        .table td,
        th {
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

        /* 사원이름  css*/
        .nameModal {
            cursor: pointer;
        }

        /* 사원이름 클릭시 작동하는 모달 css */
        .modal {
            margin-top: 250px;
        }


        /* page 색변화처리  */
        .pagination li.colorChange a {
            background-color: #0d6efd !important;
            color: #ffffff !important;
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

                    <button id="save-Btn" class="btn btn-outline-primary my-2 my-sm-0" type="button">글쓰기</button>

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
                                <td id="empNo"><a class="nameModal" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal" data-eno="${a.empNo}">${a.empName}</a></td>
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
                            <li class="page-item" data-pno="${i}"><a class="page-link"
                                    href="/hrms/board/board-list/?boardPageNo=${i}">${i}</a></li>
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
                            aria-label="Search" name="boardKeyWord" value="${search.boardKeyWord}"><i id="keyboard"
                            class="fa fa-keyboard-o"></i>
                        <button class="btn btn-outline-primary my-2 my-sm-0" id="search-button"
                            type="submit">검색</button>
                    </div>
                </form>
            </header>

        </section>

        <!-- 사원이름 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">삼조상사</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table hrInfoTable">

                            <tbody>
                                <tr>
                                    <th scope="row" rowspan="4">사진</th>
                                    <td>이름</td>
                                    <td id="modalName"></td>
                                </tr>
                                <tr>
                                    <td>부서</td>
                                    <td id="modalDept"></td>
                                </tr>
                                <tr>
                                    <th scope="row">직급</th>
                                    <td colspan="2" id="modalPos"></td>
                                </tr>
                                <tr>
                                    <td>직책</td>
                                    <td id="modalRole"></td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td colspan="2" id="modalEmail"></td>
                                </tr>
                                <tr>
                                    <td>핸드폰번호</td>
                                    <td colspan="2" id="modalPhone"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- bootstrap js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>
    <script>
        //저장기능
        const $save = document.getElementById('save-Btn');
        $save.onclick = function () {
            window.location.href = '/hrms/board/board-save/'
        };



        //select 선택 후 검색을 하더라도 전에 선택된 option이 유지되게 하는 기능
        function maintainSelect() {
            const $select = document.getElementById('category');
            // console.log('select' + $select);
            for (let s of [...$select.children]) {
                if (s.value == '${search.boardType}') {
                    s.setAttribute('selected', 'selected')
                }
            }
        }
        maintainSelect();


        function colorSwitch(e) {
            const curPageNum = '${boardPageMaker.boardPage.boardPageNo}';
            const $pageList = document.querySelector('.pagination');

            for (let p of $pageList.children) {
                // console.log(p);
                if (curPageNum === p.dataset.pno) {
                    // console.log(p.dataset.pno);
                    // 색상 변경 로직
                    p.classList.add('colorChange');
                    break;

                }
            }
        }
        colorSwitch();



        function renderEmpInfo(responseResult) {

            const empNoElements = document.querySelectorAll('#empNo');

            empNoElements.forEach(element => {
                element.addEventListener('click', (e) => {
                    const eno = e.target.dataset.eno;

                    for (const r of responseResult) {
                            if(r.empNo==eno){
                                // console.log('일치');
                                const modalName=document.getElementById('modalName');
                                const modalDept=document.getElementById('modalDept');
                                const modalPos=document.getElementById('modalPos');
                                const modalRole=document.getElementById('modalRole');
                                const modalEmail=document.getElementById('modalEmail');
                                const modalPhone=document.getElementById('modalPhone');
                                modalName.innerText=r.empName;
                                modalDept.innerText=r.deptName;
                                modalPos.innerText=r.posName;
                                modalRole.innerText=r.roleName;
                                modalEmail.innerText=r.empEmail;
                                modalPhone.innerText=r.empPhone;
                            }

                    }
         
                });
            });

        }


        //emp정보 가져오기

        //사원정보 요청 URI
        const URL = '/api/hrms/boardInfo';

        //사원정보 목록 불러오는 함수

        function getEmpInfo() {

            fetch(URL)
                .then(res => res.json())
                .then(responseResult => {
                    // console.log(responseResult);
                    renderEmpInfo(responseResult)
                });

        }

        (function () {
            getEmpInfo();

        })();
    </script>

</body>

</html>
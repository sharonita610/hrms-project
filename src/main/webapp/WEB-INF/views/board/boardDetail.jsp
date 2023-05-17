<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAMJO SANGSA</title>
</head>

<body>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
            content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <!-- 기본세팅 css	-->
        <link rel="stylesheet" href="/assets/css/common.css">
        <!-- 헤더, 배너 고정 틀용 css -->
        <link rel="stylesheet" href="/assets/css/header-banner.css">
        <!-- 메인 페이지 list 포함 css -->
        <link rel="stylesheet" href="/assets/css/main-page.css">
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .detail-part {
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
        </div>
        <section class="detail-part">
            <div class="container">
                <h1>게시글 작성</h1>
                <form action="/hrms/show-modify" method="post">
                    <div class="form-group">
                        <input type="hidden" name="boardNo" value="${b.boardNo}">
                        <label for="board">게시판:</label>
                        <select id="board" name="bdType">
                            <option value="NOTICE">공지게시판</option>
                            <option value="FREE">자유게시판</option>
                            <option value="NONAME">익명게시판</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="title">제목:</label>
                        <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요" readonly>
                    </div>
                    <div class="form-group">
                        <label for="content">내용:</label>
                        <textarea id="content" name="bdContent" placeholder="내용을 입력하세요"
                            readonly>${b.bdContent}</textarea>
                    </div>
                    <div class="form-group">
                        <button id="backToList">목록</button>
                        <!--  onclick="'window.location.href=/hrms/'" -->
                        <button type="submit">수정</button>
                    </div>
                </form>

                <!-- 댓글 영역 -->

                <div id="replies" class="row">
                    <div class="offset-md-1 col-md-10">
                        <!-- 댓글 쓰기 영역 -->
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label for="newReplyText" hidden>댓글 내용</label>
                                            <textarea rows="3" id="newReplyText" name="replyText" class="form-control"
                                                placeholder="댓글을 입력해주세요."></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="newReplyWriter" hidden>댓글 작성자</label>
                                            <input id="newReplyWriter" name="replyWriter" type="text"
                                                class="form-control" placeholder="작성자 이름" readonly
                                                style="margin-bottom: 6px;">
                                            <button id="replyAddBtn" type="button"
                                                class="btn btn-dark form-control">등록</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end reply write -->

                        <!--댓글 내용 영역-->
                        <div class="card">
                            <!-- 댓글 내용 헤더 -->
                            <div class="card-header text-white m-0" style="background: #343A40;">
                                <div class="float-left">댓글 (<span id="replyCnt">0</span>)</div>
                            </div>

                            <!-- 댓글 내용 바디 -->
                            <div id="replyCollapse" class="card">
                                <div id="replyData">
                                    <!-- 
                                < JS로 댓글 정보 DIV삽입 > 
                            -->
                                </div>

                                <!-- 댓글 페이징 영역 -->
                                <ul class="pagination justify-content-center">
                                    <!-- 
                                < JS로 댓글 페이징 DIV삽입 > 
                            -->
                                </ul>
                            </div>
                        </div> <!-- end reply content -->
                    </div>
                </div>
                <!-- end replies row -->

            </div>


        </section>
        <script>
            // URI
            const URL = '/api/hrms/replies';

            // 게시글 번호 
            const boardNo = `${b.boardNo}`

            // 페이지 렌더링 함수
            function renderPage({
                boardPage,
                end,
                final_page,
                next,
                prev,
                start
            }) {
                let tag = "";

                //이전 버튼 만들기
                if (prev) {
                    tag += "<li class='page-item'><a class='page-link page-active' href='" + (start - 1) +
                        "'>이전</a></li>";
                }
                //페이지 번호 리스트 만들기
                for (let i = start; i <= end; i++) {
                    let active = '';
                    if (boardPage.boardPageNo === i) {
                        active = 'p-active';
                    }

                    tag += "<li class='page-item " + active + "'><a class='page-link page-custom' href='" + i +
                        "'>" + i + "</a></li>";
                }
                //다음 버튼 만들기
                if (next) {
                    tag += "<li class='page-item'><a class='page-link page-active' href='" + (end + 1) +
                        "'>다음</a></li>";
                }

                // 페이지태그 렌더링
                const $pageUl = document.querySelector('.pagination');
                $pageUl.innerHTML = tag;

                // ul에 마지막페이지 번호 저장.
                $pageUl.dataset.fp = final_page;


            }

            // 페이지 클릭 이벤트 핸들러
            function makePageButtonClickEvent() {
                // 페이지 버튼 클릭이벤트 처리
                const $pageUl = document.querySelector('.pagination');
                $pageUl.onclick = e => {
                    if (!e.target.matches('.page-item a')) return;

                    e.preventDefault(); // 태그의 기본 동작 중단(a태그 링크 이동 기능 제거)
                    // 누른 페이지 번호 가져오기
                    const pageNum = e.target.getAttribute('href');
                    // console.log(pageNum);

                    // 페이지 번호에 맞는 목록 비동기 요청
                    findAllReplies(pageNum);
                };
            }




            // 댓글 리스트와 렌더링
            function renderReplyList({
                boardReplies,
                boardReplyPageMaker,
                replyCount
            }) {
                // 총 댓글수
                document.getElementById('replyCnt').textContent = replyCount;


                //댓글 내용 렌더링
                // 댓글 하나하나 태그
                let tag = '';

                if (boardReplies === null || boardReplies.length === 0) {
                    tag += "<div id='replyContent' class='card-body'>댓글이 아직 없습니다! ㅠㅠ</div>";

                } else {
                    for (let rep of boardReplies) {
                        const {
                            repNo,
                            empNo,
                            repContent,
                            regDate
                        } = rep;

                        tag += "<div id='replyContent' class='card-body' data-replyId='" + repNo + "'>" +
                            "    <div class='row user-block'>" +
                            "       <span class='col-md-3'>" +
                            "         <b>" + empNo + "</b>" +
                            "       </span>" +
                            "       <span class='offset-md-6 col-md-3 text-right'><b>" + regDate +
                            "</b></span>" +
                            "    </div><br>" +
                            "    <div class='row'>" +
                            "       <div class='col-md-6'>" + repContent + "</div>" +
                            "       <div et-md-2 col-md-4 text-right'>";

                        // if (currentAccount === rep.account || auth === 'ADMIN') {
                        tag +=
                            "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +
                            "         <a id='replyDelBtn' class='btn btn-sm btn-outline-dark' href='#'>삭제</a>";
                        // }
                        tag += "       </div>" +
                            "    </div>" +
                            " </div>";
                    }
                }
                document.getElementById('replyData').innerHTML = tag;
                renderPage(boardReplyPageMaker);

            }




            // 댓글 목록 불러오기 함수
            function findAllReplies(page = 1) {

                fetch(`\${URL}/\${boardNo}/page/\${page}`)
                    .then(res => res.json())
                    .then(responseResult => {
                        console.log(responseResult);
                        renderReplyList(responseResult)
                    });

            }

            //
            (function () {

                // 댓글 리스트 호출
                findAllReplies();
                // 페이지 이동
                makePageButtonClickEvent();

            })()
        </script>

    </body>

    </html>
</body>

</html>
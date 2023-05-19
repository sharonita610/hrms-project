<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>

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
        <style>
            body {
                font-family: Arial, sans-serif;
            }


            .detail-title {
                font-weight: 700;
                font-size: 50px;
                margin-bottom: 30px;
                letter-spacing: 20px;
            }

            .detail-part {
                margin: 200px auto;
            }

            .container-box {
                max-width: 1000px;
                height: fit-content;
                margin: 0 auto;
                border: 1px solid #000;
                padding: 20px
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


            /* 제목 css */


            .detail-button {
                display: flex;
                justify-content: end;
            }

            .detail-button #backToList {
                margin-right: 10px;
            }

            #replyContent {
                border: 1px solid #000;
            }

            /* 댓글 창 css */
            .card {
                height: 150px;
                width: 100%;
            }

            .form-group textarea {
                height: 120px;

            }

            .col-md-4 {
                /* margin-top; */
                display: inline-block;
                width: 200px;
            }

            #newReplyText {
                overflow: auto;
                resize: none;
            }


            .form-control {
                margin-bottom: 35px;
            }

            /* empNo hidden 처리 */
        </style>
    </head>

    <body>
        <div id="content-wrapper">
            <section class="detail-section">
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
                    <div class="container-box">
                        <h1 class="detail-title">게시글</h1>
                        <form action="/hrms/show-modify" method="post">
                            <div class="form-group">
                                <input type="hidden" name="boardNo" value="${b.boardNo}">
                                <label for="board">게시판</label>
                                <select id="board" name="bdType">
                                    <c:if test="${b.bdType=='NOTICE'}">
                                        <option value="NOTICE">공지게시판</option>
                                    </c:if>
                                    <c:if test="${b.bdType=='FREE'}">
                                        <option value="FREE">자유게시판</option>
                                    </c:if>
                                    <c:if test="${b.bdType=='NONAME'}">
                                        <option value="NONAME">익명게시판</option>
                                    </c:if>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="title" class="container">제목</label>
                                <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요"
                                    value='${b.bdTitle}' readonly>
                            </div>
                            <div class="form-group">
                                <label for="content">내용</label>
                                <textarea id="mytextarea" name="bdContent" readonly>${b.bdContent}</textarea>

                                <!-- <textarea id="content" name="bdContent" placeholder="내용을 입력하세요"
                                    readonly>${b.bdContent}</textarea> -->
                            </div>
                            <div class="form-group detail-button">
                                <button id="backToList" type="button">목록</button>
                                <button type="submit">수정</button>
                                <!--   onclick="window.location.href='/hrms/board-list?boardPageNo=${s.boardPageNo}'" -->
                            </div>

                        </form>

                        <!-- 댓글 -->

                        <div id="replies" class="row">
                            <div class="offset-md-1 col-md-10">
                                <!-- 댓글 입력란 -->
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <div class="form-group">
                                                    <label for="newReplyText" hidden>댓글 내용</label>
                                                    <textarea rows="3" id="newReplyText" name="replyText"
                                                        class="form-control" placeholder="댓글을 입력해주세요."></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="newReplyWriter" hidden>댓글 작성자</label>
                                                    <input id="newReplyWriter" name="replyWriter" type="text"
                                                        class="form-control" placeholder="작성자 이름"
                                                        style="margin-bottom: 6px;">
                                                    <button id="replyAddBtn" type="button"
                                                        class="btn btn-dark form-control">등록</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="card">
                                    <!-- 댓글 수 -->
                                    <div class="card-header text-white m-0" style="background: #343A40;">
                                        <div class="float-left">댓글 (<span id="replyCnt">0</span>)</div>
                                    </div>


                                    <div id="replyCollapse" class="card">
                                        <div id="replyData">

                                        </div>

                                        <ul class="pagination justify-content-center">

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 수정 모달 -->



                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                            tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Modal title</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <input type="text" class="modal-body">
                                    ...
                                    </input>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">수정</button>
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">닫기</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
            </section>
        </div>

        <!-- bootstrap js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
        </script>
        <script>
            const $backToList = document.getElementById('backToList');
            $backToList.onclick = (e) => {
                window.location.href = '/hrms/board-list?boardPageNo=${s.boardPageNo}';
            }

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
                    tag += "<div id='replyContent' class='card-body'>댓글을 입력해 주세요</div>";

                    //         "repNo": 2536,
                    // "repContent": "reply content536",
                    // "empNo": 69,
                    // "replyRegDate": "2023:05:17 14:46",
                    // "deptName": "hrRESOURCE`",
                    // "posName": "chef",
                    // "roleName": "cook"


                } else {
                    for (let rep of boardReplies) {
                        const {
                            repNo,
                            empNo,
                            replyRegDate,
                            repContent,
                            deptName,
                            posName,
                            roleName,
                            empName
                        } = rep;
                        // +'/'+postName+'/'+roleName
                        tag += `
                                <div id='replyContent' class='card-body' data-replyId='\${repNo}'>
                                    <div class='row user-block'>
                                    <span class='col-md-3'>
                                        <span>\${deptName}</span><span>/</span>
                                        <span>\${posName}</span><span>/</span>
                                        <span>\${roleName}</span><span>/</span>
                                        <span>\${empName}</span>
                                        <input type='hidden' name='empNo' value='\${empNo}'>
                                    </span>
                                    <span class='offset-md-6 col-md-3 text-right'><b>\${replyRegDate}</b></span>
                                    </div><br>
                                    <div class='row'>
                                    <div class='col-md-6'>\${repContent}</div>
                                    <div class='et-md-2 col-md-4 text-right'>
                                `;


                        // if (currentAccount === rep.account || auth === 'ADMIN') {
                        tag +=
                            // "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +
                            "<button id='modifyBtn' type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop'> 수정 </button>" +
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
            //댓글 삭제 기능

            //버블링을 이용하여 a태그 효과 제거
            const $replyData = document.getElementById('replyData');

            function deleteEvent() {
                $replyData.onclick = e => {
                    // repNo값 가져오기
                    const $getReplyId = e.target.closest('#replyContent').dataset.replyid;
                    console.log($getReplyId);
                    // empNo값 가져오기
                    const $getEmpNo = document.querySelector('#replyContent span input').value;
                    console.log($getEmpNo);
                    console.log(e.target);
                    console.log('삭제버튼 클릭');
                    e.preventDefault();
                    if (e.target.matches('#replyDelBtn')) {
                        // console.log('삭제떠줘');
                        if (!confirm('삭제하시겠습니까?'))
                            return;

                        // 삭제시 서버로 보낼 데이터 json에 담기
                        const deletInfo = {
                            empNo: $getEmpNo,
                            repNo: $getReplyId,
                        };

                        // 삭제 데이터 만들기

                        const requestDeleteInfo = {
                            method: 'DELETE',
                            headers: {
                                'content-type': 'application/json'
                            },
                            body: JSON.stringify(deletInfo)
                        };


                        // fetch 시작
                        fetch(URL, requestDeleteInfo)
                            .then(res => {
                                if (res.status === 200) {
                                    alert('삭제됬어!!!!!');
                                } else {
                                    alert('실패ㅠㅠㅠㅠㅠ제에발!');
                                    return res.json();
                                }
                            }).then(responseResult => {
                                findAllReplies(1)
                            });

                    } else if (e.target.matches('#modifyBtn')) {
                        // console.log("수정");
                        // 모달에 뿌려줄 원래 댓글 text가져와서 모달에 repContent 넣어주기
                        const rpCon = e.target.parentElement.parentElement.children[0].innerText;
                        document.querySelector('.modal-body').value = rpCon;
                        // console.log(rpCon);

                        //모달에 repNo값 뽑아서 모달에 넣어주기
                        const $rpRpNo = e.target.parentElement.parentElement.parentElement.dataset.replyid;
                        // console.log(rpRpNo);
                        document.querySelector('.modal-body').dataset.rno = $rpRpNo;


                        //empNo 값 뽑아서 모달에 넣어주기(부모에 부모에 형제에 첫번째 자식에 자식에 0번 인덱스)
                        const $rpEmpNo = e.target.parentElement.parentElement.previousElementSibling
                            .previousElementSibling.firstElementChild.children[0].innerText;
                        document.querySelector('.modal-body').dataset.reno = $rpEmpNo;

                    }
                }

            }


            // 수정버튼 클릭시 수정 처리

            function modifyBoardReply() {


                const $modifyButton = document.querySelector('.btn-primary');

                $modifyButton.onclick = e => {
                    const $getRepCont = document.querySelector('.modal-body').value;
                    console.log($getRepCont);
                    const $getRepNo = document.querySelector('.modal-body').dataset.rno;
                    // console.log($getRepNo);
                    const $getEmpNo = document.querySelector('.modal-body').dataset.reno;
                    // console.log($getEmpNo);
                    const modifyInfo = {
                        method: 'PATCH',
                        headers: {
                            'content-type': 'application/json'
                        },
                        body: JSON.stringify({
                            repNo: $getRepNo,
                            repContent: $getRepCont,
                            empNo: $getEmpNo,
                        })
                    };

                    // console.log(modifyInfo);
                    fetch(URL, modifyInfo)
                        .then(res => {
                            if (res.status == 200) {
                                alert('댓글이 수정되었습니다.')
                                //창 닫아줌
                                document.querySelector('.btn-secondary').click();
                            } else {
                                alert('댓글 수정에 실패하였습니다.')
                            }
                        })
                        .then(result => {
                            findAllReplies(1);
                        });
                };

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

            // 댓글 save기능
            function makeReplyRegisterClickEvent() {

                const $regBtn = document.getElementById('replyAddBtn');

                $regBtn.onclick = e => {

                    const $rt = document.getElementById('newReplyText');
                    const $rw = document.getElementById('newReplyWriter');

                    // console.log($rt.value);
                    console.log($rw.value);


                    // 클라이언트 입력값 검증
                    if ($rt.value.trim() === '') {
                        alert('댓글 내용은 필수입니다!');
                        return;
                    }


                    // 저장시 서버로 보낼 데이터
                    const payload = {
                        repContent: $rt.value,
                        empNo: $rw.value,
                        boardNo: boardNo
                    };

                    const requestInfo = {
                        method: 'POST',
                        headers: {
                            'content-type': 'application/json'
                        },
                        body: JSON.stringify(payload)
                    };

                    // SAVE FETCH 시작
                    fetch(URL, requestInfo)
                        .then(res => {
                            if (res.status === 200) {
                                alert('댓글이 정상 등록됨!');
                                // 입력창 비우기
                                $rt.value = '';
                                $rw.value = '';

                                // 마지막페이지 번호
                                // const lastPageNo = document.querySelector('.pagination').dataset.fp;
                                findAllReplies(1);
                            } else {
                                alert('댓글 등록에 실패함!');
                            }
                        });
                };
            }


            (function () {


                // 댓글 리스트 호출
                findAllReplies();
                // 페이지 이동
                makePageButtonClickEvent();
                //댓글 save
                makeReplyRegisterClickEvent();

                //삭제 기능
                deleteEvent();
                //댓글 수정기능
                modifyBoardReply();


            })()
        </script>

    </body>

    </html>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>

<!doctype html>
<html lang="en">

<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <!-- boot-strap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <!-- ck editor -->
    <script src="https://cdn.tiny.cloud/1/2h0oiwycjeu5k9ts481odi4en2v8u1wf7k3zi3va3lw2j0uy/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>
    <!-- fontawsome -->
    <script src="https://kit.fontawesome.com/024f42bdd1.js" crossorigin="anonymous"></script>
    <script>
        tinymce.init({
            selector: '#mytextarea',
            readonly: true
        });
    </script>
    <%@ include file="../main/include/header.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
        }


        .detail-section {
            width: 75%;
        }


        .detail-title {
            font-weight: 700;
            font-size: 50px;
            line-height: 60px;
            letter-spacing: 50px;
            display: inline-block;
            width: 300px;
            margin-left: 340px;

        }

        .detail-part {
            margin-top: 50px;
            margin-left: 300px;

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
            margin-left: 185px;
            height: 60px;
            width: 120px;
            font-size: larger;
            font-weight: 600;
            letter-spacing: 5px;
            text-align: center;
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
            margin-left: 10px;
        }

        #replyContent {
            border: 1px solid #f4f4f4;
        }

        /* 댓글 창 css */

        #replies {
            height: 1000px;

        }

        .offset-md-1 {
            margin: 10px auto;
            max-width: 900px;
        }

        .col-md-3 {
            width: 20%;
        }

        .showUserInfo {
            width: 50%;
        }

        .showDateTime {
            width: 50%;
            text-align: end;
        }


        .offset-md-6 {
            text-align: end;
            padding-right: 30px;

        }


        .card {
            height: 150px;
            width: 100%;
            height: fit-content;
        }

        #reply-count {
            color: #000;
            margin-left: 750px;
            text-align: end;
        }

        .form-group textarea {
            height: 120px;

        }

        .col-md-4 {

            display: inline-block;
            width: 200px;
            padding-left: 9%;
        }

        .col-md-6 {
            width: 75%;
        }

        #newReplyText {
            overflow: auto;
            resize: none;
        }

        #modifyBtn,
        #replyDelBtn {
            background-color: white !important;
            color: #0d6efd !important;
        }

        #modifyBtn:hover,
        #replyDelBtn:hover {
            background-color: #0d6efd !important;
            color: white !important;
        }

        .modifyAndDelete {
            display: flex;
            justify-content: end;
            width: fit-content;
        }

        .modifyAndDelete #modifyBtn {
            margin-right: 5px;
        }

        .pagination {
            margin: 10px auto;
        }

        .col-md-9 {
            margin-right: 25px;
        }

        .col-md-9 #newReplyWriter {
            margin-bottom: 10px;
        }

        /* 모달창 */
        .modal {
            --bs-modal-margin: 20rem;
        }

        .modal .modDEL,
        .boardModDEL {
            border: none;

        }

        /* .modal .boardModDEL{
             border: none;
        } */

        .modal .modMod {
            height: 150px;
        }

        .modal-title {
            font-weight: 600;
        }


        .modifyAndDelete #modifyBtn {
            height: 38.38px;
        }


        #replyDelBtn {
            height: 38.38px;
        }

        /* page 색변화처리  */
        .colorChange a {
            background-color: #0d6efd !important;
            color: #ffffff !important;
        }
    </style>
</head>

<body>
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <section class="detail-section">
            <section class="detail-part">
                <div class="container-box">
                    <div class="detail-topbox">
                        <h1 class="detail-title">게시글</h1>
                        <c:if test="${login.empNo==b.empNo}">
                            <button type="button" class="btn btn-danger" data-bno="${b.boardNo}" id="boardRedDelete"
                                data-bs-toggle='modal' data-bs-target='#staticBackdrop3'>삭제</button>
                        </c:if>
                    </div>
                    <form action="/hrms/board/show-modify" method="post">
                
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
                            <input type="hidden" id="pageInfo" name="boardPageNo" value="${s.boardPageNo}">
                            <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요" value='${b.bdTitle}'
                                readonly>
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="mytextarea" name="bdContent" readonly>${b.bdContent}</textarea>

                            <!-- <textarea id="content" name="bdContent" placeholder="내용을 입력하세요"
                                    readonly>${b.bdContent}</textarea> -->
                        </div>  
                        <div class="form-group detail-button">
                            <c:if test="${login.empNo==b.empNo}">
                                <button type="submit">수정</button>
                            </c:if>
                            <button id="backToList" type="button">목록</button>
                            <!--   onclick="window.location.href='/hrms/board-list?boardPageNo=${s.boardPageNo}'" -->
                        </div>

                    </form>




                </div>

                <!-- 댓글 파트-->

                <div id="replies" class="row">
                    <div class="offset-md-1 col-md-10">
                        <!-- 댓글 입력란 -->
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
                                        <div class="form-group replyController">
                                            <input id="newReplyWriter" name="replyWriter" type="text"
                                                class="form-control" style="margin-bottom: 35px;" value="${login.empName}" readonly>
                                            <button id="replyAddBtn" type="button"
                                                class="btn btn-dark form-control">등록</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="card">
                            <!-- 댓글 수 -->
                            <div class="card-header text-white m-0" style="background: f4f4f4;">
                                <div id="reply-count" class="float-left">댓글 (<span id="replyCnt">0</span>)</div>
                            </div>


                            <div id="replyCollapse" class="card">
                                <div id="replyData"> </div>
                                <ul class="pagination justify-content-center">

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Board Delete Modal -->
                <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">게시글 삭제</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <input type="text" class="modal-body boardModDEL" value="게시글을 삭제하시겠습니까?" readonly></input>
                            <div class="modal-footer" data-boardNo="${b.boardNo}">
                                <button type="button" class="btn btn-primary boardDelBtn-primary">삭제</button>
                                <button type="button" class="btn btn-secondary del-secondary"
                                    data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- Reply MODIFY Modal -->
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">댓글 수정</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <textarea type="text" class="modal-body modMod"></textarea>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary modibtn">수정</button>
                                <button type="button" class="btn btn-secondary mod-secondary modifylastbtn"
                                    data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Reply DELETE Modal -->
                <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">
                                    댓글 삭제
                                </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <input type="text" class="modal-body modDEL" value="댓글을 삭제하시겠습니까?" readonly></input>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary delBtn-primary">삭제</button>
                                <button type="button" class="btn btn-secondary del-secondary boardDEL"
                                    data-bs-dismiss="modal">닫기</button>
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
        //목록버튼 클릭시 이동하는 기능
        const $backToList = document.getElementById('backToList');
        $backToList.onclick = (e) => {
            // console.log(e.target);
            window.location.href = '/hrms/board/board-list?boardPageNo=${s.boardPageNo}';
        }

        //삭제버튼 클릭시 해당 게시물을 삭제하는 기능
        function deleteBoard() {

            const $boardDelModal = document.querySelector('.boardDelBtn-primary');

            $boardDelModal.onclick = e => {
                const $delbno = e.target.parentElement.dataset.boardno
                // console.log($delbno);
                window.location.href = '/hrms/board/board-delete?boardNo=' + $delbno;
            }


        };



        // URI
        const URL = '/api/hrms/replies';

        // 게시글 번호 
        const boardNo = `${b.boardNo}`;

        //로그인 게정명 
        const loginEmpNo='${login.empNo}';

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

                tag += "<li class='page-item " + active + "'><a class='page-link page-custom' data-replyno='" + i +
                    "' href='" + i +
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
                // console.log(e.target.innerText);
                const $replypageList = document.querySelector('.justify-content-center');

                for (const r of $replypageList.children) {
                    if (e.target.innerText == r.children[0].attributes[1].value) {
                        // console.log(r.children);
                        // console.log(e.target.innerText);
                        r.classList.add('colorChange')
                        // console.log(r);
                    }

                }

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
                tag += "<div id='replyContentWriter' class='card-body'>댓글을 입력해 주세요</div>";
            } else {
                for (let rep of boardReplies) {
                    const {
                        repNo,
                        empNo,
                        replyRegDate,
                        repContent,
                        deptName,
                        posName,
                        empName
                    } = rep;
                    // console.log(rep);

                    tag += `
                                <div id='replyContent' class='card-body' data-replyId='\${repNo}'>
                                    <div class='row user-block'>
                                    <span class='col-md-3 showUserInfo'>
                                        <span>\${deptName}</span><span>/</span>
                                        <span>\${posName}</span><span>/</span>
                                        <span>\${empName}</span>
                                        <input type='hidden' name='empNo' value='\${empNo}'>
                                    </span>
                                    <span class='col-md-3 text-right showDateTime'><b>\${replyRegDate}</b></span>
                                    </div><br>
                                    <div class='row'>
                                    <div class='col-md-6 showContent'>\${repContent}</div>
                                    <div class='et-md-2 col-md-4 text-right modifyAndDelete'>
                                `;


                    if (loginEmpNo== empNo) {
                    
                        tag += "<button id='modifyBtn' type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop'> 수정 </button>" +
                            "         <button id='replyDelBtn' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#staticBackdrop2'>삭제</button>";
                    }
                    tag += "       </div>" +
                        "    </div>" +
                        " </div>";
  // "         <a id='replyModBtn' class='btn btn-sm btn-outline-dark' data-bs-toggle='modal' data-bs-target='#replyModifyModal'>수정</a>&nbsp;" +

                }
            }
            document.getElementById('replyData').innerHTML = tag;
            renderPage(boardReplyPageMaker);

        }


        //댓글 삭제 기능

        //버블링을 이용하여 a태그 효과 제거
        const $replyData = document.getElementById('replyData');

        function deleteAndModifyEvent() {
            $replyData.onclick = e => {
                // repNo값 가져오기
                const $getReplyId = e.target.closest('#replyContent').dataset.replyid;
                // console.log($getReplyId);

                // empNo값 가져오기
                const $rpdelEmpNo = e.target.parentElement.parentElement.previousElementSibling.
                previousElementSibling.firstElementChild.lastElementChild.value;
                // console.log($rpdelEmpNo);
                e.preventDefault();

                if (e.target.matches('#replyDelBtn')) {

                    const $rpRpNo = e.target.parentElement.parentElement.parentElement.dataset.replyid;
                    // console.log($rpRpNo);
                    document.querySelector('.modDEL').dataset.rno = $rpRpNo;
                    //empNo 값 뽑아서 모달에 넣어주기(부모에 부모에 형제에 첫번째 자식에 자식에 0번 인덱스)
                    const $rpEmpNo = e.target.parentElement.parentElement.previousElementSibling.
                    previousElementSibling.firstElementChild.lastElementChild.value;
                    // console.log($rpEmpNo);
                    document.querySelector('.modDEL').dataset.reno = $rpEmpNo;




                } else if (e.target.matches('#modifyBtn')) {
                    // console.log("수정");

                    // 모달에 뿌려줄 원래 댓글 text가져와서 모달에 repContent 넣어주기
                    const rpCon = e.target.parentElement.parentElement.children[0].innerText;
                    document.querySelector('.modMod').value = rpCon;
                    // console.log(rpCon);

                    //댓글에서 repNo값 뽑아서 모달에 넣어주기
                    const $rpRpNo = e.target.parentElement.parentElement.parentElement.dataset.replyid;
                    // console.log($rpRpNo);
                    document.querySelector('.modMod').dataset.rno = $rpRpNo;


                    //empNo 값 뽑아서 모달에 넣어주기(부모에 부모에 형제에 첫번째 자식에 자식에 0번 인덱스)
                    const $rpEmpNo = e.target.parentElement.parentElement.previousElementSibling.
                    previousElementSibling.firstElementChild.lastElementChild.value;
                    // console.log('고급추적:', e.target);
                    // console.log($rpEmpNo);
                    document.querySelector('.modMod').dataset.reno = $rpEmpNo;

                }
            }

        }

        // 삭제버튼시 삭제 처리
        function deleteBoardReply() {
            // 삭제시 서버로 보낼 데이터 json에 담기
            const $makedelButton = document.querySelector('.delBtn-primary');
            $makedelButton.onclick = e => {
                const $rpRpNo = document.querySelector('.modDEL').dataset.rno;
                // console.log($rpRpNo);
                const $rpEmpNo = document.querySelector('.modDEL').dataset.reno;
                // console.log($rpEmpNo);

                // 삭제 데이터 만들기
                const requestDeleteInfo = {
                    method: 'DELETE',
                    headers: {
                        'content-type': 'application/json'
                    },
                    body: JSON.stringify({
                        repNo: $rpRpNo,
                        empNo: $rpEmpNo
                    })
                };

                // fetch 시작
                fetch(URL, requestDeleteInfo)
                    .then(res => {
                        if (res.status === 200) {
                            // alert('삭제됐어!!!!!');
                            document.querySelector('.boardDEL').click();
                        } else {
                            return res.json().then(data => {
                                console.log(data); // 서버에서 반환된 오류 메시지 출력
                                throw new Error('서버에서 삭제 실패');
                            });
                        }
                    })
                    .then(responseResult => {
                        findAllReplies(1);
                    })
                    .catch(error => {
                        console.error(error);
                        // 실패 시 처리할 로직 추가
                        console.log('삭제 안됌');
                    });
            };
        }

        // 수정버튼 클릭시 수정 처리

        function modifyBoardReply() {


            const $modifyButton = document.querySelector('.modibtn');
            // console.log('여기까지는 되나?'+$modifyButton);
            // console.log($modifyButton);
            $modifyButton.addEventListener('click', function (e) {
                const $getRepCont = document.querySelector('.modMod').value;
                // console.log($getRepCont);
                const $getRepNo = document.querySelector('.modMod').dataset.rno;
                // console.log($getRepNo);
                const $getEmpNo = document.querySelector('.modMod').dataset.reno;
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
                            // alert('댓글이 수정되었습니다.')
                            //창 닫아줌
                            document.querySelector('.modifylastbtn').click();
                        } else {
                            // alert('댓글 수정에 실패하였습니다.')
                        }
                    })
                    .then(result => {
                        findAllReplies(1);
                    });
            })

        }



        // 댓글 목록 불러오기 함수
        function findAllReplies(page = 1) {

            fetch(`\${URL}/\${boardNo}/page/\${page}`)
                .then(res => res.json())
                .then(responseResult => {
                    // console.log(responseResult);
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
                // console.log($rw.value);


                // 클라이언트 입력값 검증
                if ($rt.value.trim() === '') {
                    alert('댓글 내용은 필수입니다!');
                    return;
                }


                // 저장시 서버로 보낼 데이터
                const payload = {
                    repContent: $rt.value,
                    empNo: loginEmpNo,
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
                            alert('댓글이 정상적으로 등록되었습니다.');
                            // 입력창 비우기
                            $rt.value = '';
                            $rw.value = '';
                            // 마지막페이지 번호
                            // const lastPageNo = document.querySelector('.pagination').dataset.fp;
                            document.getElementById('newReplyWriter').value=' ${login.empName}';
                            findAllReplies(1);

                        } else {
                            // console.log($rt.value);
                            // console.log($rw.value);
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

            // modal에 값 집어넣는 기능
            deleteAndModifyEvent();

            //댓글 수정기능
            modifyBoardReply();

            //삭제 기능
            deleteBoardReply();
            //게시글 삭제 
            deleteBoard();

        })();
    </script>

</body>

</html>
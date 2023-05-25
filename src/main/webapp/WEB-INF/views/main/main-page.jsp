<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<link rel="icon" href="/assets/img/favicon_blue.png">
<link rel="stylesheet" href="/assets/css/main-page.css">
<link rel="stylesheet" href="/assets/css/main-confirmlist.css">
<!-- bootstrap css -->
<link rel="stylesheet" href="/assets/css/main-page.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">

</script>
<style>
    .board-part .boardTable {
        text-align: center;
    }

    .table .table-top {
        background-color: #d0e3ed;
    }



    .table .table-main td {
        border: none !important;
        border-bottom: 1px solid #f4f4f4;
    }

    .table-top {
        border: 1px solid #f4f4f4;
    }

    .title-list {
        display: flex;
        justify-content: end;
    }

    .replyCount {
        color: orangered;
    }

    .title-list #left-pointer {
        margin-left: 110px;
        margin-right: 20px;

    }
    .title-list #left-pointer a{
        cursor: pointer;
    }
    .title-list #right-pointer a{
        cursor: pointer;
    }

    .title-list #right-pointer {
        margin-right: 5px;
    }

    .title-list #wannaseemore {
        margin-right: 10px;
        margin-left: 30px;
    }
</style>
<%@ include file="../main/include/header.jsp" %>
<!-- 메인 페이지 list 포함 css -->

<body>
    <div id="body-wrapper">
        <%@ include file="include/left-banner.jsp" %>
        <section class="main-page-list">
            <div id="main-list">
                <div id="top-list">
                    <ul>
                        <li class="title-list">
                            <h1>공지사항</h1>
                            <div id="left-pointer">
                            </div>
                            <div id="right-pointer">
                            </div>
                            <span id="wannaseemore">
                                <a href="/hrms/board/board-list">더보기+</a>
                            </span>
                        </li>
                        <section class="board-part">
                            <table class="boardTable table">
                                <tr class="table-top">
                                    <th scope="col" id="boardNum">글번호</th>
                                    <th scope="col" id="boardTitle">글제목</th>
                                    <th scope="col" id="writer">작성자</th>
                                    <th scope="col" id="writtenDate">작성일</th>
                                </tr>
                                <tbody class="boardTableBody" id="tableOutter">

                                </tbody>
                            </table>
                        </section>
                    </ul>
                    <ul>
                        <li class="title-list">
                            <h1>동호회</h1>
                        </li>
                        <li>동호회</li>
                        <li>동호회</li>
                    </ul>
                </div>
                <div id="bottom-list">
                    <ul id = "mail-box">
                        <li class="title-list">
                            <h1>메일</h1>
                            <span id="wannaseemore">
                                <a href="/hrms/mail-list?empNo=${login.empNo}">더보기+</a>
                            </span>
                        </li>
                        <li style="display: flex; width: 100%; height: 36px; justify-content: center; align-items: center; background-color: #d0e3ed;"><div style="width: 33%; text-align: center;">번호</div><div style="width: 33%; text-align: center;">발신자</div><div style="width: 33%; text-align: center;">확인</div></li>
                    </ul>
                    <ul id = "confirm-box">
                        <li class="title-list">
                            <h1>결재</h1>
                            <input type = 'hidden' name = 'conStatus' value = null>
                            <a href="/hrms/confirm/list?conStatus=">더보기+</a>
                        </li>
                        <div id = "confirm-table">

                        </div>
                    </ul>
                </div>
            </div>
        </section>
    </div>
<script>

    const URL = "/hrms/confirm";
    const empNo = ${login.empNo};
    const roleCode = '${login.roleCode}';

    const confirmBox = document.getElementById('confirm-table');

    function getConfirmList(){
        fetch(`\${URL}/\${empNo}/\${roleCode}`)
            .then(res => res.json())
            .then(result => {
                if(result !== null){
                    renderConfirmList(result);
                }
            });
    }

    function renderConfirmList(list){
        let tag = '';
        tag += '<ul class = "header-bar confirm-tr" id = "waiting-th"><li class = "title-line col1">NO</li>' +
            '<li class = "title-line col2">문서제목</li>';
        if (roleCode === '11111') {
            tag += '<li class = "title-line col3">기안자</li>';
        } else {
            tag += '<li class = "title-line col3">부서장</li>';
        }
        tag += '<li class = "title-line col4">기안부서</li><li class = "title-line col5">승인여부</li></ul>';

        tag += '<div class = "inner-list-container">';

        if(list.length === 0){
            emptyBox();
            return;
        }

        for (const confirm of list) {

            const {
                conNo,
                conTitle,
                fromName,
                fromDept,
                conDate,
                conStatus,
                conCheckDate
            } = confirm;

            tag += '<ul class = "confirm-tr" id = "doc-info"><li class = "col1">' + conNo + '</li><li class = "col2">' +
                conTitle + '</li><li class = "col3">' + fromName + '</li><li class = "col4">' + fromDept + '</li>';
            if(conStatus === '승인대기'){
                tag += '<li id = "conStatus" class = "col5 skyblue">' + conStatus + '</li></ul>';
            } else if(conStatus === '승인거절'){
                tag += '<li id = "conStatus" class = "col5 red">' + conStatus + '</li></ul>';
            } else if(conStatus === '승인완료') {
                tag += '<li id = "conStatus" class = "col5 green">' + conStatus + '</li></ul>';
            }
        }
        tag += '</div>';
        confirmBox.innerHTML = tag;
    }

    function emptyBox(){
        confirmBox.innerHTML = '<p id = "empty-box">표시할 결재문건이 없습니다.</p>';
    }

    getConfirmList();

 </script>


     <script>
        const URLboard = '/api/hrms/main-board';


        function renderTable(responseResult) {
            const tableBody = document.getElementById('tableOutter');
            let tag = '';
            const {
                boardPageMaker,
                mainBoardResponseDTOS
            } = responseResult;
            for (const one of mainBoardResponseDTOS) {
                // console.log(boardPageMaker.boardPage.boardPageNo);
                // console.log(one);
                tag += ` <tr class='table-top'>
                                        <th scope='col'>\${one.boardNo}</th>
                                        <th scope='col'><a href='/hrms/board/board-detail/?boardNo=\${one.boardNo}&boardPageNo=\${boardPageMaker.boardPage.boardPageNo}&bdType=NOTICE'>\${one.bdTitle}
                                            <span class='replyCount'>[\${one.repNo}]</span><a></th>
                                        <th scope='col'>\${one.empName}</th>
                                        <th scope='col'>\${one.bdDate}</th>
                            </tr>`;

            }

            // console.log(tag);
            tableBody.innerHTML = tag;
            prevpageRendering(boardPageMaker);
            nextpageRendering(boardPageMaker);

        }

        // 이전 페이지 렌더링
        function prevpageRendering(boardPageMaker) {
            // console.log(boardPageMaker);
            const $leftpointer = document.getElementById('left-pointer');

            // console.log(boardPageMaker.boardPage.boardPageNo);
            if (boardPageMaker.boardPage.boardPageNo > 1){
                $leftpointer.innerHTML =  `<i class='fa-solid fa-angles-left' data-pno='\${boardPageMaker.boardPage.boardPageNo-1}'>`;}
                    else{
                        $leftpointer.innerHTML =  `<i class='fa-solid fa-angles-left' data-pno='1'>`;
                    }
                // `<a data-pno='\${boardPageMaker.boardPage.boardPageNo-1}'>&lt;&lt;</a>`;

            // console.log('그려지냐?');

        }
        // 다음 페이지 렌더링
        function nextpageRendering(boardPageMaker) {
            const $rightpointer = document.getElementById('right-pointer');
            if (boardPageMaker.boardPage.boardPageNo != boardPageMaker.final_page)
                $rightpointer.innerHTML = `<i class='fa-solid fa-angles-right' data-pno='\${boardPageMaker.boardPage.boardPageNo+1}'>`
                // `<a data-pno='\${boardPageMaker.boardPage.boardPageNo+1}'><i class="fa-solid fa-right-long"></a>`
                    // <i class="fa-solid fa-angles-right"></i>
        }


        //이전페이지이벤트부여 함수
        function prevpageAddEvent() {
            const $leftpointer = document.getElementById('left-pointer');
            $leftpointer.onclick = (e) => {
                e.preventDefault();
                if (e.target.matches('#left-pointer i')){
                    console.log(e.target.dataset.pno);
                const prewPage = e.target.dataset.pno;
                wannaBoardList(prewPage);}

            }
        }

        //이후페이지이벤트부여 함수
        function nextpageAddEvent() {
            const $rightpointer = document.getElementById('right-pointer');
            $rightpointer.onclick = (e) => {
                if (e.target.matches('#right-pointer i')){
                const nextPage = e.target.dataset.pno;
                wannaBoardList(nextPage);}
            }
        }


        //board 패치
        function wannaBoardList(pageNo = 1) {

            fetch(`\${URLboard}/page/\${pageNo}`)
                .then(res => res.json())
                .then(responseResult => {
                    // console.log(responseResult);
                    renderTable(responseResult);
                })
        }

        (function () {
            wannaBoardList();
            prevpageAddEvent();
            nextpageAddEvent();
        })();
     </script>

    <script>
        //메일 rest용 url
        const mailURL = '/api/hrms/mail';
        //접속자 사번 가져오기
        const mailempNo = '${login.empNo}';
        
        //접속한 사원에게 온 메일의 리스트 json받아오기
        function getMailList(){
        fetch(`\${mailURL}/mailempNo/\${mailempNo}`)
            .then(res=>res.json())
            .then(mailresult =>{
               console.log(mailresult);
                //renderMailList(mailresult);
            })
        };

        function renderMailList(responseResult){
            let tag = '';
            {}
        }



        (function(){
            getMailList()
        })();

    </script>
</body>
<%@ include file="../main/include/footer.jsp" %>

</html>
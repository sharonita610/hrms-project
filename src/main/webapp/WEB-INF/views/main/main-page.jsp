<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="/assets/css/main-page.css">
<!-- bootstrap css -->
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
   .replyCount{
        color: orangered;
    }

    .title-list #left-pointer {
        margin-left: 110px;
        margin-right: 20px;
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
                            <span id="left-pointer">
                                &lt;&lt;
                            </span> 
                            <span id="right-pointer">
                                &gt;&gt;
                            </span>
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
                    <ul>
                        <li class="title-list">
                            <h1>메일</h1>
                        </li>
                        <li>메일</li>
                        <li>메일</li>
                    </ul>
                    <ul>
                        <li class="title-list">
                            <h1>결재</h1>
                        </li>
                        <li>결재</li>
                        <li>결재</li>
                    </ul>
                </div>
            </div>
        </section>
    </div>


    <script>
        const URL = '/api/hrms/main-board';


        function renderTable(responseResult) {
            const tableBody = document.getElementById('tableOutter');
            let tag = '';
            const {
                boardPageMaker,
                mainBoardResponseDTOS
            } = responseResult;
            for (const one of mainBoardResponseDTOS) {

                // console.log(one);
                tag += ` <tr class='table-top'>
                                    <th scope='col'>\${one.boardNo}</th>
                                    <th scope='col'><a href='/hrms/board/board-detail/?boardNo=\${one.boardNo}&boardPageNo=1&bdType=NOTICE'>\${one.bdTitle}
                                        <span class='replyCount'>[\${one.repNo}]</span><a></th>
                                    <th scope='col'>\${one.empName}</th>
                                    <th scope='col'>\${one.bdDate}</th>
                         </tr>`;

            }

            // console.log(tag);
            tableBody.innerHTML = tag;
            pageRendering(boardPageMaker);

        }

        // 페이지 렌더링  
        function pageRendering(boardPageMaker){
                console.log(boardPageMaker);
                if

        }




        function wannaBoardList(pageNo = 1) {

            fetch(`\${URL}/page/\${pageNo}`)
                .then(res => res.json())
                .then(responseResult => {
                    // console.log(responseResult);
                    renderTable(responseResult);
                })
        }

        (function () {
            wannaBoardList();
        })();
    </script>
</body>

</html>
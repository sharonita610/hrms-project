<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="/assets/css/main-page.css">
<link rel="stylesheet" href="/assets/css/main-confirmlist.css">
<!-- bootstrap css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
 <!-- bootstrap js -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
 integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
</script>
<style>
    .board-part .boardTable{
        text-align: center;
    }
    .table .table-top{
        background-color: #d0e3ed;
    }

    .table .table-main td{
        border: none !important;
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
                        </li>
                        <section class="board-part">
                            <table class="boardTable table">
                                    <tr class="table-top">
                                        <th scope="col" id="boardNum">번호</th>
                                        <th scope="col" id="boardTitle">제목</th>
                                        <th scope="col" id="writer">작성자</th>
                                        <th scope="col" id="writtenDate">작성일</th>
                                    </tr>
                                    <tr class="table-main table-hover">
                                        <th scope="row">1</th>
                                        <td id="title">공지사항 입니다.</td>
                                        <td id="empNo">커피빈</a></td>
                                        <td id="date">2020-11-22</td>
                                    </tr>
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
                    <ul id = "confirm-box">
                        <li class="title-list">
                            <h1>결재</h1>
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
                renderConfirmList(result);
            })
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
        for (let i = 0; i < 8; i++) {

            const {
                conNo,
                conTitle,
                fromName,
                fromDept,
                conDate,
                conStatus,
                conCheckDate
            } = list[i];

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

    getConfirmList();

</script>
</body>

</html>
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
<script type="text/javascript" src="/assets/js/main-confirm.js"></script>
</body>

</html>
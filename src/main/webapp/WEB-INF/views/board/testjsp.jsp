<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title></title>
</head>
<style>
    .list-table {

        border: 1px solid #000;
    }
</style>

<body>
    <div id="board_area">

        <h1>공지사항</h1>
        <table class="list-table">
            <thead>
                <tr>
                    <th width="70">번호</th>
                    <th width="500">제목</th>
                    <th width="120">글쓴이</th>
                    <th width="100">작성일</th>
                    <th width="100">조회수</th>
                </tr>
                <c:forEach var="i" begin="1" ,end="5">
                    <tr>
                        <th width="70">1</th>
                        <th width="500">1</th>
                        <th width="120">1</th>
                        <th width="100">1</th>
                        <th width="100">1</th>
                    </tr>
                </c:forEach>
            </thead>
        </table>
    </div>







</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/confirm-modify.css">
</head>

<body>
<div id="body-wrapper">
    <%@ include file="../main/include/left-banner.jsp" %>
    <div class="rqform-container">
        <form action="/hrms/confirm/modify" method="post">
            <div class="confirm-titleline">
                <h1>결재요청문 수정</h1>
            </div>

            <div class="rqform-header">
                <div class="fromEmp section">
                    <div>기안자</div>
                    <div>${c.fromName}</div>
                </div>
                <div class="rq-date section">
                    <div>기안일자</div>
                    <div id="today"></div>
                </div>
                <div class="department section">
                    <div>부서</div>
                    <div>${boss.deptName}</div>
                </div>
                <div class="dept-head section">
                    <div>부서장</div>
                    <div>${boss.empName}</div>
                </div>
            </div>


            <div class="rqform-content-wrap">
                <div class="rqform-title">
                    <div>문서제목</div>
                    <input type="hidden" name="conNo" value="${c.conNo}">
                    <div><label for="conTitle"></label><input id="conTitle" class="conTitle" type="text" name="conTitle"
                                                              value="${c.conTitle}" autofocus></div>
                </div>
                <div class="rqform-content">
                    <div>내용</div>
                    <div><label for="conContent"></label><textarea id="conContent" class="conContent"
                                                                   name="conContent">${c.conContent}</textarea></div>
                </div>
            </div>

            <div class="submit">
                <div class="cancel" onclick="history.back()">수정취소</div>
                <div id="addConfirm">결재수정</div>
            </div>
            <button id="addBtn">결재수정</button>

        </form>
    </div>

</div>

<script>
    $today = document.getElementById('today');

    const today = new Date();
    const year = today.getFullYear(); // 년도
    const month = today.getMonth() + 1; // 월
    const date = today.getDate(); // 날짜

    $today.innerText = year + '-' + month + '-' + date;

    const $addBtn = document.getElementById('addConfirm');
    $addBtn.addEventListener('click', addConfirm);

    function addConfirm() {
        let $title = document.getElementById('conTitle').value;
        let $content = document.getElementById('conContent').value;
        if ($title.trim().length === 0) {
            alert("문서 제목을 입력해주세요");
            $title.cursor;
        } else if ($content.trim().length === 0) {
            alert("결재 요청할 내용은 필수로 입력해야 합니다");
            $title.cursor;
        } else {
            document.getElementById('addBtn').click();
        }
    }

</script>

</body>

</html>
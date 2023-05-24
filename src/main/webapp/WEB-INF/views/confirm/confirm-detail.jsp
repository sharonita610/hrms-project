<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/confirm-detail.css">
</head>
<body>
<div id="body-wrapper">
    <%@ include file="../main/include/left-banner.jsp" %>
<div class="rqform-container">
    <form action="/hrms/confirm/modify" method="post">
        <div class="confirm-titleline">
            <h1>결재요청문</h1>
        </div>

        <div class="rqform-header">
            <div class="fromEmp section">
                <div>기안자</div>
                <div>${c.fromName}</div>
            </div>
            <div class="rq-date section">
                <div>기안일자</div>
                <div id="today">${c.conDate}</div>
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
                <input type="hidden" id="conNo" name="conNo" value="${c.conNo}">
                <div><label for="conTitle"></label><input id="conTitle" class="conTitle" type="text" name="conTitle"
                                                          value="${c.conTitle}" readonly></div>
            </div>
            <div class="rqform-content">
                <div>내용</div>
                <div><label for="conContent"></label><textarea id="conContent" class="conContent" name="conContent"
                                                               readonly>${c.conContent}</textarea></div>
            </div>
        </div>

                <div id = "submit" class="submit">
                    <div id = "cancel" class="cancel" onclick="goback()">뒤로가기</div>
                </div>
                <button id="addBtn">결재수정</button>

    </form>
</div>
</div>

<script>

    const roleCode = '${login.roleCode}';
    const $submit = document.getElementById('submit');
    const conNo = document.getElementById('conNo').value;
    const conStatus = '${c.conStatus}';

    if(conStatus === '승인대기') {

        //  부서장일때 --------------------------------------------------------------
        //결재 승인

        if (roleCode === '11111') {

            $submit.innerHTML +=
                '<div id="check">결재승인</div>' +
                '<div id="reject">결재반려</div>';

            const $checkBtn = document.getElementById('check');

            $checkBtn.onclick = () => {
                if (!confirm('결재요청을 승인합니다')) {
                    return;
                }

                fetch(`/hrms/confirm/check/\${conNo}`, {method: 'PUT'})
                    .then(res => res.json())
                    .then(result => {
                            if (result) {
                                window.location.href = "/hrms/confirm/list";
                            }
                        }
                    )
            }

            //결재 반려
            const $rejectBtn = document.getElementById('reject');

            $rejectBtn.onclick = () => {
                if (!confirm('결재요청을 반려합니다')) {
                    return;
                }

                fetch(`/hrms/confirm/reject/\${conNo}`, {method: 'PUT'})
                    .then(res => res.json())
                    .then(result => {
                            if (result) {
                                window.location.href = "/hrms/confirm/list";
                            }
                        }
                    )
            }
        }
//사원일때 --------------------------------------------------------------
        else {
            $submit.innerHTML +=
                '<div id="modiConfirm">수정하기</div>' +
                '<div id="remove">삭제하기</div>';


            //수정하기 버튼 누르면 textarea 입력가능으로 변경, 수정하기 버튼에 수정하기 함수 연결
            const $modiBtn = document.getElementById('modiConfirm');
            $modiBtn.addEventListener('click', changeForm);

            function changeForm() {
                document.getElementById('conTitle').removeAttribute('readonly');
                document.getElementById('conContent').removeAttribute('readonly');

                document.getElementById('conTitle').focus();

                $modiBtn.id = "addConfirm";
                $modiBtn.innerText = "수정완료";
                $modiBtn.addEventListener('click', addConfirm);
            }

            //수정완료 버튼 누르면 수정 후 리스트로 복귀
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

            //삭제버튼 누르면 삭제
            const $delBtn = document.getElementById('remove');
            let conNo = document.getElementById('conNo').value;

            $delBtn.onclick = () => {
                if (!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }

                fetch(`/hrms/confirm/delete/\${conNo}`, {method: 'delete'})
                    .then(res => res.json())
                    .then(result => {
                            if (result) {
                                window.location.href = "/hrms/confirm/list";
                            }
                        }
                    )
            }
        }
    }

    function goback(){
        window.location.href = '/hrms/confirm/list';
    }

</script>

</body>

</html>
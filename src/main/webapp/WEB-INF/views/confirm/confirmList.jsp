<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/assets/css/confirmlist.css">
</head>

<body>
<div class="confirm-page-wrapper">
    <h1>결재문서함</h1>
    <div class="confirm-outer-container">
        <div class="confirm-box confirm-waiting-list">
            <h2>결재대기문서</h2>
            <table id="waiting-table">

            </table>
        </div>
        <div class="confirm-box confirmed-list">
            <h2>결재완료문서</h2>
            <table id="comfirmed-table">
                <tr id="confirmed-th">
                    <th>NO</th>
                    <th>문서제목</th>
                    <th>기안자</th>
                    <th>기안부서</th>
                    <th>기안일</th>
                    <th>승인여부</th>
                    <th>승인일자</th>
                </tr>
            </table>
        </div>
        <div class="confirm-box rejected-list">
            <h2>반려문서</h2>
            <table id="rejected-teble">
                <tr id="rejected-th">
                    <th>NO</th>
                    <th>문서제목</th>
                    <th>기안자</th>
                    <th>기안부서</th>
                    <th>기안일</th>
                    <th>승인여부</th>
                    <th>반려일자</th>
                </tr>
            </table>
        </div>
    </div>
</div>

</body>

<script>
    const empNo = 1;
    const URL = "/confirm";
    const roleCode = "11111";

    //승인대기 목록 불러오기 함수
    function getWaitingList() {
        const $section = document.getElementById("waiting-table");

        fetch(`\${URL}/list/\${empNo}/\${roleCode}/waiting`)
            .then(res => res.json())
            .then(result => {
                renderConfirmList(result, $section)
            });
    }

    function renderConfirmList(list, $section) {
        let tag = '';
        if ($section.id === 'waiting-table') {
            tag += '<tr id = "waiting-th"><th class = "col1">NO</th>' +
                '<th class = "col2">문서제목</th><th class = "col3">기안자</th>' +
                '<th class = "col4">기안부서</th><th class = "col5">기안일</th>' +
                '<th class = "col6">승인여부</th><th class = "col7">수정</th>' +
                '<th class = "col7">삭제</th></tr>'
        }
        for (let c of list) {
            const {conNo, conTitle, fromName, fromDept, conDate, conStatus} = c;

            tag += '<tr class = "waiting-list"><td class = "col1">' + conNo + '</td><td class = "col2">' + conTitle
                + '</td><td class = "col3">' + fromName + '</td><td class = "col4">' + fromDept + '</td><td class = "col5">' + conDate
                + '</td><td class = "col6">' + conStatus + '</td><td class = "col7">' +
                '<button id = "modify">수정</button></td>' +
                '<td class = "col7"><button id = "remove">삭제</button></td></tr>';
        }
        document.getElementById('waiting-table').innerHTML = tag;
    }

    // 실행부
    getWaitingList();
</script>

</html>
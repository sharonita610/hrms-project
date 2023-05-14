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

    <div class="confirm-titleline">
        <h1>결재문서함</h1>
        <a class="rq-confirm" href="/confirm/rq-form">문서 작성하기</a>
    </div>

    <div class="confirm-outer-container">
        <h2>&lt;결재대기문서&gt;</h2>
        <div class="confirm-box waiting-list">
            <table id="waiting-table">
            </table>
        </div>
        <h2>&lt;결재완료문서&gt;</h2>
        <div class="confirm-box confirmed-list">
            <table id="confirmed-table">
            </table>
        </div>
        <h2>&lt;반려문서&gt;</h2>
        <div class="confirm-box rejected-list">
            <table id="rejected-table">
            </table>
        </div>
    </div>
</div>

</body>

<script>

    const URL = "/confirm";
    const empNo = 1;
    const roleCode = '11111';
    // const roleCode = null;

    //페이지 로딩
    function startConfirmPage() {
        getWaitingList();
        getCheckedList();
        getRejectedList();
    }

    //승인대기 목록 불러오기 함수
    function getWaitingList() {
        const $section = document.getElementById("waiting-table");

        fetch(`\${URL}/\${empNo}/\${roleCode}/waiting`)
            .then(res => res.json())
            .then(result => {
                renderConfirmList(result, $section)
            });
    }

    //승인완료 목록 불러오기 함수
    function getCheckedList() {
        const $section = document.getElementById("confirmed-table");

        fetch(`\${URL}/\${empNo}/\${roleCode}/checked`)
            .then(res => res.json())
            .then(result => {
                renderConfirmList(result, $section)
            });

    }

    //반려목록 불러오기 함수
    function getRejectedList() {
        const $section = document.getElementById("rejected-table");
        fetch(`\${URL}/\${empNo}/\${roleCode}/rejected`)
            .then(res => res.json())
            .then(result => {
                renderConfirmList(result, $section)
            });
    }

    //목록 그리기 함수
    function renderConfirmList(list, $section) {
        let tag = '';
        if ($section.id === 'waiting-table') {
            tag += '<tr id = "waiting-th"><th class = "col1">NO</th>' +
                '<th class = "col2">문서제목</th>';
            if (roleCode === '11111') {
                tag += '<th class = "col3">기안자</th>';
            } else {
                tag += '<th class = "col3">부서장</th>';
            }
            tag += '<th class = "col4">기안부서</th><th class = "col5">기안일</th>' +
                '<th class = "col6">승인여부</th><th class = "col7">수정</th>' +
                '<th class = "col7">삭제</th></tr>';

        } else if ($section.id === 'confirmed-table') {
            tag += '<tr id = " confirmed-th"><th class = "col1">NO</th>' +
                '<th class = "col2">문서제목</th>';
            if (roleCode === '11111') {
                tag += '<th class = "col3">기안자</th>';
            } else {
                tag += '<th class = "col3">부서장</th>';
            }
            tag += '<th class = "col4">기안부서</th><th class = "col5">기안일</th>' +
                '<th class = "col6">승인여부</th><th class = "col7">승인일자</th>';
        } else if ($section.id === 'rejected-table') {
            tag += '<tr id = " rejected-th"><th class = "col1">NO</th>' +
                '<th class = "col2">문서제목</th>';
            if (roleCode === '11111') {
                tag += '<th class = "col3">기안자</th>';
            } else {
                tag += '<th class = "col3">부서장</th>';
            }
            tag += '<th class = "col4">기안부서</th><th class = "col5">기안일</th>' +
                '<th class = "col6">승인여부</th><th class = "col7">반려일자</th>';
        }

        for (let c of list) {
            const {conNo, conTitle, fromName, fromDept, conDate, conStatus, conCheckDate} = c;

            tag += '<tr><td class = "col1">' + conNo + '</td><td class = "col2">' + conTitle
                + '</td><td class = "col3">' + fromName + '</td><td class = "col4">' + fromDept + '</td><td class = "col5">' + conDate
                + '</td><td class = "col6">' + conStatus + '</td>';

            if ($section.id === 'waiting-table') {
                tag += '<td class="col7"><button id="modify"> </button></td>'
                    + '<td class = "col7"><button id = "remove"> </button></td></tr>';
            } else {
                tag += '<td class = "col7">' + conCheckDate + '</td>';
            }
        }
        $section.innerHTML = tag;
    }

    // 실행부
    startConfirmPage();
</script>

</html>
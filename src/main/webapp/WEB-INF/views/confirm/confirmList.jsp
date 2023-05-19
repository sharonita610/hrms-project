<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/confirmlist.css">
</head>

<body>
<div id="body-wrapper">
    <%@ include file="../main/include/left-banner.jsp" %>

    <div class="confirm-page-wrapper">

        <div class="confirm-titleline">
            <h1>결재문서함</h1>
            <a class="rq-confirm" href="/hrms/confirm/rq-form">문서 작성하기</a>
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
</div>

</body>

<script>

    const URL = "/hrms/confirm";
    const empNo = 2;
    // const roleCode = '11111';
    const roleCode = null;

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
            tag += '<tr class = "confirm-tr" id = "waiting-th"><th class = "col1">NO</th>' +
                '<th class = "col2">문서제목</th>';
            if (roleCode === '11111') {
                tag += '<th class = "col3">기안자</th>';
            } else {
                tag += '<th class = "col3">부서장</th>';
            }
            tag += '<th class = "col4">기안부서</th><th class = "col5">기안일</th>' +
                '<th class = "col6">승인여부</th>'

            if (roleCode === '11111') {
                tag += '<th class = "col7">승인</th>' +
                    '<th class = "col7">거절</th></tr>';
            } else {
                tag += '<th class = "col7">수정</th>' +
                    '<th class = "col7">삭제</th></tr>';
            }
        } else if ($section.id === 'confirmed-table') {
            tag += '<tr class = "confirm-tr" id = " confirmed-th"><th class = "col1">NO</th>' +
                '<th class = "col2">문서제목</th>';
            if (roleCode === '11111') {
                tag += '<th class = "col3">기안자</th>';
            } else {
                tag += '<th class = "col3">부서장</th>';
            }
            tag += '<th class = "col4">기안부서</th><th class = "col5">기안일</th>' +
                '<th class = "col6">승인여부</th><th class = "col7">승인일자</th>';
        } else if ($section.id === 'rejected-table') {
            tag += '<tr class = "confirm-tr" id = " rejected-th"><th class = "col1">NO</th>' +
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

            tag += '<tr class = "confirm-tr" id = "doc-info"><td class = "col1">' + conNo + '</td><td class = "col2"><a href="/hrms/confirm/detail?conNo=' + conNo + '">' + conTitle
                + '</a></td><td class = "col3">' + fromName + '</td><td class = "col4">' + fromDept + '</td><td class = "col5">' + conDate
                + '</td><td class = "col6">' + conStatus + '</td>';

            if ($section.id === 'waiting-table' && roleCode === '11111') {
                tag += '<td class="col7"><div class = "button" id = "check"></div></td>'
                    + '<td class = "col7"><div class = "button" id = "reject"></div></td></tr>';
            } else if ($section.id === 'waiting-table' && roleCode !== '11111') {
                tag += '<td class="col7"><div class = "button" id = "modify"></div></td>'
                    + '<td class = "col7"><div class = "button" id = "remove"></div></td></tr>';
            } else {
                tag += '<td class = "col7">' + conCheckDate + '</td>';
            }
        }
        $section.innerHTML = tag;
    }

    //마우스오버 이벤트 -> 문서 수정, 삭제, 승인, 거절
    $box = document.querySelector('.confirm-outer-container');
    $box.addEventListener('mouseover', modifyConfirm);

    function modifyConfirm(e) {
        if (e.target.matches('#modify')) {
            let $modiBtn = e.target.closest('#modify');
            let $docInfo = e.target.closest('#doc-info');
            let conNo = $docInfo.firstChild.innerText;

            $modiBtn.onclick = () => {
                window.location.href = '/confirm/modify?conNo=' + conNo;
            }
        }

        if (e.target.matches('#remove')) {
            let $remoBtn = e.target.closest('#remove');
            let $docInfo = e.target.closest('#doc-info');
            let conNo = $docInfo.firstChild.innerText;

            $remoBtn.onclick = () => {
                if (!confirm('정말 삭제하시겠습니까?')) {
                    return;
                }

                fetch(`\${URL}/delete/\${conNo}`, {method: 'delete'})
                    .then(res => res.json())
                    .then(result => {
                            if (result) {
                                getWaitingList();
                            }
                        }
                    )

            }
        }

        if (e.target.matches('#check')) {
            let $chkBtn = e.target.closest('#check');
            let $docInfo = e.target.closest('#doc-info');
            let conNo = $docInfo.firstChild.innerText;

            $chkBtn.onclick = () => {
                if (!confirm('결재요청을 승인합니다')) {
                    return;
                }
                fetch(`\${URL}/check/\${conNo}`, {method: 'PUT'})
                    .then(res => res.json())
                    .then(result => {
                        if (result) {
                            startConfirmPage();
                        }
                    });
            }
        }

        if (e.target.matches('#reject')) {
            let $rejBtn = e.target.closest('#reject');
            let $docInfo = e.target.closest('#doc-info');
            let conNo = $docInfo.firstChild.innerText;

            $rejBtn.onclick = () => {
                if (!confirm('결재요청을 반려합니다')) {
                    return;
                }
                fetch(`\${URL}/reject/\${conNo}`, {method: 'PUT'})
                    .then(res => res.json())
                    .then(result => {
                        if (result) {
                            startConfirmPage();
                        }
                    });
            }
        }

    }


    // 실행부
    startConfirmPage();
</script>

</html>
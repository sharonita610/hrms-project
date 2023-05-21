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
    <div class="forscroll">
        <div class="confirm-page-wrapper">

            <div class="confirm-titleline">
                <h1>결재문서함</h1>
                <a class="rq-confirm" href="/hrms/confirm/rq-form">문서 작성하기</a>
            </div>

            <div class="confirm-outer-container">
                <h2>&lt;결재대기문서&gt;</h2>
                <div class="confirm-box waiting-list">
                    <div class = "confirm-table" id="waiting-table">
                    </div>
                </div>
                <h2>&lt;결재완료문서&gt;</h2>
                <div class="confirm-box confirmed-list">
                    <div  class = "confirm-table" id="confirmed-table">
                    </div>
                </div>
                <h2>&lt;반려문서&gt;</h2>
                <div class="confirm-box rejected-list">
                    <div  class = "confirm-table" id="rejected-table">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<script>

    const URL = "/hrms/confirm";
    const empNo = 1;
    const roleCode = '11111';
    // const roleCode = null;

    //페이지 로딩
    function startConfirmPage() {
        getWaitingList();
        getCheckedList();
        getRejectedList();
    }

    //모든 내역 불러오기 함수
    function getAllConfirmList(){

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

        //목록 첫줄 그리기
        if ($section.id === 'waiting-table') {
            tag += '<ul class = "confirm-tr" id = "waiting-th"><li class = "title-line col1">NO</li>' +
                '<li class = "title-line col2">문서제목</li>';
            if (roleCode === '11111') {
                tag += '<li class = "title-line col3">기안자</li>';
            } else {
                tag += '<li class = "title-line col3">부서장</li>';
            }
            tag += '<li class = "title-line col4">기안부서</li><li class = "title-line col5">기안일</li>' +
                '<li class = "title-line col6">승인여부</li>'

            if (roleCode === '11111') {
                tag += '<li class = "title-line col7">승인</li>' +
                    '<li class = "title-line col7">거절</li></ul>';
            } else {
                tag += '<li class = "title-line col7">수정</li>' +
                    '<li class = "title-line col7">삭제</li></ul>';
            }
        } else if ($section.id === 'confirmed-table') {
            tag += '<ul class = "confirm-tr" id = " confirmed-th"><li class = "title-line col1">NO</li>' +
                '<li class = "title-line col2">문서제목</li>';
            if (roleCode === '11111') {
                tag += '<li class = "title-line col3">기안자</li>';
            } else {
                tag += '<li class = "title-line col3">부서장</li>';
            }
            tag += '<li class = "title-line col4">기안부서</li><li class = "title-line col5">기안일</li>' +
                '<li class = "title-line col6">승인여부</li><li class = "title-line col7">승인일자</li></ul>';
        } else if ($section.id === 'rejected-table') {
            tag += '<ul class = "confirm-tr" id = " rejected-th"><li class = "title-line col1">NO</li>' +
                '<li class = "title-line col2">문서제목</li>';
            if (roleCode === '11111') {
                tag += '<li class = "title-line col3">기안자</li>';
            } else {
                tag += '<li class = "title-line col3">부서장</li>';
            }
            tag += '<li class = "title-line col4">기안부서</li><li class = "title-line col5">기안일</li>' +
                '<li class = "title-line col6">승인여부</li><li class = "title-line col7">반려일자</li></ul>';
        }

        //리스트 내용 그리기
        for (let c of list) {
            const {conNo, conTitle, fromName, fromDept, conDate, conStatus, conCheckDate} = c;

            tag += '<a href="/hrms/confirm/detail?conNo=' + conNo + '"><ul class = "confirm-tr" id = "doc-info"><li class = "col1">' + conNo + '</li><li class = "col2">' + conTitle
                + '</li><li class = "col3">' + fromName + '</li><li class = "col4">' + fromDept + '</li><li class = "col5">' + conDate
                + '</li><li class = "col6">' + conStatus + '</li>';

            if ($section.id === 'waiting-table' && roleCode === '11111') {
                tag += '<li class="col7"><div class = "button" id = "check"></div></li>'
                    + '<li class = "col7"><div class = "button" id = "reject"></div></li></ul></a>';
            } else if ($section.id === 'waiting-table' && roleCode !== '11111') {
                tag += '<li class="col7"><div class = "button" id = "modify"></div></li>'
                    + '<li class = "col7"><div class = "button" id = "remove"></div></li></ul></a>';
            } else {
                tag += '<li class = "col7">' + conCheckDate + '</li></ul></a>';
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
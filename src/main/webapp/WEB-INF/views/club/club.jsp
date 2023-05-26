<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>SAMJO SANGSA</title>
    <link rel="icon" href="/assets/img/favicon_blue.png">
    <%@ include file="../main/include/header.jsp" %>
    <link rel="stylesheet" href="/assets/css/club.css">
    <link rel="stylesheet" href="/assets/css/club-modal.css" </head> <body>
    <!-- ================ 클럽 모달 ============================================================================ -->
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <div class="modal-background"></div>
        <div class="club-modal-wrapper common-club-modal">
            <div class="club-modal-separator">
                <section class="club-modal-content-container">
                    <ul class="contents-wrapper">
                        <li class="club-modal-club-info">
                            <ul class="club-modal-informations">
                                <li class="club-modal-image"><img src="/resources/static/assets/img/logo.png"
                                        alt="동호회사진">
                                </li>
                                <li class="club-name"></li>
                                <li class="board-writer"></li>
                                <li>
                                    <!-- 가입하기 버튼 id 는 버튼 위치 잡으려고 만듬 -->
                                    <button id="join-club-btn">가입하기</button>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <div class="club-modal-contents">
                                <div class="post-img"></div>
                                <div class="post-text"></div>
                            </div>
                        </li>
                    </ul>
                </section>
                <section class="club-modal-replies-container">
                    <div class="club-modal-replies-head">
                        <ul class="replies-wrapper">
                            <li class="club-modal-add-reply">
                                <form action="#" method>
                                    <input class="write-reply" type="text" placeholder="댓글을 작성해보세요!">
                                    <button id="add-reply" type="submit">등록</button>
                                    <button id="cancel-reply" type="reset">취소</button>
                                </form>
                            </li>

                            <li class="club-modal-reply-list">
                                <div class="club-reply-generate"></div>    
                            </li>
    
                        </ul>
                    </div>
                </section>
            </div>
        </div>

        <!-- ============================================================================================ -->
        <!-- club-my-modal ============================================================================== -->
        <div class="club-modal-wrapper my-modal">
            <div class="club-modal-separator">
                <section class="club-modal-content-container">
                    <ul class="contents-wrapper">
                        <li class="club-modal-club-info">
                            <ul class="club-modal-informations">
                                <li class="club-modal-image"><img src="/resources/static/assets/img/samjo-logo.png"
                                        alt="동호회사진">
                                </li>
                                <li>동호회이름</li>
                                <li>[작성자이름]</li>
                                <li>
                                    <form action="#" method="post">
                                        <!-- 가입하기 버튼 id 는 버튼 위치 잡으려고 만듬 -->
                                        <button id="update-club-btn">수정하기</button>
                                        <button id="delete-club-btn">삭제하기</button>
                                    </form>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <div class="club-modal-contents">
                                게시글 <br>
                                사진란
                            </div>
                        </li>
                    </ul>
                </section>
                <section class="club-modal-replies-container">
                    <div class="club-modal-replies-head">
                        <ul class="replies-wrapper">
                            <li class="club-modal-reply-list">
                                <div class="club-modal-reply-list-one">
                                    <ul>
                                        <li>작성자</li>
                                        <li>시간</li>
                                        <li>내용내용내용내용내용내용내용내용내용</li>
                                    </ul>
                                </div>
                                <div class="club-modal-reply-list-one">
                                    <ul>
                                        <li>작성자</li>
                                        <li>시간</li>
                                        <li>내용내용내용내용내용내용내용내용내용</li>
                                    </ul>
                                </div>
                                <div class="club-modal-reply-list-one">
                                    <ul>
                                        <li>작성자</li>
                                        <li>시간</li>
                                        <li>내용내용내용내용내용내용내용내용내용</li>
                                    </ul>
                                </div>
                                <div class="club-modal-reply-list-one">
                                    <ul>
                                        <li>작성자</li>
                                        <li>시간</li>
                                        <li>내용내용내용내용내용내용내용내용내용</li>
                                    </ul>
                                </div>

                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </div>

        <!-- ======================================================================================= -->
        <!-- <div class="sample">안녕</div> -->
        <section class="section-club-board">
            <div id="club-contents">
                <div class="club-drop-down-btn">
                    <button class="club-dropbtn"></button>
                    <div class="club-drop-down-content">
                        <a href="/hrms/club/club-board-list">전체보기</a>
                        <a href="/hrms/club/joined-club-board-list?empNo=${exEmp.empNo}">내 동호회</a>
                    </div>
                </div>
                <div id="club-board-list">
                    <div class="club-card-wrapper">
                        <c:forEach var="c" items="${clubBoardList}">
                            <section class="club-card" data-cbDate="${c.cbDate}" data-bno="${c.cbNo}"
                                data-writer="${c.empName}">
                                <div class="club-card-info">
                                    <ul>
                                        <li><img src="#" alt="" class="club-profile-img"></li>
                                        <li class="board-list-club-name" data-clubCode="${c.clubCode}">${c.clubName}</li>
                                        <!-- 가입하기 버튼 -->
                                        <li>
                                            <button class="join" type="submit"
                                                style="cursor: pointer !important;">가입하기</button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="club-card-content">
                                    <div class="board-list-club-URL">${c.cbURL}</div>
                                    <div class="board-list-club-content">${c.cbContent}</div>
                                </div>
                            </section>
                        </c:forEach>

                    </div>
                </div>
                <div id="club-board-information">
                    <div id="club-board-reply">
                        <div class="club-board-sort">
                            <div class="myBoard"><a href="#">내게시글</a></div>
                            <div class="myClub"><a href="#">내동호회</a></div>
                            <div class="myReply"><a href="#">내가쓴댓글</a></div>
                        </div>
                        <div class="club-my-board">
                            <div class="three-option">

                                <!-- <ul>
                                        <li class="club-board-title" data-cbNo="cbNo" data-clubCode="clubCode">cbTitle</li>   
                                    </ul>  -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script>
        // 내게시글, 가입동호회, 내댓글 관련 스크립트

        // 현재 로그인한 사원번호 -- <세션으로 바꿀 부분>
        const empNo = '${exEmp.empNo}';

        // 비동기 URI
        const clubBoardURL = '/hrms/club';

        // ---------------------------------------------------------------------

        const $showbtn = document.querySelector('.club-dropbtn');
        const $hiddenContent = document.querySelector('.club-drop-down-content');

        $showbtn.onclick = e => {
            $hiddenContent.classList.toggle('show-content');
        };

        // ----------------------------------------------------------------------
        const $threeOption = document.querySelector('.three-option');
        const $myBoard = document.querySelector('.myBoard');
        const $myClub = document.querySelector('.myClub');
        const $myReply = document.querySelector('.myReply');

        // three-option 안에 태그들을 전부 지우는 함수
        function removeAllOption() {
            while ($threeOption.firstChild) {
                $threeOption.removeChild($threeOption.firstChild);
            }
        }

        // 내 게시글 클릭시 태그 생성 및 목록 비동기 요청
        $myBoard.onclick = e => {
            let myBoardTag = '';
            removeAllOption();
            fetch(clubBoardURL + '/myboardList/' + empNo)
                .then(res => res.json())
                .then(resResult => {
                    // console.log(resResult);
                    if (resResult.length === 0) {
                        myBoardTag += "<div> 작성한 게시글이 없습니다.</div>";
                    } else {
                        for (let oneboard of resResult) {
                            const {
                                cbNo,
                                cbTitle,
                                clubCode,
                                empNo
                            } = oneboard;

                            myBoardTag += "<ul>" +
                                "<li class='club-board-title' data-cbNo='" + cbNo + "' data-clubCode='" +
                                clubCode + "'>" + cbTitle + "</li>" +
                                "</ul>";
                        }
                    }
                    document.querySelector('.three-option').innerHTML = myBoardTag;
                });
        };

        // 내 동호회 클릭시 태그 생성 및 목록 비동기 요청
        $myClub.onclick = e => {
            let myClubTag = '';
            removeAllOption();
            fetch(clubBoardURL + '/myclubList/' + empNo)
                .then(res => res.json())
                .then(resResult => {
                    if (resResult.length === 0) {
                        myBoardTag += "<div> 가입한 동호회가 없습니다.</div>";
                    } else {
                        for (let oneClub of resResult) {
                            const {
                                ecIndex,
                                empJoinDate,
                                empNo,
                                clubCode,
                                clubName
                            } = oneClub;

                            myClubTag += "<ul>" +
                                "<li class='joined-club-list' data-clubCode='" + clubCode + "'>" + clubName +
                                "<button class='club-leave-btn'>탈퇴하기</button>" +
                                "</li>" +
                                "</ul>";
                        }
                    }
                    document.querySelector('.three-option').innerHTML = myClubTag;
                });
        };

        // 내가 쓴 댓글 클릭시 태그 생성 및 목록 비동기 요청
        $myReply.onclick = e => {
            let myReplyTag = '';
            removeAllOption();
            fetch(clubBoardURL + '/myClubReply/' + empNo)
                .then(res => res.json())
                .then(resResult => {
                    if (resResult.length === 0) {
                        myReplyTag += "<div> 작성한 댓글이 없습니다.</div>";
                    } else {
                        for (let oneReply of resResult) {
                            const {
                                clubRepNo,
                                clubRepContent,
                                clubRepDate,
                                cbNo,
                                empNo,
                                empName
                            } = oneReply;

                            myReplyTag += "<ul>" +
                                "<li class='my-club-reply' data-clubRepNo='" + clubRepNo + "'data-cbNo='" +
                                cbNo + "'>" + clubRepContent +
                                "<button class='crep-mod-btn'>수정</button>" +
                                "<button class='crep-del-btn'>삭제</button>" +
                                "</li>" +
                                "</ul>";
                        }
                    }
                    document.querySelector('.three-option').innerHTML = myReplyTag;

                });
        };


        // 게시글 컨텐츠 클릭시 모달창 띄우기
        const $clubCardContent = document.querySelector('.club-card-content');
        const $commonModal = document.querySelector('.common-club-modal');
        const $modalBackground = document.querySelector('.modal-background');

        // ==================================================================
        const $clubCard = document.querySelector('.club-card');
        
        $clubCard.parentElement.onclick = e => {
            
            // 게시글 상세보기
            const $detailClubName = document.querySelector('.board-list-club-name');
            const $detailClubContent = document.querySelector('.board-list-club-content');
            const $detailClubProfile = document.querySelector('.club-profile-img');
            const $detailClubPostImg = document.querySelector('.board-list-club-URL');
    
            const $modalClubName = document.querySelector('.club-name');
            const $modalBoardWriter = document.querySelector('.board-writer');
            const $modalProfile = document.querySelector('.club-modal-image');
            const $modalPostImg = document.querySelector('.post-img');
            const $modalPostText = document.querySelector('.post-text');
            const $modalDate = document.querySelector('.reply-time');

            const $joinedClubList = document.querySelectorAll('.joined-club-list');

            // console.log(e.target);

            // 동호회 가입하기 버튼 클릭시
            if(e.target.classList.contains('join')) {
            // console.log($joinedClubList);
                
            console.log();
                fetch(clubBoardURL + '/myclubList/' + empNo)
                .then(res => res.json())
                .then(resResult => {
                    for (let oneClub of resResult) {
                            const {
                                ecIndex,
                                empJoinDate,
                                empNo,
                                clubCode,
                                clubName
                            } = oneClub;
                            // 현재 가입하기를 누른 동호회코드가 이미 가입된 동호회 코드인지 확인
                            console.log(e.target.parentElement.previousElementSibling.dataset.clubcode + '///' + clubCode);

                            if (+e.target.parentElement.previousElementSibling.dataset.clubcode === +clubCode) {
                                alert('이미 가입된 동호회입니다.');
                                return;    
                            }
                            console.log('================');
                        }
                    
                    // # 서버로 보낼 데이터
                    const joinDto = {
                        empNo: empNo,
                        clubCode: e.target.parentElement.previousElementSibling.dataset.clubcode
                    };

                    const requestJoinInfo = {
                        method: 'POST',
                        headers: {
                            'content-type' : 'application/json'
                        },
                        body: JSON.stringify(joinDto)
                    };

                    fetch(clubBoardURL + '/clubJoin', requestJoinInfo)
                        .then(res => {
                            if (res.status === 200) {
                                alert('가입에 성공했습니다!');
                            }
                        });

                });
                
                    
            }

            // 컨텐츠를 클릭했을 경우만 상세보기
            else if (e.target.classList.contains('board-list-club-content') || e.target.classList.contains(
                    'board-list-club-URL')) {

                e.preventDefault();
                const cbNo = e.target.closest('.club-card').dataset.bno;

                $commonModal.classList.add('show-modal');
                $modalBackground.classList.add('show-modal');

                $modalPostText.textContent = e.target.parentElement.querySelector('.board-list-club-content')
                    .textContent;
                $modalClubName.textContent = e.target.parentElement.previousElementSibling.querySelector(
                    '.board-list-club-name').textContent;

                $modalBoardWriter.textContent = e.target.closest('.club-card').dataset.writer;
                // $modalDate.textContent = e.target.closest('.club-card').dataset.cbdate;

                $modalProfile.textContent = e.target.parentElement.previousElementSibling.querySelector(
                    '.club-profile-img').textContent;
                $modalPostImg.textContent = e.target.parentElement.querySelector('.board-list-club-URL')
                .textContent;


                // 게시글 상세보기 시 댓글 목록 비동기 처리
                let replyTag = '';

                fetch(clubBoardURL + '/boardReply/' + cbNo)
                    .then(res => res.json())
                    .then(resResult => {
                        if (resResult.length === 0) {
                            replyTag += "<div class='noreply'>댓글이 없습니다.</div>"
                        } else {
                            for (let rep of resResult) {
                                const {clubRepNo, clubRepContent, clubRepDate, cbNo, empNo, empName} = rep;

                           replyTag += "<div class='club-modal-reply-list-one' data-clubRepNo='" + clubRepNo + "' data-cbNo='" + cbNo + "'"
                                        + "data-empNo='" + empNo + "'>"
                                        + "<div class='reply-info'> "
                                            + "<span class='reply-writer'>" + empName + "</span>"
                                            + "<span class='reply-time'>" + clubRepDate + "</span>"
                                        + "</div>"
                                        + "<div class='reply-content'>"
                                            + clubRepContent
                                        + "</div>"
                                    + "</div>";

                                }
                        }

                        document.querySelector('.club-reply-generate').innerHTML = replyTag;
                    });
            }
        };

        // 모달창 닫기
        $modalBackground.onclick = e => {
            if (e.target.classList.contains('common-club-modal')) return;
            $commonModal.classList.remove('show-modal');
            $modalBackground.classList.remove('show-modal');
        }


        // 동호회 탈퇴하기
        const $clubLeaveBtn = document.querySelector('.club-leave-btn');
        $threeOption.onclick = e => {

            if (e.target.matches('.club-leave-btn')) {
                console.log(e.target.parentElement.dataset.clubcode);
                // # 서버로 보낼 데이터
                    const LeaveDto = {
                        empNo: empNo,
                        clubCode: e.target.parentElement.dataset.clubcode
                    };

                    const requestLeaveInfo = {
                        method: 'DELETE',
                        headers: {
                            'content-type' : 'application/json'
                        },
                        body: JSON.stringify(LeaveDto)
                    };

                if (!confirm('정말로 탈퇴하시겠습니까?')) return;
           
                // 서버에 삭제 비동기 요청
                fetch(clubBoardURL + '/leaveClub', requestLeaveInfo)
                    .then(res => {
                        if (res.status === 200) {
                            alert('동호회를 탈퇴했습니다.');
                            return res.json();
                        } else {
                            alert('동호회 탈퇴 실패');
                        }
                    });
            }

        }






        // ====================================================================

        //========= 메인 실행부 =========//
        // (function () {

        // 내가 작성한 게시글 목록 불러오기
        // getMyBoardClubList();

        // 댓글 등록 이벤트 등록
        //makeReplyRegisterClickEvent();

        // 삭제 이벤트 등록
        // replyRemoveClickEvent();

        // 수정 이벤트 등록
        // replyModifyClickEvent();

        // })();
    </script>



    </body>
<%@ include file="../main/include/footer.jsp" %>

</html>
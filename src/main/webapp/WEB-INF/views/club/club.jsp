<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAMJO SANGSA</title>
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="stylesheet" href="/assets/css/header-banner.css">
    <link rel="stylesheet" href="/assets/css/main-page.css">
    <link rel="stylesheet" href="/assets/css/club.css">

</head>

<body>
    <header class="common_wrap">
        <section class="section-header">
            <div class="head">
                <ul>
                    <li>
                        <div class="logo-img">
                            <a href="#">
                                <img src="/img.png" alt="로고">
                            </a>
                        </div>
                    </li>
                    <li>삼조상사에 오신 것을 환영합니다.</li>
                    <li><a href="#"><span id="logout-button">로그아웃</span></a></li>
                </ul>
            </div>
        </section>
        <section class="section-sub-header">
            <div class="nav-bar">
                <ul id="tabs">
                    <li><a href="#">HOME</a></li>
                    <li><a href="#">게시판</a></li>
                    <li><a href="#">결재</a></li>
                    <li><a href="#">메일</a></li>
                    <li><a href="#">동호회</a></li>
                </ul>
            </div>
        </section>
    </header>
    <div id="body-wrapper">
        <section class="section-left-body">
            <div id="left-body">
                <div class="left-fix">
                    <div class="information-box">
                        <ul id="profile">
                            <li id="photo"><a href="#">사원사진</a></li>
                        </ul>
                        <ul id="information">
                            <li>사원번호</li>
                            <li>이름</li>
                            <li>휴대폰번호</li>
                            <li>부서</li>
                            <li>직책</li>
                            <li>
                                <button id="change-info" type="submit">수정</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-club-board">
            <div id="club-contents">
                <div class="club-drop-down-btn">
                    <button class="club-dropbtn"></button>
                    <div class="club-drop-down-content">
                        <a href="/club/club-board-list">전체보기</a>
                        <a href="/club/joined-club-board-list?empNo=1">내 동호회</a>
                    </div>
                </div>
                <div id="club-board-list">
                    <div class="club-card-wrapper">
                        <c:forEach var="c" items="${clubBoardList}">
                            <section class="club-card" data-bno="${c.cbNo}">
                                <div class="club-card-info">
                                    <ul>
                                        <li><img src="#" alt=""></li>
                                        <li>${c.clubName}</li>
                                        <!-- 가입하기 버튼 -->
                                        <li>
                                            <button class="join">가입하기</button>
                                        </li>
                                    </ul>
                                </div>
                                <div class="club-card-content">
                                    <ul>
                                        <li>${c.cbURL}</li>
                                        <li>${c.cbContent}</li>
                                    </ul>
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

        // 원본 글 번호
        const bno = '${clubBoardList.get(0).cbNo}';

        // 현재 로그인한 사원번호
        const empNo = '${exEmp.empNo}';

        // 댓글 요청 URI
        const clubBoardURL = '/club';
        const clubReplyURL = '/club-reply';

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
                    console.log(resResult);

                    if (resResult.length === 0) {
                        myBoardTag += "<div> 작성한 게시글이 없습니다.</div>";
                    } else {
                        for (let oneboard of resResult) {
                            const {cbNo, cbTitle, clubCode, empNo} = oneboard;

                            myBoardTag +=   "<ul>" 
                                            +  "<li class='club-board-title' data-cbNo='" + cbNo + "' data-clubCode='" + clubCode + "'>" + cbTitle + "</li>"   
                                            + "</ul>";
                        }

                    }
                    document.querySelector('.three-option').innerHTML = myBoardTag;

                });


        };

        // 내



        // function getMyBoardClubList() {

        // }


        // 로그인한 회원 계정명
        // const currentAccount = '${login.account}';
        // const auth = '${login.auth}';




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

</html>
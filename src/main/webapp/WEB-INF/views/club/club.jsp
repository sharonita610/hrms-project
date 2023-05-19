<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
    
    <head>
        <%@ include file="../main/include/header.jsp" %>
        <link rel="stylesheet" href="/assets/css/club.css">
        <link rel="stylesheet" href="/assets/css/club-modal.css"
    </head>
    
    <body>
    <!-- ================ 클럽 모달 ============================================================================ -->
    <div id="body-wrapper">
        <%@ include file="../main/include/left-banner.jsp" %>
        <div class="club-modal-wrapper common-club-modal">
        <div class="club-modal-separator">
            <section class="club-modal-content-container">
                <ul class="contents-wrapper">
                    <li class="club-modal-club-info">
                        <ul class="club-modal-informations">
                            <li class="club-modal-image"><img src="/resources/static/assets/img/samjo-logo.png" alt="동호회사진">
                            </li>
                            <li>동호회이름</li>
                            <li>[작성자이름]</li>
                            <li>
                                <form action="#" method="post">
                                    <!-- 가입하기 버튼 id 는 버튼 위치 잡으려고 만듬 -->
                                    <button id="join-club-btn">가입하기</button>
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
                        <li class="club-modal-add-reply">
                            <form action="#" method>
                                <input class="write-reply" type="text" placeholder="댓글을 작성해보세요!">
                                <button id="add-reply" type="submit">등록</button>
                                <button id="cancel-reply" type="reset">취소</button>
                            </form>
                        </li>
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
<!-- ============================================================================================ -->
<!-- club-my-modal ============================================================================== -->
<div class="club-modal-wrapper my-modal">
	<div class="club-modal-separator">
		<section class="club-modal-content-container">
			<ul class="contents-wrapper">
				<li class="club-modal-club-info">
					<ul class="club-modal-informations">
						<li class="club-modal-image"><img src="/resources/static/assets/img/samjo-logo.png" alt="동호회사진">
						</li>
						<li>동호회이름</li>
						<li>[작성자이름]</li>
						<li>
							<form action="#" method="post">
								<!-- 가입하기 버튼 id 는 버튼 위치 잡으려고 만듬 -->
								<button id="update-club-btn">수정하기</button>
								<button id="quit-club-btn">탈퇴하기</button>
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
                        <a href="/hrms/club/joined-club-board-list?empNo=1">내 동호회</a>
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
                            const {cbNo, cbTitle, clubCode, empNo} = oneboard;

                            myBoardTag +=   "<ul>" 
                                            +  "<li class='club-board-title' data-cbNo='" + cbNo + "' data-clubCode='" + clubCode + "'>" + cbTitle + "</li>"   
                                            + "</ul>";
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
                            const {ecIndex, empJoinDate, empNo, clubCode, clubName} = oneClub;

                            myClubTag +=   "<ul>" 
                                            +  "<li class='joined-club-list' data-clubCode='" + clubCode + "'>" + clubName 
                                                + "<button class='club-leave-btn'>탈퇴하기</button>"
                                            +  "</li>"   
                                            + "</ul>";
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
                            const {clubRepNo, clubRepContent, clubRepDate, cbNo, empNo, empName} = oneReply;

                            myReplyTag +=   "<ul>" 
                                            +  "<li class='my-club-reply' data-clubRepNo='"+ clubRepNo +"'data-cbNo='" + cbNo + "'>" + clubRepContent 
                                                + "<button class='crep-mod-btn'>수정</button>"
                                                + "<button class='crep-del-btn'>삭제</button>"
                                            +  "</li>"   
                                            + "</ul>";
                        }
                    }
                    document.querySelector('.three-option').innerHTML = myReplyTag;

            });
        };

        // 게시글 컨텐츠 클릭시 모달창 띄우기
        const $commonModal = document.querySelector('.common-club-modal');
        const $clubCard = document.querySelector('.club-card');
        $clubCard.onclick = e => {
            $commonModal.style.display = 'block';
        };



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
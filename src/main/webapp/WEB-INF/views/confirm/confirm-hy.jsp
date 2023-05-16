<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAMJO SANGSA</title>
</head>

<body>
    <!doctype html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
            content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <!-- 기본세팅 css	-->
        <link rel="stylesheet" href="/assets/css/common.css">
        <!-- 헤더, 배너 고정 틀용 css -->
        <link rel="stylesheet" href="/assets/css/header-banner.css">
        <!-- 메인 페이지 list 포함 css -->
        <link rel="stylesheet" href="/assets/css/main-page.css">
        <link rel="stylesheet" href="/assets/css/confirm.css">
    </head>

    <body>
        <header class="common_wrap">
            <section class="section-header">
                <div class="head">
                    <ul>
                        <li>
                            <div class="logo-img">
                                <a href="#">
                                    <img src="/resources/static/assets/img/samjo-logo.png" alt="로고">
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





            <section class="detail-part">

                <div class="container">
                    <h1>게시글 작성</h1>
                    <form action="/hrms/show-modify" method="post">
                        <div class="form-group">
                            <input type="hidden" name="boardNo" value="${b.boardNo}">
                            <label for="board">게시판:</label>
                            <select id="board" name="bdType">
                                <option value="NOTICE">공지게시판</option>
                                <option value="FREE">자유게시판</option>
                                <option value="NONAME">익명게시판</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="title">제목:</label>
                            <input type="text" id="title" name="bdTitle" placeholder="제목을 입력하세요" readonly>
                        </div>
                        <div class="form-group">
                            <label for="content">내용:</label>
                            <textarea id="content" name="bdContent" placeholder="내용을 입력하세요"
                                readonly>${b.bdContent}</textarea>
                        </div>
                        <div class="form-group">
                            <button id="backToList">목록</button>
                            <button type="submit">수정</button>
                        </div>
                    </form>
                </div>


            </section>
            <!--  -->


            <!-- 댓글 영역 -->

            <div id="replies" class="row">
                <div class="offset-md-1 col-md-10">
                    <!-- 댓글 쓰기 영역 -->
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label for="newReplyText" hidden>댓글 내용</label>
                                        <textarea rows="3" id="newReplyText" name="replyText" class="form-control"
                                            placeholder="댓글을 입력해주세요."></textarea>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="newReplyWriter" hidden>댓글 작성자</label>
                                        <input id="newReplyWriter" name="replyWriter" type="text" class="form-control"
                                            placeholder="작성자 이름" readonly style="margin-bottom: 6px;">
                                        <button id="replyAddBtn" type="button"
                                            class="btn btn-dark form-control">등록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> <!-- end reply write -->

                    <!--댓글 내용 영역-->
                    <div class="card">
                        <!-- 댓글 내용 헤더 -->
                        <div class="card-header text-white m-0" style="background: #343A40;">
                            <div class="float-left">댓글 (<span id="replyCnt">0</span>)</div>
                        </div>

                        <!-- 댓글 내용 바디 -->
                        <div id="replyCollapse" class="card">
                            <div id="replyData">
                                <!-- 
                            < JS로 댓글 정보 DIV삽입 > 
                        -->
                            </div>

                            <!-- 댓글 페이징 영역 -->
                            <ul class="pagination justify-content-center">
                                <!-- 
                            < JS로 댓글 페이징 DIV삽입 > 
                        -->
                            </ul>
                        </div>
                    </div> <!-- end reply content -->
                </div>
            </div> <!-- end replies row -->

            <!-- 댓글 수정 모달 -->
            <div class="modal fade bd-example-modal-lg" id="replyModifyModal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header" style="background: #343A40; color: white;">
                            <h4 class="modal-title">댓글 수정하기</h4>
                            <button type="button" class="close text-white" data-bs-dismiss="modal">X</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="form-group">
                                <input id="modReplyId" type="hidden">
                                <label for="modReplyText" hidden>댓글내용</label>
                                <textarea id="modReplyText" class="form-control" placeholder="수정할 댓글 내용을 입력하세요."
                                    rows="3"></textarea>
                            </div>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button id="replyModBtn" type="button" class="btn btn-dark">수정</button>
                            <button id="modal-close" type="button" class="btn btn-danger"
                                data-bs-dismiss="modal">닫기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- end replyModifyModal -->

        </div>



        </div>
    </body>

    </html>
</body>

</html>
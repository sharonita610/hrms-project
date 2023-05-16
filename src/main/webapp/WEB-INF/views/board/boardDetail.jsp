<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <style>
         body {
                font-family: Arial, sans-serif;
            }
            .save-part{
                margin-top: 200px;
            }

            .container {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
            }

            h1 {
                text-align: center;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-group select {
                width: 100%;
                padding: 10px;
                font-size: 16px;
            }

            .form-group textarea {
                width: 100%;
                height: 200px;
                padding: 10px;
                font-size: 16px;
            }

            .form-group button {
                padding: 10px 20px;
                font-size: 16px;
                background-color: #0d6efd;
                color: white;
                border: none;
                cursor: pointer;
            }

            .form-group button:hover {
                background-color: #0d6efd;
            }
            #content{
                resize: none;
            }
    </style>
</head>

<body>

        <section class="save-part">

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
                        <textarea id="content" name="bdContent" placeholder="내용을 입력하세요" readonly>${b.bdContent}</textarea>
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
                                    <input id="newReplyWriter" name="replyWriter" type="text"
                                         class="form-control" placeholder="작성자 이름"
                                        readonly style="margin-bottom: 6px;">
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

    <script>

        function selectVal(){
            if('${b.bdType=NOTICE}')
            console.log('맞아');
        };



        const $type=document.querySelector('.type');
        function typeChange() {
            console.log($type.value);
            if($type.value='FREE'){
                // console.log('맞아맞아');

            }
        }
        typeChange();
        

        const $toList = document.getElementById('backToList');
        $toList.onclick = function () {
            history.back();
        }

        selectVal();

        // 댓글 관련 스크립트

        // URI
        const URL='/api/hrms/replies';

        // 게시글 번호 
        const boardNo=`${b.boardNo}`

        // 댓글 리스트와 렌더링
        function renderReplyList({
            boardReplies,boardReplyPageMaker,replyCount
        }) {
            // 총 댓글수
            console.log(document.getElementById('replyCnt').textContent=replyCount);
            document.getElementById('replyCnt').textContent=replyCount;
            
        }

        // 댓글 목록 불러오기 함수
        function findAllReplies(page=1){
        
            fetch(`\${URL}/\${boardNo}/page/\${page}`)
            .then(res=>res.json())
            .then(responseResult=>{
                console.log(responseResult);
            });
        
        }

        //
        (function() {
            
            // 댓글 리스트 호출
            findAllReplies();

        })()







    </script>

</body>

</html>
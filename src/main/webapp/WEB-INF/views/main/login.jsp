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

    <%--    <link rel="stylesheet" href="/assets/css/index.css">--%>
    <style>

        .wrapper{
            border: 4px solid rgba(190, 193, 194, 0.49);
            border-right: 5px solid rgba(190, 193, 194, 0.89);
            border-bottom: 5px solid rgba(190, 193, 194, 0.49);
            width: 40%;
            padding: 10px;
            margin: 5% auto;
        }
        .container img {
            width: 300px;
            height: 260px;
            margin: 0 auto;
        }

        .logo-image-container{
            text-align: center;
            height: 250px;
        }
        .logo-image-container .thumbnail-box {
            width: 300px;
            height: 300px;
            /*border-radius: 50%;*/
            overflow: hidden;
            margin: 0 auto;
            cursor: pointer;
        }
        .logo-image-container .thumbnail-box img{
            width: 300px;
            height: 300px;
        }

        form {
            border: 3px solid #f1f1f1;
        }
        h1{
            font-size: 1.2rem;
            padding-bottom: 10px;
            text-align: center;
        }
        b{
            font-size: 0.8rem;
            padding-left: 10px;
        }
        #login-button{
            font-weight: 800;
        }

        /*  INPUT 태그 크기 조정*/
        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #f1f1f1;
            box-sizing: border-box;
        }

        /* 버튼 스타일 */
        button {
            background-color: rgba(190, 193, 194, 0.49);
            color: #434374;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            font-size: 1.2rem;
        }

        /* 버튼 호버 효과 */
        button:hover {
            opacity: 0.8;
        }



        /* container에 패딩 추가 */
        .container {
            padding: 14px;
        }

        /*  비밀번호 잊었을때  */
        span.pwd {
            float: right;
            padding-top: 16px;
        }
        #forgot-pwd p{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="container">
        <div class="logo-image-container">
            <div class="thumbnail-box">
                <img src="/assets/img/logo.png" alt="회사로고">
            </div>
        </div>
        <h1>당신의 노고에 감사드립니다</h1>
        <div class="form-holder">
            <form action="/log-in" name="log-in"method="post">
                <div class="container">
                    <b>사원번호</b>
                    <input type="text" placeholder="email을 입력해주세요" name="empEmail"
                           required="required" aria-required="true" >

                    <b>비밀번호</b>
                    <input type="password" placeholder="비밀번호를 입력해주세요" name="empPassword"
                           required="required" aria-required="true" >

                    <button type="submit" class="submit-btn" id="login-button">로그인</button>
                    <label for="auto-login">
                        <input type="checkbox" id="auto-login" name="autoLogin"> 자동로그인
                    </label>
                </div>
            </form>
        </div>
        <div class="container" style="background-color:#f1f1f1">
            <span class="psw"><a href="#" id="forgot-pwd"><p>비밀번호를 잊으셨나요?</p></a></span>
        </div>
    </div>
</div>
</body>
<script>
    const serverMessage = '${msg}';
    console.log('msg :' + serverMessage);
    if(serverMessage === 'NO_EMP_EMAIL'){
        alert('잘 못 된 이메일입니다');
    }else if(serverMessage === 'WRONG_PW'){
        alert('비밀번호가 틀렸습니다');
    }

</script>
</html>
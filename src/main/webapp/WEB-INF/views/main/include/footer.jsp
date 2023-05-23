<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        footer {
            background: rgba(28, 30, 40, 0.74);
            height: 55px;
        }

        .footer-top {
            font-size: 13px;
            border-bottom: 1px solid #7e7e7e;
            padding: 5px;
            color: #f5f3f3;
            display: flex;
            flex-direction: row;
            justify-content: space-between;

        }

        .left_1st img {
            width: 10px;
            margin-right: 12px;
            margin-left: 7px;
        }

        .copyright {
            padding-right: 160px;
        }

        .footer-law {
            margin-right: 12px;
        }

        .footer-bottom {
            font-size: 0.64em;
            display: flex;
            color: #f5f3f3;

            letter-spacing: 0.02em;
            flex-direction: row;
            justify-content: space-between;
            padding: 8px 0px 8px 8px;

        }

        .footer-bottom a {
            text-decoration: underline;
            color: #ccc;
        }

    </style>
</head>
<footer>
    <section class="footer_bottom_wrap">
        <div class="footer-top">
            <div class="left_1st">
                <img src="/assets/img/location.png" alt="">
                <span>대한민국 강남구 서울특별시 강남구 테헤란로7길 7 </span>
            </div>
            <span class="copyright">© 2023 SamJo Company. All Rights Reserved</span>
            <span class="footer-law">이용약관 | 개인정보처리방침</span>
        </div>
        <div class="footer-bottom">
            <p>
                2023-서울강남-0508-0526 | 3조 [삼조상사] | 팀원 [ 김혜영 | 한세진 | 이상욱 | 김지승 | 홍성준 ]<br>
            </p>
            <p>
                중앙정보기술인재개발원 | 연락처 02-561-1911
                <a href="http://www.choongang.co.kr/">&nbsp사업자 정보 확인</a></p>
            <p class="footer-law">
                개인정보 보허법에 의한 개인정보 개인정보 수집·이용·제공 및 개인정보의 처리 안내
                <a href="https://www.privacy.go.kr/front/main/main.do">&nbsp자세히보기</a>
            </p>
        </div>
    </section>
</footer>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>header</title>
    <link rel="stylesheet" href="css/style.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <style>
        footer {
            width: 100%;
            min-height: 180px;
            margin-top: 40px;
            padding: 30px 50px 30px 50px;
            position: absolute;
            z-index: 9;
            background-color: white;
            border-top: 1px solid #f1f1f1;
            box-sizing: border-box;
        }

        footer a {
            display: inline-block;
            margin: 15px 20px 10px 20px;
            color: gray; font-size: 16px;
        }

        footer a:visited {
            color: gray;
        }

        footer p {
            margin-top: 0; margin-bottom: 0;
        }

        footer p span {
            display: inline-block;
            margin-left: 20px;
        }
    </style>
</head>


<body>
<footer>
    <p>
        <span>상호 : (주)water</span><br/>
        <span>사업자등록번호 : 123-12-56789</span><br/>
        <span>대표번호 : 053-123-4567</span><br/>
        <span>주소 : 대구광역시 동구 동내로70 (첨단정보통신융합산업기술원 302호)</span><br/>
        <span>© CHERRY Corp. All rights reserved.</span>
    </p>
    <nav>
        <a href="https://github.com/whatpill1/water_web_ver3.git" style="text-decoration-line: none;">저희의 Github가 궁금하시다구요?</a>
    </nav>
</footer>
</body>
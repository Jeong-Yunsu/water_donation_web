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
        .loginlogout {
            border: none;
            background-color: white;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 17px;
            cursor: pointer;
            margin: 10px;
        }
        *{
            font-family: 'Nanum Gothic', cursive;
        }
        header {
            width: 100%;
            height: 64px;
        }
        nav {
            position: relative;
            margin: 0px auto;
        }
        nav ul {
            position: relative; top: 0; padding-right: 170px;
        }
    </style>
</head>

<body>

<header class="site_header">
    <a href="/main" class="logo">
        logo
    </a>
    <nav>
        <ul class="menu">
            <li><a href="/notice" class="link">공지사항</a></li>
            <li><a href="/donainglistall" class="link">기부 카테고리</a></li>
            <li><a href="/map" class="link">내 주위</a></li>
            <li><a href="/store" class="link">기부 스토어</a></li>
        </ul>
    </nav>
    <div style="position: absolute; top: 10px; right: 0px; float: right; text-align:center ; width: 500px">
    <c:if test="${sessionScope.mbr_id==null }">
        <input type="button" class="loginlogout" onclick="location.href='login'" value="로그인" style="float: right; padding-right: 10px"/>
    </c:if>
    <c:if test="${sessionScope.mbr_id!=null }">

        <!-- 관리자만 관리자페이지 뜸 -->
        <c:if test="${user.verify==9 }">
                <input type="button" class="loginlogout" onclick="location.href='indexlist'" value="관리자 화면" style="float: right; padding-right: 10px"/>
        </c:if>
        <input type="button" class="loginlogout" onclick="location.href='mypage'" value="마이페이지" style="float: right"/>
        <form action="/logout" method="post" style="margin: 0 auto; float: right">
            <input type="submit" class="loginlogout" value="로그아웃"/>
        </form>
    </c:if>
    </div>
</header>
</body>
</html>
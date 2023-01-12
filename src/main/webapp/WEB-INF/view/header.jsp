<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>header</title>
    <link rel="stylesheet" href="css/style.css" />
    <style>
        .loginlogout {
            border: none;
            background-color: white;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 17px;
            cursor: pointer;
            margin: 10px;
        }
    </style>
</head>

<body>

<header class="site_header" style="width: 100%; height: 64px;">
    <a href="/main" class="logo">
        logo
    </a>
    <nav style="position: relative; margin: 0 auto; ">
        <ul class="menu" style="position: relative; top: 0px; padding-right: 170px">
            <li><a href="/intro" class="link">소개</a></li>
            <li><a href="/donainglistall" class="link">기부 카테고리</a></li>
            <li><a href="/map" class="link">내 주위</a></li>
            <li><a href="#" class="link">기부 스토어</a></li>
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
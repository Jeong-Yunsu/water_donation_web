<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Water - 투명하게</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/info.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<style>
    body {
        background-color: white;
    }
</style>

<body>
<%@ include file="header.jsp"%>

<script defer src="./scripts.js"></script>

<div class="container mt-3" style="padding-top: 50px; margin: 0 auto; padding-right: 25px;">
    <h2></h2>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ul>
        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/fox.jpg" width="1100" height="500">
                <div class="info" style="position: absolute">
                    <p class="name">여우는 줠라 귀엽습니다.</p>
                    <p class="group">인정 하십니까?</p>
                    <p class="d-day">인정 합니다.</p>
                    <div class="progressBar">
                        <span class="bar chartAnimate active" style="width: 19%"></span>
                    </div>
                    <div class="progressInfo">
                        <p class="amount">..</p>
                        <p class="percent">..</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/fox2.jpg"  width="1100" height="500">
                <div class="info" style="position: absolute">
                    <p class="name">여우는 줠라 귀엽습니다.</p>
                    <p class="group">인정 하십니까?</p>
                    <p class="d-day">인정 합니다.</p>
                    <div class="progressBar">
                        <span class="bar chartAnimate active" style="width: 19%"></span>
                    </div>
                    <div class="progressInfo">
                        <p class="amount">..</p>
                        <p class="percent">..</p>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/tiger.jpg"  width="1100" height="500">
                <div class="info" style="position: absolute">
                    <p class="name">여우는 줠라 귀엽습니다.</p>
                    <p class="group">인정 하십니까?</p>
                    <p class="d-day">인정 합니다.</p>
                    <div class="progressBar">
                        <span class="bar chartAnimate active" style="width: 19%"></span>
                    </div>
                    <div class="progressInfo">
                        <p class="amount">..</p>
                        <p class="percent">..</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev" style="width: 10%">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" data-slide="next" style="width: 10%">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
</div>




<style>

    .Maincardarea {
        display: block;
        margin: 80px auto 0;
        width: 1100px;
    }


    .Maincardarea_text {
        font-size: 25px;
        font-weight: 900;
        line-height: 1.2;
    }

    .Maincardarea_link {
        color: black;
        display: inline-block;
        vertical-align: top;
    }

    .Maincarearea_icon {
        position: relative;
        width: 12px;
        height: 24px;
        margin: 5px 0 0 8px;
    }

    .Maincarearea_icon::before {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        width: 12px;
        height: 12px;
        -ms-transform: translate(-50%,-50%) rotate(45deg);
        transform: translate(-50%,-50%) rotate(45deg);
        border-top: 2px solid #000;
        border-right: 2px solid #000;
    }

    .Donacard_list {
        overflow: hidden;
        margin-top: 20px;
    }

    .Donacard_image {
        margin: 10px auto 0;
        float: left;
        position: relative;
        width: 267px;
        height: 363px;
        background-color: #fff;
        font-family: NanumSquareWebFont,dotum,Sans-serif;
    }

    .Donacard_image::after {
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        border: 1px solid rgba(0,0,0,.11);
        content: "";
        margin-left: 10px;
    }

    .Donacard_title {
        overflow: hidden;
        text-overflow: ellipsis;
        display: block;
        display: -webkit-box;
        height: 50px;
        line-height: 25px;
        word-wrap: break-word;
        word-break: break-all;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        font-size: 17px;
        letter-spacing: -.5px;
        color: #333;
    }

    .Donacard_orga {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        margin-top: 8px;
        font-family: NanumBarunGothic,dotum,Sans-serif;
        font-size: 15px;
        color: #828282;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
    }


</style>

<div class="Maincardarea">
    <h3 class="Maincardarea_text">
        <a href="#" class="Maincardarea_link" style="text-decoration: none; color: inherit;" > 기부 목록 <i class="Maincarearea_icon"></i></a>
    </h3>
    <ul class="Donacard_list">
        <li style="display: inline-block; vertical-align: top;">
            <c:forEach items="${main1}" var="main1">
                <jsp:useBean id="now1" class="java.util.Date" />
                <fmt:formatDate value="${now1}" pattern="yyyy-MM-dd" var="today1" />
                <c:if test="${main1.cntr_end_dt >= today1}">
                <a href="/view?n=${main1.cntr_sn}" class="Donacard_image" style="text-decoration-line: none;">
                    <div class="Donacard_imagelist" style="width: 257px; height: 205px; background-color: white; margin-left: 10px">
                        <img src=${main1.cntr_file_id} width="100%" height="200">
                    </div>
                    <div class="Donacard_content" style="width: 257px; padding:21px 20px 0; margin-left: 10px">
                        <strong class="Donacard_title" style="color: black; " >${main1.cntr_ttl}</strong>
                        <div class="Donacard_orga" style="color: black; ">${main1.cntr_rcvfvr}</div>
                        <div class="Donacard_orga" style="color: black;"><strong>${main1.percent} %</strong><strong style="float: right"><fmt:formatNumber value="${main1.ctbny_pc}" pattern="#,###"/>원</strong></div>
                    </div>
                </a>
            </c:if>
            </c:forEach>
        </li>
    </ul>
</div>

<div class="Maincardarea">
    <h3 class="Maincardarea_text">
        <a href="#" class="Maincardarea_link" style="text-decoration: none; color: inherit;" > 대충 재능 기부 <i class="Maincarearea_icon"></i></a>
    </h3>
    <ul class="Donacard_list">
        <li style="display: inline-block; vertical-align: top;">
            <c:forEach items="${main2}" var="main2">
                <jsp:useBean id="now2" class="java.util.Date" />
                <fmt:formatDate value="${now2}" pattern="yyyy-MM-dd" var="today2" />
                <c:if test="${main2.cntr_end_dt >= today2}">
                <a href="/view?n=${main2.cntr_sn}" class="Donacard_image" style="text-decoration-line: none;">
                    <div class="Donacard_imagelist" style="width: 257px; height: 205px; background-color: white; margin-left: 10px">
                        <img src=${main2.cntr_file_id} width="100%" height="200">
                    </div>
                    <div class="Donacard_content" style="width: 257px; padding:21px 20px 0; margin-left: 10px">
                        <strong class="Donacard_title" style="color: black">${main2.cntr_ttl}</strong>
                        <div class="Donacard_orga" style="color: black;">${main2.cntr_rcvfvr}</div>
                        <div class="Donacard_orga" style="color: black;"><strong>${main2.percent} %</strong><strong style="float: right"><fmt:formatNumber value="${main2.ctbny_pc}" pattern="#,###"/>원</strong></div>
                    </div>
                </a>
            </c:if>
            </c:forEach>
        </li>
    </ul>
</div>

<div class="Maincardarea">
    <h3 class="Maincardarea_text">
        <a href="#" class="Maincardarea_link" style="text-decoration: none; color: inherit;" > 자투리 상품 기부 <i class="Maincarearea_icon"></i></a>
    </h3>
    <ul class="Donacard_list">
        <li style="display: inline-block; vertical-align: top;">
            <c:forEach items="${main3}" var="main3">
                <jsp:useBean id="now3" class="java.util.Date" />
                <fmt:formatDate value="${now3}" pattern="yyyy-MM-dd" var="today3" />
                <c:if test="${main3.cntr_end_dt >= today3}">
                <a href="/view?n=${main3.cntr_sn}" class="Donacard_image" style="text-decoration-line: none;">
                    <div class="Donacard_imagelist" style="width: 257px; height: 205px; background-color: white; margin-left: 10px">
                        <img src=${main3.cntr_file_id} width="100%" height="200" style="margin-top: 5px;">
                    </div>
                    <div class="Donacard_content" style="width: 257px; padding:21px 20px 0; margin-left: 10px">
                        <strong class="Donacard_title" style="color: black">${main3.cntr_ttl}</strong>
                        <div class="Donacard_orga" style="color: black;">${main3.cntr_rcvfvr}</div>
                        <div class="Donacard_orga" style="color: black;"><strong>${main3.percent} %</strong><strong style="float: right"><fmt:formatNumber value="${main3.ctbny_pc}" pattern="#,###"/>원</strong></div>
                    </div>
                </a>
            </c:if>
            </c:forEach>
        </li>
    </ul>
</div>

</body>
</html>
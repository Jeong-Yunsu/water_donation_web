<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="d" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>진행중인 기부 현황</title>
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/donainglist.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<style>
    .sl_progressBarWrap {
        margin-top: 5px;
        width: 90%;
        height: 5px;
        position: relative;
        background-color: #e8e8e8;
        border-radius: 2.5px;
        margin-left: 15px;
    }
    .sl_bar {
        height: 5px;
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        background-color: #439A97;
        border-radius: 2.5px;
        -webkit-animation: animate-width 1.5s both;
        animation: animate-width 1.5s both;
    }
</style>

<body>
<div class="wrap">
    <div >
        <%@ include file="donaing.jsp"%>
    </div>
    <div role="main" class="content">
        <h3 class="content_title">여러분들의 소중한 기부를 기다리고 있어요</h3>
            <div class="card_wrap">
                <c:forEach items="${donainglistall}" var="donainglistall">
                    <jsp:useBean id="now" class="java.util.Date" />
                    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                    <c:if test="${donainglistall.cntr_end_dt >= today}">
                    <a class="card" href="/view?n=${donainglistall.cntr_sn}" style="text-decoration: none; color: black;">
                        <img src=${donainglistall.cntr_file_id} alt width="267" height="200" class="card_img">
                        <div class="card_content">
                            <strong class="card_title">${donainglistall.cntr_ttl}</strong>
                        </div>
                        <div class="card_content">
                            <div>${donainglistall.cntr_rcvfvr}</div>
                        </div>
                        <div class="card_content">
                            <strong>${donainglistall.percent} %</strong><strong style="float: right"><fmt:formatNumber value="${donainglistall.ctbny_pc}" pattern="#,###"/>원</strong>
                        </div>
                        <div class="sl_progressBarWrap">
                            <span class="sl_bar" style="width: ${donainglistall.percent}%"></span>
                        </div>
                    </a>
                    </c:if>
                </c:forEach>
            </div>
    </div>
</div>
</body>
</html>
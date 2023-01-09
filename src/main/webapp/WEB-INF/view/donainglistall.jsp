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
</head>

<body>
<div class="wrap">
    <div >
        <%@ include file="donaing.jsp"%>
    </div>
    <div role="main" class="content">
        <h3 class="content_title">여러분들의 소중한 기부를 기다리고 있어요</h3>
            <div class="card_wrap">
                <c:forEach items="${donainglistall}" var="donainglistall">
                    <a class="card" href="/view?n=${donainglistall.cntr_sn}" style="text-decoration: none; color: black;">
<%--                        <img src="https://bakey-api.codeit.kr/files/629/images/sunglasses.jpg" alt width="267" height="200" class="card_img">--%>
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
                    </a>
                </c:forEach>
            </div>
    </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기간 지난 기부</title>
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/donainglist.css">
</head>

<body>
<div class="wrap">
    <div>
        <%@ include file="dona.jsp"%>
    </div>
    <div role="main" class="content">
        <h3 class="content_title">소중한 기부 감사드려요</h3>
        <div class="card_wrap">
            <c:forEach items="${donamlrd}" var="donamlrd">
                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                <c:if test="${donamlrd.cntr_end_dt < today}">
                    <a class="card" href="/viewmlrdlist?n=${donamlrd.cntr_sn}" style="text-decoration: none; color: black;">
                        <img src=${donamlrd.cntr_file_id} alt width="267" height="200" class="card_img">
                        <div class="card_content">
                            <strong class="card_title">${donamlrd.cntr_ttl}</strong>
                        </div>
                        <div class="card_content">
                            <div>${donamlrd.cntr_rcvfvr}</div>
                        </div>
                        <div class="card_content">
                            <strong>${donamlrd.percent} %</strong><strong style="float: right"><fmt:formatNumber value="${donamlrd.ctbny_pc}" pattern="#,###"/>원</strong>
                        </div>
                    </a>
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>


</body>
</html>
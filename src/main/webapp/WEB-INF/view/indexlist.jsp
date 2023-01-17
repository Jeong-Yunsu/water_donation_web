<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기부글 목록</title>
    <link rel="stylesheet" href="css/indexregister.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<style>
    table {width: 1180px; margin-top: 10px; text-align: center; border-spacing: 10px}
    *{ font-family: 'Nanum Gothic', cursive;}
</style>

<body>
<%@ include file="header.jsp"%>

<section id="container">
    <%@ include file="indexaside.jsp"%>
    <div class="wrapper" style="margin-top: 50px; margin-right: 500px">
        <form role="form" method="post" autocomplete="off">
            <div class="wrap">
                <h2>기부글 목록</h2>
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
    <%--                    <th>내용</th>--%>
                        <th>목표금액</th>
                        <th>기부대상</th>
                        <th>기부방법</th>
                        <th>모금 시작일</th>
                        <th>모금 종료일</th>
                        <th>수혜자/수혜기관</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="list">
                        <tr>
                            <td>${list.cntr_sn}</td>
                            <td style="text-align: left">
                                <a style="text-decoration: none; color: black; font-weight: bold" href="indexview?n=${list.cntr_sn}">${list.cntr_ttl}</a>
                            </td>
    <%--                        <td>${list.cntr_cn}</td>--%>
                            <td><fmt:formatNumber value="${list.cntr_obctr}" pattern="###,###,###"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${list.cntr_category eq 0}">
                                        <span>어린이</span>
                                    </c:when>
                                    <c:when test="${list.cntr_category eq 1}">
                                        <span>노인</span>
                                    </c:when>
                                    <c:when test="${list.cntr_category eq 2}">
                                        <span>장애인</span>
                                    </c:when>
                                    <c:when test="${list.cntr_category eq 3}">
                                        <span>동물</span>
                                    </c:when>
                                    <c:when test="${list.cntr_category eq 4}">
                                        <span>기타</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${list.cntr_category2 eq 0}">
                                        <span>기부금</span>
                                    </c:when>
                                    <c:when test="${list.cntr_category2 eq 1}">
                                        <span>재능</span>
                                    </c:when>
                                    <c:when test="${list.cntr_category2 eq 2}">
                                        <span>상품</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td><fmt:formatDate value="${list.rgtr_dt}" pattern="yyyy-MM-dd"/></td>
                            <td>${list.cntr_end_dt}</td>
                            <td>${list.cntr_rcvfvr}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</section>

</body>
</html>

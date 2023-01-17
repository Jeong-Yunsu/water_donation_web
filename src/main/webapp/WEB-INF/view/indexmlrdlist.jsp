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
    table {width: 570px; margin-top: 10px; text-align: center; border-spacing: 13px}
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
                <table style="width: 100%">
                    <thead>
                    <tr>
                        <th>기부글 번호</th>
                        <th>소통글 번호</th>
                        <th>제목</th>
                        <th>소통글 작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${mlrdlist}" var="mlrdlist">
                        <tr>
                            <td>${mlrdlist.cntr_sn}</td>
                            <td>${mlrdlist.mlrd_sn}</td>
                            <td style="text-align: left; width: 100%">
                                <a href="indexmlrdview?q=${mlrdlist.mlrd_sn}">${mlrdlist.mlrd_ttl}</a>
                            </td>
    <%--                        <td>${list.cntr_cn}</td>--%>
                            <td><fmt:formatDate value="${mlrdlist.rgtr_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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

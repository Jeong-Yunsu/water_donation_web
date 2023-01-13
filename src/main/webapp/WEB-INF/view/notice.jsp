<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>소개</title>
    <link rel="stylesheet" href="css/style.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<style>
    .intro_image {
        margin: 100px;
    }
    body {
        height: 100%
    }
    .wrapper {
        position: relative;
        padding-bottom: 60px;
    }
</style>

<body>
<%@ include file="header.jsp"%>

<div class="wrapper">
    <div class="intro_image">
        <img src="images/dona.jpg"><a>음..</a>
    </div>
</div>
<div>
    <%@ include file="footer.jsp"%>
</div>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기부 카테고리</title>
    <link rel="stylesheet" href="css/dona.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<body>
<%@ include file="dona.jsp"%>

<div class="category-theme_area">
    <ul class="category-theme_inner">
        <li class="category-theme_item">
            <a href="/donainglistall" style="text-decoration-line: none;">
                <img src="images/mulbangul.png" width="70" height="70">
                <figure>전체</figure>
            </a>
        </li>
        <li class="category-theme_item">
            <a href="/donainglist?c=0" style="text-decoration-line: none;">
                <img src="images/child.png" width="70" height="70">
                <figure>아이들</figure>
            </a>
        </li>
        <li class="category-theme_item" >
            <a href="/donainglist?c=1" style="text-decoration-line: none;">
                <img src="images/old.png" width="70" height="70">
                <figure>어르신</figure>
            </a>
        </li>
        <li class="category-theme_item">
            <a href="/donainglist?c=2" style="text-decoration-line: none;">
                <img src="images/handi.png" alt="장애인" width="70" height="70">
                <figure>장애인</figure>
            </a>
        </li>
        <li class="category-theme_item">
            <a href="/donainglist?c=3" style="text-decoration-line: none;">
                <img src="images/animal.png" width="70" height="70">
                <figure>동물</figure>
            </a>
        </li>
        <li class="category-theme_item">
            <a href="/donainglist?c=4" style="text-decoration-line: none;">
                <img src="images/etc.png" width="70" height="70">
                <figure>기타</figure>
            </a>
        </li>
    </ul>
</div>
</body>
</html>
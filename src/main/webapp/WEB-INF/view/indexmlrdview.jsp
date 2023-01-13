<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기부글 자세히</title>
    <link rel="stylesheet" href="css/indexview.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<body>
<%@ include file="header.jsp"%>

<section id="container">
    <%@ include file="indexaside.jsp"%>
    <div class="wrapper">
        <form role="form" method="post" autocomplete="off">
            <input type="hidden" name="n" value="${mlrdview.cntr_sn}">
            <div class="wrap">

                <h2>기부 자세히 보기</h2>

                <div class="user_wrap">
                    <label>소통글 이름</label>
                    <span>${mlrdview.mlrd_ttl}</span>
                </div>

                <div class="user_wrap">
                    <label>이미지</label>
                    <span><img src="${mlrdview.mlrd_file_id}"/></span>
                </div>

                <div class="user_wrap">
                    <label style="margin-bottom: 10px">기부 내용</label>
                    <span>${mlrdview.mlrd_cn}</span>
                </div>

                <div class="button_wrap">
                    <button type="button" class="modify_button" onclick="location.href='indexmlrdmodify?n=${mlrdview.mlrd_sn}'">수정</button>
                    <form action="/indexmlrddelete" method="post">
                        <button type="button" id="delete_Btn" class="delete_button">삭제</button>
                    </form>
                </div>
            </div>
        </form>
    </div>
</section>

</body>
</html>
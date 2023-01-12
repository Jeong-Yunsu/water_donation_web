<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="css/mypage.css" />
</head>

<body>
<%@ include file="header.jsp"%>

<div type="button" class="wrapper" >
    <div class="wrap">
        <div>
            <c:forEach items="${mypage}" var="mypage">
                <h1 class="mypage_title">${mypage.mbr_nm}님의 마이페이지</h1>
                <form action="/mypage" method="post">
                    <div class="content_wrap">
                        <label>아이디</label>
                        <p class="contents">${mypage.mbr_id}</p>
                    </div>
                    <div class="content_wrap">
                        <label>닉네임</label>
                        <p class="contents">${mypage.mbr_ncnm}</p>
                    </div>
                    <div class="content_wrap">
                        <label>성별</label>
                        <p class="contents">${mypage.mbr_gen}</p>
                    </div>
                    <div class="content_wrap">
                        <label>전화번호</label>
                        <p class="contents">${mypage.mbr_tel}</p>
                    </div>
                    <div class="content_wrap">
                        <label>생일</label>
                        <p class="contents">${mypage.mbr_brthdy}</p>
                    </div>
                    <div class="content_wrap">
                        <label>이메일</label>
                        <p class="contents">${mypage.mbr_email}</p>
                    </div>
                    <div class="content_wrap">
                        <label>현재까지 내가 기부한 금액</label>
                        <p class="contents"><fmt:formatNumber value="${mypage.sum_btr_pc}" pattern="#,###"/>원</p>
                    </div>
                    </c:forEach>
                    <div class="content_wrap">
                        <label>기부 내역</label>
                        <c:forEach items="${userDonaDate}" var="userDonaDate">
                            <p class="contents" style="margin-top: 10px; margin-bottom: 15px"><fmt:parseDate value="${userDonaDate.dona_dt}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
                                <fmt:formatDate pattern="yyyy년 MM월 dd일 H시 mm분" value="${parsedDateTime}"/></p>
                            <a href="/view?n=${userDonaDate.dona_sn}" style="text-decoration-line: none; color: black;"><p class="contents" style="margin-bottom: 15px">${userDonaDate.dona_ttl}</p></a>
                            <p class="contents" style="margin-bottom: 80px"><fmt:formatNumber value="${userDonaDate.btr_pc}" pattern="#,###"/>원</p>
                        </c:forEach>
                    </div>
                </form>
                <div class="button_wrap">
                    <button class="modify_button" type="button" onclick="location.href='update'">정보 수정</button>
                </div>
                <div class="button_wrap">
                    <button class="modify_button" style="margin-bottom: 50px" type="button" onclick="delOk()">이전으로</button>
                </div>
        </div>
    </div>
</div>
</body>
</html>
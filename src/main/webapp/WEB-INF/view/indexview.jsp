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
            <input type="hidden" name="n" value="${donas.cntr_sn}">
            <div class="wrap">

                <h2>기부 자세히 보기</h2>

                <div class="user_wrap">
                    <label>기부명</label>
                    <span>${donas.cntr_ttl}</span>
                </div>

                <div class="user_wrap">
                    <label>이미지</label>
                    <span><img src="${donas.cntr_file_id}"/></span>
                </div>

                <div class="user_wrap">
                    <label style="margin-bottom: 10px">기부 내용</label>
                    <span>${donas.cntr_cn}</span>
                </div>

                <div class="user_wrap">
                    <label>수혜자/수혜기관</label>
                    <span>${donas.cntr_rcvfvr}</span>
                </div>

                <div class="se_wrap">
                    <label>기부 대상</label>
                    <c:choose>
                        <c:when test="${donas.cntr_category eq 0}">
                            <span>어린이</span>
                        </c:when>
                        <c:when test="${donas.cntr_category eq 1}">
                            <span>노인</span>
                        </c:when>
                        <c:when test="${donas.cntr_category eq 2}">
                            <span>장애인</span>
                        </c:when>
                        <c:when test="${donas.cntr_category eq 3}">
                            <span>동물</span>
                        </c:when>
                        <c:when test="${donas.cntr_category eq 4}">
                            <span>기타</span>
                        </c:when>
                    </c:choose>
                </div>

                <div class="se_wrap">
                    <label>기부 방법</label>
                    <c:choose>
                        <c:when test="${donas.cntr_category2 eq 0}">
                            <span>기부금</span>
                        </c:when>
                        <c:when test="${donas.cntr_category2 eq 1}">
                            <span>재능</span>
                        </c:when>
                        <c:when test="${donas.cntr_category2 eq 2}">
                            <span>상품</span>
                        </c:when>
                    </c:choose>
                </div>

                <!-- 기부방법이 기부금일때만 나오도록 해야하는디.... -->
                <div class="user_wrap">
                    <label>기부가격</label>
                    <span><fmt:formatNumber value="${donas.cntr_obctr}" pattern="###,###,###"/></span>
                </div>

                <div class="button_wrap">
                    <button type="button" class="modify_button" onclick="location.href='indexmodify?n=${donas.cntr_sn}'">수정</button>
                    <form action="/indexdelete" method="post">
                        <button type="button" class="delete_button" onclick="delUser()">삭제</button>
                    </form>
                </div>
            </div>
        </form>
    </div>
</section>

</body>
</html>

<script>

    function delUser() {
        var result = confirm("삭제하시겠습니까?");

        if (result) {
            alert("삭제되었습니다.");
        } else {
            return false
        }
    }

</script>
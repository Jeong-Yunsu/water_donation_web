<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>소통글 수정</title>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 주소저장 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- 뭐였지 -->
    <script src="/resources/ckeditor/ckeditor.js"></script> <!-- ck에디터 -->
    <script type="text/javascript" src="/js/adres.js" defer></script>
    <script type="text/javascript" src="/js/delOk.js" defer></script>

    <link rel="stylesheet" href="css/indexmodify.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

</head>

<body>
<%@ include file="header.jsp"%>

<section id="container">
    <%@ include file="indexaside.jsp"%>
    <div class="wrapper">
        <form role="form" method="post" autocomplete="off">
            <input type="hidden" name="mlrd_sn" value="${mlrdview.mlrd_sn}" />
                <div class="wrap">
                    <h2>상품 등록</h2>
                    <div class="user_wrap2">
                        <label for="mlrd_ttl">기부명</label>
                        <input class="user_input2" type="text" id="mlrd_ttl" name="mlrd_ttl" value="${mlrdview.mlrd_ttl}" />
                    </div>

                    <div class="user_wrap2">
                        <label for="mlrd_cn">기부내용</label>
                        <textarea class="user_input2" rows="5" cols="50" id="mlrd_cn" name="mlrd_cn">${mlrdview.mlrd_cn}</textarea>
                        <script>
                            var ckeditor_config = {
                                resize_enaleb : false,
                                enterMode : CKEDITOR.ENTER_BR,
                                shiftEnterMode : CKEDITOR.ENTER_P,
                                // filebrowserUploadUrl : "/admin/goods/ckUpload"
                            };
                            CKEDITOR.replace("mlrd_cn", ckeditor_config);
                        </script>
                    </div>

                    <div class="se_wrap_mod">
                        <label for="cntr_sn">어떤 기부글?</label>
                        <select class="se_input_mod" id="cntr_sn" name="cntr_sn">
                            <option value="${mlrdview.cntr_sn}" selected disabled hidden>${mlrdview.cntr_ttl}</option>
                            <c:forEach items="${mlrdlist}" var="mlrdlist">
                                <jsp:useBean id="now" class="java.util.Date" />
                                <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                                <c:if test="${mlrdlist.cntr_end_dt < today}">
                                    <option value="${mlrdlist.cntr_sn}">${mlrdlist.cntr_ttl}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="button_wrap">
                        <div class="login_button_wrap">
                            <button class="register_button" type="submit">수정</button>
                            <button class="back_button" type="button" onclick="delOk()">취소</button>
                        </div>
                    </div>
                </div>
        </form>
    </div>
</section>

</body>
</html>

<script>

    function delOk(){
        var result = confirm("이전 페이지로 돌아가시겠습니까?");

        if(result) {
            return location.href='indexview?n=${mlrd.cntr_sn}'
        } else {
            return false
        }
    }

    // 숫자만 들어가도록
    var regExp = /[^0-9]/gi;
    $("#cntr_obctr").keyup(function(){ numCheck($(this)); });
    function numCheck(selector) {
        var tempVal = selector.val();
        selector.val(tempVal.replace(regExp, ""));
    }

</script>
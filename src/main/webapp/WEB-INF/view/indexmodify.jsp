<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기부글 수정</title>
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
            <input type="hidden" name="cntr_sn" value="${donas.cntr_sn}" />
                <div class="wrap">
                    <h2>상품 등록</h2>
                    <div class="user_wrap2">
                        <label for="cntr_ttl">기부명</label>
                        <input class="user_input2" type="text" id="cntr_ttl" name="cntr_ttl" value="${donas.cntr_ttl}" />
                    </div>

                    <div class="user_wrap2">
                        <label for="cntr_cn">기부내용</label>
                        <textarea class="user_input2" rows="5" cols="50" id="cntr_cn" name="cntr_cn">${donas.cntr_cn}</textarea>
                        <script>
                            var ckeditor_config = {
                                resize_enaleb : false,
                                enterMode : CKEDITOR.ENTER_BR,
                                shiftEnterMode : CKEDITOR.ENTER_P,
                                // filebrowserUploadUrl : "/admin/goods/ckUpload"
                            };
                            CKEDITOR.replace("cntr_cn", ckeditor_config);
                        </script>
                    </div>

                    <div class="se_wrap2">
                        <label for="cntr_category">수혜자/수혜기관</label>
                        <input class="user_input2" type="text" id="cntr_rcvfvr" name="cntr_rcvfvr" value="${donas.cntr_rcvfvr}" required />
                    </div>

                    <div class="se_wrap2">
                        <label for="cntr_category">기부대상</label>
                        <select class="se_input2" id="cntr_category" name="cntr_category">
                            <option value="0">어린이</option>
                            <option value="1">어르신</option>
                            <option value="2">장애인</option>
                            <option value="3">동물</option>
                            <option value="4">기타</option>
                        </select>
                    </div>

                    <div class="se_wrap2">
                        <label for="cntr_category2">기부방법</label>
                        <select class="se_input2" id="cntr_category2" name="cntr_category2">
                            <option value="0">기부금</option>
                            <option value="1">재능</option>
                            <option value="2">상품</option>
                        </select>
                    </div>

                        <!-- 기부방법이 기부금일때만 나오도록 해야하는디.... -->
                    <div class="user_wrap2">
                        <label for="cntr_obctr">목표금액</label>
                        <input class="user_input2" type="text" id="cntr_obctr" name="cntr_obctr" value="${donas.cntr_obctr}"/>
                    </div>

<%--                    <!-- 파일 업로드좀;;;; -->--%>
<%--                    <div class="user_wrap">--%>
<%--                        <label>사진</label>--%>
<%--                        <input class="user_input" type="file" id="file" name="file" />--%>
<%--                    </div>--%>

                    <!-- 모금 마감날짜;;;; -->
                    <div class="user_wrap2">
                        <label>모금 마감날짜</label>
                        <input class="user_input2 datebox2" type = date  name = "cntr_end_dt" size=50 />
                    </div>

                    <div class="adres_wrap2">
                        <label>주소 등록</label>
                        <input class="adres_input2" style="width: 50%" type="text" id="sample4_postcode" placeholder="우편번호" readonly/>
                        <input class="adres_input2" style="width: 30%" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/><br>

                        <input class="adres_input2" type="text" name="cntr_adres1" id="sample4_roadAddress" placeholder="도로명주소" value="${donas.cntr_adres1}" readonly>
                        <input class="adres_input2" type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly/>
                        <span id="guide" style="color:#999;display:none"></span>
                        <input class="adres_input2" type="text" name="cntr_adres2" id="sample4_detailAddress" placeholder="상세주소" value="${donas.cntr_adres2}" readonly/>
                        <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
                        <%--                        <input type="hidden" id="cntr_adres" name="cntr_adres" value="" >--%>
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
            return location.href='indexview?n=${donas.cntr_sn}'
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
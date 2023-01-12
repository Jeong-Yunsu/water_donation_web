<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기부글 등록</title>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 주소저장 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- 뭐였지 -->
    <script src="/resources/ckeditor/ckeditor.js"></script> <!-- ck에디터 -->
    <script type="text/javascript" src="/js/adres.js" defer></script>

    <link rel="stylesheet" href="/css/indexregister.css" />
    <link rel="stylesheet" href="/css/signup.css" />
</head>

<body>
<%@ include file="header.jsp"%>

<section id="container">
    <%@ include file="indexaside.jsp"%>
    <div class="wrapper">
        <form role="form" method="post" autocomplete="off">
            <div class="wrap">
                <h2>기부글 등록</h2>
                <div class="user_wrap">
                    <label for="cntr_ttl">기부명</label>
                    <input class="user_input" type="text" id="cntr_ttl" name="cntr_ttl" required />
                </div>

                <div class="user_wrap">
                    <label for="cntr_cn">기부내용</label>
                    <textarea class="user_input" rows="5" cols="50" id="cntr_cn" name="cntr_cn" required></textarea>
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

                <div class="se_wrap">
                    <label for="cntr_rcvfvr">수혜자/수혜기관</label>
                    <input class="user_input" type="text" id="cntr_rcvfvr" name="cntr_rcvfvr" required />
                </div>

                <div class="se_wrap">
                    <label for="cntr_category">기부대상</label>
                    <select class="se_input" id="cntr_category" name="cntr_category">
                        <option value="0">어린이</option>
                        <option value="1">어르신</option>
                        <option value="2">장애인</option>
                        <option value="3">동물</option>
                        <option value="4">기타</option>
                    </select>
                </div>

                <div class="se_wrap">
                    <label for="cntr_category2">기부방법</label>
                    <select class="se_input" id="cntr_category2" name="cntr_category2">
                        <option value="0">기부금</option>
                        <option value="1">재능</option>
                        <option value="2">상품</option>
                    </select>
                </div>

                <!-- 기부방법이 기부금일때만 나오도록 해야하는디.... -->
                <div class="user_wrap">
                    <label for="cntr_obctr">목표금액</label>
                    <input class="user_input" type="text" id="cntr_obctr" name="cntr_obctr" />
                </div>

<%--                        <!-- 파일 업로드좀;;;; -->--%>
<%--                        <div class="user_wrap">--%>
<%--                            <label>사진</label>--%>
<%--                            <input class="user_input" type="file" id="file" name="file" />--%>
<%--                        </div>--%>

                <!-- 모금 마감날짜;;;; -->
                <div class="user_wrap">
                    <label>모금 마감날짜</label>
                    <input class="user_input datebox" type = date  name = "cntr_end_dt" size=50 required />
                </div>

                <div class="adres_wrap">
                    <label>주소 등록</label>
                    <input class="adres_input" style="width: 50%" type="text" id="sample4_postcode" placeholder="우편번호" readonly />
                    <input class="adres_input" style="width: 30%" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" /><br>
                    <input class="adres_input" type="text" name="cntr_adres1" id="sample4_roadAddress" placeholder="도로명주소" readonly />
                    <input class="adres_input" type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly />
                    <span id="guide" style="color:#999;display:none"></span>
                    <input class="adres_input" type="text" name="cntr_adres2" id="sample4_detailAddress" placeholder="상세주소" />
                    <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
<%--                    <input type="hidden" id="cntr_adres" name="cntr_adres" value="" >--%>
                        </div>

                <div class="button_wrap">
                    <div class="login_button_wrap">
                        <button class="login_button" type="submit" id="register_Btn">등록</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
</body>
</html>

<script>

    // 컨트롤러에서 데이터 받기
    var jsonData = JSON.parse('${ctgry}');
    console.log(jsonData);
    var cate1Arr = new Array();
    var cate1Obj = new Object();

    // 1차 분류 셀렉트 박스에 삽입할 데이터 준비
    for(var i = 0; i < jsonData.length; i++) {
        if(jsonData[i].level == "1") {
            cate1Obj = new Object();  //초기화
            cate1Obj.cateCode = jsonData[i].cateCode;
            cate1Obj.cateName = jsonData[i].cateName;
            cate1Arr.push(cate1Obj);
        }
    }

    // 1차 분류 셀렉트 박스에 데이터 삽입
    var cate1Select = $("select.ctgry1")
    for(var i = 0; i < cate1Arr.length; i++) {
        cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
            + cate1Arr[i].cateName + "</option>");
    }

    // 숫자만 들어가도록
    var regExp = /[^0-9]/gi;
    $("#cntr_obctr").keyup(function(){ numCheck($(this)); });
    function numCheck(selector) {
        var tempVal = selector.val();
        selector.val(tempVal.replace(regExp, ""));
    }

</script>

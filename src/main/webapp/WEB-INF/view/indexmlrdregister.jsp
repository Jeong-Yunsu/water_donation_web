<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>소통글 등록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!-- 뭐였지 -->
    <script src="/resources/ckeditor/ckeditor.js"></script> <!-- ck에디터 -->

    <link rel="stylesheet" href="/css/indexregister.css" />
    <link rel="stylesheet" href="/css/signup.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<body>
    <%@ include file="header.jsp"%>

    <section id="container">
        <%@ include file="indexaside.jsp"%>
        <div class="wrapper">
            <form role="form" method="post" autocomplete="off">
                    <div class="wrap">
                        <h2>기부 소통글 등록</h2>
                        <div class="user_wrap">
                            <label for="mlrd_ttl">소통글 제목</label>
                            <input class="user_input" type="text" id="mlrd_ttl" name="mlrd_ttl" required />
                        </div>

                        <div class="user_wrap">
                            <label for="mlrd_cn">소통글 내용</label>
                            <textarea class="user_input" rows="5" cols="50" id="mlrd_cn" name="mlrd_cn" required></textarea>
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

                        <div class="se_wrap">
                            <label for="cntr_sn">어떤 기부글?</label>
                            <select class="se_input" id="cntr_sn" name="cntr_sn">
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
                                <button class="login_button" type="submit" id="mlrdregister_Btn">등록</button>
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

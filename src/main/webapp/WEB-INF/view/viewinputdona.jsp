<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기부금 등록</title>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 주소저장 -->
    <script type="text/javascript" src="/js/adres.js" defer></script>

    <link rel="stylesheet" href="css/viewinputdona.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<body>
<%@ include file="header.jsp"%>


<div class="wrapper">
    <div class="wrap">
        <div style="text-align: center; margin-top: 60px; margin-bottom: 90px">
            <h2>${viewinput.cntr_ttl}</h2>
            <h4 style="font-weight: lighter">by ${viewinput.cntr_rcvfvr}</h4>
        </div>
        <div>
            <div class="sign">
                잠깐! 간편한 연말정산을 위해 꼭 확인해 주세요.
            </div>
            <div style="margin-bottom: 40px">
                기부금 세액공제를 편리하게 받으실 수 있도록 첫 결제 시에 아래와 같이 소득세법에 따라 회원님의 개인정보를 수집하고 있습니다. <br>
                동의 여부 선택 후 [확인] 버튼을 눌러주시면, 바로 결제 기부하실 수 있습니다.
            </div>
            <div class="sign">
                개인정보 수집/제공 동의 및 기부금 영수증 신청
            </div>
            <div style="margin-bottom: 22px; height: 150px; overflow-y:scroll">
                water에서는 회원께서 결제 기부하셨을 경우 소득세법에 따라 세액공제를 받으실 수 있도록 기부증빙(기부금 영수증) 국세청 등록 대행 을 하고 있습니다. (단, 기부금 영수증 발급이 가능한 단체 중 해피빈에 개인정보 수집 업무 위탁 및 국세청 등록 업무 대행에 동의한 단체에 한 함)
                <br>
                연말정산 간소화 시스템을 통해 기부금 세액공제를 받으시려면 개인정보 제공에 동의 후 입력해 주시기 바랍니다.
                <br>
                소득세법에 따른 개인정보 수집 안내<br>
                water에서는 기부금 영수증 발급 및 발급명세서 작성을 목적으로 소득세법 제160조의3, 소득세법 시행령 제113조 제1항, 제208조의3, 소득세법 시행규칙 제58조 조항에 의거하여 기부자의 이름, 주민등록번호, 주소를 수집합니다. 수집한 개인정보는 기부금 영수증 발급을 위해서만 사용되며, 관련 법령에 따라 5년간 보관됩니다.
                <br>
                개인정보를 입력하지 않을 경우 기부금 영수증 발급이 제한될 수 있습니다. (기부금 영수증 발급명세는 국세청 홈택스에서만 조회되며 우편으로는 발송되지 않습니다.)
                <br>
                기부금 영수증 발행을 위한 개인정보 제공 안내<br>
                수집한 개인정보는 기부금 영수증 발행과 기부내역의 신고에만 사용되며, 국세청과 기부금 영수증 발행기관에서 관련 법률에 따라 보관 후 파기합니다.
                <br>
                1. 국세청에 제공되는 정보 : 이름, 기부 일자, 금액, 주민등록번호<br>
                2. 모금단체에 제공되는 정보 : 아이디, 이름 일부분, 기부 일자, 금액, 주민등록번호 앞자리<br>
                3. 관련 법령 준수를 위해 해피빈이 보관하는 정보 : 이름, 기부 일자, 금액, 주민등록번호, 주소<br>
            </div>
        </div>

        <form role="form" method="post">
            <input type="hidden" name="cntr_sn" value="${viewinput.cntr_sn}" />
            <div class="box_wrap">
                <label>기부자명</label>
                <input class="box_input" type="text" id="btn_nm" name="btn_nm"/>
            </div>
            <div class="box_wrap">
                <label>기부금액을 쓰시오</label>
                <input class="box_input" type="text" id="btr_pc" name="btr_pc"/>
            </div>
            <div class="adres_wrap">
                <label>주소</label>
                <input class="adres_input" style="width: 50%" type="text" id="sample4_postcode" placeholder="우편번호" readonly />
                <input class="adres_input" style="width: 30%" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" /><br>
                <input class="adres_input" type="text" name="btr_adres1" id="sample4_roadAddress" placeholder="도로명주소" readonly />
                <input class="adres_input" type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly />
                <span id="guide" style="color:#999;display:none"></span>
                <input class="adres_input" type="text" name="btr_adres2" id="sample4_detailAddress" placeholder="상세주소" />
                <input type="hidden" id="sample4_extraAddress" placeholder="참고항목">
            </div>

            <div class="button_wrap">
                <div class=login_button_wrap">
                    <input type="hidden" name = "mbr_sn" value ="${user.mbr_sn}">
                    <button class="login_button" type="submit" id="makeDona_Btn" >기부하기</button>
                </div>
            </div>
            <div class="button_wrap">
                <div class="login_button_wrap">
                    <button class="login_button" type="button" onclick="delOk()">취소</button>
                </div>
            </div>
        </form>
    </div>
</div>


</body>
</html>

<script>
    function delOk(){
        var result = confirm("이전 페이지로 돌아가시겠습니까?");

        if(result) {
            return location.href='donainglistall';
        } else {
            return false
        }
    }
</script>
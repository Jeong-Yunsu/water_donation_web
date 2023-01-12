<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/signup/id.js" defer></script>
    <script type="text/javascript" src="/js/signup/password.js" defer></script>
    <script type="text/javascript" src="/js/signup/brthdy.js" defer></script>
    <script type="text/javascript" src="/js/signup/email.js" defer></script>
    <link rel="stylesheet" href="css/signup.css" />
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>

<body>
<div class="wrapper">
    <form action="/signup" method="post">
        <div class="wrap">
            <div class="logo_wrap">
                <a href="/main" class="logo">
                    logo
                </a>
            </div>
            <div class="id_wrap">
                <label>아이디</label>
                <input class="id_input" type="text" id="mbr_id" name="mbr_id" placeholder="아이디(2~12자의 영문, 숫자만 사용 가능합니다.)" oninput="checkId()" required><br>
                <span class="id_ok" style="font-weight: bold">사용가능한 아이디입니다.</span>
                <span class="id_already" style="font-weight: bold">이미 사용중인 아이디입니다.</span>
                <span class="id_check" style="font-weight: bold">2~12자의 영문, 숫자만 사용 가능합니다.</span>
            </div>
            <div class="pw_wrap">
                <label>비밀번호</label>
                <input class="pw_input" type="password" id="mbr_password" name="mbr_password" placeholder="비밀번호(8~16자의 영어, 숫자, 특수문자를 포함하세요.)" oninput="checkPassword()" required><br>
                <span style="font-weight: bold" id="check2"></span>
            </div>
            <div class="pwck_wrap">
                <label>비밀번호 확인</label>
                <input class="pwck_input" type="password" id="mbr_password2" name="mbr_password2" placeholder="비밀번호 확인" onchange="checkPassword2()" required><br>
                <span style="font-weight: bold" id="check"></span>
            </div>
            <div class="se_wrap">
                <label>회원구분</label>
                <select class="se_input" id="mbr_se" name="mbr_se">
                    <option value="0">기부자</option>
                    <option value="1">개인 수혜자</option>
                    <option value="2">기관 수혜자</option>
                </select>
            </div>
            <div class="user_wrap">
                <label>이름</label>
                <input class="user_input" type="text" id="mbr_nm" name="mbr_nm" required>
            </div>
            <div class="user_wrap">
                <label>닉네임</label>
                <input class="user_input" type="text" id="mbr_ncnm" name="mbr_ncnm" required>
            </div><br>
            <div class="gen_wrap">
                <label>성별</label>
                남성 <input type="radio" name="mbr_gen" value="남"/>
                여성 <input type="radio" name="mbr_gen" value="여"/>
            </div>
            <div class="tel_wrap">
                <label>전화번호</label>
                <input class="tel_input" type="text" name="mbr_tel" placeholder="전화번호(-를 제외하시오)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required>
            </div>
            <div class="brthdy_wrap">
                <label>생년월일</label>
                <input class="brthdy_input" type="text" style="width: 40%"  name="yy" id="yy" placeholder="년(4자)" oninput="handleInputLength(this, 4)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                <select class="brthdy_input" style="width: 20%" id="mm", name="mm">
                    <option value="">월</option>
                    <option value="01" >1</option>
                    <option value="02" >2</option>
                    <option value="03" >3</option>
                    <option value="04" >4</option>
                    <option value="05" >5</option>
                    <option value="06" >6</option>
                    <option value="07" >7</option>
                    <option value="08" >8</option>
                    <option value="09" >9</option>
                    <option value="10" >10</option>
                    <option value="11" >11</option>
                    <option value="12" >12</option>
                </select>
                <input class="brthdy_input" type="text" style="width: 20%" name="dd" id="dd" placeholder="일" oninput="handleInputLength(this, 2)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                <input type="hidden" id="mbr_brthdy" name="mbr_brthdy" value="" >
            </div>
            <div class="mail_wrap">
                <label>이메일(선택)</label>
                <input type="text" style="width: 48%" class="mail_input" id="user_email"><span style="height: 45px" id="middle">@</span><input type="text" style="width: 48%" class="mail_input" id="email_address" list="user_email_address" placeholder="ex) naver.com">
                <datalist class="mail_input" id="user_email_address">
                    <option value="naver.com"></option>
                    <option value="daum.com"></option>
                    <option value="gmail.com"></option>
                    <option value="직접입력"></option>
                </datalist>
                <input type="hidden" id="mbr_email" name="mbr_email" value="">
            </div>
            <div class="button_wrap">
                <div class=login_button_wrap">
                    <button class="login_button" type="submit" onclick="work()">가입하기</button>
                </div>
            </div>
            <div class="button_wrap">
                <div class="login_button_wrap">
                    <button class="login_button" type="button" onclick="delOk()">취소</button>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>

<script>
    function work() {
        var result = confirm("회원가입을 진행하겠습니까?");

        if (result) {
            return true;
        } else {
            return false;
        }
    }
    function delOk(){
        var result = confirm("이전 페이지로 돌아가시겠습니까?");

        if(result) {
            return history.go(-1);
        } else {
            return false
        }
    }
</script>
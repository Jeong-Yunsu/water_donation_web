<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css" />
</head>

<body>
<div class="wrapper">
    <div class="wrap">
        <div class="logo_wrap">
            <a href="/main" class="logo">
                logo
            </a>
        </div>
        <form action="/login" method="post">
            <form action="#" class="signin-form">
                <div class="login_wrap">
                    <div class="id_wrap">
                        <div class="id_input_box">
                            <input class="id_input" type="text" name="mbr_id" placeholder="아이디" required>
                        </div>
                    </div>
                    <div class="pw_wrap">
                        <div class="pw_input_box">
                            <input class="pw_input" type="password" name="mbr_password" placeholder="비밀번호" required>
                        </div>
                    </div>
                    <div class="button_wrap">
                        <div class=login_button_wrap">
                            <button class="login_button" type="submit">로그인</button>
                        </div>
                    </div>
                    <div class="button_wrap">
                        <div class=login_button_wrap">
                            <button class="login_button" type="button" onclick="location.href='signup'">회원가입</button>
                        </div>
                        <div>
                            <span style="color: red;">${message}</span>
                        </div>
                    </div>
                </div>
            </form>
        </form>
    </div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/style1.css">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" href="./assets/css/login.css">

<script src="./js/scroll.js"></script>
<title>Happy House</title>
</head>
<body>
	 <div id="login-box">
        <!-- left -->
        <div class="left">
            <div class="brand">
                <img src="./assets/img/logo/logo_happy_house.png" alt="Happy House" class="logo">
                <div class="name">Happy House</div>
            </div>
            <hr>
            <div class="slogan">
                "Bớt đi một đứa trẻ đau khổ <br> là thêm một người lớn hạnh phúc."
            </div>
        </div>
        <!-- right -->
        <div class="right">
            <h1>Đăng nhập</h1>
            <label>Tài khoản: </label>
            <input type="text" name="username"/>
            <label>Mật khẩu: </label>
            <input type="password" name="password"  />
            <a href="signUp.jsp"> Đăng kí </a>
            <input type="submit" name="signup_submit" value="Đăng nhập" />
        </div>
    </div>
</body>
</html>
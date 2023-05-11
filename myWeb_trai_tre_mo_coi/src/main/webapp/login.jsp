<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">

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
            <form action="login" class="form" method="post">
            	<h1>Đăng nhập</h1>
            	<%
            		String error = request.getAttribute("error")+"";
            		error = (error.equals("null")) ? "" : error;
            	%>
            	<div class="error">
            		<span style="color: red; font-size: 14px"> <%= error %> </span>
            	</div>
	            <label>Tên đăng nhập: </label>
	            <input type="text" name="username"/>
	            <label >Mật khẩu: </label>
	            <input type="password" name="password"  />
	            <a href="signUp.jsp"> Đăng kí </a>
	            <input type="submit" name="signup_submit" value="Đăng nhập" />
            </form>
        </div>
    </div>
</body>
</html>
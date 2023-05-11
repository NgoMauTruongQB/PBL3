<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" type="text/css" href="./assets/css/signUp.css">
<title>Sign up</title>
</head>
<body>
<form action="introducter_signup" method="post">
	<div id="login-box">
		<!-- left -->
		<div class="left">
			<div class="brand">
				<img src="./assets/img/logo/logo_happy_house.png" alt="Happy House"
					class="logo">
				<div class="name">Happy House</div>
			</div>
			<hr>
			<div class="slogan">
				"Bớt đi một đứa trẻ đau khổ <br> là thêm một người lớn hạnh phúc."
			</div>
		</div>
		<!-- right -->
		<div class="right">
			<h1>Đăng kí trở thành người giới thiệu</h1>
			<form action="" method="get" onsubmit="return validateForm()">
			<label>Phone number:</label>
			<input type="text" name="phone" required="required" />
			<label>Address: </label>
			<input type="text" name="address" id="username" required="required" /> 
			<label>Note: </label>
			<input type="text" name="note" id="email" required="required">
			 
			<input type="submit" name="submit" id="submit" value="Đăng kí" onclick="validateForm"/>
			</form>
				<%
            		String error = request.getAttribute("error")+"";
            		error = (error.equals("null")) ? "" : error;
            	%>
            	<div class="error">
            		<span style="color: red; font-size: 14px"> <%= error %> </span>
            	</div>
		</div>
	
	</div>
	</form>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" type="text/css" href="./assets/css/signUp1.css">
<title>Happy House</title>
</head>
<body>
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
			<h1>Đăng kí tài khoản</h1>
			<form action="" method="get" onsubmit="return validateForm()">
			<label>Họ và tên:</label>
			<input type="text" name="fullname" required="required" />
			<label>Tên người dùng: </label>
			<input type="text" name="username" id="username" required="required" /> 
			<label>Email: </label>
			<input type="email" name="email" id="email" required="required">
			<label>Mật khẩu: </label>
			<input type="password" name="password" id="password" required="required" /> 
			<label>Nhập lại mật khẩu: </label>
			<input type="password" name="password2" id="password2" required="required" /> 
			<input type="submit" name="submit" id="submit" value="Đăng nhập" onclick="validateForm"/>
			</form>
		</div>
	</div>
</body>
<script>
function validateForm() {
	const password = document.getElemetById("password").value;
	const password2 = document.getElemetById("password2").value;
	const username = document.getElemetById("username").value;
	const email = document.getElemetById("email").value;
	const fullname = document.getElemetById("fullname").value;

	if (password.length < 6 ){
		alert("Mật khẩu phải có ít nhất 7 kí tự !");
		return false;
	}

	if(password != password2){
		alert("Mật khẩu nhập lại không khớp !");
		return false;
	}

	if(username.length < 4 || username == null || username == ""){
		alert("Độ dài usename không đúng ! ");
		return false;
	}

	const emailRegex = '/^\\S+@\\S+\\.\\S+$/';
	if (!emailRegex.test(email)) {
		alert("Địa chỉ email không hợp lệ");
		return false;
	}
	return true;
}
</script>
</html>
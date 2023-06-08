<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<link rel="stylesheet" href="assets/css/signUp.css">
<title>Happy House</title>

</head>
<body>
	<%
		String error = request.getAttribute("error")+"";
		error = (error.equals("null")) ? "" : error;
		
		String username = request.getAttribute("username")+"";
		username = (username.equals("null")) ? "" : username;
		
		String name = request.getAttribute("name")+"";
		name = (name.equals("null")) ? "" : name;
		
		String email = request.getAttribute("email")+"";
		email = (email.equals("null")) ? "" : email;
	%>	
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
			<form action="register" class="form" method="post" >
				<label>Họ và tên:</label>  <span class="red" >*</span>
				<span class="red errName" style="display: none; font-size: 14px ">Không hợp lệ</span>
				<input type="text" name="name" required="required" id="name" value="<%= name  %>" />

				<label>Tên người dùng: </label>  <span class="red">*</span> 
				<span class="red errUsername" style="display: none; font-size: 14px">Không hợp lệ </span>
				<div class="red" id="error" style="display: inline; font-size: 14px">
				<%=error %>
				</div>
				<input type="text" name="username" id="username" required="required" value="<%=username %>"/> 

				<label>Email: </label>  <span class="red">*</span>
				<span class="red errEmail" style="display: none; font-size: 14px">Không hợp lệ</span>
				<input type="email" name="email" id="email" required="required" value="<%=email %>">

				<label>Mật khẩu: </label>  <span class="red">*</span>
				<span class="red errPassword" style="display: none; font-size: 14px">Không hợp lệ</span>
				<input type="password" name="password" id="password" required="required" onchange="checkPassword()" /> 

				<label>Nhập lại mật khẩu: </label>  <span class="red">*</span>
				<span class="red errPassword2" style="display: none; font-size: 14px">Không hợp lệ</span>
				<input type="password" name="password2" id="password2" required="required" onchange="checkPassword()" /> 

				<input type="submit" id="submit" value="Đăng kí" />
				
			</form>
			
		</div>
		<script src="js/validateForm.js"></script>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/register.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <title>Happy House</title>
</head>
<body>
	<%@ include file="headerUser.jsp" %>
    <div id="wrapper">
        <h2>Đăng kí trở thành người giới thiệu</h2>
        <hr>
    </div>

	<div id="register">
		<!-- left -->
		<div class="left">
			<img src="./assets/img/icon/TraiTim.png" alt="">
		</div>
		<!-- right -->
		<div class="right">
			<form action="introducter_signup" method="post">
                <input type="text" name="phone" required="required" placeholder="Số điện thoại" />
                <input type="text" name="address" required="required" placeholder="Địa chỉ"/> 
                <input type="text" name="note" required="required" placeholder="Ghi chú">
                <button type="submit" name="submit" id="submit"> Đăng kí </button>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/css/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <title>Happy House</title>
</head>

<body>
<%@ include file="headerUser.jsp" %>
<script>
  Success = <%= request.getAttribute("Success") %>;
  if (Success) {
    Swal.fire({
      icon: 'success',
      title: 'Đăng kí thành công',
      text: 'Bạn đã đăng kí thành công',
      confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = "index.jsp";
      }
    });
  }
</script>
<div id="wrapper">
    <h2>Đăng kí trở thành người nhận nuôi</h2>
    <hr>
</div>

	<div id="register">
		<div class="left">
			<img src="./assets/img/icon/TraiTim.png" alt="">
		</div>
		<div class="right">
			<form action="adopter_signup" method="post">
                <input type="text" name="phone" required="required" placeholder="Số điện thoại" />
                <input type="text" name="address" required="required" placeholder="Địa chỉ"/> 
                <input type="text" name="cccd" required="required" placeholder="CCCD/CMND"/>
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
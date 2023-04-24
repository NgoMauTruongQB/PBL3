<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
<link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
<link rel="stylesheet" href="./assets/css/insert.css">
<script src="./js/scroll.js"></script>
<title>Update User</title>
</head>
<body>
	<div class="container ">
		<%
			String uName = request.getAttribute("uName")+"";
			String uUsername = request.getAttribute("uUsername")+"";
			String uPassword = request.getAttribute("uPassword")+"";
			String uEmail = request.getAttribute("uEmail")+"";
			String uState = request.getAttribute("uState")+"";
			String uRole = request.getAttribute("uRole")+"";
			String userId = request.getAttribute("userId")+"";
			String uError = request.getAttribute("uError")+"";
        	uError = (uError.equals("null")) ? "" : uError;
		%>
        <!-- Bread Crumb -->
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="user_manage.jsp">Trẻ</a></li>
            <li><a href="#">Chỉnh sửa tài khoản</a></li>
        </ul>

        <!-- Infomation -->
        <div class="info" >
            <form action="user_controller" method="post">
                <input type="hidden" name="mod" value="updateUser">
                <div class="header-info">
                    <h2>Thông tin tài khoản</h2>
                </div>

                <hr>

                <div class="infoDiv">
                    <label for="iName"> Họ và tên: <span> * </span> </label>
                    <input type="text" name="uName" id="uName" required value="<%= uName%>">
                </div>
                <div class="infoDiv">
                    <label for="iName"> Tên tài khoản: <span> * </span> </label> 
                    <div class="red" name="uError" id="uError" style="display: inline; font-size: 14px; color:red;"><%= uError %></div> <br>
                    <input type="text" name="uUsername" id="uUsername" required value="<%= uUsername%>">
                </div>
                <div class="infoDiv">
                    <label for="uPassword">Mật khẩu: <span> * </span> </label> <br>
                        <input type="text" name="uPassword" id="uPassword" required value="<%= uPassword%>">
                </div>
                <div class="infoDiv">
                    <label for="uEmail">Email: <span> * </span> </label>
                        <input type="email" name="uEmail" id="uEmail" required value="<%= uEmail%>">
                </div>
                <div class="infoDiv">
                    <label for="uState">Trạng thái: <span> * </span> </label>
                    <div class="uState radioInput">
                        <div class="state-sub">
                            <input type="radio" name="uState" id="status-active" value="1" <% if(uState.equals("1")){ out.print("checked"); } %>>
                            <label for="status-active">Đang hoạt động</label>
                        </div>
                        <div class="state-sub">
                            <input type="radio" name="uState" id="status-inactive" value="0" <% if(uState.equals("0")){ out.print("checked"); } %>>
                        <label for="status-inactive">Không hoạt động</label>
                        </div>
                    </div>
                </div>
                <div class="infoDiv">
                    <label for="uRole"> Quyền: <span> * </span> </label>
                    <select name="uRole" id="uRole">
					    <option value="user" <%= (uRole.equals("user")) ? "selected" : "" %>>User</option>
					    <option value="admin" <%= (uRole.equals("admin")) ? "selected" : "" %>>Admin</option>
					    <option value="staff" <%= (uRole.equals("staff")) ? "selected" : "" %>>Staff</option>
					</select>

                </div> 
                <input type="hidden" name="userId" id="uId" value="<%= userId %>">
                <hr>
                <div class="footer-info">
                    <button type="submit">Lưu thông tin</button>
                </div>

            </form>
        </div>
    </div>
    <script src="./js/upload-img.js"></script>
</body>
</html>
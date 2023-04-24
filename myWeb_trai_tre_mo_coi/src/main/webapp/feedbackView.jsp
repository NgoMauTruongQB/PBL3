<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/view.css">
    <script src="./js/scroll.js"></script>
    <title>Happy House</title>
<body>
	<div class="container ">
	<%
		String name = request.getAttribute("name")+"";
		String gender = request.getAttribute("gender")+"";
		Date date = (Date) request.getAttribute("date");
		String phone = request.getAttribute("phone")+"";
		String email = request.getAttribute("email")+"";
		String positon = request.getAttribute("positon")+"";
		int state = (int) request.getAttribute("state");
		String photo = request.getAttribute("photo")+"";
		photo = (photo.equals("null")) ? "" : photo;
		double rating = (double) request.getAttribute("rating");
		int count = (int) request.getAttribute("count");
	%>

        <!-- Bread Crumb -->
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="feedback_manage.jsp">Đánh giá và phản hồi</a></li>
            <li><a href="#">Thông tin chi tiết</a></li>
        </ul>

        <!-- Image Profile -->
        <div class="imgDiv" >
            <div class="cover-image">
                <img src="assets/img/cover/cover.png" alt="Ảnh bìa" >
            </div>
            <div class="profile">
                <img src="uploads/staff/<%=photo %>" id="preview" class="square-image" alt="Ảnh đại diện" 
                	onerror="this.onerror=null;this.src='./assets/img/avatar/avatar.jpg';" >
            </div>
        </div> 

        <!-- Infomation -->
        <div class="info">
            <form action="">
                <div class="header-info">
                    <h2>Thông tin chi tiết</h2>
                </div>

                <hr>

                <div class="infoDiv">
                    <label for="vName"> Họ và tên: <span> * </span> </label> 
                    <input type="text" name="vName" id="vName"value="<%= name %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vGender">Giới tính: <span> * </span></label>
                    <div class="vGender radioInput">
                        <div class="gender-sub">
                            <input type="radio" name="vGender" id="male" value="Nam" <% if(gender.equals("Nam")){ out.print("checked"); } %>  disabled>
                            <label for="male">Nam</label>
                        </div>
                        <div class="gender-sub">
                            <input type="radio" name="vGender" id="female" value="Nữ" <% if(gender.equals("Nữ")){ out.print("checked"); } %>  disabled>
                            <label for="female">Nữ</label>
                        </div>
                    </div>
                </div> 
                <div class="infoDiv">
                    <label for="vDate"> Ngày sinh: <span> * </span> </label>
                    <input type="date" name="vDate" id="vDate" value="<%= date %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vPhone"> Số điện thoại: <span> * </span> </label>
                    <input type="tel" name="vPhone" id="vPhone" value="<%= phone %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vEmail"> Email: </label>
                    <input type="text" name="vEmail" id="vEmail" value="<%= email %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vPosition"> Chức vụ: </label>
                    <input type="text" name="vPosition" id="vPosition" value="<%= positon %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vState">Trạng thái: <span> * </span> </label>
                    <div class="vState radioInput" >
                        <div class="state-sub">
                            <input type="radio" name="vState" id="status-active" value="1" <% if(state == 1) { out.print("checked"); } %>  disabled>
                            <label for="status-active">Đang làm việc</label>
                        </div>
                        <div class="state-sub">
                            <input type="radio" name="vState" id="status-inactive" value="0" <% if(state == 0) { out.print("checked"); } %>>
                            <label for="status-inactive">Đã chuyển đi</label>
                        </div>
                    </div>
                </div>

                <div class="infoDiv">
                    <label for="vRating"> Đánh giá: </label>
                    <div class="star-ratings">
	              	<% for(int i = 0; i < 5; i++) { %>
	             		<% if (i < Math.floor(rating)) { %>
	             		 	<i class="fa-solid fa-star"></i>
	             		<% } else if (i == Math.floor(rating) && rating % 1 != 0) { %>
	             			<i class="fa-regular fa-star-half-stroke"></i>
	             		<% } else { %>
	             			<i class="fa-regular fa-star"></i>
	             		<%} %>
	              	<%} %>
	              	<div><%=  rating %> | <%= count %> lượt đánh giá</div>
                    </div>
                </div>

                <hr>

                <div class="footer-info">
                </div>

            </form>
        </div>
    </div>
    <script src="./js/upload-img.js"></script>
</body>
</html>
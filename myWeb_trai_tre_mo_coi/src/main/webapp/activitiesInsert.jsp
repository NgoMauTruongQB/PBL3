<%@page import="model.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.StaffDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/activities.css">
    <script src="./js/scroll.js"></script>
    <title>Charity activities Insert</title>
</head>
<body>
	<div class="container ">

        <!-- Bread Crumb -->
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="activities_manage.jsp">Hoạt động từ thiện</a></li>
            <li><a href="#">Thêm thông tin</a></li>
        </ul>

        <!-- Infomation -->
        <div class="info">
            <form action="activities_controller" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="mod" value="add">
                <div class="header-info">
                    <h2>Thông tin nhân viên</h2>
                </div>

                <hr>

                <div class="infoDiv">
                    <label for="uName"> Tên hoạt động: <span> * </span> </label> 
                    <input type="text" placeholder="Nắng về bản" name="uName" id="uName" required>
                </div>
                <div class="infoDiv">
                    <label for="uPurpose"> Mục đích của hoạt động: </label>
                    <input type="text" placeholder="Ủng hộ trẻ em vùng cao" name="uPurpose" id="uPurpose">
                </div>
                <div class="infoDiv">
                    <label for="uDateBegin"> Ngày bắt đầu: <span> * </span> </label>
                    <input type="date" name="uDateBegin" id="uDateBegin" required>
                </div>
                <div class="infoDiv">
                    <label for="uDateEnd"> Ngày kết thúc: <span> * </span></label>
                    <input type="date" name="uDateEnd" id="uDateEnd" required>
                </div>
                <div class="infoDiv">
                    <label for="uMoney">Số tiền cần quyên góp: <span> * </span></label>
                    <input type="number" placeholder="200000" name="uMoney" id="uMoney" required>
                </div>
                <div class="infoDiv">
                    <label for="uStaff"> Nhân viên phụ trách: <span> * </span> </label>
                    <select name="uStaff" id="uStaff" >
                        <% 	StaffDAO staffDao = new StaffDAO();
	                    	ArrayList<Staff> list = staffDao.selectAll();
		                	for( Staff st : list) {
	                	%>
	                        <option value="<%= st.getStaffID()%>"><%= st.getFullname() %></option>
	                    <% } %>
                    </select>
                </div>
                <div class="infoDiv">
                    <label for="file-input" class="custom-file-input">
                        <i class="fa fa-cloud-upload"></i> Tải lên tệp tin
                    </label>
                    <input type="file" id="file-input" name="file-input" accept="image/*"
                    data-hs-file-attach-options='{
                        "textTarget": "#avatarImg",
                        "mode": "image",
                        "targetAttr": "src",
                        "resetTarget": ".js-file-attach-reset-img",
                        "resetImg": "./assets/img/test/img1.jpg",
                        "allowTypes": [".png", ".jpeg", ".jpg"]
                    }'>
                </div>
                <hr>
                <div class="footer-info">
                    <button type="submit">Lưu thông tin</button>
                </div>

            </form>
            
        </div>

        <div class="imgDiv" >
            <div class="cover-image">
                <img src="assets/img/activities/activities.png" id="preview" alt="Ảnh bìa" >
            </div>
        </div>
    </div>
    <script src="./js/upload-img-activities.js"></script>
</body>
</html>
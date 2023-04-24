<%@page import="model.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.StaffDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/activities.css">
    <script src="./js/scroll.js"></script>
    <title>Charity activities Update</title>
</head>
<body>
	<div class="container ">
		<%
			String id = request.getAttribute("id")+"";
			String name = request.getAttribute("name")+"";
			Date date_begin = (Date) request.getAttribute("date_begin");
			Date date_end = (Date) request.getAttribute("date_end");
			Double money = (Double) request.getAttribute("money");
			String purpose = request.getAttribute("purpose")+"";
			String staffID = request.getAttribute("staffID")+"";
			String photo = request.getAttribute("photo")+"";
			photo = (photo.equals("null")) ? "" : photo;
			DecimalFormat df = new DecimalFormat("##0");
    		String formattedAmount = df.format(money);
			
		%>
        <!-- Bread Crumb -->
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="activities_manage.jsp">Hoạt động từ thiện</a></li>
            <li><a href="#">Chỉnh sửa thông tin</a></li>
        </ul>

        <!-- Infomation -->
        <div class="info">
            <form action="activities_controller" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="mod" value="update">
                <div class="header-info">
                    <h2>Thông tin hoạt động</h2>
                </div>

                <hr>

                <div class="infoDiv">
                    <label for="uName"> Tên hoạt động: <span> * </span> </label> 
                    <input type="text" name="uName" id="uName" required value="<%= name%>">
                </div>
                <div class="infoDiv">
                    <label for="uPurpose"> Mục đích của hoạt động: </label>
                    <input type="text" name="uPurpose" id="uPurpose" value="<%= purpose%>">
                </div>
                <div class="infoDiv">
                    <label for="uDateBegin"> Ngày bắt đầu: <span> * </span> </label>
                    <input type="date" name="uDateBegin" id="uDateBegin" required value="<%= date_begin%>">
                </div>
                <div class="infoDiv">
                    <label for="uDateEnd"> Ngày kết thúc: <span> * </span></label>
                    <input type="date" name="uDateEnd" id="uDateEnd" required value="<%= date_end%>">
                </div>
                <div class="infoDiv">
                    <label for="uMoney">Số tiền cần quyên góp: <span> * </span></label>
                    <input type="number" name="uMoney" id="uMoney" required value="<%= formattedAmount%>">
                </div>
                <div class="infoDiv">
                    <label for="iStaff"> Nhân viên phụ trách: <span> * </span> </label>
                    <select name="iStaff" id="iStaff" >
                    <% 
					   StaffDAO staffDao = new StaffDAO();
					   ArrayList<Staff> list = staffDao.selectAll();
					   for (Staff st : list) {
					      if (st.getStaffID().equals(staffID)) {
					         String staffName = st.getFullname();
					      }
					%>
					   <option value="<%= st.getStaffID() %>" <% if (st.getStaffID().equals(staffID)) { %>selected<% } %>>
					      <%= st.getFullname() %>
					   </option>
					<% } %>
                    </select>
                </div>
                <div class="infoDiv">
                    <label for="file-input" class="custom-file-input">
                        <i class="fa fa-cloud-upload"></i> Tải lên tệp tin
                    </label>
                    <input type="file" id="file-input" name="uPhoto" accept="image/*"
                    data-hs-file-attach-options='{
                        "textTarget": "#avatarImg",
                        "mode": "image",
                        "targetAttr": "src",
                        "resetTarget": ".js-file-attach-reset-img",
                        "resetImg": "./assets/img/activities/activities.png",
                        "allowTypes": [".png", ".jpeg", ".jpg"]
                    }'>
                </div>
                <input type="hidden" name="uId" id="uId" value="<%= id %>">

                <hr>

                <div class="footer-info">
                    <button type="submit">Lưu thông tin</button>
                </div>

            </form>
            
        </div>

        <div class="imgDiv" >
            <div class="cover-image">
                <img src="uploads/activities/<%=photo %>" id="preview" alt="Ảnh hoạt động" 
                	onerror="this.onerror=null;this.src='./assets/img/activities/activities.png';" >
            </div>
        </div>
    </div>
    <script src="./js/upload-img-activities.js"></script>
</body>
</html>
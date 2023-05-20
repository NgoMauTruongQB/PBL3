<%@page import="java.util.ArrayList"%>
<%@page import="database.StaffDAO"%>
<%@page import="model.Staff"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="assets/css/manage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="./js/scroll.js"></script>
    <title>Happy House | Manange</title>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Quản lí nhân viên</h1></div>

        <div class="operation">
            <!-- Thêm  -->
            <div class="insert">
                <a href="staffInsert.jsp"><button> <i class="fa-solid fa-plus"></i> Thêm mới </button></a>
            </div>
            
            <!-- Tìm kiếm -->
            <button onclick="showHideSearch()" > <i class="fa-solid fa-filter"></i> &nbsp; Tìm kiếm </button>

        </div>

        <div id="searchDiv">
            <div class="search-form">
                <form class="search-form-js" >
                    <input type="text" name="sName" id="sName" placeholder="Họ và tên" onkeyup="searchName()">
                    <input type="email" name="sEmail" id="sEmail" placeholder="Email" onkeyup="searchEmail()">
                    <input type="text" name="sPosition" id="sPosition" placeholder="Chức vụ" onkeyup="searchPosition()" >
                    <input type="tel" name="sPhone" id="sPhone" placeholder="Số điện thoại" onkeyup="searchPhone()" >
                    <input type="date" name="sDate" id="sDate" placeholder="Ngày sinh">
                    <select name="sGender" id="sGender" onchange="searchGender()">
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                    </select>
                    <button type="submit" id="search" >
                        <i class="fa-solid fa-magnifying-glass"></i>
                        Tìm kiếm
                    </button>
                </form>
            </div>
        </div>
		<%
			String notification = request.getAttribute("notification")+"";
	 		notification = (notification.equals("null")) ? "" : notification;
			if (!notification.isEmpty()) { %>
			  <script>
			    alert("<%= notification %>");
			  </script>
		<% } %>
        <!-- Bảng -->
        <div class="table" >
        	<table style="width: 100%; overflow-x: auto;">
        	<%
        	StaffDAO std = new StaffDAO();
        	ArrayList<Staff> list = std.selectAll();
        	%>
	            <thead>
	                <tr>
                        <th>Ảnh</th>
	                    <th>ID</th>
	                    <th onclick="sortTable(2)">  Họ và tên  &nbsp; <i class="ti-exchange-vertical"></i>  </th>
	                    <th onclick="sortTable(3)"> Giới tính &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(4)"> Ngày sinh &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(5)">Chức vụ &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th>Email </th>
                        <th>Số điện thoại</th>
	                    <th onclick="sortTable(8)">Trạng thái &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% for (Staff st : list) { %>
	             <%
                   java.sql.Date dateOfBirth = st.getDate_of_birth();
                   SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                   String formattedDateOfBirth = dateFormat.format(dateOfBirth);
                  %>
                    <tr>
                        <td>
                            <img src="uploads/staff/<%= st.getPhoto() %>" alt="Ava" class="image-class" onerror="this.onerror=null;this.src='./assets/img/avatar/avatar.jpg';">
                        </td>
	                    <td><%= st.getStaffID() %></td>
	                    <td class="editable "><%= st.getFullname() %></td>
	                    <td class="editable"><%= st.getGender() %></td>
						<td class="editable"><%= formattedDateOfBirth %></td>
	                    <td class="editable"><%= st.getPosition() %></td>
	                    <td class="editable"><%= st.getEmail() %></td>
                        <td class="editable"><%= st.getPhone() %></td>
	                    <td class="editable">
	                    <%if (st.getState() ==1 ){ %>
	                    <%= "Đang làm việc" %> <%} else { %>
	                    <%= "Nghỉ việc" %> <%} %>
                        <td>
	                    	<button class="edit" onclick="editStaff('<%= st.getStaffID() %>')">Sửa</button>
						    <button class="delete" onclick="confirmDelete('<%= st.getStaffID() %>')">Xoá</button>
						</td>
	                </tr>
	            <%} %>
	            <script>
	            function editStaff(id) {
	            	  window.location.href = "staff_controller?id=" + id + "&mod=getInfo";
	            	}
	            function confirmDelete(id) {
	            	console.log(id);
	                if (confirm("Bạn có chắc chắn muốn xoá nhân viên này?")) {
	                    window.location.href = "staff_controller?id=" + id + "&mod=deleteStaff";
	                }
	            }				
	            </script>      
	            </tbody>
	        </table>
            <div id="pagination">
                <button id="prev-page">Previous</button>
                <button id="next-page">Next</button>
            </div>
        </div>
    <script src="./js/table.js"></script>
    <script src="./js/staffAction.js"></script>
</body>
</html>
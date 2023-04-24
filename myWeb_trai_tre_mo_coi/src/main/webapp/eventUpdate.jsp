<%@page import="java.sql.Date"%>
<%@page import="model.Staff"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.StaffDAO"%>
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
    <link rel="stylesheet" href="./assets/css/subManage.css">
    <script src="./js/scroll.js"></script>
    <title> Event Update</title>
</head>
<body>
	<div class="container ">
		<%
			String id = request.getAttribute("id")+"";
			String name = request.getAttribute("name")+"";
	       	String loction = request.getAttribute("location")+"";
	       	String staffID = request.getAttribute("staffID")+"";
	       	String staffName = request.getAttribute("staffName")+"";
	       	int number = (int) request.getAttribute("number");
	       	Date dateBegin = (Date) request.getAttribute("dateBegin");
	       	Date dateEnd = (Date) request.getAttribute("dateEnd");
	       	int state = (int) request.getAttribute("state");
	       	String content = request.getAttribute("content")+"";
	       	content = (content.equals("null")) ? "" : content;
		%>
        <!-- Bread Crumb -->
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="event_manage.jsp">Sự kiện</a></li>
            <li><a href="#">Chỉnh sửa thông tin</a></li>
        </ul>

        <!-- Infomation -->
        <div class="info" >
            <form action="event_controller" method="get">
                <input type="hidden" name="mod" value="update" >
                <div class="header-info">
                    <h2>Thông tin chi tiết hoạt động</h2>
                </div>
                <hr>
                <div class="infoDiv">
                    <label for="iName">Tên hoạt động: <span> * </span> </label> 
                    <input type="text" placeholder="Tham quan sở thú" name="iName" id="iName" required value="<%= name %>" >
                </div>
                <div class="infoDiv">
                    <label for="iLocation">Địa điểm:<span> * </span> </label> <br>
                    <input type="text" placeholder="Đà Nẵng" name="iLocation" required id="iLocation" value="<%= loction %>" >
                </div>
                <div class="infoDiv">
                    <label for="iStaff"> Nhân viên phụ trách: <span> * </span> </label>
                    <select name="iStaff" id="iStaff" >
                    <% 
					   StaffDAO staffDao = new StaffDAO();
					   ArrayList<Staff> list = staffDao.selectAll();
					   for (Staff st : list) {
					      if (st.getStaffID().equals(staffID)) {
					         staffName = st.getFullname();
					      }
					%>
					   <option value="<%= st.getStaffID() %>" <% if (st.getStaffID().equals(staffID)) { %>selected<% } %>>
					      <%= st.getFullname() %>
					   </option>
					<% } %>
                    </select>
                </div>
                <div class="infoDiv">
                    <label for="iNumber"> Số lượng trẻ tham gia: <span> * </span></label>
                    <input type="number" name="iNumber" id="iNumber" required value="<%= number %>">
                </div>
                <div class="infoDiv">
                    <label for="iDateBegin"> Ngày bắt đầu: <span> * </span> </label>
                    <input type="date" name="iDateBegin" id="iDateBegin" required value="<%= dateBegin %>">
                </div>
                <div class="infoDiv">
                    <label for="iDateEnd"> Ngày kết thúc: <span> * </span></label>
                    <input type="date" name="iDateEnd" id="iDateEnd" required value="<%= dateEnd %>">
                </div>
                <div class="infoDiv">
                    <label for="iSate">Tình trạng: <span> * </span></label>
                    <div class="iSate radioInput">
                        <div class="gender-sub">
                            <input type="radio" name="iSate" id="" value="0" <% if(state == 0) { out.print("checked"); } %>>
                            <label for="">Chưa diễn ra</label>
                        </div>
                        <div class="gender-sub">
                            <input type="radio" name="iSate" id="" value="1" <% if(state == 1) { out.print("checked"); } %>>
                            <label for="">Đã diễn ra</label>
                        </div>
                    </div>
                </div>
                <div class="infoDiv">
                    <label for="iContent"> Thông tin hoạt động:</label>
                    <input type="text" name="iContent" id="iContent" value="<%= content %>">
                </div>
                <input type="hidden" name="uId" id="uId" value="<%= id %>">
                <hr>
                <div class="footer-info">
                    <button type="submit">Lưu thông tin</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
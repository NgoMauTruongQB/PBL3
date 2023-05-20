<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Charity_activities"%>
<%@page import="database.Charity_activitiesDAO"%>
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
    <link rel="stylesheet" href="assets/css/manage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="./js/scroll.js"></script>
    <title>Document</title>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Quản lí hoạt động từ thiện</h1></div>

        <div class="operation">
            <!-- Thêm  -->
            <div class="insert">
                <a href="activitiesInsert.jsp"><button> <i class="fa-solid fa-plus"></i> Thêm mới </button></a>
            </div>
            
            <!-- Tìm kiếm -->
            <button onclick="showHideSearch()" > <i class="fa-solid fa-filter"></i> &nbsp; Tìm kiếm </button>

        </div>

        <div id="searchDiv">
            <div class="search-form">
                <form >
                    <input type="text" name="sName" id="sName" placeholder="Tên hoạt động" onkeyup="searchName()">
                    <input type="text" name="sPurpose" id="sPurpose" placeholder="Số tiền cần quyên góp" onkeyup="searchPurpose()">
                    <input type="date" name="sDateBegin" id="sDateBegin" onchange="searchDateBegin()" >
					<input type="date" name="sDateEnd" id="sDateEnd" onchange="searchDateEnd()" >
                    <input type="text" name="sStaff" id="sStaff" placeholder="Nhân viên" onkeyup="searchStaff()">
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
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th> Tên hoạt động</th>
	                    <th> Số tiền cần khuyên góp</th>
	                    <th> Ngày tổ chức</th>
                        <th> Ngày kết thúc </th>
	                    <th> Nhân viên phụ trách </th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% 	Charity_activitiesDAO acDao = new Charity_activitiesDAO();
	            	ArrayList<Charity_activities> list = acDao.selectAll();
	            	for( Charity_activities c : list) {
	            		DecimalFormat df = new DecimalFormat("#,##0");
	            		String formattedAmount = df.format(c.getMoney_collected());
	            		java.sql.Date dateBegin = c.getDate_begin();
	 	                java.sql.Date dateEnd = c.getDate_end();
	                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	                    String formatDateBegin = dateFormat.format(dateBegin);
	                    String formatDateEnd = dateFormat.format(dateEnd);
	            %>
                    <tr>
	                    <td><%= c.getActivityID() %></td>
	                    <td class="editable"><%= c.getName_of_activity() %></td>
	                    <td class="editable"><%= formattedAmount  %></td>
	                    <td class="editable"><%= formatDateBegin %></td>
	                    <td class="editable"><%= formatDateEnd %></td>
	                    <td class="editable"><%= c.getStaff().getFullname() %></td>
                        <td>
	                    	<button class="edit" onclick="edit('<%= c.getActivityID() %>')">Sửa</button>
						    <button class="delete" onclick="confirmDelete('<%= c.getActivityID() %>')">Xoá</button>
						</td>
	                </tr>
                <% } %>
                <script>
	            function edit(id) {
	            	  window.location.href = "activities_controller?id=" + id + "&mod=getInfo";
	            	}
	            function confirmDelete(id) {
	            	console.log(id);
	                if (confirm("Bạn có chắc chắn muốn xoá hoạt động này?")) {
	                    window.location.href = "activities_controller?id=" + id + "&mod=delete";
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
    <script src="./js/activitiesAction.js"></script>
</body>
</html>
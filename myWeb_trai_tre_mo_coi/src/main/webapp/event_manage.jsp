<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Event"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.EventDAO"%>
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
    <title>Event Manage</title>
</head>
<body>
	<div class="container">
	<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Quản lí hoạt động vui chơi</h1></div>

        <div class="operation">
            <!-- Thêm  -->
            <div class="insert">
                <a href="eventInsert.jsp"><button> <i class="fa-solid fa-plus"></i> Thêm mới </button></a>
            </div>
            
            <!-- Tìm kiếm -->
            <button onclick="showHideSearch()" > <i class="fa-solid fa-filter"></i> &nbsp; Tìm kiếm </button>

        </div>

        <div id="searchDiv">
            <div class="search-form">
                <form class="search-form-js" >
                    <input type="text" name="sName" id="sName" placeholder="Tên hoạt động" onkeyup="searchName()">
                    <input type="text" name="sLocation" id="sLocation" placeholder="Địa điểm" onkeyup="searchLocation()">
                    <input type="number" name="sNumber" id="sNumber" placeholder="Số lượng trẻ" onkeyup="searchChildrenNumber()" >
                    <input type="text" name="sStaff" id="sStaff" placeholder="Nhân viên" onkeyup="searchStaff()">
                    <select name="sState" id="sState" onchange="searchState()">
                        <option value="1">Đã diễn ra</option>
                        <option value="0">Chưa diễn ra</option>
                    </select>
                </form>
            </div>
        </div>

        <!-- Bảng -->
        <div class="table" >
        <%
        	EventDAO eventDao = new EventDAO();
        	ArrayList<Event> list = eventDao.selectAll();
        %>
        	<table style="width: 100%; overflow-x: auto;">
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th onclick="sortTable(1)"> Tên hoạt động</th>
	                    <th onclick="sortTable(2)"> Địa điểm</th>
	                    <th onclick="sortTable(3)"> Ngày tổ chức</th>
                        <th onclick="sortTable(4)"> Ngày kết thúc </th>
	                    <th onclick="sortTable(5)"> Nhân viên phụ trách </th>
                        <th onclick="sortTable(6)"> Số lượng trẻ </th>
                        <th onclick="sortTable(7)"> Trạng thái</th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% for(Event event : list){
                   java.sql.Date dateBegin = event.getDate_begin();
	               java.sql.Date dateEnd = event.getDate_end();
                   SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                   String formatDateBegin = dateFormat.format(dateBegin);
                   String formatDateEnd = dateFormat.format(dateEnd);
                  %>
                    <tr>
	                    <td><%= event.getEventID() %></td>
	                    <td class="editable "><%= event.getEvent_of_name() %></td>
	                    <td class="editable"><%= event.getLocation() %></td>
	                    <td class="editable"><%= formatDateBegin %></td>
	                    <td class="editable"><%= formatDateEnd %></td>
	                    <td class="editable"><%= event.getStaff().getFullname() %></td>
                        <td class="editable"><%= event.getNumber_of_children() %></td>
	                    <td class="editable"><% if(event.getState() == 1){ %>
	                     <%="Đã diễn ra"%> <%} else {%>
	                    <%="Chưa diễn ra"%> <%} %></td>
                        <td>
	                    	<button class="edit" onclick="edit('<%= event.getEventID() %>')">Sửa</button>
						    <button class="delete" onclick="confirmDelete('<%= event.getEventID() %>')">Xoá</button>
						</td>
	                </tr>
	           <% } %>
	            </tbody>
	        </table>
	        <script>
	            function edit(id) {
	            	  window.location.href = "event_controller?id=" + id + "&mod=getInfo";
	            	}
	            function confirmDelete(id) {
	            	console.log(id);
	                if (confirm("Bạn có chắc chắn muốn xoá hoạt động này?")) {
	                    window.location.href = "event_controller?id=" + id + "&mod=delete";
	                }
	            }				
	            </script>
            <div id="pagination">
                <button id="prev-page">Previous</button>
                <button id="next-page">Next</button>
            </div>
        </div>
    <script src="./js/table.js"></script>
    <script src="./js/eventAction.js"></script>
</body>
</html>
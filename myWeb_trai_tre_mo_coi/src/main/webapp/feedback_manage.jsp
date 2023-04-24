
<%@page import="model.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.FeedbackDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/feedback.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="../js/scroll.js"></script>
    <title>Happy House | Feedback Manage</title>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1> Phản hồi về chất lượng phục vụ của nhân viên </h1></div>

        <div id="searchDiv">
            <div class="search-form">
                <form class="search-form-js" >
                    <input type="text" name="sName" id="sName" placeholder="Họ và tên" onkeyup="searchName()">
                    <input type="date" name="sDate" id="sDate" placeholder="Ngày đánh giá">
                    <input type="text" name="sRate" id="sRate" placeholder="Đánh giá" onkeyup="searchRate()">
                    <button type="submit" id="search" >
                        <i class="fa-solid fa-magnifying-glass"></i>
                        Tìm kiếm
                    </button>
                </form>
            </div>
        </div>

        <!-- Bảng -->
        <div class="table" >
        	<table style="width: 100%; overflow-x: scroll;">
	            <thead>
	                <tr>
	                    <th>ID</th>
	                    <th onclick="sortTable(1)"> Nhân viên  <i class="ti-exchange-vertical"></i>  </th>
	                    <th onclick="sortTable(2)"> Đánh giá  <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(3)"> Ngày đánh giá  <i class="ti-exchange-vertical"></i></th>
	                    <th> Nhận xét </th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% 	FeedbackDAO fbDao = new FeedbackDAO();
	            	ArrayList<Feedback> list = fbDao.selectAll();
	            %>
	            <% for (Feedback fb : list) {%>
                    <tr>
	                    <td><%= fb.getFeedbackID() %></td>
                        <td class="editable"> <button class="view" onclick="view('<%= fb.getStaff().getStaffID() %>')"><%= fb.getStaff().getFullname() %></button></td>
                        <td class="editable"><%= fb.getRating() %></td>
	                    <td class="editable"><%= fb.getDate_of_feedback() %></td>
	                    <td class="editable"><%= fb.getContent_of_feedback() %></td>
	                </tr>
 				<% } %>
                
	            </tbody>
	        </table>
	        <script>
		        function view(id) {
	          	  window.location.href = "feedback_controller?id=" + id + "&mod=getInfoView";
	          	}
	        </script>
            <div id="pagination">
                <button id="prev-page">Previous</button>
                <button id="next-page">Next</button>
            </div>
        </div>
    <script src="./js/table.js"></script>
    <script src="./js/feedbackAction.js"></script>
</body>
</html>
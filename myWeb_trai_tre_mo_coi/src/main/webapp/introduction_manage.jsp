<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Introduction"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.IntroductionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/feedback.css">
    <script src="./js/scroll.js"></script>
    <title> Happy House | Manange </title>
</head>
<body>
<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Hoạt động giới thiệu</h1></div>

        <!-- Tìm kiếm -->
        <div id="searchDiv">
            <div class="search-form">
                <form class="search-form-js" >
                    <input type="text" name="sName" id="sName" placeholder="Họ và tên trẻ" onkeyup="searchName()">
                    <input type="text" name="sName2" id="sName2" placeholder="Người giới thiệu" onkeyup="searchName2()">
                    <input type="date" name="sDate" id="sDate" placeholder="Ngày">
                    
                    <button type="submit" id="search" >
                        <i class="fa-solid fa-magnifying-glass"></i>
                        Tìm kiếm
                    </button>
                </form>
            </div>
        </div>


        <!-- Bảng -->
        <div class="table" >
        	<table >
	            <thead>
	                <tr>
	                    <th> ID </th>
	                    <th> Họ tên trẻ </i></th>
	                    <th> Người giới thiệu</th>
	                    <th> Ngày  </th>
	                    <th> Trạng thái</th>
	                    <th> Ghi chú </th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% 	IntroductionDAO introductionDAO = new IntroductionDAO();
	            	ArrayList<Introduction> list = introductionDAO.selectAll();
	            	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	            	for(Introduction intro : list) {
	            		java.sql.Date date = intro.getDate_introduction();
	            %>
	           		<tr>
	                    <td><%= intro.getIntroductionID() %></td>
	                    <td><%= intro.getChild().getName() %></td>
	                    <td><%= intro.getIntroducter().getName() %></td>
	                    <td><%= dateFormat.format(date) %></td>
                        <td><% if (intro.getState() == 0) {%> <%= "Đang xác thực" %> <% } else {%> <%= "Hoàn tất" %> <%} %></td>
	                    <td><% if (intro.getNote() == null) {%> <%= "" %> <% } else {%> <%= intro.getNote() %> <%} %></td>
	                    <td>
	                    	<button class="edit" onclick="edit('<%= intro.getIntroductionID() %>')">Xác thực</button>
						    <button class="delete" onclick="confirmDelete('<%= intro.getIntroductionID() %>')"> Xoá</button>
						</td>
	                </tr>
	            <% } %>
	            <script>
	            function confirmDelete(id) {
	                if (confirm("Bạn có chắc chắn muốn xoá ?")) {
	                    window.location.href = "introduction_controller?id=" + id + "&mod=delete";
	                }
	            }	
	            function edit(id) {
	            	if (confirm("Xác thực giới thiệu ...")) {
	            		window.location.href = "introduction_controller?id=" + id + "&mod=update";
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
    </div>
    <script src="js/introductionAction.js"></script>
</body>
</html>
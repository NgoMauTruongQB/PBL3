<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="model.Event"%>
<%@ page import="database.EventDAO" %>
<%@page import="model.Charity_activities"%>
<%@ page import="database.Charity_activitiesDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="database.StaffDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/style1.css">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<script src="../js/scroll.js"></script>
<title>Happy House</title>

</head>
<body>
	<div id="main">
        <!-- top bar -->
        <section id="top-bar">
            <div class="brand">
                <img src="./assets/img/logo/logo_happy_house.png" alt="logo_happy_house">
                <h1>Happy House</h1>
            </div>
            <div class="infor">
                <div class="contact">
                    <i class="fa-solid fa-address-book"></i>
                    <h6>0921123123 <br> happyhouse@gmail.com</h6>
                </div>
                <div class="address">
                    <i class="fa-solid fa-location-dot"></i>
                    <h6>54 Nguyễn Lương Bằng <br> Liên Chiểu - Đà Nẵng</h6>
                </div>
                 <%
                	Object ob = session.getAttribute("adopter");
                	
                	
                %>
			
					<%
 				   Charity_activitiesDAO charity_activitiesDAO = new Charity_activitiesDAO();
    				ArrayList<Charity_activities> charitys = charity_activitiesDAO.selectAll();
					%>
					
                <%
                	Object obj = session.getAttribute("user");
                	User user = null;
                	if(obj != null)
                		user = (User)obj;
                	if(user == null) {
                %>
	                <div class="login">
	                    <a href="./login.jsp">
	                        <i class="fa-solid fa-right-to-bracket"></i>
	                        Đăng nhập
	                    </a>
	                </div>
                <% } 
                else { %>
	                <div class="login" style="padding: 10px 5px 10px 5px">
	                    <a href="logout">
	                        Xin chào  <%= user.getUsername() %>
	                    </a>
	                </div>
                <% } %>
            </div>
        </section>
        <!-- end top bar -->

        <!-- header -->
        <section id="header">
            <ul id="nav">
                <li><a href="./index.jsp">
                        <i class="fa-solid fa-house"></i>
                        Trang chủ
                    </a></li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-users-rectangle"></i>
                        Hoạt động
                    </a>
                    <ul class="subnav subnav-child">
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Vui chơi giải trí</a></li>
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Từ thiện</a></li>
                    </ul>
                </li>
                <li><a href="#">
                        <i class="fa-solid fa-hand-holding-heart"></i>
                        Ủng hộ
                    </a>
                    <ul class="subnav subnav-child">
                    
                        <li><a href="./donation.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Các sự kiện từ thiện</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-calendar-week"></i>
                        Danh mục
                    </a>
                    <ul class="subnav subnav-event">
                        <li><a href="./adoption.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Nhận nuôi trẻ</a></li>
                        <li><a href="./introduction.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Giới thiệu trẻ</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-calendar-week"></i>
                        Đăng kí
                    </a>
                    <ul class="subnav subnav-event">
                        
                                       <li><a href="./introducter_signup.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Đăng kí giới thiệu</a></li>
                        <li><a href="./adopter_signup.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Đăng kí nhận nuôi</a></li>
                    </ul>
                </li>
                <li><a href="#">
                        <i class="fa-solid fa-hand-holding-heart"></i>
                        Liên hệ
                    </a></li>
                    
                   <li><a href="#">
                        <i class="fa-solid fa-hand-holding-heart"></i>
                       Phản hồi
                    </a>
                    <ul class="subnav subnav-child">
                        <li><a href="./index.jsp#feedback">
                                <i class="fa-solid fa-arrow-right"></i>
                                Phản hồi</a></li>
                        
                    </ul>
                </li>
            </ul>
        </section>
        <!-- end header -->

        
       

    </div>
</body>
</html>
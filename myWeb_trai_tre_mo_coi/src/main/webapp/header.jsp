
 

<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Happy House</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <script src="./js/scroll.js"></script>
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
</head>
<body>
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
        <div class="bar-button" onclick="openNav()">
            <div class="bar1"></div>
            <div class="bar2"></div>
            <div class="bar3"></div>
        </div>

        <ul id="nav">
            <li><a href="admin_page.jsp">
                <i class="fa-solid fa-house"></i>
                Trang chủ
            </a></li>
            <li><a href="user_manage.jsp">
                <i class="fa-solid fa-user"></i>
                Tài khoản
            </a></li>
            <li class="js-open-subnav">
                <a href="#">
                <i class="fa-solid fa-children"></i>
                Trẻ
                <i class="fa-solid fa-caret-down"></i>
                </a>
                <ul class="subnav subnav-child js-subnav">
                    <li><a href="children_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Danh sách</a></li>
                    <li><a href="adoption_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Hoạt động nhận nuôi</a></li>
                    <li><a href="introduction_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Giới thiệu vào trung tâm</a></li>
                </ul>
            </li>
            <li class="js-open-subnav">
                <a href="#">
                    <i class="fa-solid fa-user-nurse"></i>
                    Nhân viên 
                    <i class="fa-solid fa-caret-down"></i>
                </a>
                <ul class="subnav subnav-event .js-subnav">
                    <li><a href="staff_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Danh sách</a></li>
                    <li><a href="feedback_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Đánh giá - Phản hồi</a></li>
                </ul>
            </li>
            <li class="js-open-subnav">
                <a href="#">
                    <i class="fa-solid fa-calendar-week"></i>
                    Sự kiện 
                    <i class="fa-solid fa-caret-down"></i>
                </a>
                <ul class="subnav subnav-event .js-subnav">
                    <li><a href="event_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Hoạt động vui chơi</a></li>
                    <li><a href="activities_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Hoạt động từ thiện</a></li>
                </ul>
            </li>
            <li><a href="#">
                <i class="fa-solid fa-hand-holding-heart"></i>
                Nhà hảo tâm
            </a>
            <ul class="subnav subnav-child js-subnav">
                    <li><a href="adopter_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                       	Người nhận nuôi</a></li>
                    <li><a href="introducter_manage.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Người giới thiệu</a></li>
                </ul>
            </li>
            <li class="js-open-subnav">
                <a href="#">
                    <i class="fa-solid fa-coins"></i>
                    Tài chính
                    <i class="fa-solid fa-caret-down"></i>
                </a>
                <ul class="subnav subnav-statis .js-subnav">
                    <li><a href="monthly_statistics.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Thống kê theo tháng</a></li>
                    <li><a href="verifyDonations.jsp">
                        <i class="fa-solid fa-arrow-right"></i>
                        Xác thực ủng hộ</a></li>
                    <li><a href="donationStatistics.jsp">
	                    <i class="fa-solid fa-arrow-right"></i>
	                    Gây quỹ</a></li>
                </ul>
            </li>
        </ul>
    </section>
    <script>
        function openNav() {
            document.querySelector('.bar-button').classList.toggle("change");
            var nav = document.querySelector('#nav');
            if (nav.style.display === 'block') {
                document.getElementById("nav").style.display = 'none';
            } else {
                document.getElementById("nav").style.display = 'block';
            }
        }
		function showSubnav() {
            var windowWidth = window.innerWidth;
            if (windowWidth < 1023) {
                var subnav = this.querySelector('.subnav');
                if (subnav.style.display === 'block') {
                subnav.style.display = 'none';
                } else {
                subnav.style.display = 'block';
                }
            }
        }
        var navItems = document.querySelectorAll('#nav > li');
        navItems.forEach(function(navItem) {
            navItem.addEventListener('click', showSubnav);
        });
	</script>
</body>
</html>

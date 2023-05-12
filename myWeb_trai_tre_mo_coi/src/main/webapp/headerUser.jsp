<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="database.StaffDAO" %>
<%@ page import="model.Staff" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="icon" href="./assets/img/logo/logo_happy_house.png">
    <title>Happy House</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
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
                <% Object obj=session.getAttribute("user"); User user=null; if(obj !=null) user=(User)obj;
                    if(user==null) { %>
                <div class="login">
                    <a href="./login.jsp">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        Đăng nhập
                    </a>
                </div>
                <% } else { %>
                <div class="login" style="padding: 10px 5px 10px 5px">
                    <a href="logout">
                        Xin chào <%= user.getUsername() %>
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
                <li><a href="index.jsp">
                        <i class="fa-solid fa-house"></i>
                        Trang chủ
                    </a></li>
                <li class="js-open-subnav">
                    <a href="activities.jsp">
                        <i class="fa-solid fa-users-rectangle"></i>
                        Hoạt động
                        <i class="fa-solid fa-caret-down"></i>
                    </a>
                    <ul class="subnav subnav-child js-subnav">
                        <li><a href="activities.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Vui chơi giải trí</a></li>
                        <li><a href="charity_activities.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Từ thiện</a></li>
                    </ul>
                </li>
                <li><a href="donation.jsp">
                    <i class="fa-solid fa-hand-holding-heart"></i>
                    Ủng hộ
                </a></li>
                <li class="js-open-subnav">
                    <a href="#">
                        <i class="fa-solid fa-calendar-week"></i>
                        Danh mục
                        <i class="fa-solid fa-caret-down"></i>
                    </a>
                    <ul class="subnav subnav-event .js-subnav">
                        <li><a href="./adoption.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Nhận nuôi trẻ</a></li>
                        <li><a href="./introduction.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Giới thiệu trẻ</a></li>
                    </ul>
                </li>
                <li><a href="#">
                        <i class="fa-solid fa-calendar-week"></i>
                        Đăng kí
                    </a>
                    <ul class="subnav subnav-child js-subnav">
                        <li><a href="./adopter_signup.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Đăng kí nhận nuôi</a></li>
                        <li><a href="./introducter_signup.jsp">
                                <i class="fa-solid fa-arrow-right"></i>
                                Đăng kí giới thiệu</a></li>
                    </ul>
                </li>
                <li><a href="#feedback">
                    <i class="fa-solid fa-hand-holding-heart"></i>
                    Phản hồi
                </a></li>
            </ul>
        </section>
	</div>
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
            navItems.forEach(function (navItem) {
                navItem.addEventListener('click', showSubnav);
            });
        </script>
</html>
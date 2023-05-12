 <%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@page import="model.Event"%>
<%@page import="database.EventDAO"%>

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Happy House</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
        <link rel="stylesheet" href="./assets/css/donate.css">
        <link rel="stylesheet" href="/View/assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="assets/css/charity_activities.css">
        <script src="./js/scroll.js"></script>
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
                <div class="login">
                    <a href="./login.html">
                        <i class="fa-solid fa-right-to-bracket"></i> 
                        Đăng nhập
                    </a>
                </div>
            </div>
        </section>
        <!-- end top bar -->
    	
    	
    	
    	
        <!-- header -->
        <section id="header">
            <ul id="nav">
                <li><a href="/View/index.html">
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
                        <li><a href="">
                            <i class="fa-solid fa-arrow-right"></i>
                            Nuôi trẻ hàng tháng</a></li>
                        <li><a href="">
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
                        <li><a href="">
                            <i class="fa-solid fa-arrow-right"></i>
                            Nhận nuôi trẻ</a></li>
                        <li><a href="">
                            <i class="fa-solid fa-arrow-right"></i>
                            Giới thiệu trẻ</a></li>
                        <li><a href="">
                            <i class="fa-solid fa-arrow-right"></i>
                            Đánh giá chất lượng</a></li>
                    </ul>
                </li>
                <li><a href="#">
                    <i class="fa-solid fa-hand-holding-heart"></i>
                    Liên hệ
                </a></li>
            </ul>

        </section>
        <!-- end header -->
        <div id="wrapper" style="padding-bottom: 0%;">
            <div><h2 id="donate"> HOẠT ĐỘNG VUI CHƠI giải trí </h2></div>
           <div id="line-up" ><hr>
            </div>
            
        </div>
        <div style="padding-top: 100px;" >
            <ul class="accordion-div">
                
                <!-- database -->
                <%	Date date_in, date_out; 
					String address,content, name;
					EventDAO eventDao = new EventDAO();
					ArrayList<Event> list = new ArrayList<>();
					list = eventDao.selectAll();
					for(int i=0; i<list.size(); i++){
						Event e = list.get(i);
						date_in = e.getDate_begin();
						date_out = e.getDate_end();
						address = e.getLocation();
						content = e.getContent();
						name = e.getEvent_of_name();
						%>
						<li name="li<%=(i+1)%4+1%>">
                    <div>
                        <button class="accordion" name="btn<%=(i+1)%4+1%>">
                            <label >
                                <%=name%>
                            </label>
                        </button>
                        <div class="panel">
                            <div class="accordion-line">
	                            <p style="font-weight: bold;">Thời gian diễn ra: </p>
	                            <p><%=date_in %> -  <%=date_out %></p>
                            </div>
                            <div class="accordion-line">
                            	<p style="font-weight: bold;">Địa điểm:</p>
                            	<p> <%=address %></p>
                            </div>
                            <div class="accordion-line">
                            	<p style="font-weight: bold;">Nội dung hoạt động: </p>
                            	<p><%=content %></p>
                            </div>
                        </div>
                    </div>
                </li>
						<%
					}
				%>
            </ul>
        </div>

        <script>
            var acc = document.getElementsByClassName("accordion");
            var i;
            
            for (i = 0; i < acc.length; i++) {
              acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                  panel.style.display = "none";
                } else {
                  panel.style.display = "block";
                }
              });
            }
            </script>
    </body>
    </html>
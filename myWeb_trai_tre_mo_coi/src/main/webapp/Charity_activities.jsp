 <%@page import="java.util.Arrays"%>
<%@page import="model.Charity_activities"%>
<%@page import="database.Charity_activitiesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>

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
    <!--  -->
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
    
    
    
    <div id="wrapper">
        <div><h2 id="donate"> HOẠT ĐỘNG TỪ THIỆN </h2></div>
       <div id="line-up" ><hr>
        </div>
        
    </div>
    
    
    <div class="cards">
        
          <%
		    String activityID;
			String name_of_activity;
			Date date_begin;
			Date date_end ;
			double money_collected; 
			String purpose_of_activity; 
			String staffID ;
			String image ;
			Charity_activitiesDAO charityDAO  =  new Charity_activitiesDAO();
			ArrayList<Charity_activities> list = new ArrayList<>();
			list = charityDAO.selectAll();
			String ids[] = new String[list.size()];
			for(int i=0; i<list.size(); i++){
				Charity_activities e = list.get(i);
				activityID = e.getActivityID();
				name_of_activity = e.getName_of_activity();
				date_begin = e.getDate_begin();
				date_end = e.getDate_end();
				money_collected = e.getMoney_collected();
				purpose_of_activity = e.getPurpose_of_activity();
				staffID = e.getStaff().getStaffID();
				image = e.getImage();
				String str_i = Integer.toString(i+1);
				ids[i] = str_i;
				%>
				<div class="card" >
		            <img src="<%=image %>" class="card-img-top"  alt="...">
		            <div class="card-body">
		            	<div><h5 class="card-title" style="padding: 10px; padding-bottom: 0px"><%=name_of_activity %></h5></div>
		              	<div><p class="card-text" style="font-size: 14px; float: right; padding-right: 40px"> <%=date_begin %></p></div><br><br>
		              	
		              	<div id="exampleModal">
		              		<button class="card-button" id="myBtn<%=str_i %>" name="btn">
		              			<a href="#">Xem chi tiết</a>
		              		</button>
		                     
		              	</div>
		
		            </div>
		          </div>
		          <!-- The Modal -->

					<div  class="modal" id="myModal<%=str_i %>">
					  <!-- Modal content -->
						   <a href="#" class="overlay-close close" ></a>
						
						   <div class="dialog-body" id="modal-1">
						       <a class="dialog-close-btn close" href="#" >&times;</a>
						       <div class="card-body">	
						           <img src="<%=image %>" class="card-img-modal" alt="...">
						           <div class="row" style="text-align: center;"><h5 class="card-title" ><%=name_of_activity %></h5></div>
						           <div class="row">
						               <div class="col">
						                   <p class="card-text" style="text-align: left;">Ngày bắt đầu: <%=date_begin %></p>
						               </div>
						               <div class="col">
						                   <p class="card-text" style="text-align: left;">Ngày kết thúc: <%=date_end %></p>
						               </div>                 
						           </div>
						           <div class="row"><p class="card-text" style="text-align: left;">Số tiền ủng hộ: <%= String.format("%.0f", money_collected) %> vnD</p></div>
						           <div class="row"><p class="card-text" style="text-align: left;">Chi tiết họat động: <%=purpose_of_activity %></p></div>
						           <div class="row"><p class="card-text" style="text-align: left;">Cá nhân ủng hộ: <%=staffID %></p></div>
						   		</div>
						 	</div>
					 	
					</div> 
					<%
				}
	    	%>
	    	<div id="myDiv" data-my-value="<%= ids %>"></div>
    </div>
    	 
	    <script>
	  // Get the modal
	  var modals = [];
	  var btns = [];
	  <% for (int i=0; i<ids.length; i++) { %>
	    var modal = document.getElementById("myModal<%=ids[i]%>");
	    var btn = document.getElementById("myBtn<%=ids[i]%>");
	    if (modal) {
	      modals.push(modal);
	    }
	    if (btn) {
	      btns.push(btn);
	    }
	  <% } %>
		
	  // When the user clicks the button, open the modal 
	  for (var i=0; i<btns.length; i++) {
	    btns[i].onclick = function(index) {
	      return function() {
	        modals[index].style.display = "block";
	      }
	    }(i);
	  }
		
	  // When the user clicks anywhere outside of the modal, close it
	  window.onclick = function(event) {
	    for (var i=0; i<modals.length; i++) {
	      if (event.target == modals[i]) {
	        modals[i].style.display = "none";
	      }
	    }
	  }
	</script>
        

</body>
</html>
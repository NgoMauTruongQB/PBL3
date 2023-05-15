<%@page import="java.time.LocalDate"%>
<%@page import="model.DonationStatistics"%>
<%@page import="database.donationStatisticsDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="model.Charity_activities"%>
<%@page import="database.Charity_activitiesDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Happy House</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./assets/css/style1.css">
	<link rel="stylesheet" href="assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
	<link rel="stylesheet" href="/View/assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="icon" href="./assets/img/logo/logo_happy_house.png">
	<script src="./js/scroll.js"></script>
</head>

<body>
	<%@ include file="headerUser.jsp"%>
	<div id="wrapper">
		<h2>HOẠT ĐỘNG TỪ THIỆN</h2>
		<hr>
	</div>
	<div class="cards">
		<%
		String id;
		String activityID;
		String name_of_activity;
		Date date_begin;
		Date date_end;
		double money_collected;
		String purpose_of_activity;
		String staffID;
		String image;
		String staff_name;
		Charity_activitiesDAO charityDAO = new Charity_activitiesDAO();
		ArrayList<Charity_activities> list = new ArrayList<>();
		list = charityDAO.selectAll();
		String ids[] = new String[list.size()];
		double amount_of_money;
		for (int i = 0; i < list.size(); i++) {
			Charity_activities e = list.get(i);
			activityID = e.getActivityID();
			name_of_activity = e.getName_of_activity();
			date_begin = e.getDate_begin();
			date_end = e.getDate_end();
			money_collected = e.getMoney_collected();
			purpose_of_activity = e.getPurpose_of_activity();
			staffID = e.getStaff().getStaffID();
			image = e.getPhoto();
			String str_i = Integer.toString(i + 1);
			ids[i] = str_i;
			staff_name = e.getStaff().getFullname();
			id = e.getActivityID();
			Date current_date = new Date();
			int p = current_date.after(date_end) ? 100 : (current_date.after(date_begin) ? 50 : 0);
		%>
		<div class="card">
			<div class="content">
				<img src="uploads/activities/<%=image%>" class="card-img-top"
					alt="..." onerror="this.src='assets/img/activities/activities.png'">
				<div class="card-body">
					<h5 class="card-title"><%=name_of_activity%>
						-
						<%=purpose_of_activity%></h5>
					<p class="card-text date"><%=date_begin%></p>
					<div class="pro">
						<progress value="<%=p%>" max="100"></progress>
					</div>
					<div id="exampleModal" class="footer">
						<span>Số tiền cần quyên góp: <%=String.format("%.0f", money_collected)%></span>
						<button class="card-button" id="myBtn<%=str_i%>" name="btn">
							Xem chi tiết</button>
					</div>
				</div>
			</div>
		</div>

		<!-- The Modal -->

		<div class="modal" id="myModal<%=str_i%>">
			<!-- Modal content -->
			<a href="#" class="overlay-close close"></a>

			<div class="dialog-body" id="modal-1">
				<div class="card-body">
					<img src="uploads/activities/<%=image%>" class="card-img-modal"
						alt="..."
						onerror="this.src='assets/img/activities/activities.png'">
					<div class="row">
						<h5 class="card-title"><%=name_of_activity%></h5>
					</div>
					<p class="card-text">
						<span>Ngày bắt đầu: </span>
						<%=date_begin%>
						-
						<%=date_end%></p>
					<p class="card-text">
						<span>Số tiền ủng hộ: </span>
						<%=String.format("%.0f", money_collected)%>
						VND
					</p>
					<p class="card-text">
						<span>Chi tiết họat động: </span>
						<%=purpose_of_activity%></p>
					<p class="card-text">
						<span>Nhân viên chịu trách nhiệm: </span>
						<%=staff_name%></p>
				</div>
			</div>
		</div>
		<%
		}
		%>
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
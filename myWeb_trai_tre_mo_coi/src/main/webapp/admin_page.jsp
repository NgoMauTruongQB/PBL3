<%@page import="java.util.Calendar"%>
<%@page import="database.donationStatisticsDAO"%>
<%@page import="model.Monthly_statistics"%>
<%@page import="database.DonationDAO"%>
<%@page import="model.Charity_activities"%>
<%@page import="database.Charity_activitiesDAO"%>
<%@page import="model.Staff"%>
<%@page import="database.StaffDAO"%>
<%@page import="model.Children"%>
<%@page import="database.ChildrenDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Happy House</title>
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/css/sectionCounter.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container">
	    <div class="row">
	            <div class="column">
	                <div class="card card1 row">
	                    <p class="column"><i class="fa-solid fa-children"></i></p>
	                    <div>
	                    	<h3>11</h3>
	                    	<p>Trẻ đang sinh sống</p>
	                    </div>
	                </div>
	            </div>
	    
	            <div class="column">
	                <div class="card card2 row">
	                    <p class="column"><i class="fa-solid fa-user-nurse"></i></p>
	                    <h3>55+</h3>
	                    <p>Cán bộ đang công tác</p>
	                </div>
	            </div>
	    
	            <div class="column">
	                <div class="card card3 row">
	                    <p class="column"><i class="fa-solid fa-users"></i></p>
	                    <h3>100+</h3>
	                    <p>Tài khoản đang hoạt động</p>
	                </div>
	            </div>
	    
	            <div class="column">
	                <div class="card card4 row">
	                    <p class="column"><i class="fa-solid fa-hand-holding-heart"></i></p>
	                    <h3>100+</h3>
	                    <p>Hoạt động từ thiện</p>
	                </div>
	            </div>
	        </div>
	    	
	        <div class="row ">
		        <div id="send-email" class="column">
	                <form action="sendMail_controller" method="post">
	                	<input name="mod" value="allStaff" type="hidden">
	                    <h2>Thông báo đến nhân viên</h2>
	                    <label>Tiêu đề: </label>
	                    <input name="titleEmail" placeholder="Tên tiều đề">
	                    <label>Nội dung: </label>
	                    <textarea name="contentEmail"></textarea>
	                    <button type="submit">Gửi</button>
	                </form>
	            </div>
	        	<div class="sendEmail">
	            <div id="donaton_chart" class="column"></div>
	        </div>
	    </div>
	
	    <script>
	    <%  
	    	ChildrenDAO childrenDAO = new ChildrenDAO();
	    	ArrayList<Children> c = childrenDAO.selectAll();
	    	int count1 = c.size();
	    	StaffDAO staffDao = new StaffDAO();
	    	ArrayList<Staff> s = staffDao.selectAll();
	    	int count2 = s.size();
	    	UserDAO userDao = new UserDAO();
	    	ArrayList<User> u = userDao.selectAll();
	    	int count3 = u.size();
	    	Charity_activitiesDAO charity_activitiesDAO = new Charity_activitiesDAO();
	    	ArrayList<Charity_activities> ca = charity_activitiesDAO.selectAll();
	    	int count4 = ca.size();
	    	donationStatisticsDAO doDao = new donationStatisticsDAO();
	    	ArrayList<Monthly_statistics> list = doDao.selectAllMonth();
	    	Calendar calendar = Calendar.getInstance();
	    	int year = calendar.get(Calendar.YEAR);
		 %>
	        // Draw
	        google.charts.load('current', { 'packages': ['corechart'] });
	        google.charts.setOnLoadCallback(drawChart);
	
	        function drawChart() {
	            var data = new google.visualization.DataTable();
	            data.addColumn('number', 'Tháng');
	            data.addColumn('number', 'Tiền');
	            data.addRows([
	                [0, 0]
	                <%  for (Monthly_statistics m : list) { %>
		         	,[<% if (year == m.getYear()) {%> <%= m.getMonth() %>, <%= m.getTotal()%> <%} %>]
		          <% } %>
	            ]);
	
	            var options = {
	                title: 'Số tiền quyên góp được hằng tháng',
	                animation: {
	                    duration: 1000,
	                    easing: 'out',
	                    startup: true
	                },
	                legend: 'none',
	                colors: ['#8892d6'],
	                orientation: 'vertical'
	            };
	
	            var chart = new google.visualization.BarChart(document.getElementById('donaton_chart'));
	            chart.draw(data, options);
	        }

	        var targets = [<%= count1%>, <%= count2%>, <%= count3%>, <%= count4%>];
	        var counters = document.querySelectorAll('.card h3');
	        var countInterval = 50;
	
	        function count(counter, target) {
	            var count = 0; 
	
	            var interval = setInterval(function() {
	                count += 1;
	                counter.innerText = count;
	                if (count === target) {
	                    clearInterval(interval);
	                }
	            }, countInterval);
	        }
	
	        for (var i = 0; i < counters.length; i++) {
	            count(counters[i], targets[i]);
	        }
	
	    </script>
    </div>
     <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
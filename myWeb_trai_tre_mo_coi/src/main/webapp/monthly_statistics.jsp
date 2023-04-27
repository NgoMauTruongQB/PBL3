<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Monthly_statistics"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.donationStatisticsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/donation.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="./js/scroll.js"></script>
    <title>Monthly Statistics</title>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Thống kê ủng hộ hàng tháng</h1></div>
        <div class="search">
            <input type="text" name="sDate" id="sDate" placeholder="Tháng" onkeyup="searchDate()">
            <button class="excel" onclick="edit()">Xuất file excel </button>
        </div>
		
        <!-- Bảng -->
        <div class="table" >
        	<table style="width: 100%; overflow-x: auto;">
	            <thead>
	                <tr>
	                	<th></th>
	                    <th>Tháng</th>
	                    <th>Tổng tiền nhận được</th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <%
	            	donationStatisticsDAO dnDao = new donationStatisticsDAO();
	            	ArrayList<Monthly_statistics> list = dnDao.selectAllMonth();
	            	for( Monthly_statistics ms : list) {
	            		DecimalFormat df = new DecimalFormat("#,##0");
	            		String formattedAmount = df.format(ms.getTotal());
	            %>
                    <tr>
	                    <td></td>
	                    <td><%= ms.getMonth() %>/<%= ms.getYear() %></td>
	                    <td><%= formattedAmount %></td>
	                </tr>
				<% } %>
	            </tbody>
	        </table>
            <div id="pagination">
                <button id="prev-page">Previous</button>
                <button id="next-page">Next</button>
            </div>
        </div>
	    <script>
		    function edit() {
		    	window.location.href = "create_excel_controller?&mod=export_monthly_statistics";
		    }
	    </script>
	    <script src="./js/table.js"></script>
	    <script src="./js/monthlyStatistics.js"></script>
	</div>
		
</body>
</html>
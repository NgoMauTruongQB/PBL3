<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.donationStatisticsDAO"%>
<%@page import="model.DonationStatistics"%>
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
    <title>Donation Statistics</title>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Thống kê gây quỹ</h1></div>
        <div class="search">
            <input type="text" name="sName" id="sName" placeholder="Tên hoạt động" onkeyup="searchName()">
        </div>

        <!-- Bảng -->
        <div class="table" >
        	<table style="width: 100%; overflow-x: auto;">
	            <thead>
	                <tr>
	                    <th>ID hoạt động</th>
	                    <th>Tên hoạt động</th>
	                    <th>Số tiền cần quyên góp</th>
	                    <th>Số tiền đã nhận được</th>
                        <th>Số tiền còn lại</th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <%
	            	donationStatisticsDAO dnDao = new donationStatisticsDAO();
	            	ArrayList<DonationStatistics> list = dnDao.selectAll();
	            	for(DonationStatistics dn : list) {
	            	DecimalFormat df = new DecimalFormat("#,##0");
	            	double money_collected = dn.getMoney_collected();
	            	double amount_of_money = dn.getAmount_of_money();
	            	double remaining_amount = money_collected - amount_of_money;
	            	double amount_of_money_percentTmp = (double) amount_of_money / money_collected * 100;
	            	double amount_of_money_percent = (double) Math.round(amount_of_money_percentTmp * Math.pow(10, 2)) / Math.pow(10, 2);
	            	Double remaining_amount_percent = 100 - amount_of_money_percent;
	            %>
                    <tr>
	                    <td><%= dn.getId() %></td>
	                    <td class="editable"><%= dn.getName() %></td>
	                    <td class="editable"><%= df.format(money_collected) %></td>
	                    <td class="editable"><%= df.format(amount_of_money) %> (<%= amount_of_money_percent %> %) </td>
	                    <td class="editable"><%= df.format(remaining_amount) %> (<%= remaining_amount_percent%> %)</td>
	                </tr>
				<% } %>
	            </tbody>
	        </table>
            <div id="pagination">
                <button id="prev-page">Previous</button>
                <button id="next-page">Next</button>
            </div>
        </div>
    <script src="./js/table.js"></script>
    <script src="./js/donationAction.js"></script>
</body>
</html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Donation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.DonationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="assets/css/manage.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="./js/scroll.js"></script>
    <title>Verify Donation</title>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Xác thực ủng hộ</h1></div>

        <div class="operation">           
            <!-- Tìm kiếm -->
            <button onclick="showHideSearch()" style="right: 10px" > <i class="fa-solid fa-filter"></i> &nbsp; Tìm kiếm </button>
			<button class="excel" onclick="edit()"> Xuất file excel </button>
        </div>

        <div id="searchDiv">
            <div class="search-form">
                <form >
                    <input type="text" name="sName" id="sName" placeholder="Tên hoạt động" onkeyup="searchName()">
                    <input type="text" name="sFullname" id="sFullname" placeholder="Tên người ủng hộ" onkeyup="searchFullname()">
                    <input type="date" name="sDate" id="sDate" onchange="searchDate()" >
                    <select name="sState" id="sState" onchange="searchState()">
                        <option value="0">Đang xác thực</option>
                        <option value="1">Hoàn tất </option>
                    </select>
                </form>
            </div>
        </div>

        <!-- Bảng -->
        <div class="table" >
        	<table style="width: 100%; overflow-x: auto;">
	            <thead>
	                <tr>
	                    <th> ID</th>
	                    <th> Tên hoạt động</th>
                        <th> Tên người ủng hộ </th>
	                    <th> Số tiền quyên góp</th>
	                    <th> Số điện thoại</th>
                        <th> Ngày thực hiện</th>
                        <th> Trạng thái</th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% 
	            	DonationDAO dnDao = new DonationDAO();
	           		ArrayList<Donation> list = dnDao.selectAll();
	           		for(Donation dn : list) {
	           			DecimalFormat df = new DecimalFormat("#,##0");
	            		String formattedAmount = df.format(dn.getAmount_of_money());
	            		java.sql.Date date = dn.getDate_of_donation();
	                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	                    String formatDate = dateFormat.format(date);
	            %>
                    <tr>
	                    <td><%= dn.getDonationID() %></td>
	                    <td class="editable"><%= dn.getActivity().getName_of_activity() %></td>
	                    <td class="editable"><%= dn.getUser().getFullname() %></td>
	                    <td class="editable"><%= formattedAmount %></td>
	                    <td class="editable"><%= dn.getPhoneNumber() %></td>
	                    <td class="editable"><%= formatDate %></td>
                        <td class="editable"><% if(dn.getState() == 1){ %> <%= "Hoàn tất" %> <%} else {%> <%= "Đang xác thực" %> <%} %></td>
                        <td>
	                    	<button class="edit" onclick="edit('<%= dn.getDonationID() %>')">Xác thực</button>
						    <button class="delete" onclick="confirmDelete('<%= dn.getDonationID() %>')"> Xoá</button>
						</td>
	                </tr>
	             <% } %>
	            </tbody>
	            <script>
	            function edit(id) {
	            	if (confirm("Xác thực số tiền đã nhận được ...")) {
	            		window.location.href = "verifyDonation_controller?id=" + id + "&mod=edit";
	            	}
				}
	            function confirmDelete(id) {
	                if (confirm("Bạn có chắc chắn muốn xoá?")) {
	                    window.location.href = "verifyDonation_controller?id=" + id + "&mod=delete";
	                }
	            }
	    	    function edit() {
	    	    	window.location.href = "create_excel_controller?&mod=export_donation";
	    	    }				
	            </script>
	        </table>
            <div id="pagination">
                <button id="prev-page">Previous</button>
                <button id="next-page">Next</button>
            </div>
        </div>
    <script src="./js/table.js"></script>
    <script src="./js/verifyDonation.js"></script>
</body>
</html>
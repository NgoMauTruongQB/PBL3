<%@page import="model.Adopter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.AdopterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/adopter.css">
    <script src="./js/scroll.js"></script>
    <title>Happy House | Manange </title>
</head>
<body>
	<div class="container">
	<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Người nhận nuôi</h1></div>

        <!-- Tìm kiếm -->
        <div class="search-form">
            <form>
                <input type="text" name="sName" id="sName" placeholder="Họ và tên" onkeyup="searchName()">
                <input type="text" name="sCmnd" id="sCmnd" placeholder="CMND/CCCD" onkeyup="searchCmnd()">
                <input type="text" name="sAddress" id="sAddress" placeholder="Địa chỉ" onkeyup="searchAddress()">
                <input type="tel" name="sPhone" id="sPhone" placeholder="Số điện thoại" onkeyup="searchPhone()">
                <button type="submit" id="search">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    Tìm kiếm
                </button>
            </form>
        </div>

        <!-- Thêm  -->
        <div class="insert">
            <button onclick="document.getElementById('insert-modal').style.display='block'">
                <i class="fa-solid fa-plus"></i>
                Thêm mới
            </button>
        </div>
		<%
			String notification = request.getAttribute("notification")+"";
	 		notification = (notification.equals("null")) ? "" : notification;
			if (!notification.isEmpty()) { %>
			  <script>
			    alert("<%= notification %>");
			  </script>
		<% } %>
        <!-- Bảng -->
        <div class="table" >
        	<table >
	            <thead>
	                <tr>
	                    <th> ID </th>
	                    <th> CMND </th>
	                    <th onclick="sortTable(2)"> Họ và tên &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(3)"> Địa chỉ &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th> Số điện thoại </th>
	                    <th> Ghi chú </th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% AdopterDAO add = new AdopterDAO();
	            ArrayList<Adopter> list = add.selectAll();
	            %>
	            <% for (Adopter ad : list) {%>
	           		<tr>
	                    <td><%= ad.getAdopterID() %></td>
	                    <td class="editable"><%= ad.getCmnd() %></td>
	                    <td class="editable"><%= ad.getName() %></td>
	                    <td class="editable"><%= ad.getAddress() %></td>
	                    <td class="editable"><%= ad.getPhoneNumber() %></td>
	                    <td class="editable"><% if (ad.getNote() == null) {%> <%= "" %> <% }else {%> <%= ad.getNote() %><%} %></td>
	                    <td>
	                    	<button class="edit" onclick="editAdopter('<%= ad.getAdopterID() %>')">Sửa</button>
						    <button class="delete" onclick="confirmDelete('<%= ad.getAdopterID() %>')"> Xoá</button>
						</td>
	                </tr>
                 <%} %>
	            <script>
	            function editAdopter(id) {
	            	window.location.href = "adopter_controller?id=" + id + "&mod=getInfo";
				}
	            function confirmDelete(id) {
	                if (confirm("Bạn có chắc chắn muốn xoá ?")) {
	                	window.location.href = "adopter_controller?id=" + id + "&mod=deleteAdopter";
	                }
	            }				
	            </script>   
	            </tbody>
	        </table>
            <div id="pagination">
                <button id="prev-page">Previous</button>
                <button id="next-page">Next</button>
            </div>
        </div>
        <script src="./js/table.js"></script>

        <!-- INSERT MODAL -->
        <%
        	String error = request.getAttribute("error")+"";
        	error = (error.equals("null")) ? "" : error;
        	
        	String name = request.getAttribute("name")+"";
        	name = (name.equals("null")) ? "" : name;
        	
        	String cmnd = request.getAttribute("cmnd")+"";
        	cmnd =  (cmnd.equals("null")) ? "" : cmnd;
        	
        	String phone = request.getAttribute("phone")+"";
        	phone =  (phone.equals("null")) ? "" : phone;
        	
        	String address = request.getAttribute("address")+"";
        	address =  (address.equals("null")) ? "" : address;
        	
        	String note = request.getAttribute("note")+"";
        	note =  (note.equals("null")) ? "" : note;
        	
        	String uError = request.getAttribute("uError")+"";
        	uError = (uError.equals("null")) ? "" : uError;
        %>
        <div id="insert-modal" class="modal" style="overflow-x:auto;">
            <div class="modal-container" >
        
                <!-- Modal Content -->
                <form class="modal-content animate" action="adopter_controller" method="post">
                <input type="hidden" name="mod" value="addAdopter">
                    <div class="header">
                        <h1>Thông tin người nhận nuôi</h1>
                        <div onclick="document.getElementById('insert-modal').style.display='none'" class="cancelbtn">
                            <i class="fa-solid fa-xmark"></i>
                        </div>
                    </div>

                    <hr>
        
                    <div class="body">
                        <div class="modal-name">
                            <label for="iName">Họ và tên: <span> * </span> </label> 
                            <input type="text" placeholder="Nguyen Van A" name="iName" id="iName" required value="<%= name  %>">
                        </div>
            
                        <div class="modal-cmnd">
                            <label for="iCmnd">CMND: <span> * </span> </label>
                            <div class="red" id="error" style="display: inline; font-size: 14px; color:red;"><%=error %></div> <br>
                            <input type="text" placeholder="0092112212" name="iCmnd" required id="iCmnd" value="<%= cmnd  %>">
                        </div>

                        <div class="modal-phone">
                            <label for="iPhone">Số điện thoại:<span> * </span> </label> 
                            <input type="tel" placeholder="0921233423" name="iPhone" required id="iPhone" value="<%= phone  %>">
                        </div>

                        <div class="modal-address">
                            <label for="iAddress"> Địa chỉ: <span> * </span> </label>
                            <input type="text" placeholder="Liên Chiểu, Đà Nẵng" name="iAddress" required id="iAddress" <%= address %>>
                        </div>
                        <div class="modal-note">
                            <label for="iNote"> Ghi chú: </label>
                            <input type="text" name="iNote" id="iNote" value="<%= note  %>">
                        </div>  
                    </div>

                    <div class="footer">
                        <button type="submit">Lưu thông tin</button>   
                    </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="js/play-modal.js"></script>
    <script src="js/adopterAction.js"></script>
</body>
</html>
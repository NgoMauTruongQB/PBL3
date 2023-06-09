<%@page import="model.Children"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.ChildrenDAO"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/children.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="./js/scroll.js"></script>
    <title>Happy House | Children Manage</title>
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp" %>
        <div class="header-body"><h1>Quản lí trẻ</h1></div>

        <div class="operation">
            <!-- Thêm  -->
            <div class="insert">
                <a href="childrenInsert.jsp"><button> <i class="fa-solid fa-plus"></i> Thêm mới </button></a>
            </div>
            
            <!-- Tìm kiếm -->
            <button onclick="showHideSearch()" > <i class="fa-solid fa-filter"></i> &nbsp; Tìm kiếm </button>

        </div>

        <div id="searchDiv">
            <div class="search-form">
                <form class="search-form-js" >
                    <input type="text" name="sName" id="sName" placeholder="Họ và tên" onkeyup="searchName()">
                    <input type="date" name="sDate" id="sDate" placeholder="Ngày sinh">
                    <select name="sGender" id="sGender" onchange="searchGender()">
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                    </select>
                    <select name="sState" id="sState" onchange="searchState()">
                        <option value="1">Đang sinh sống</option>
                        <option value="0">Đã chuyển đi </option>
                    </select>
                    <button type="submit" id="search" >
                        <i class="fa-solid fa-magnifying-glass"></i>
                        Tìm kiếm
                    </button>
                </form>
            </div>
        </div>

        <!-- Bảng -->
        <div class="table" >
        	<table style="width: 100%; overflow-x: scroll;">
        	<%
        	ChildrenDAO crd = new ChildrenDAO();
        	ArrayList<Children> list = crd.selectAll();
        	%>
	            <thead>
	                <tr>
                        <th>Ảnh</th>
	                    <th>ID</th>
	                    <th onclick="sortTable(2)"> Họ và tên  <i class="ti-exchange-vertical"></i>  </th>
	                    <th onclick="sortTable(3)"> Giới tính  <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(4)"> Ngày sinh  <i class="ti-exchange-vertical"></i></th>
	                    <th> Sức khoẻ </th>
	                    <th>Lí do </th>
                        <th>Học vấn</th>
	                    <th onclick="sortTable(8)">Trạng thái <i class="ti-exchange-vertical"></i></th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% for (Children cr : list) { %>
	             <%
                   java.sql.Date dateOfBirth = cr.getDate_of_birth();
                   SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                   String formattedDateOfBirth = dateFormat.format(dateOfBirth);
                  %>
                    <tr>
                        <td>
                            <img src="uploads/children/<%=cr.getPhoto() %>" alt="An example image" class="image-class" onerror="this.onerror=null;this.src='./assets/img/avatar/avatar.jpg';">
                        </td>
	                    <td><%= cr.getOrphanID() %></td>
                        <td class="editable"> <button class="view" onclick="viewChild('<%= cr.getOrphanID() %>')"><%= cr.getName() %></button></td>
	                    <td class="editable"><%= cr.getGender() %></td>
	                    <td class="editable"><%= formattedDateOfBirth %></td>
	                    <td class="editable"><%= cr.getHealth_status() %></td>
	                    <td class="editable"><%= cr.getReason() %></td>
                        <td class="editable"><% if (cr.getEducation() == null) {%> <%= "" %> <% }else {%> <%= cr.getEducation() %><%} %></td>
	                    <td class="editable"><%if (cr.getState() == 1){ %>
	                    <%= "Đang sinh sống" %><%} else {%>
	                    <%= "Đã chuyển đi" %> <%} %><td>
                        <td>
	                    	<button class="edit" onclick="editChild('<%= cr.getOrphanID() %>')">Sửa</button>
						    <button class="delete" onclick="confirmDelete('<%= cr.getOrphanID() %>')">Xoá</button>
						</td>
	                </tr>
	             <%} %> 
	             <script>
	             function viewChild(id) {
	            	  window.location.href = "children_controller?id=" + id + "&mod=getInfoView";
	            	}
	             function editChild(id) {
	            	  window.location.href = "children_controller?id=" + id + "&mod=getInfo";
	            	}
	             function confirmDelete(id) {
		            	console.log(id);
		                if (confirm("Bạn có chắc chắn muốn xoá trẻ này?")) {
		                    window.location.href = "children_controller?id=" + id + "&mod=deleteChild";
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
    <script src="./js/childrenAction.js"></script>
    </div>
</body>
</html>
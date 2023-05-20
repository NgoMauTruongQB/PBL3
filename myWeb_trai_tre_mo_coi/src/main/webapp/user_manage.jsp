<%@page import="java.util.ArrayList"%>
<%@page import="database.UserDAO"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/fonts/fontawesome-free-6.3.0-web/css/fontawesome.css">
    <link rel="stylesheet" href="./assets/css/user.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <script src="./js/scroll.js"></script>
    <title>Happy House | Manange </title>
</head>
<body>
    <div class="container">
        <%@ include file="header.jsp" %>


        <div class="header-body"><h1>Quản lí tài khoản</h1></div>

        <!-- Tìm kiếm -->
        <div class="search-form">
            <form>
                <input type="text" name="sName" id="sName" placeholder="Họ và tên" onkeyup="searchName()">
                <input type="text" name="sUsername" id="sUsername" placeholder="Tên người dùng" onkeyup="searchUsername()">
                <input type="email" name="sEmail" id="sEmail" placeholder="Email" onkeyup="searchEmail()">
                <select name="sRole" id="sRole" onchange="searchRole()">
                    <option value="user">User</option>
                    <option value="admin">Admin</option>
                    <option value="staff">Staff</option>
                </select>
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
        	<% 
	       	UserDAO us = new UserDAO();
	        ArrayList<User> list = us.selectAll();
	        %>
	            <thead>
	                <tr>
	                    <th>ID </th>
	                    <th onclick="sortTable(1)">Tên tài khoản &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(2)">Họ và tên  <i class="ti-exchange-vertical"></i></th>
	                    <th>Mật khẩu</th>
	                    <th onclick="sortTable(4)">Email &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(5)">Quyền &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th onclick="sortTable(6)">Trạng thái &nbsp; <i class="ti-exchange-vertical"></i></th>
	                    <th></th>
	                </tr>
	            </thead>
	            <tbody id="data-table">
	            <% for (User u : list){ %>
	           		<tr>
	                    <td><%= u.getId() %></td>
	                    <td class="editable"><%= u.getUsername() %></td>
	                    <td class="editable"><%= u.getFullname() %></td>
	                    <td class="editable"><%= u.getPassword() %></td>
	                    <td class="editable"><%= u.getEmail() %></td>
	                    <td class="editable"><%= u.getRole() %></td>
	                    <td class="editable"><% if(u.getState() == 1){ %>
	                     <%= "Đang hoạt động" %> <%} else {%>
	                    <%= "Không hoạt động" %> <%} %></td>
	                    <td>
	                    	<button class="edit" onclick="editUser('<%= u.getId() %>')">Sửa</button>
						    <button class="delete" onclick="confirmDelete('<%= u.getId() %>')"> Xoá</button>
						</td>
	                  </tr>
	            <%} %>
	            <script>
	            function editUser(id) {
	            	window.location.href = "user_controller?id=" + id + "&mod=getInfo";
				}
	            function confirmDelete(id) {
	                if (confirm("Bạn có chắc chắn muốn xoá user này?")) {
	                    window.location.href = "user_controller?id=" + id + "&mod=deleteUser";
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
         	
         	String username = request.getAttribute("username")+"";
         	username = (username.equals("null")) ? "" : username;
         	
         	String name = request.getAttribute("name")+"";
     		name = (name.equals("null")) ? "" : name;
     		
     		String email = request.getAttribute("email")+"";
     		email = (email.equals("null")) ? "" : email;
     		
     		String password = request.getAttribute("password")+"";
     		password = (password.equals("null")) ? "" : password;
         %>
        <div id="insert-modal" class="modal" style="overflow-x:auto;">
            <div class="modal-container" >
        
                <!-- Modal Content -->
                <form class="modal-content animate" action="user_controller" method="post">
                	<input type="hidden" name="mod" value="addUser">
                    <div class="header">
                        <h1>Thông tin tài khoản</h1>
                        <div onclick="document.getElementById('insert-modal').style.display='none'" class="cancelbtn">
                            <i class="fa-solid fa-xmark"></i>
                        </div>
                    </div>

                    <hr>
        
                    <div class="body">
                        <div class="modal-name">
                            <label for="iName">Họ và tên:  </label> 
                            <input type="text" placeholder="Nguyen Van A" name="iName" id="iName" value="<%= name  %>">
                        </div>
            
                        <div class="modal-username">
                            <label for="iUsername">Tên tài khoản:<span> * </span> </label>
                            <div class="red" id="error" style="display: inline; font-size: 14px; color:red;"><%=error %></div> <br>
                            <input type="text" placeholder="vana02" name="iUsername" required id="iUsername" value="<%=username %>">
                        </div>

                        <class class="modal-password">
                            <label for="iPassword">Mật khẩu:<span> * </span> </label> <br>
                            <input type="text" placeholder="congchua" name="iPassword" required id="iPassword" value="<%=password %>">
                        </class>

                        <div class="modal-email">
                            <label for="iEmail">Email: <span> * </span> </label>
                            <input type="email" placeholder="congchua@gmail.com" name="iEmail" required id="iEmail" ="iEmail">
                        </div>

                        <div class="modal-role">
                            <label for="iRole"> Quyền:<span> * </span> </label>
                            <select name="iRole" id="iRole">
                                <option value="user">User</option>
                                <option value="admin">Admin</option>
                                <option value="staff">Staff</option>
                            </select>
                        </div>

                        <label>
                    </div>

                    <div class="footer">
                        <button type="submit">Lưu user</button>   
                    </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="./js/play-modal.js"></script>
    <script src="./js/userAction.js"></script>
</body>
</html>
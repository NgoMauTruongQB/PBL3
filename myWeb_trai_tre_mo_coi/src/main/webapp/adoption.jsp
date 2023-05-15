<%@page import="model.User"%>
<%@page import="model.Children"%>
<%@page import="database.ChildrenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="/View/assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" href="/View/assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <link rel="icon" href="./assets/img/logo/logo_happy_house.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="./assets/css/charity.css">
    <script src="./js/scroll.js"></script>
    <title>Happy House</title>
</head>

<body>
    <%@ include file="headerUser.jsp" %>
    <script>
        SuccessAdoption = <%= request.getAttribute("SuccessAdoption") %>;
        if (SuccessAdoption) {
            Swal.fire({
                icon: 'success',
                title: 'Yêu cầu đã gửi thành công',
                text: 'Yêu cầu của bạn đang chờ xác thực',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = "index.jsp";
                }
            });
        }
    </script>
    <%
        ChildrenDAO childrenDAO = new  ChildrenDAO();
        ArrayList<Children> Childrens = childrenDAO.selectAll();
    %>	
    <div id="wrapper">
        <h2>Nhận nuôi trẻ</h2>
        <hr>
    </div>
    <div id="adoption">
        <div class="left">
            <img src="./assets/img/icon/TreEm.png" alt="">
        </div>
        <div class="right">
            <form action="adoption" method="post">
                <input type="hidden" name="mod" value="insert">
                <%
                    String error = request.getAttribute("error")+"";
                    error = (error.equals("null")) ? "" : error;
                %>
                <div class="error">
                    <span style="color: red; font-size: 14px">
                        <%= error %>
                    </span>
                </div>
                <select name="children_name" class="control-form" required>
                    <option value="" selected disabled hidden>Chọn tên trẻ</option>
                    <% for (Children children : Childrens) { 
                        if(children.getState() == 1) {
                    %>
                        <option value="<%= children.getName()%>"><%= children.getName() %></option>
                    <% } } %>
                </select>
                <input type="text" name="note" placeholder="Ghi chú" class="control-form">
                <button type="button" class="form-submit"><a href="./adopter_signup.jsp"> Đăng kí </a></button>
                <button type="submit" class="form-submit"> Gửi </button>
            </form>
        </div>
    </div>
</body>

</html>
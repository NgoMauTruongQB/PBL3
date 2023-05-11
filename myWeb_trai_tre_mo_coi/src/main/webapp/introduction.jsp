<%@page import="model.User"%>
<%@page import="model.Children"%>
<%@page import="database.ChildrenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/style1.css">
    <link rel="stylesheet" href="./View/assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/donate.css">
    <script src="./js/scroll.js"></script>
    <link rel="stylesheet" href="./View/assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <title>Donate</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>
<script>
SuccessIntroduction = <%= request.getAttribute("SuccessIntroduction") %>;
  if (SuccessIntroduction) {
    Swal.fire({
    	 icon: 'success',
         title: 'Gửi thành công',
         text: 'Cảm ơn bạn đã phản hồi',
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
	<div id="main">
          <%@ include file="headerUser.jsp" %>

<form action="introduction" method="post">
<input type="hidden" name="mod" value="insert">
<div id="wrapper">
    <div><h2 id="donate"> Ủng Hộ Nuôi Trẻ Tại Trung Tâm </h2></div>
   <div id="line-up">
    <hr>
   </div>
    <div class="logo">
        <img src="./assets/img/logo/logo_happy_house.png" alt="">
    </div>
    <div class="content">
       <div class="row">
          <%
            		String error = request.getAttribute("error")+"";
            		error = (error.equals("null")) ? "" : error;
            	%>
            	<div class="error">
            		<span style="color: red; font-size: 14px"> <%= error %> </span>
            	</div>
        <div class="col col-full">
        <!--     <input type="text" name="children_name" placeholder="Tên trẻ" class="control-form"> -->
              <select name="children_name" class="control-form" required>
                        <option value="" selected disabled hidden>Chọn tên trẻ</option>
                      	<%
        				for (Children children : Childrens) {
    							%>
    			<option value="<%= children.getName()%>"><%= children.getName() %></option>
    			<% } %> 
                    </select> 
        </div>
       
       </div>
       <div class="row">
        <div class="col col-full">
            <input type="text" name="note" placeholder="Ghi chú" class="control-form">
        </div>
       </div>
       
       <input type="submit" value="SEND" class="form-submit">
    </div>
    </div>
    </form>
 </div>
    </body>
    
</html>
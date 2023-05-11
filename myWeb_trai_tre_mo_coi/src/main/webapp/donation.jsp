<%@page import="model.User"%>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <title>Donate</title>
</head>
<body>
<script>
SuccessDonation = <%= request.getAttribute("SuccessDonation") %>;
  if (SuccessDonation) {
    Swal.fire({
    	icon: 'success',
        title: 'Cảm ơn bạn đã Donate',
        text: 'Số tiền của bạn đang chờ được xác thực',
        confirmButtonText: 'OK'
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = "index.jsp";
      }
    });
  }
</script>
	<div id="main">
          <%@ include file="headerUser.jsp" %>

<form action="verifyDonation_controller" method="post">
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
     	<%
            		String error = request.getAttribute("error")+"";
            		error = (error.equals("null")) ? "" : error;
            	%>
            	<div class="error">
            		<span style="color: red; font-size: 14px"> <%= error %> </span>
            	</div>
        
       <div class="row">
        <div class="col col-full ">
           	
            <select name="charity_activities" class="control-form " placeholder="chọn hoạt động ủng hộ">
    
  			<option value="HD1201">Ủng hộ trẻ em bị hở hàm ếch </option>
  			<option value="HD1202" >100K cùng bé đến trường</option>
  			<option value="HD1221">Đem nắng về bản</option> 
  	
    			<%
        for (Charity_activities charity : charitys) {
    			%>
    			<option value="<%= charity.getActivityID()%>"><%= charity.getName_of_activity() %></option>
    			<% } %> 
			</select>
        </div>
       </div>
       <div class="row">
        <div class="col col-full">
            <input type="text" name="phone" placeholder="Số điện thoại" class="control-form">
        </div>
       
       </div>
       <div class="row">
        <div class="col col-full">
          
            <input type="text" name="money" placeholder="Số tiền ủng hộ" class="control-form">
        </div>
       </div>
       
       <input type="submit" value="SEND" class="form-submit">
    </div>
    </div>
    </form>
 </div>
    </body>
    
    </html> 
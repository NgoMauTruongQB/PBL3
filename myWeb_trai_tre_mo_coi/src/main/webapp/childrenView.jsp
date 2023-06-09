<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/children_view.css">
    <script src="./js/scroll.js"></script>
    <title>Xem thông tin</title>
</head>
<body>
	<div class="container ">
	<%
		String uName = request.getAttribute("uName")+"";
		String uGender = request.getAttribute("uGender")+"";
		Date uDate = (Date) request.getAttribute("uDate");
		String uHealth = request.getAttribute("uHealth")+"";
		String uEducation = request.getAttribute("uEducation")+"";
		uEducation = (uEducation.equals("null")) ? "" : uEducation;
		String uReason = request.getAttribute("uReason")+"";
		int uState = (int) request.getAttribute("uState");
		String uPhoto = request.getAttribute("uPhoto")+"";
       	uPhoto = (uPhoto.equals("null")) ? "" : uPhoto;
		String id = request.getAttribute("id")+"";
	%>
        <!-- Bread Crumb -->
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="children_manage.jsp">Trẻ</a></li>
            <li><a href="#">Chi tiết thông tin trẻ</a></li>
        </ul>

        <!-- Image Profile -->
        <div class="imgDiv" >
            <div class="cover-image">
                <img src="./assets/img/cover/cover.png" alt="Ảnh bìa" >
            </div>
            <div class="profile">
                <img src="uploads/children/<%=uPhoto %>" id="preview" class="square-image" alt="Ảnh đại diện" 
                	onerror="this.onerror=null;this.src='./assets/img/avatar/avatar.jpg';" >
            </div>
        </div>

        <!-- Infomation -->
        <div class="info">
            <form action="">
                <div class="header-info">
                    <h2>Thông tin trẻ</h2>
                </div>

                <hr>

                <div class="infoDiv">
                    <label for="vName"> Họ và tên: <span> * </span> </label> 
                    <input type="text" placeholder="Nguyen Van A" name="vName" id="vName" value="<%= uName %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vGender">Giới tính: <span> * </span></label>
                    <div class="vGender radioInput">
                        <div class="gender-sub">
                            <input type="radio" name="vGender" id="male" value="Nam" value="Nam" <% if(uGender.equals("Nam")){ out.print("checked"); } %>  disabled>
                            <label for="male">Nam</label>
                        </div>
                        <div class="gender-sub">
                            <input type="radio" name="vGender" id="female" value="Nữ" <% if(uGender.equals("Nữ")){ out.print("checked"); } %>  disabled>
                            <label for="female">Nữ</label>
                        </div>
                    </div>
                </div> 
                <div class="infoDiv">
                    <label for="vDate"> Ngày sinh: <span> * </span> </label>
                    <input type="date" placeholder="27/02/2003" name="vDate" id="vDate" value="<%= uDate %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vHealth"> Sức khoẻ: <span> * </span> </label>
                    <input type="text" name="vHealth" id="vHealth" placeholder="Tốt" value="<%= uHealth %>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vEducation"> Học vấn: </label>
                    <input type="text" name="vEducation" id="vEducation" placeholder="8/12" value="<%= uEducation%>"  readonly>
                </div>
                <div class="infoDiv">
                    <label for="vState">Trạng thái: <span> * </span> </label>
                    <div class="vState radioInput" >
                        <div class="state-sub">
                            <input type="radio" name="vState" id="status-active" value="1" <% if(uState == 1) { out.print("checked"); } %>  disabled>
                            <label for="status-active">Đang sinh sống</label>
                        </div>
                        <div class="state-sub">
                            <input type="radio" name="vState" id="status-inactive" value="0" <% if(uState == 0) { out.print("checked"); } %>  disabled>
                            <label for="status-inactive">Đã chuyển đi</label>
                        </div>
                    </div>
                </div>
                <div class="infoDiv">
                    <label for="vReason"> Lí do: </label>
                    <textarea name="vReason" id="vReason"  rows="10"  readonly><%= uReason %></textarea>
                </div>

                <hr>

                <div class="footer-info">
                </div>

            </form>
        </div>
    </div>
    <script src="./js/upload-img.js"></script>
</body>
</html>
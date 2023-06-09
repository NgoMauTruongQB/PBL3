<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/children_update.css">
    <script src="./js/scroll.js"></script>
    <title>Update Children</title>
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
            <li><a href="#">Cập nhật thông tin trẻ </a></li>
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
            <form action="children_controller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="mod" value="updateChild">
            <input type="hidden" name = "id" value="<%= id %>">
                <div class="header-info">
                    <h2>Thông tin trẻ</h2>
                </div>

                <hr>

                <div class="infoDiv">
                    <label for="uName"> Họ và tên: <span> * </span> </label> 
                    <input type="text" placeholder="Nguyen Van A" name="uName" id="uName" required value="<%= uName %>">
                </div>
                <div class="infoDiv">
                    <label for="uGender">Giới tính: <span> * </span></label>
                    <div class="uGender radioInput">
                        <div class="gender-sub">
                            <input type="radio" name="uGender" id="male" value="Nam" <% if(uGender.equals("Nam")){ out.print("checked"); } %>>
                            <label for="male">Nam</label>
                        </div>
                        <div class="gender-sub">
                            <input type="radio" name="uGender" id="female" value="Nữ" <% if(uGender.equals("Nữ")){ out.print("checked"); } %>>
                            <label for="female">Nữ</label>
                        </div>
                    </div>
                </div> 
                <div class="infoDiv">
                    <label for="uDate"> Ngày sinh: <span> * </span> </label>
                    <input type="date" placeholder="27/02/2003" name="uDate" id="uDate" required  value="<%= uDate %>">
                </div>
                <div class="infoDiv">
                    <label for="iHealth"> Sức khoẻ: <span> * </span> </label>
                    <input type="text" name="uHealth" id="uHealth" placeholder="Tốt" value="<%= uHealth %>">
                </div>
                <div class="infoDiv">
                    <label for="iEducation"> Học vấn: </label>
                    <input type="text" name="uEducation" id="uEducation" placeholder="8/12" value="<%= uEducation%>">
                </div>
                <div class="infoDiv">
                    <label for="iReason"> Lí do: </label>
                    <input type="text" name="uReason" id="uReason" placeholder="Bị bỏ rơi trước cổng chùa" value="<%= uReason %>">
                </div>
                <div class="infoDiv">
                    <label for="uState">Trạng thái: <span> * </span> </label>
                    <div class="uState radioInput">
                        <div class="state-sub">
                            <input type="radio" name="uState" id="status-active" value="1" <% if(uState == 1) { out.print("checked"); } %>>
                            <label for="status-active">Đang sinh sống</label>
                        </div>
                        <div class="state-sub">
                            <input type="radio" name="uState" id="status-inactive" value="0" <% if(uState == 0) { out.print("checked"); } %>>
                            <label for="status-inactive">Đã chuyển đi</label>
                        </div>
                    </div>
                </div>
                <div class="infoDiv">
                    <label for="file-input" class="custom-file-input">
                        <i class="fa fa-cloud-upload"></i> Tải lên tệp tin
                    </label>
                    <input type="file" id="file-input" name="uPhoto" accept="image/*"
                    data-hs-file-attach-options='{
                        "textTarget": "#avatarImg",
                        "mode": "image",
                        "targetAttr": "src",
                        "resetTarget": ".js-file-attach-reset-img",
                        "resetImg": "./assets/img/test/img1.jpg",
                        "allowTypes": [".png", ".jpeg", ".jpg"]
                    }'>
                </div>

                <hr>

                <div class="footer-info">
                    <button type="submit">Lưu thông tin</button>
                </div>

            </form>
        </div>
    </div>
    <script src="./js/upload-img.js"></script>
</body>
</html>
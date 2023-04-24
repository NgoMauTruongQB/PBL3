<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/children_insert.css">
    <script src="./js/scroll.js"></script>
    <title>Insert Children</title>
</head>
<body>
	<div class="container ">

        <!-- Bread Crumb -->
        <ul class="breadcrumb">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="children_manage.jsp">Trẻ</a></li>
            <li><a href="#">Thêm trẻ</a></li>
        </ul>

        <!-- Image Profile -->
        <div class="imgDiv" >
            <div class="cover-image">
                <img src="./assets/img/cover/cover.png" alt="Ảnh bìa" >
            </div>
            <div class="profile">
                <img src="./assets/img/avatar/avatar.jpg" id="preview" class="square-image" alt="Ảnh đại diện" >
            </div>
        </div>

        <!-- Infomation -->
        <div class="info" >
            <form action="children_controller" method="post" enctype="multipart/form-data">
            <input type="hidden" name="mod" value="addChild">
                <div class="header-info">
                    <h2>Thông tin trẻ</h2>
                </div>

                <hr>

                <div class="infoDiv">
                    <label for="iName"> Họ và tên: <span> * </span> </label> 
                    <input type="text" placeholder="Nguyen Van A" name="iName" id="iName" required>
                </div>
                <div class="infoDiv">
                    <label for="iGender">Giới tính: <span> * </span></label>
                    <div class="iGender radioInput">
                        <div class="gender-sub">
                            <input type="radio" name="iGender" id="male" value="Nam">
                            <label for="male">Nam</label>
                        </div>
                        <div class="gender-sub">
                            <input type="radio" name="iGender" id="female" value="Nữ">
                            <label for="female">Nữ</label>
                        </div>
                    </div>
                </div> 
                <div class="infoDiv">
                    <label for="iDate"> Ngày sinh: <span> * </span> </label>
                    <input type="date" placeholder="27/02/2003" name="iDate" id="iDate" required>
                </div>
                <div class="infoDiv">
                    <label for="iHealth"> Tình trạng sức khoẻ: <span> * </span></label>
                    <input type="text" placeholder="Tốt" name="iHealth" id="iHealth" required>
                </div>
                <div class="infoDiv">
                    <label for="iEducation"> Học vấn: <span> * </span></label>
                    <input type="text" name="iEducation" id="iEducation" placeholder="8/12">
                </div>
                <div class="infoDiv">
                    <label for="iReason"> Lí do: <span> * </span> </label>
                    <input type="text" name="iReason" id="iReason" placeholder="Nhận nuôi từ chùa">
                </div>
                <div class="infoDiv">
                    <label for="file-input" class="custom-file-input">
                        <i class="fa fa-cloud-upload"></i> Tải lên tệp tin
                    </label>
                    <input type="file" id="file-input" name="file-input" accept="image/*"
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
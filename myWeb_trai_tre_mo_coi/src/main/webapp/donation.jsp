<%@page import="java.util.ArrayList"%>
<%@page import="database.Charity_activitiesDAO"%>
<%@page import="model.Charity_activities"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./View/assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" href="./View/assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="./assets/css/donate.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="./js/scroll.js"></script>
    <title>Donate</title>
</head>

<body>
	<%@ include file="headerUser.jsp" %>
    <script>
        SuccessDonation = <%=request.getAttribute("SuccessDonation")%>;
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
    <div id="wrapper">
        <h2>Ủng hộ cho các hoạt động</h2>
        <hr>
    </div>
    <div id="donation">
        <div class="left">
            <img class="img" src="./assets/img/icon/donation.jpg" alt="">
            <div class="overlay">
                <h3>Quy Trình ủng hộ:</h3>
                <li>Chuyển số tiền cần ủng hộ đến số tài khoản "99997777" - Ngân hàng Quân Đội. Nội dung chuyển khoản: "Tên hoạt đông" - "Số điện thoại" </li>
                <li>Điền thông tin tương ứng vào form</li>
                <li>Nhân viên của chúng tôi sẽ kiểm tra và xác thực số tiền ủng hộ.</li>
            </div>
        </div>
        <div class="right">
            <form action="verifyDonation_controller" method="post">
                <input type="hidden" name="mod" value="insert">
                <div class="content">
                    <% String error=request.getAttribute("error") + "" ; error=(error.equals("null")) ? "" : error; %>
                        <div class="error">
                            <span style="color: red; font-size: 14px">
                                <%=error%>
                            </span>
                        </div>
                        <label for="">Tên hoạt động: </label>
                        <select name="charity_activities" class="control-form" placeholder="chọn hoạt động ủng hộ">
                            <%  Charity_activitiesDAO charity_activitiesDAO=new Charity_activitiesDAO();
                                ArrayList<Charity_activities> charitys = charity_activitiesDAO.selectAll();
                                for (Charity_activities charity : charitys) { %>
                                    <option value="<%=charity.getActivityID()%>">
                                        <%=charity.getName_of_activity()%>
                                    </option>
                                    <% } %>
                        </select>
                        <label for="">Số điện thoại: </label>
                        <input type="text" name="phone" placeholder="Số điện thoại" class="control-form">
                        <label for="">Số tiền ủng hộ: </label>
                        <input type="text" name="money" placeholder="Số tiền ủng hộ" class="control-form">
                        <button type="submit" class="form-submit"> Gửi</button>
                </div>
            </form>
        </div>
    </div>
</body>

</html>
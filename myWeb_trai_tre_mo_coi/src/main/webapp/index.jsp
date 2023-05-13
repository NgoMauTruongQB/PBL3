<%@page import="model.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="database.StaffDAO" %>
<%@ page import="model.Staff" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="./assets/css/style1.css">
	<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
	<script src="./js/scroll.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	<link rel="icon" href="./assets/img/logo/logo_happy_house.png">
	<title>Happy House</title>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
</head>
<body>
	<script>
		SuccessFeedback = <%= request.getAttribute("SuccessFeedback") %>;
		  if (SuccessFeedback) {
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
	<%@ include file="headerUser.jsp" %>

        <!-- slider -->
        <div id="slideshow">
            <div class="mySlides fade">
                <img src="./assets/img/slider/sl1.png" alt="slider1">
                <div class="text">Bớt đi một đứa trẻ đau khổ <br> Là thêm một người lớn hạnh phúc.</div>
            </div>
            <div class="mySlides fade">
                <img src="./assets/img/slider/sl2.png" alt="slider2">
                <div class="text">Cho yêu thương - Nhận yêu thương</div>
            </div>
            <div class="mySlides fade">
                <img src="./assets/img/slider/sl3.png" alt="slider3">
                <div class="text">Kết nối vòng tay yêu thương</div>
            </div>

            <!-- next and previous button -->
            <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
            <a class="next" onclick="plusSlides(1)">&#10095;</a>
        </div>
        <script src="./js/slider.js"></script>
        <!-- end slider -->

        <!-- introduce -->
        <div id="introduce">
            <div class="left">
                <img src="./assets/img/card/c2.png" alt="Happy House">
            </div>
            <div class="right">
                <h1> Chức năng nhiệm vụ</h1>
                <hr>
                <p> &nbsp;&nbsp;&nbsp;&nbsp;Trung tâm bảo trợ xã hội - Happy House là đơn vị sự nghiệp tư thục trực
                    thuộc Sở Lao động - Thương binh và Xã hội, có chức năng tiếp nhận, quản lý, chăm sóc, nuôi
                    dưỡng, giáo dục hướng nghiệp, phục hồi chức năng cho các đối tượng bảo trợ xã hội và các đối
                    tượng khác do Chủ tịch UBND tỉnh quyết định theo quy định của pháp luật.

                    Trung tâm có tư cách pháp nhân, có con dấu, trụ sở và tài khoản riêng, hoạt động theo cơ chế tự
                    chủ, tự chịu trách nhiệm; chịu sự chỉ đạo, quản lý nhà nước của Ủy ban nhân dân tỉnh, Sở Lao
                    động Thương binh và Xã hội và sự quản lý, hướng dẫn, kiểm tra về chuyên môn, nghiệp vụ của Bộ
                    Lao động Thương binh và Xã hội theo quy định của pháp luật.
                    <br>

                    &nbsp;&nbsp;&nbsp;&nbsp; Trung tâm được giao nhiệm vụ chăm sóc, nuôi dưỡng:
                    Trẻ mồ côi cả cha và mẹ, trẻ em bị bỏ rơi mất
                    nguồn nuôi dưỡng, trẻ mồ côi cha hoặc mẹ nhưng người còn lại mất tích theo quy định tại điều 78
                    của Bộ luật dân sự hoặc không đủ khả năng nuôi dưỡng theo quy định của pháp luật; trẻ em có cha
                    và
                    mẹ đang chấp hành án phạt tù tại trại giam không có nguồn nuôi dưỡng; trẻ em nhiễm HIV, gia đình
                    thuộc hộ nghèo. Người chưa thành niên từ đủ 16 đến 18 tuổi nhưng đang đi học văn hóa, học nghề,
                    có hoàn cảnh như
                    trên.
                </p>
            </div>
        </div>

        <!-- end introduce -->
	
         <form action="feed_back">
            <div id="feedback">
                <div class="header">
                    <h1>Phản hồi về chất lượng</h1>
                    <hr>
                </div>
                <div class="content">
                    <div class="box">
                        <div class="form">
                            <label for="name">
                                <% StaffDAO staffDAO=new StaffDAO(); ArrayList<Staff> staffs = staffDAO.selectAll(); %>
                                    Tên nhân viên:
                                    <% String error=request.getAttribute("error")+"";
                                        error=(error.equals("null")) ? "" : error; %>
                                        <div class="error">
                                            <span style="color: red; font-size: 14px">
                                                <%= error %>
                                            </span>
                                        </div>
                            </label>
                            <select name="name1" id="raying" required>
                                <option value="" selected disabled hidden>Chọn tên nhân viên</option>
                                <% for (Staff staff : staffs) { %>
                                    <option value="<%= staff.getFullname()%>">
                                        <%= staff.getFullname() %>
                                    </option>
                                    <% } %>
                            </select>
    
                            <label for="rating">Đánh giá:</label>
                            <select name="rating" id="raying" required>
                                <option value="" selected disabled hidden>Chọn đánh giá</option>
                                <option value="5">5 sao</option>
                                <option value="4">4 sao</option>
                                <option value="3">3 sao</option>
                                <option value="2">2 sao</option>
                                <option value="1">1 sao</option>
                            </select>
    
                            <label for="comment">Nhận xét của bạn:</label>
                            <textarea id="comment" name="comment" required></textarea>
                            <% String errorF=request.getAttribute("errorF")+""; errorF=(errorF.equals("null")) ? "" : errorF; %>
                            <div class="error">
                                <span style="color: red; font-size: 14px">
                                    <%= errorF %>
                                </span>
                            </div>
                            <input class="button" type="submit" value="Phản hồi">
                        </div>
                        <div class="icon">
                            <img src="./assets/img/icon/heart.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </form>
		<jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
<script  src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.5/dist/sweetalert2.min.css"></script>
</html>
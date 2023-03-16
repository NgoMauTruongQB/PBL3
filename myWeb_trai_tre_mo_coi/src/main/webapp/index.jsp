<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/style1.css">
<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
<script src="./js/scroll.js"></script>
<title>Happy House</title>
</head>
<body>
	<div id="main">
        <!-- top bar -->
        <section id="top-bar">
            <div class="brand">
                <img src="./assets/img/logo/logo_happy_house.png" alt="logo_happy_house">
                <h1>Happy House</h1>
            </div>
            <div class="infor">
                <div class="contact">
                    <i class="fa-solid fa-address-book"></i>
                    <h6>0921123123 <br> happyhouse@gmail.com</h6>
                </div>
                <div class="address">
                    <i class="fa-solid fa-location-dot"></i>
                    <h6>54 Nguyễn Lương Bằng <br> Liên Chiểu - Đà Nẵng</h6>
                </div>
                <div class="login">
                    <a href="./login.jsp">
                        <i class="fa-solid fa-right-to-bracket"></i>
                        Đăng nhập
                    </a>
                </div>
            </div>
        </section>
        <!-- end top bar -->

        <!-- header -->
        <section id="header">
            <ul id="nav">
                <li><a href="#">
                        <i class="fa-solid fa-house"></i>
                        Trang chủ
                    </a></li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-users-rectangle"></i>
                        Hoạt động
                    </a>
                    <ul class="subnav subnav-child">
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Vui chơi giải trí</a></li>
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Từ thiện</a></li>
                    </ul>
                </li>
                <li><a href="#">
                        <i class="fa-solid fa-hand-holding-heart"></i>
                        Ủng hộ
                    </a>
                    <ul class="subnav subnav-child">
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Nuôi trẻ hàng tháng</a></li>
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Các sự kiện từ thiện</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa-solid fa-calendar-week"></i>
                        Danh mục
                    </a>
                    <ul class="subnav subnav-event">
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Nhận nuôi trẻ</a></li>
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Giới thiệu trẻ</a></li>
                        <li><a href="">
                                <i class="fa-solid fa-arrow-right"></i>
                                Đánh giá chất lượng</a></li>
                    </ul>
                </li>
                <li><a href="#">
                        <i class="fa-solid fa-hand-holding-heart"></i>
                        Liên hệ
                    </a></li>
            </ul>
        </section>
        <!-- end header -->

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
            <div class="row">
                <div class="left .column-2">
                    <div class="flip-card">
                        <div class="flip-card-inner">
                            <div class="flip-card-front">
                                <img src="./assets/img/card/c2.png" alt="Happy House">
                            </div>
                            <div class="flip-card-back">
                                <img src="./assets/img/card/c1.png" alt="Sở lao động thương binh xã hội">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="right .column-2">
                    <h1> Chức năng nhiệm vụ</h1>
                    <hr>
                    <p> &nbsp;&nbsp;&nbsp;&nbsp;Trung tâm bảo trợ xã hội - Happy House là đơn vị sự nghiệp tư thục trực thuộc Sở Lao động - Thương binh và Xã hội, có chức năng tiếp nhận, quản lý, chăm sóc, nuôi
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
        </div>
        <!-- end introduce -->

        <!-- feedback -->
        <div id="feedback">
            <div class="header">
                <h1>Phản hồi về chất lượng</h1>
                <hr>
            </div>
            <div class="content">
                <div class="box">
                    <label for="name">
                        <i class="fa-solid fa-user"></i>
                        Tên nhân viên:
                    </label>
                    <input type="text" id="name" required>

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

                    <input class="button" type="submit" value="Phản hồi">
                </div>
            </div>
        </div>
        <!-- end feedback -->

        <!-- footer -->
        <div id="footer">
            <div class="content">
                <div class="text1">
                    Thành lập năm 2023 <br>
                    Với hi vọng giúp đỡ các bạn nhỏ khó khăn, không nơi nương tựa.
                </div>
                <div class="button">
                    <a href="#">ĐỌC THÊM</a>
                </div>
                <div class="text1">Hãy đồng hành cùng chúng tôi</div>
                <div class="icon">
                    <a
                        href="https://www.facebook.com/pages/Tr%E1%BA%A1i-Tr%E1%BA%BB-M%E1%BB%93-C%C3%B4i-Khuy%E1%BA%BFt-T%E1%BA%ADt-K291-L%C3%AA-V%C4%83n-Hi%E1%BA%BFn-%C4%90%C3%A0-N%E1%BA%B5ng/735114560005794"><i
                            class="fa-brands fa-facebook"></i></a>
                    <a href=""><i class="fa-brands fa-instagram"></i></a>
                    <a href=""><i class="fa-brands fa-twitter"></i></a>
                    <a href=""><i class="fa-brands fa-linkedin"></i></a>
                    <a href=""><i class="fa-brands fa-google-plus-g"></i></a>
                </div>
            </div>
        </div>
        <!-- end footer -->

    </div>
</body>

</html>
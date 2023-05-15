<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@page import="model.Event"%>
<%@page import="database.EventDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Happy House</title>
    <meta charset="UTF-8">  
    <link rel="stylesheet" href="assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="/View/assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="assets/css/event.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="icon" href="./assets/img/logo/logo_happy_house.png">
    <script src="./js/scroll.js"></script>
</head>
<body>
	<%@ include file="headerUser.jsp" %>
    <div id="wrapper" >
        <div><h2 id="donate"> Hoạt động vui chơi giải trí </h2></div>
        <div id="line-up" ><hr>
        </div>
    </div>
    <div>
        <ul class="accordion-div">
            <%	Date date_in, date_out; 
                String address,content, name;
                EventDAO eventDao = new EventDAO();
                ArrayList<Event> list = new ArrayList<>();
                list = eventDao.selectAll();
                for(int i=0; i<list.size(); i++){
                    Event e = list.get(i);
                    date_in = e.getDate_begin();
                    date_out = e.getDate_end();
                    address = e.getLocation();
                    content = e.getContent();
                    name = e.getEvent_of_name();
            %>
                    <li name="li<%=(i+1)%4+1%>">
                <div>
                    <button class="accordion" name="btn<%=(i+1)%4+1%>">
                        <label > <%=name%> </label>
                    </button>
                    <div class="panel">
                        <div class="accordion-line">
                            <p style="font-weight: bold;">Thời gian diễn ra: </p>
                            <p><%=date_in %> -  <%=date_out %></p>
                        </div>
                        <div class="accordion-line">
                            <p style="font-weight: bold;">Địa điểm:</p>
                            <p> <%=address %></p>
                        </div>
                        <div class="accordion-line">
                            <p style="font-weight: bold;">Nội dung hoạt động: </p>
                            <p><%=content %></p>
                        </div>
                    </div>
                </div>
            </li>
                    <%
                }
            %>
        </ul>
    </div>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;
        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
            });
        }
        </script>
</body>
</html>
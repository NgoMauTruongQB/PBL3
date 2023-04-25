<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/css/sectionCounter.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<title>Happy House | Admin page</title>
</head>
<body>
	<button class="edit" onclick="editUser()">Sửa</button>
	<script>
	            function editUser() {
	            	window.location.href = "create_excel_controller?&mod=getInfo";
				}
	</script>
</body>
</html>
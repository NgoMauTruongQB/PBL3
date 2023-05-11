<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/wsh/styles.css">

</head>
<body style="background-image: url('img/bg/bg1.jpg'); background-size: cover;">
	<header class="topbar" >
		<div class="container" data-v-878436c2>
			<div class="row">
				<a class="logo col-3" href="login.jsp">
					<img src="/wsh/img/logo/img_wsh3.ico" alt="biet tuong" width="34"> 
				</a>
				<label class="form-lable col-9 mt-2 text-primary" ><h6> Hoai Bao - Nhat Vy</h3></label>
			</div>
		</div>	
	</header>
	<main style="padding-top: 50px" >
		<div class="container bg-white" >
			<form action="login" id="myForm" >
				<h2 style="text-align: center">
					<font style="vertical-align: center;">
						<font style="vertical-align: center;">Đăng nhập</font>
					</font>
				</h2>
				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">Email address</label> 
					<input type="text" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp">
					<div id="emailHelp" class="form-text">We'll never share your
						email with anyone else.</div>
				</div>
				<div class="mb-3">
					<label for="exampleInputPassword1" class="form-label">Password</label>
					<input type="password" class="form-control"
						id="exampleInputPassword1">
				</div>
				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" id="exampleCheck1">
					<label class="form-check-label" for="exampleCheck1">Check me
						out</label>
				</div>
				<button type="submit" class="btn secondary register">
					<font style="vertical-align: inherit;">
						<font style="vertical-align: inherit;">Đăng nhập</font>
					</font>
				</button>
				
				
				<button class="btn btn-primary " onclick="creatAccount()">
					<a href="Register.jsp" style="color: #fff; text-decoration: none; ">Create new Account</a>			
				</button>	
				
			</form>
		</div>
	</main>
</body>
</html>
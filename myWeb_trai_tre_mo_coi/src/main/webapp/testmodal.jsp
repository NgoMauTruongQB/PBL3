
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Happy House</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome-free-6.3.0-web/css/all.css">
    <link rel="stylesheet" href="./assets/css/donate.css">
    <link rel="stylesheet" href="/View/assets/fonts/themify-icons-font/themify-icons/themify-icons.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding: 7%; /* Location of the box */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  left: 0;
  top: 0;
    width: 100%;
    height: 100%;
    align-items: center;
    justify-content: center;
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 0px;
  border: 1px solid #888;
  width: 75%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>
</head>
<body>

<h2>Modal Example</h2>

<!-- Trigger/Open The Modal -->
<button id="myBtn">Open Modal</button>

<!-- The Modal -->

<div  class="modal" id="myModal">
  <!-- Modal content -->
  <div class="modal-content">
	   <a href="#" class="overlay-close close" ></a>
	
	   <div class="dialog-body" id="modal-1">
	       <a class="dialog-close-btn close" href="#" >&times;</a>
	       <div class="card-body">	
	           <img src="./assets/img/slider/sl1.png" class="card-img-modal" alt="...">
	           <div class="row"><h5 class="card-title">name_of_activity</h5></div>
	           <div class="row">
	               <div class="col">
	                   <p class="card-text" style="text-align: left;">Ngày bắt đầu:</p>
	               </div>
	               <div class="col">
	                   <p class="card-text" style="text-align: left;">Ngày kết thúc: </p>
	               </div>                 
	           </div>
	           <div class="row"><p class="card-text" style="text-align: left;">Số tiền ủng hộ: </p></div>
	           <div class="row"><p class="card-text" style="text-align: left;">Chi tiết họat động: </p></div>
	           <div class="row"><p class="card-text" style="text-align: left;">Cá nhân ủng hộ: </p></div>
	   		</div>
	 	</div>
 	
  	</div>
</div>
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</body>
</html>

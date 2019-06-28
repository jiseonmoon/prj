<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
	$(function(){
		$('.carousel').carousel();
	})
</script>
</head>
<body>
	<div id="carousel-generic" class="carousel slide">
       <ol class="carousel-indicators">
         <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
         <li data-target="#carousel-generic" data-slide-to="1"></li>
         <li data-target="#carousel-generic" data-slide-to="2"></li>
         <li data-target="#carousel-generic" data-slide-to="3"></li>
         <li data-target="#carousel-generic" data-slide-to="4"></li>              
       </ol>
       <div class="carousel-inner">
          <div class="item active">
             <img src="image/1.jpg" alt="First slide">
          </div>
          <div class="item">
             <img src="image/2.jpg" alt="Second slide">              
          </div>
          <div class="item">
             <img src="image/3.jpg" alt="Third slide">               
          </div>
          <div class="item">
             <img src="image/4.jpg" alt="Third slide">               
          </div>
          <div class="item">
             <img src="image/5.jpg" alt="Third slide">               
          </div>                                                         
       </div>
        <a class="left carousel-control" href="#carousel-generic" data-slide="prev">
          <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#carousel-generic" data-slide="next">
          <span class="icon-next"></span>
        </a>
      </div>
</body>
</html>
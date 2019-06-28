<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	.mainlist div div{
		border-right: 1px dotted silver;
		padding:20px;
	}
	.mainlist h5{
		font-weight: bolder;
	}
</style>
</head>
<body style="background-color: #f8f9fa;">
	<c:set var="list1" value="${requestScope.list1}"></c:set>
	<c:set var="list2" value="${requestScope.list2}"></c:set>
	<c:set var="list3" value="${requestScope.list3}"></c:set>
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
      
      <div class="container mainlist">
      	<div class="row">
      		<div class="col-md-4 col-sm-6 col-xs-12">
      			<h5> 최신 후원 게시글</h5>
      			<hr>
      			<ul class="datalist">
      				<c:forEach var="board" items="${list1 }" >
      					<li><a href="spondetail.do?no=${board.boardno }">${board.boardtitle }</a></li>
      				</c:forEach>
      			</ul>
      		</div>
      		<div class="col-md-4 col-sm-6 col-xs-12">
      			<h5> 가장 후원액이 많은 게시글</h5>
      			<hr>
      			<ul class="datalist">
      				<c:forEach var="board" items="${list2 }">
      					<li><a href="spondetail.do?no=${board.boardno }">${board.boardtitle }</a></li>
      				</c:forEach>
      			</ul>
      		</div>
      		<div class="col-md-4 col-sm-6 col-xs-12">
      			<h5> 마감 임박 게시글</h5>
      			<hr>
      			<ul class="datalist">
      				<c:forEach var="board" items="${list3 }">
      					<li><a href="spondetail.do?no=${board.boardno }">${board.boardtitle }</a></li>
      				</c:forEach>
      			</ul>
      		</div>
      	</div>
      </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Oxygen&display=swap" rel="stylesheet">
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
		border-left: 1px dotted silver;
		padding:20px;
	}
	.datalist{
		padding:0;
	}
	.mainlist h5{
		font-weight: bolder;
		display: inline;
	}
	.mainlist hr{
		margin:8px 0;
	}
	.datalist{
		list-style:inside;
	}
	.datalist a{
		text-decoration: none;
		color:black;
	}
	.sm{
		font-size: 0.8em;
	}
	.sidecontent{
		padding:20px;
	}
	.sidecontent .g{
		font-family: 'Oxygen', sans-serif;
	}
	.sidemenu .glyphicon-flash{
		background-color: rgb(236,250,255, 0.9);
		color: yellow;
		padding: 10px;
		font-size:3em;
		border-radius: 50%;
		transition: all 0.3s;
	}
	.sidemenu .glyphicon-flash:hover{
		background-color: orange;
	}
	.sidemenu .glyphicon-leaf{
		background-color: rgb(236,250,255, 0.9);
		color: green;
		padding: 10px;
		font-size:3em;
		border-radius: 50%;
		transition: all 0.3s;
	}
	.sidemenu .glyphicon-leaf:hover{
		background-color: orange;
	}
	.sidemenu .glyphicon-usd{
		background-color: rgb(236,250,255, 0.9);
		color: black;
		padding: 10px;
		font-size:3em;
		border-radius: 50%;
		transition: all 0.3s;
	}
	.sidemenu .glyphicon-usd:hover{
		background-color: orange;
	}
	.sidemenu .glyphicon-thumbs-up{
		background-color: rgb(236,250,255, 0.9);
		color: blue;
		padding: 10px;
		font-size:3em;
		border-radius: 50%;
		transition: all 0.3s;
	}
	.sidemenu .glyphicon-thumbs-up:hover{
		background-color: orange;
	}
	.sidemenu .glyphicon{
		right:20px;
		margin-top:20px;
	}
	.sidemenu{
		background-color: rgba(248,230,255,0.2);
		margin-bottom: 20px;
	}
	@media (max-width:768px){
		.sidemenu{
			display:none;
		}
	}
	@media (max-width:991px){
		.sidemenu .glyphicon{
			display:none !important;
		}
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
       </ol>
       <div class="carousel-inner">
          <div class="item active">
             <img class="cai img-responsive" src="image/11.jpg" alt="First slide">
          </div>
          <div class="item">
             <img class="cai img-responsive" src="image/12.jpg" alt="Second slide">              
          </div>
          <div class="item">
             <img class="cai img-responsive" src="image/13.jpg" alt="Third slide">               
          </div>                                                       
       </div>
        <a class="left carousel-control" href="#carousel-generic" data-slide="prev">
          <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#carousel-generic" data-slide="next">
          <span class="icon-next"></span>
        </a>
      </div>
      <div class="container-fluid sidemenu">
      <div class="container">
      	<div class="row">
      		<div class="col-lg-3 col-md-6 sidecontent">
	      		<div class="col-lg-3 col-md-3">
	      			<span class="glyphicon glyphicon-flash"></span>
	      		</div>
	      		<div class="col-lg-9 col-md-9 g">
	      			<h3>Fast & Easy</h3>
	      			<p>쉽고 빠르게 당신의 후원을 성사시킬 수 있습니다.</p>
	      		</div>
      		</div>
      		<div class="col-lg-3 col-md-6 sidecontent">
	      		<div class="col-lg-3 col-md-3">
	      			<span class="glyphicon glyphicon-leaf"></span>
	      		</div>
	      		<div class="col-lg-9 col-md-9 g">
	      			<h3>Who & When</h3>
	      			<p>누구나 언제든 도전할 수 있습니다.</p>
	      		</div>
      		</div>
      		<div class="col-lg-3 col-md-6 sidecontent">
	      		<div class="col-lg-3 col-md-3">
	      			<span class="glyphicon glyphicon-usd"></span>
	      		</div>
	      		<div class="col-lg-9 col-md-9 g">
	      			<h3>Small | Big</h3>
	      			<p>적든 많든 당신이 원하는 만큼 투자할 수 있습니다.</p>
	      		</div>
      		</div>
      		<div class="col-lg-3 col-md-6 sidecontent">
	      		<div class="col-lg-3 col-md-3">
	      			<span class="glyphicon glyphicon-thumbs-up"></span>
	      		</div>
	      		<div class="col-lg-9 col-md-9 g">
	      			<h3>Best & New</h3>
	      			<p>항상 신선하고 최고의 경험을 제공합니다.</p>
	      		</div>
      		</div>
      		</div>
      </div>
      </div>
      
      <div class="container mainlist">
      	<div class="row">
      		<div class="col-md-4 col-sm-6 col-xs-12">
      			<span class="glyphicon glyphicon-list"></span><h5> 최신 후원 게시글</h5>
      			<hr>
      			<ul class="datalist">
      				<c:forEach var="board1" items="${list1 }" >
      					<li><a href="spondetail.do?no=${board1.boardno }">${board1.boardtitle } <span class="sm">[${board1.boardtag }]</span></a></li>
      				</c:forEach>
      			</ul>
      		</div>
      		<div class="col-md-4 col-sm-6 col-xs-12">
      			<span class="glyphicon glyphicon-list"></span><h5> 가장 후원액이 많은 게시글</h5>
      			<hr>
      			<ul class="datalist">
      				<c:forEach var="board2" items="${list2 }">
      					<li></span><a href="spondetail.do?no=${board2.boardno }"> ${board2.boardtitle } <span class="sm">[${board2.boardtag }]</span><span class="sm"> [${board2.nowmoney }만원]</span></a></li>
      				</c:forEach>
      			</ul>
      		</div>
      		
      		
            
      		<div class="col-md-4 col-sm-6 col-xs-12">
      			<span class="glyphicon glyphicon-list"></span><h5> 마감 임박 게시글</h5>
      			<hr>
      			<ul class="datalist">
      				<c:forEach var="board3" items="${list3 }">
      				
      					<c:set var="date" value="${board3.finaldate }"/>
      					<jsp:useBean id="now" class="java.util.Date"/>
						<fmt:parseDate var="parsedate" value="${date }" pattern="yyyy-MM-dd"></fmt:parseDate>
						<fmt:parseNumber value="${now.time/(1000*60*60*24) }" integerOnly="true" var="nowDays"/>
          			 	<fmt:parseNumber value="${parsedate.time/(1000*60*60*24) }" integerOnly="true" var="oldDays"/>
          			 	<c:set value="${oldDays - nowDays }" var="dateDiff"/>
          			 	
      					<li><a href="spondetail.do?no=${board3.boardno }">${board3.boardtitle } <span class="sm">[${board3.boardtag }]</span><span class="sm">[${dateDiff+1 }일 남았습니다.]</span></a></li>
      				</c:forEach>
      			</ul>
      		</div>
      	</div>
      </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Document</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<style>
	.header nav ul{
		list-style: none;
		background-color: rgba(243,242,240,0.7);
		text-align: center;
		margin-bottom:0;
		padding:0;
	}
	.header nav ul li{
		font-size:18px;
		margin-left:20px;
		margin-right:20px;
		display: inline-block;
		padding: 10px;
	}
	.header nav ul li:hover{
		color:black;
		background-color: rgba(0, 0, 0, 0.2);
	}
	
	.header nav ul li a:link{
		color:black;
		text-decoration: none;
	}
	.header nav ul li a:hover{
		color:black;
		text-decoration: none;
	}
	.header nav ul li a:visited, .header nav ul li a:focus, .header nav ul li a:active{
		color:black;
		text-decoration: none;
	}
	.header{
		padding:0 !important;
	}
	.mb{
		display:none !important;
	}
	.header .pc a{
		font-weight: bold;
	}
	@media (max-width:876px){
		.pc{
			font-size:0.9em !important;
		}
	}
	@media (max-width:762px){
		.mb{
			display: inline !important;
			padding:1.5px 10px !important;
		}
		.pc{
			display: none !important;
			
		}
	}
	@media (max-width:505px){
		.header nav ul li{
			margin-left:10px !important;
			margin-right:10px !important;
		}
	}
	@media (max-width:385px){
		.header nav ul li{
			margin-left:5px !important;
			margin-right:5px !important;
		}
	}
</style>
</head>

<body>
	<c:set var="member" value="${sessionScope.member }"/>
	<div class="container-fluid header">
		<nav>
			<ul>
				<li class="mb"><a href="main.do"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="mb"><a href="sponlist.do"><span class="glyphicon glyphicon-usd"></span></a></li>
				<li class="mb"><a href="#"><span class="glyphicon glyphicon-bullhorn"></span></a></li>
				<li class="pc"><a href="main.do">비트펀딩</a></li>
				<li class="pc"><a href="sponlist.do">후원하기</a></li>
				<li class="pc"><a href="qalist.do">고객센터</a></li>
				<c:choose>
					<c:when test="${empty member }">
						<li class="mb"><a href="login.do"><span class="glyphicon glyphicon-log-in"></span></a></li>
						<li class="mb"><a href="add.do"><span class="glyphicon glyphicon-user"></span></a></li>
						<li class="hlogin pc"><a href="login.do">로그인</a></li>
						<li class="hlogin pc"><a href="add.do">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${member.mtier eq 3}">
								<li class="mb"><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span></a></li>
								<li class="mb"><a href="memberinfo.do"><span class="glyphicon glyphicon-info-sign"></span></a></li>
								<li class="mb"><a href="memberlist.do"><span class="glyphicon glyphicon-book"></span></a></li>
								<li class="hlogin pc"><a href="logout.do">로그아웃</a></li>
								<li class="hlogin pc"><a href="memberinfo.do">사용자 정보</a></li>
								<li class="hpage pc"><a href="memberlist.do">관리자 페이지</a></li>
							</c:when>
							<c:otherwise>
								<li class="mb"><a href="logout.do"><span class="glyphicon glyphicon-log-out"></span></a></li>
								<li class="mb"><a href="memberinfo.do"><span class="glyphicon glyphicon-info-sign"></span></a></li>
								<li class="hlogin pc"><a href="logout.do">로그아웃</a></li>
								<li class="hlogin pc"><a href="memberinfo.do">사용자 정보</a></li>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>			
			</ul>
			<ul>
			
			</ul>
		</nav>
	</div>
</body>
</html>
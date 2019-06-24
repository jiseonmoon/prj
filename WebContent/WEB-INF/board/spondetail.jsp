<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="result" value="${ requestScope.result }"></c:set>
	
	<div class="center-block" style='width:60%; background:pink'>
		<p class="text-center">${ result.boardtag }</p><br> <!-- 글 태그 -->
		<h1 class="text-center">${ result.boardtitle }</h1><br> <!-- 글제목 -->
		<p class="text-center">${ result.boardwriter }</p><br> <!-- 글작성자 -->
		
		<div class="row">
	  		<div class="col-md-8">${ result.imagepath }</div> <!-- 이미지 -->
	  		<div class="col-md-4">
	  			${ result.nowmoney }<br> <!-- 현재모금액 -->
	  			${ result.finaldate }<br> <!-- 마감일 -->
	  			${ result.destmoney } <!-- 목표모금액 -->
	  		</div>
		</div>
	 	글내용: <br>
		현재모금액: ${ result.nowmoney }<br>
		마감일: ${ result.finaldate }<br>
		목표금액: ${ result.destmoney }<br>
	</div>
	
	<div class="center-block" style='width:60%;'>

  		<!-- Nav tabs -->
  		<ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">상세내용</a></li>
		    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">댓글</a></li>
  		</ul>

  		<!-- Tab panes -->
	  	<div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home">${ result.boardcontent }</div> <!-- 글내용 -->
		    <div role="tabpanel" class="tab-pane" id="profile">댓글내용</div>
  		</div>

	</div>
	
	

	글번호: ${ result.boardno }<br>
	회원번호: ${ result.writerno }<br>
	후원최소액: ${ result.minmoney }<br>

  		
	
</body>
</html>
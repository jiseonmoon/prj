<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function(){
		let no = ${ result.boardno }
		$.ajax({
            url:"sponsublist.do",
		    data:"no="+no,
		    dataType:"html",
		    success:function(data) {
			    $('#result').append(data);
		    } ,error:function(data) {
			    console.log('error');
		    }
	   });
	});
	
	function formSubmit() {
		$('#result').empty();
	    var params = $("#frm").serialize();
	    console.log(params);
	    
	    $.ajax({
	    	url:"sponsubadd.do",
	    	data:params,
	    	type:'post',
	    	success:function() {
	    		console.log('성공');
	    	}
	    });
	    
	    let no = ${ result.boardno }
	    $.ajax({
            url:"sponsublist.do",
		    data:"no="+no,
		    dataType:"html",
		    success:function(data) {
			    $('#result').append(data);
		    } ,error:function(data) {
			    console.log('error');
		    }
	   });
	};
	
	
	function Submit() {
		$('#result').empty();
		let no = ${ result.boardno }
		$.ajax({
            url:"sponsublist.do",
		    data:"no="+no,
		    dataType:"html",
		    success:function(data) {
			    $('#result').append(data);
		    } ,error:function(data) {
			    console.log('error');
		    }
	   });
	};
	
	
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#pay{
		padding-left: 50px;
		padding-right: 50px;
	}
	
	#sub{
		margin-top: 30px;
	}
	
	#main{
		padding-bottom: 30px;
	}
</style>
</head>
<body>
	<c:set var="path" value="${ requestScope.image }"></c:set> 
	<c:set var="result" value="${ requestScope.result }"></c:set>
	
	<div class="center-block" style='width:100%;' id="main" > <!-- background:pink' -->
		<p class="text-center">${ result.boardtag }</p><br> <!-- 글 태그 -->
		<h1 class="text-center">${ result.boardtitle }</h1><br> <!-- 글제목 -->
		<p class="text-center"><strong>${ result.boardwriter }</strong></p><br> <!-- 글작성자 -->
		
		<div class="row">
			<div class="col-md-2">
	  		</div>
	  		<div class="col-md-5">
	  			<img class="img-responsive" src="upload/${ result.imagepath }" alt="img"> <!-- 이미지 -->
	  		</div>
	  		<div class="col-md-5">
	  			<p>현재모금역</p>
	  			<h2>${ result.nowmoney }원</h2><br><br> <!-- 현재모금액 -->
	  			
	  			<p>마감일</p>
	  			<h2>${ result.finaldate }</h2><br><br> <!-- 마감일 -->
	  			
	  			<p>목표금액</p>
	  			<h2>${ result.destmoney }만원</h2><br><br> <!-- 목표모금액 -->
	 
	  			<br>
	  			<br>
	  			
	  			<!-- 글번호 넘겨주기 -->
	  			<form action="payment1.do" method="post">
	  				<input type="hidden" name="boardno" value="${ result.boardno }">
	  				<button type="submit" class="btn btn-primary" id="pay">후원하기</button>
	  			</form>
	  			<br>
	  			<form action="spondel.do" method="post">
	  				<input type="hidden" name="boardno" value="${ result.boardno }"> <!-- 글번호 -->
	  				<input type="hidden" name="imagepath" value="${ result.imagepath }"> <!-- 이미지이름 -->
	  				<button type="submit" class="btn btn-default">삭제</button>
	  			</form>
	  		</div>
		</div>
	</div>
	
	<div class="center-block" style='width:60%;' id="sub">
  		<!-- Nav tabs -->
  		<ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">상세내용</a></li>
		    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">댓글</a></li>
  		</ul>

  		<!-- Tab panes -->
	  	<div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home">
		    	${ result.boardcontent } <!-- 글내용 -->
		    </div>
		    <div role="tabpanel" class="tab-pane" id="profile">
		    	<form action="sponsubadd.do" method="post" id="frm"> <!-- 글번호랑 같이 넘겨줌 -->
		    		<input type="hidden" name="boardno" value="${ result.boardno }">
					<textarea name="content" class="form-control" rows="3" maxlength="100" style='width:90%;'></textarea> <!-- 댓글내용 -->
					<input type="text" name="memberNo"> <!-- 회원 번호를 세션에서 받아 넘겨주게 바꿔야됨 -->
					<!-- <button type="submit" class="btn btn-info" id="submit">작성</button> -->
					<input type="button" class="btn btn-info" value="댓글작성" onclick="formSubmit()" />
					<input type="button" class="btn btn-info" value="새로고침" onclick="Submit()" />
				</form>
				<div id="result"></div>
		    </div>
  		</div>
	</div>
	회원번호: ${ result.writerno }<br>
	후원최소액: ${ result.minmoney }<br>
</body>
</html>
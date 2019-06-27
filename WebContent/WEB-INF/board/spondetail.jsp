<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	@media (max-width: 767px) {
		#pay{
			padding: 20px 100px;
			width: 100%;
		}
		
		#del{
			padding: 10px 100px;
			width: 100%;
		}
		
		#sub{
			margin-top: 0px;
			width: 100%;
		}
	}
	
	
	@media (min-width: 768px) {
		#sub{
			margin-top: 0px;
			width: 60%;
		}
	}
	
	
	#pay{
		padding: 20px 100px;
	}
	
	#del{
		padding: 20px 100px;
	}

	#main{
		padding-top: 20px;
		padding-bottom: 60px;
		background-color: #FBF6F6;
	}
	
	#disabledInput{
		width: 110px;
	}
	
	#content1{
		margin-left: 15px;
		border: 1px solid;
	}
	
	#content2{
		margin-left: 15px;
		padding-top: 20px;
		border: 1px solid;
	}
</style>
</head>
<body>
	<c:set var="path" value="${ requestScope.image }"></c:set> 
	<c:set var="result" value="${ requestScope.result }"></c:set>
	<c:set var="writer" value="${ requestScope.writer }"></c:set>
	<c:set var="dateResult" value="${ requestScope.dateResult }"></c:set>
	<c:set var="member" value="${ sessionScope.member }"></c:set> <!-- 세션 스코프 -->
	
	<div class="center-block" style='width:100%;' id="main">
		<h1 class="text-center"><small><${ result.boardtag }> </small>${ result.boardtitle }</h1><br> <!-- 태그, 글제목 -->
		<div class="row">
			<div class="col-md-2">
	  		</div>
	  		<div class="col-md-5">
	  			<img class="img-responsive" src="upload/${ result.imagepath }" alt="img"> <!-- 이미지 -->
	  		</div>
	  		<div class="col-md-5">
	  			<br>
	  			<p>현재모금역</p>
	  			<h2>${ result.nowmoney }만원</h2><br><br> <!-- 현재모금액 -->
	  			
	  			<p>마감일</p>
	  			<h2>${ result.finaldate }</h2><br><br> <!-- 마감일 -->
	  			
	  			<p>목표금액</p>
	  			<h2>${ result.destmoney }만원</h2><br><br> <!-- 목표모금액 -->
	 
	  			<br>
	  			<br>
	  			
	  			<form action="spondel.do" method="post">
	  				<input type="hidden" name="boardno" value="${ result.boardno }"> <!-- 글번호 -->
	  				<input type="hidden" name="imagepath" value="${ result.imagepath }"> <!-- 이미지이름 -->
	  				<button type="submit" class="btn btn-danger" id="del">삭제하기</button>
	  			</form>
	  			
	  			<br>
	  			
	  			<c:if test="${ member != null }">
					<c:if test="${ dateResult == false }">
				  		<button type="submit" class="btn btn-primary" id="pay" disabled="disabled">후원하기</button>
			  		</c:if>
			  		<c:if test="${ dateResult == true }">
				  		<button type="submit" class="btn btn-primary" id="pay" disabled="disabled">후원하기</button>
			  		</c:if>
			  	</c:if>
				
				<c:if test="${ member != null }">
					<c:if test="${ dateResult == true }">
			  			<!-- 글번호 넘겨주기 -->
			  			<form action="payment1.do" method="post">
			  				<input type="hidden" name="boardno" value="${ result.boardno }">
			  				<button type="submit" class="btn btn-primary" id="pay">후원하기</button>
			  			</form>
		  			</c:if>
		  			<c:if test="${ dateResult == false }">
			  			<button type="submit" class="btn btn-primary" id="pay" disabled="disabled">후원하기</button>
		  			</c:if>
				</c:if>
	  		</div>
		</div>
	</div>
	
	<div class="center-block" id="sub">
  		<!-- Nav tabs -->
  		<ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">상세내용</a></li>
		    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">댓글</a></li>
  		</ul>

  		<!-- Tab panes -->
	  	<div class="tab-content">
		    <div role="tabpanel" class="tab-pane active" id="home">
		    	<!-- 글내용 -->
		    	<div class="row">
			    	<div class="col-md-7" id="content1">
			    		<p class="text-left">${ result.boardcontent }</p>
		  			</div>
		  			<div class="col-md-1"></div>
			    	<div class="col-md-3" id="content2">
			    		<p class="text-center">창작자: ${ writer.mid }</p><br>
			    		<p class="text-center">이메일: ${ writer.memail }</p><br>
			    		<p class="text-center">전화번호: ${ writer.mtel }</p><br>
			    	</div>
		    	</div>
		    </div>
		    <div role="tabpanel" class="tab-pane" id="profile">
		    	<form action="sponsubadd.do" method="post" id="frm"> <!-- 글번호랑 같이 넘겨줌 -->
		    		<input type="hidden" name="boardno" value="${ result.boardno }">
					<textarea name="content" class="form-control" rows="3" maxlength="100"></textarea> <!-- 댓글내용 -->
					<!-- 회원 번호를 세션에서 받아 넘겨주게 바꿔야됨 -->
					<input id="disabledInput" type="text" placeholder="아이디" name="memberNo" disabled>
					<input type="button" class="btn btn-info" value="댓글작성" onclick="formSubmit()"/>
					<input type="button" class="btn btn-info" value="새로고침" onclick="Submit()"/>
				</form>
				<div id="result"></div>
		    </div>
  		</div>
	</div>
	<%-- 
	회원번호: ${ result.writerno }<br>
	후원최소액: ${ result.minmoney }<br>
	 --%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	.check{
		background-image :none;
		background-color: lightblue;
	}
	a:link{
		text-decoration: none;
		color: black;
	}
	@media (max-width: 992px){
		ul li:nth-of-type(4){
			margin: 0;
			position: absolute;
			right:15%;
		}
	}
	@media (max-width: 768px){
		ul li:nth-of-type(4){
			margin: 0;
			position: absolute;
			right:20%;
		}
	}
	@media(max-width: 576px){
		ul li:nth-of-type(4){
			margin: 0;
			position: absolute;
			right:5%;
		}
	}
	.jumbotron{
		background-image: url("image/back.jpg");
		background-size: cover;
		background-position: center;
	}
	.jumbotron h1, .jumbotron p{
		color:white !important;
	}
	#subbtn{
		padding:5px 30px;
	}
	@media (max-width:992px){
		#subbtn{
			margin-top:10px;
		}
	}
	@media(max-width: 576px){
		#subbtn{
			padding: 5px 20px;
		}
	}
	#check1, #check2, #check3, #check4, #check5, #check6, #check7{
		padding: 5px 15px;
		margin-top: 10px;
	}
	.pimg{
		margin: 10px;
		border: 1px double silver;
		border-radius: 10px;
	}
	#first h4, #second h4, #third h4{
		display: inline;
		font-weight: bolder;
	}
	.glyphicon-leaf{
		color: #81c147;
	}
	.glyphicon-asterisk{
		color: red;
	}
</style>
<script>
	function submitcheck(event){
		console.log("체크합니다.");
		if(!$('.panel-heading:eq(0)').hasClass('check') || !$('.panel-heading:eq(1)').hasClass('check') || !$('.panel-heading:eq(2)').hasClass('check')){
			console.log("1번");
		
			$('.nav-tabs').children('li').removeClass('active');
			$('#first').removeClass('active');
			$('#second').removeClass('active');
			$('#third').removeClass('active');
			$('#first').removeClass('show');
			$('#second').removeClass('show');
			$('#third').removeClass('show');
			$('#first').addClass('active show');
			$('.nav-tabs').children().eq(0).addClass('active');
		}
		else{
			console.log("두번째");
			if(!$('.panel-heading:eq(3)').hasClass('check') || !$('.panel-heading:eq(4)').hasClass('check') || !$('.panel-heading:eq(5)').hasClass('check')){
			
				$('.nav-tabs').children('li').removeClass('active');
				$('#first').removeClass('active');
				$('#second').removeClass('active');
				$('#third').removeClass('active');
				$('#first').removeClass('show');
				$('#second').removeClass('show');
				$('#third').removeClass('show');
				$('#second').addClass('active show');
				$('.nav-tabs').children().eq(1).addClass('active');	
			}else{
				if(!$('.panel-heading:eq(6)').hasClass('check') || !$('.panel-heading:eq(7)').hasClass('check')){
				
					$('.nav-tabs').children('li').removeClass('active');
					$('#first').removeClass('active');
					$('#second').removeClass('active');
					$('#third').removeClass('active');
					$('#first').removeClass('show');
					$('#second').removeClass('show');
					$('#third').removeClass('show');
					$('#third').addClass('active show');
					$('.nav-tabs').children().eq(2).addClass('active');	
			}else{
				document.frm.submit();
			}
		}
		}
	}

	$(function(){
		$('#check1').on('click', function(){
			console.log("클릭");
			if($('#stitle').val() != null && $('#stitle').val()!=""){
				$('.panel-heading:eq(0)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(0)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"  aria-expanded="false" class="collapsed"><span class="glyphicon glyphicon-ok"> </span> '+$('#stitle').val() + "</a>");
				$('.panel-heading:eq(0)').addClass('check');
				$('.panel-heading:eq(0) ~ div').collapse('hide');
				$('.panel-heading:eq(0) ~ div').removeClass('show');
				$('.panel-heading:eq(0) ~ div').removeClass('in');
				$('.panel-heading:eq(1) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(0)').hasClass('check')){
					$('.panel-heading:eq(0)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true">'+'<span>제목을 입력해주세요.</span>'+'</a>');
					$('.panel-heading:eq(0)').removeClass('check');
					$('.panel-heading:eq(0)').children('span').remove();
					$('.panel-heading:eq(0) ~ div').removeClass('show');
					$('.panel-heading:eq(0) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(0)').css('background-image', 'none').css('background-color', 'orange');
			}
					
		})
		$('#check2').on('click', function(){
			console.log("클릭");
			if($('#scontent').val() != null && $('#scontent').val()!=""){
				$('.panel-heading:eq(1)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(1)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-ok"> </span> '+ ' 내용이 입력되었습니다.'+"</a>");
				$('.panel-heading:eq(1)').addClass('check');
				$('.panel-heading:eq(1) ~ div').collapse('hide');
				$('.panel-heading:eq(1) ~ div').removeClass('show');
				$('.panel-heading:eq(1) ~ div').removeClass('in');
				$('.panel-heading:eq(2) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(1)').hasClass('check')){
					$('.panel-heading:eq(1)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">'+"내용을 입력해주세요."+'</a>');
					$('.panel-heading:eq(1)').removeClass('check');
					$('.panel-heading:eq(1)').children('span').remove();
					$('.panel-heading:eq(1) ~ div').removeClass('show');
					$('.panel-heading:eq(1) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(1)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check3').on('click', function(){
			console.log("클릭");
			if($('#tag').val() != null && $('#tag').val()!=""){
				$('.panel-heading:eq(2)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(2)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-ok"> </span> '+ $('#tag').val()+'</a>');
				$('.panel-heading:eq(2)').addClass('check');
				$('.panel-heading:eq(2) ~ div').collapse('hide');
			}else{
				if($('.panel-heading:eq(2)').hasClass('check')){
					$('.panel-heading:eq(2)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">'+'태그가 선택되지 않았습니다.'+"</a>");
					$('.panel-heading:eq(2)').removeClass('check');
					$('.panel-heading:eq(2)').children('span').remove();
					$('.panel-heading:eq(2) ~ div').removeClass('show');
					$('.panel-heading:eq(2) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(2)').css('background-image', 'none').css('background-color', 'orange');
			}
		})
		$('#check4').on('click', function(){
			console.log("클릭");
			if($('#imgpath').val() != null && $('#imgpath').val()!=""){
				$('.panel-heading:eq(3)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(3)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2"><span class="glyphicon glyphicon-ok"> </span> '+" 이미지를 업로드 했습니다." + "</a>");
				$('.panel-heading:eq(3)').addClass('check');
				$('.panel-heading:eq(3) ~ div').collapse('hide');
				$('.panel-heading:eq(3) ~ div').removeClass('show');
				$('.panel-heading:eq(3) ~ div').removeClass('in');
				$('.panel-heading:eq(4) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(3)').hasClass('check')){
					$('.panel-heading:eq(3)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2">'+' 이미지를 올려주세요.'+'</a>');
					$('.panel-heading:eq(3)').removeClass('check');
					$('.panel-heading:eq(3)').children('span').remove();
					$('.panel-heading:eq(3) ~ div').removeClass('show');
					$('.panel-heading:eq(3) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(3)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check5').on('click', function(){
			console.log("클릭");
			if($('#destmoney').val() != null && $('#destmoney').val()!="" && $('#destmoney').val()!=0){
				$('.panel-heading:eq(4)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(4)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo2"><span class="glyphicon glyphicon-ok"> </span> '+'목표 금액 : ' + $('#destmoney').val()+"만원" + "</a>");
				$('.panel-heading:eq(4)').addClass('check');
				$('.panel-heading:eq(4) ~ div').collapse('hide');
				$('.panel-heading:eq(4) ~ div').removeClass('show');
				$('.panel-heading:eq(4) ~ div').removeClass('in');
				$('.panel-heading:eq(5) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(4)').hasClass('check')){
					$('.panel-heading:eq(4)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo2">'+' 목표 금액을 설정해주세요.'+'</a>');
					$('.panel-heading:eq(4)').removeClass('check');
					$('.panel-heading:eq(4)').children('span').remove();
					$('.panel-heading:eq(4) ~ div').removeClass('show');
					$('.panel-heading:eq(4) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(4)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check6').on('click', function(){
			console.log("클릭");
			if($('#minmoney').val() != null && $('#minmoney').val()!="" && $('#minmoney').val()!=0){
				$('.panel-heading:eq(5)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(5)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseThree2"><span class="glyphicon glyphicon-ok"> </span> '+'최소 후원 금액 : ' + $('#minmoney').val()+"만원" + "</a>");
				$('.panel-heading:eq(5)').addClass('check');
				$('.panel-heading:eq(5) ~ div').collapse('hide');
				$('.panel-heading:eq(5) ~ div').removeClass('show');
				$('.panel-heading:eq(5) ~ div').removeClass('in');
				$('.panel-heading:eq(6) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(5)').hasClass('check')){
					$('.panel-heading:eq(5)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseThree2">'+' 최소 후원 금액을 설정해주세요.'+'</a>');
					$('.panel-heading:eq(5)').removeClass('check');
					$('.panel-heading:eq(5)').children('span').remove();
					$('.panel-heading:eq(5) ~ div').removeClass('show');
					$('.panel-heading:eq(5) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(5)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check7').on('click', function(){
			console.log("클릭");
			if($('#finaldate').val() != null && $('#finaldate').val()!=""){
				$('.panel-heading:eq(6)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(6)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3"><span class="glyphicon glyphicon-ok"> </span> '+'마감일 : ' + $('#finaldate').val()+ "</a>");
				$('.panel-heading:eq(6)').addClass('check');
				$('.panel-heading:eq(6) ~ div').collapse('hide');
				$('.panel-heading:eq(6) ~ div').removeClass('show');
				$('.panel-heading:eq(6) ~ div').removeClass('in');
				$('.panel-heading:eq(7) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(6)').hasClass('check')){
					$('.panel-heading:eq(6)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3">'+' 마감일을 선택해주세요.'+'</a>');
					$('.panel-heading:eq(6)').removeClass('check');
					$('.panel-heading:eq(6)').children('span').remove();
					$('.panel-heading:eq(6) ~ div').removeClass('show');
					$('.panel-heading:eq(6) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(6)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check8').on('click', function(){
			console.log("클릭");
			if($('#bankno').val() != null && $('#bankno').val()!=""){
				$('.panel-heading:eq(7)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(7)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo3"><span class="glyphicon glyphicon-ok"> </span> '+'계좌 번호 : ' + $('#bankno').val()+ "</a>");
				$('.panel-heading:eq(7)').addClass('check');
				$('.panel-heading:eq(7) ~ div').collapse('hide');
				$('.panel-heading:eq(7) ~ div').removeClass('show');
				$('.panel-heading:eq(7) ~ div').removeClass('in');
				$('.panel-heading:eq(8) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(7)').hasClass('check')){
					$('.panel-heading:eq(7)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo3">'+' 계좌를 입력해주세요.'+'</a>');
					$('.panel-heading:eq(7)').removeClass('check');
					$('.panel-heading:eq(7)').children('span').remove();
					$('.panel-heading:eq(7) ~ div').removeClass('show');
					$('.panel-heading:eq(7) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(7)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#atitle').on('mouseover', function(){
			$('#atitle').popover('show');
		})
		$('#atitle').on('mouseout', function(){
			$('#atitle').popover('hide');
		})
		$('#acontent').on('mouseover', function(){
			$('#acontent').popover('show');
		})
		$('#acontent').on('mouseout', function(){
			$('#acontent').popover('hide');
		})
		$('#atag').on('mouseover', function(){
			$('#atag').popover('show');
		})
		$('#atag').on('mouseout', function(){
			$('#atag').popover('hide');
		})
		$('#aimg').on('mouseover', function(){
			$('#aimg').popover('show');
		})
		$('#aimg').on('mouseout', function(){
			$('#aimg').popover('hide');
		})
		$('#adm').on('mouseover', function(){
			$('#adm').popover('show');
		})
		$('#adm').on('mouseout', function(){
			$('#adm').popover('hide');
		})
		$('#amm').on('mouseover', function(){
			$('#amm').popover('show');
		})
		$('#amm').on('mouseout', function(){
			$('#amm').popover('hide');
		})
		$('#afd').on('mouseover', function(){
			$('#afd').popover('show');
		})
		$('#afd').on('mouseout', function(){
			$('#afd').popover('hide');
		})
		$('#abn').on('mouseover', function(){
			$('#abn').popover('show');
		})
		$('#abn').on('mouseout', function(){
			$('#abn').popover('hide');
		})
		
	})
</script>
<title>Insert title here</title>
</head>
<body style="background-color: rgba(250,239,220, 0.1);">

	<div class="jumbotron">
 	 	<div class="container">
    		<h1>후원 프로젝트 생성</h1>
    		<p> 당신의 도전을 응원합니다.</p>
    		<p><a class="btn btn-success btn-lg" href="sponlist.do">목록으로</a></p>
  		</div>
	</div>
	<hr>
	<div class="container">	
		<form action="sponaddresult.do" method="POST" enctype="multipart/form-data" role="form" name="frm">
			<ul class="nav nav-tabs" role="tablist" style="z-index: 1">
	   			<li class="active" role="presentation col-md-1 col-sm-1 col-xs-1"><a href="#first" aria-controls="first" role="tab" data-toggle="tab">1단계</a></li>
	   			<li role="presentation col-md-1 col-sm-1 col-xs-1"><a href="#second" aria-controls="second" role="tab" data-toggle="tab">2단계</a></li>
	   			<li role="presentation col-md-1 col-sm-1 col-xs-1"><a href="#third" aria-controls="third" role="tab" data-toggle="tab">3단계</a></li>
	   			<li class="col-md-3 col-md-offset-6 col-sm-1 col-sm-offset-8 col-xs-8 col-xs-offset-1 d-flex justify-content-end" style="z-index: 1"><input class="btn btn-info btn-md" id="subbtn" type="button" value="제출" onclick="submitcheck()"></li>
	  		</ul>
	  		
	  		<div class="tab-content float-none">
	  			<!-- 아코디언 시작 -->
	   			<div role="tabpanel" class="tab-pane active" id="first">
	   				<div class="panel-group" id="accordion">
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="atitle" data-parent="#accordion" href="#collapseOne" 
				              	title="프로젝트 제목" data-container="body" data-toggle="popover" data-placement="top" 
				              	data-content="당신의 프로젝트를 한 눈에 알아볼 수 있도록 알기 쉬운 제목을 입력해주세요!">
								후원 프로젝트 제목 작성
				              </a>
				            </h4>
				          </div>
				          <div id="collapseOne" class="panel-collaps show in">
				            <div class="panel-body">
				            <span class="glyphicon glyphicon-leaf"></span><h4> 프로젝트 제목은 어떻게 보여지나요?</h4>
				            <img class="pimg img-responsive" src="image/제목.jpg" alt="제목 이미지">
				              <div class="form-group">
				              	<label for="stitle">프로젝트 제목</label>
				              	<input id="stitle" name="stitle" type="text" class="form-control" placeholder="프로젝트 명칭을 작성해주세요." required>
				              	<input type="button" class="btn btn-default" name="check1" id="check1" value="확인">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="acontent" data-parent="#accordion" href="#collapseTwo"
				              	title="프로젝트 스토리" data-container="body" data-toggle="popover" data-placement="top"
				              	data-content="당신이 전달하고 싶은 이야기, 당신의 도전, 마침내 이루고 싶은 목표들을 구체적이고 상세하게 적어주세요!">
				               	후원 프로젝트 스토리 작성
				              </a>
				            </h4>
				          </div>
				          <div id="collapseTwo" class="panel-collapse collapse ">
				            <div class="panel-body">
				              <div class="form-group">
				               	<span class="glyphicon glyphicon-leaf"></span><h4> 프로젝트 내용은 어떻게 보여지나요?</h4>
				          		<img class="pimg img-responsive" src="image/내용.jpg" alt="내용 이미지">
				              	<label for="scontent">프로젝트 스토리</label>
				              	<textarea id="scontent" class="form-control" name="scontent" rows="10" cols="100"></textarea>
				              	<input type="button" class="btn btn-default" name="check2" id="check2" value="확인">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="atag" data-parent="#accordion" href="#collapseThree"
				              	title="프로젝트 태그" data-container="body" data-toggle="popover" data-placement="top"
				              	data-content="당신의 프로젝트는 어떤 분야에 속하나요? 대표적인 하나를 골라주세요!">
				             	후원 프로젝트의 태그를 선택하세요.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseThree" class="panel-collapse collapse">
				            <div class="panel-body">
				           		<span class="glyphicon glyphicon-leaf"></span><h4> 태그는 어떻게 사용되나요?</h4>
				          		<img class="pimg img-responsive" src="image/태그.jpg" alt="내용 이미지">
				          		<span class="glyphicon glyphicon-asterisk"></span><h4> 선택한 태그는 게시글의 검색에 사용됩니다!</h4>
				                <label for="tag"></label><br><br>
				                <select id="tag" name="tag">
				                	<option value="">태그를 선택해주세요.</option>
				                	<option value="게임">게임</option>
				                	<option value="디자인">디자인</option>
				                	<option value="책">책</option>
				                </select>
				                <input type="button" class="btn btn-default" name="check3" id="check3" value="확인">
				            </div>
				          </div>
				        </div>
				      </div>
	   			</div>
	   			
	    		<div role="tabpanel" class="tab-pane" id="second">
	    			<div class="panel-group" id="accordion2">
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="aimg" data-parent="#accordion2" href="#collapseOne2"
				              	title="대표 이미지" data-container="body" data-toggle="popover" data-placement="top"
				              	data-content="당신의 프로젝트를 소개할 대표적인 이미지를 골라 올려주세요!">
								프로젝트를 소개할 이미지를 업로드 해주세요.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseOne2" class="panel-collapse collapse in">
				            <div class="panel-body">
				              <div class="form-group">
				              	<span class="glyphicon glyphicon-leaf"></span><h4> 이미지는 어떻게 사용되나요?</h4>
				          		<img class="pimg img-responsive" src="image/이미지.jpg" alt="내용 이미지">
				          		<span class="glyphicon glyphicon-asterisk"></span><h4> 선택한 이미지는 게시글의 소개에 사용됩니다!</h4><br><br>
				              	<label for="imgpath">이미지 파일 업로드 : </label>
				              	<input type="file" class="form-control" name="imgpath" id="imgpath">
				              	<input type="button" class="btn btn-default" name="check4" id="check4" value="확인">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="adm" data-parent="#accordion2" href="#collapseTwo2"
				              	title="목표 금액" data-container="body" data-toggle="popover" data-placement="top"
				              	data-content="당신의 목푝를 달성하기 위해서는 얼마나 되는 금액이 필요한가요? 금액을 입력해주세요!">
				               	프로젝트의 달성 금액을 입력해주세요.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseTwo2" class="panel-collapse collapse ">
				            <div class="panel-body">
				              <div class="form-group">
				             	<span class="glyphicon glyphicon-leaf"></span><h4> 목표 액수는 어떻게 보여지나요?</h4>
				          		<img class="pimg img-responsive" src="image/도달액.jpg" alt="도달 이미지">
				          		<span class="glyphicon glyphicon-asterisk"></span><h4> 당신이 목표하는 금액을 확실히 명시해주세요!</h4><br><br>
				              	<label for="destmony">금액(만 원)</label>
				              	<input type="number" class="form-control" value="0" name="destmoney" id="destmoney" step="1" min="0" max="1000">
				              	<input type="button" class="btn btn-default" name="check5" id="check5" value="확인">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="amm" data-parent="#accordion2" href="#collapseThree2"
				              	title="최소 금액" data-container="body" data-toggle="popover" data-placement="top"
				              	data-content="후원자들이 당신에게 전달할 수 있는 금액의 최소치를 설정합니다.">
				             	프로젝트 후원 최소 금액을 입력해주세요.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseThree2" class="panel-collapse collapse">
				            <div class="panel-body">
				            <div class="form-group">
				              <span class="glyphicon glyphicon-asterisk"></span><h4> 후원자들에게 바라는 최소 금액을 명시해주세요!</h4><br><br>
				              <label for="destmony">금액(만 원)</label>
				              <input type="number" class="form-control" value="0" name="minmoney" id="minmoney" step="1" min="0" max="10">
				              <input type="button" class="btn btn-default" name="check6" id="check6" value="확인">
				              </div>
				            </div>
				          </div>
				        </div>
				      </div>	
	    		</div>
	    		
	    		<div role="tabpanel" class="tab-pane" id="third">
	    			<div class="panel-group" id="accordion3">
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="afd" data-parent="#accordion3" href="#collapseOne3"
				              	title="프로젝트 마감 일자" data-container="body" data-toggle="popover" data-placement="top"
				              	data-content="프로젝트의 마감 기한을 설정합니다.">
								프로젝트 마감 기간을 입력해주세요.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseOne3" class="panel-collapse collapse in">
				            <div class="panel-body">
				              <div class="form-group">
				                <span class="glyphicon glyphicon-leaf"></span><h4> 마감 일자가 지나면 후원하기 버튼이 비활성화 됩니다!</h4><br>
				                <img class="pimg img-responsive" src="image/비활성화.jpg" alt="버튼 이미지">
				                <span class="glyphicon glyphicon-asterisk"></span><h4> 목표하는 마감 일자를 명시해주세요!</h4><br><br>
				              	<label for="finaldate">마감 기한</label>
				              	<input type="date" name="finaldate" id="finaldate" class="form-control">
				              	<input type="button" class="btn btn-default" name="check7" id="check7" value="확인">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" id="abn" data-parent="#accordion3" href="#collapseTwo3"
				              	title="입금 계좌 번호" data-container="body" data-toggle="popover" data-placement="top"
				              	data-content="후원자들이 금액을 전달할 수 있는 계좌 번호를 입력해주세요. '-'를 제외한 번호를 입력해주세요.">
				               	입금 계좌를 입력해주세요.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseTwo3" class="panel-collapse collapse ">
				            <div class="panel-body">
				              <div class="form-group">
				                <span class="glyphicon glyphicon-asterisk"></span><h4> 입력하신 계좌로 현금이 입금됩니다!</h4><br><br>
				                <span class="glyphicon glyphicon-asterisk"></span><h4> 정확한 계좌번호를 입력해주세요!</h4><br><br>
				              	<label for="bankno">'-'를 빼고 입력해주세요.</label>
				              	<input type="text" class="form-control" id="bankno" name="bankno" placeholder="은행 계좌 번호 입력 ex)94102399350">
				              	<input type="button" class="btn btn-default" name="check8" id="check8" value="확인">
				              </div>
				            </div>
				          </div>
				        </div>
				        
				      </div>	
	    		</div>	    			    		
  			</div>
		</form>
	</div>
</body>
</html>
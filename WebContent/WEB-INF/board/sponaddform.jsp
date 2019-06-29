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
<link rel="stylesheet" href="css/sponaddform.css">
<script src="js/sponaddform.js"></script>
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
	   			<li class="active" role="presentation col-md-1 col-sm-1 col-xs-2" style="z-index: 1"><a href="#first" aria-controls="first" role="tab" data-toggle="tab">1단계</a></li>
	   			<li role="presentation col-md-1 col-sm-1 col-xs-1" style="z-index: 3"><a href="#second" aria-controls="second" role="tab" data-toggle="tab">2단계</a></li>
	   			<li role="presentation col-md-1 col-sm-1 col-xs-1" style="z-index: 4"><a href="#third" aria-controls="third" role="tab" data-toggle="tab">3단계</a></li>
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
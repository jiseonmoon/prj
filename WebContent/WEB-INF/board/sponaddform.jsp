<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="sponaddresult.do" method="POST" enctype="multipart/form-data" role="form">
			<ul class="nav nav-tabs" role="tablist">
	   			<li role="presentation col-md-1"><a href="#first" aria-controls="first" role="tab" data-toggle="tab">1�ܰ�</a></li>
	   			<li role="presentation col-md-1"><a href="#second" aria-controls="second" role="tab" data-toggle="tab">2�ܰ�</a></li>
	   			<li role="presentation col-md-1"><a href="#third" aria-controls="third" role="tab" data-toggle="tab">3�ܰ�</a></li>
	   			<li class="col-md-1 col-md-offset-8"><input class="btn btn-primary" type="submit" value="����"></li>
	  		</ul>
	  		
	  		<div class="tab-content float-none">
	  			<!-- ���ڵ�� ���� -->
	   			<div role="tabpanel" class="tab-pane" id="first">
	   				<div class="panel-group" id="accordion">
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
								�Ŀ� ������Ʈ ���� �ۼ�
				              </a>
				            </h4>
				          </div>
				          <div id="collapseOne" class="panel-collapse collapse">
				            <div class="panel-body">
				              <div class="form-group">
				              	<label for="stitle">������Ʈ ����</label>
				              	<input id="stitle" name="stitle" type="text" class="form-control" placeholder="������Ʈ ��Ī�� �ۼ����ּ���.">
				              	<input type="button" class="btn btn-primary" name="check1" value="Ȯ��">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				               	�Ŀ� ������Ʈ ���丮 �ۼ�
				              </a>
				            </h4>
				          </div>
				          <div id="collapseTwo" class="panel-collapse collapse ">
				            <div class="panel-body">
				              <div class="form-group">
				              	<label for="scontent">������Ʈ ���丮</label>
				              	<textarea id="scontent" class="form-control" name="scontent" rows="10" cols="100"></textarea>
				              	<input type="button" class="btn btn-primary" name="check2" value="Ȯ��">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
				             	�Ŀ� ������Ʈ�� �±׸� �����ϼ���.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseThree" class="panel-collapse collapse">
				            <div class="panel-body">
				                <label for="tag"></label>
				                <select id="tag" name="tag">
				                	<option value="����">����</option>
				                	<option value="������">������</option>
				                	<option value="å">å</option>
				                </select>
				                <input type="button" class="btn btn-primary" name="check3" value="Ȯ��">
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
				              <a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2">
								������Ʈ�� �Ұ��� �̹����� ���ε� ���ּ���.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseOne2" class="panel-collapse collapse">
				            <div class="panel-body">
				              <div class="form-group">
				              	<label for="imgpath">�̹��� ���� ���ε� : </label>
				              	<input type="file" class="form-control" name="imgpath" id="imgpath">
				              	<input type="button" class="btn btn-primary" name="check3" value="Ȯ��">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo2">
				               	������Ʈ�� �޼� �ݾ��� �Է����ּ���.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseTwo2" class="panel-collapse collapse ">
				            <div class="panel-body">
				              <div class="form-group">
				              	<label for="destmony">�ݾ�(�� ��)</label>
				              	<input type="number" class="form-control" value="0" name="destmoney" id="destmoney" step="1" min="0" max="1000">
				              	<input type="button" class="btn btn-primary" name="check3" value="Ȯ��">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" data-parent="#accordion2" href="#collapseThree2">
				             	������Ʈ �Ŀ� �ּ� �ݾ��� �Է����ּ���.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseThree2" class="panel-collapse collapse">
				            <div class="panel-body">
				            <div class="form-group">
				              <label for="destmony">�ݾ�(�� ��)</label>
				              <input type="number" class="form-control" value="0" name="destmoney" id="destmoney" step="1" min="0" max="1000">
				              <input type="button" class="btn btn-primary" name="check3" value="Ȯ��">
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
				              <a data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3">
								������Ʈ ���� �Ⱓ�� �Է����ּ���.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseOne3" class="panel-collapse collapse">
				            <div class="panel-body">
				              <div class="form-group">
				              	<label for="finaldate">���� ����</label>
				              	<input type="date" name="finaldate" id="finaldate" class="form-control">
				              	<input type="button" class="btn btn-primary" name="check3" value="Ȯ��">
				              </div>
				            </div>
				          </div>
				        </div>
				        <div class="panel panel-default">
				          <div class="panel-heading">
				            <h4 class="panel-title">
				              <a data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo3">
				               	�Ա� ���¸� �Է����ּ���.
				              </a>
				            </h4>
				          </div>
				          <div id="collapseTwo3" class="panel-collapse collapse ">
				            <div class="panel-body">
				              <div class="form-group">
				              	
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
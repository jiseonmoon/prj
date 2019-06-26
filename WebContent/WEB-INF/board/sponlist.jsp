<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.js"></script>
<%
	boolean isFinish = (boolean)request.getAttribute("isFinish");
%>
<script>
	$(document).ready(function(){
		$(".fancybox").fancybox({
	          openEffect  : 'none',
	          closeEffect : 'none'
	    });
		if(<%=isFinish%>==true){
			document.getElementById("finishcheck").checked = true;
		}
		$('#finishcheck').on('click', function(){
			if(document.getElementById("finishcheck").checked == true){
				$('#frm').prop('action', 'sponlist.do?tag=${tag}&isFinish=true');
			}else{
				$('#frm').prop('action', 'sponlist.do?tag=${tag}&isFinish=false');
			}
		})
	})
</script>
<style>
	*{
		margin:0;
		padding:0;
	}
	.thumbnail{
		height:300px; width:200px;
		margin-top:20px;
		padding:0;
		border: 0px transparent;
		background-color: #f8f9fa;
		box-shadow: 3px 3px 5px silver;
	}
	.thumbnail > div{
		background-color: white;
	}
	
	.sponfilter{
		margin:10px 0px;
		height:100px;
	}
	.filterline{
		margin-top:10px;
	}
	
	.thumbnail a{
		border:box;
		height:180px;
		width:100%;
	}
	
	.thumbnail img{
		height:180px !important;
		width:200px;
		border:0px transparent;
		border-radius: 5px;
	}
	
	hr{
		margin-top:10px;
		margin-bottom:0;
	}
	
	.caption{
		margin-top: 9px;
		box-shadow: 1px 0px 1px silver;
		border-radius: 5px;
	}
	.caption h5{
		margin:0;
		margin-bottom: 5px;
	}
	.caption h5 a:link, a:visited{
		color: black;
		font-weight: bolder;
		text-decoration: none;
	}
	.caption > p{
		font-size: 0.8em;
	}
	.progress{
		height : 6px;
		margin-bottom:8px;
	}
	.glyphicon-gift{
		color:red;
	}
	.glyphicon-usd{
		color:green;
	}
	body{
		background-color: rgba(250,239,220, 0.1);
	}
	.header h3{
		font-weight: bolder;
	}
	@media (max-width:767px){
		.sponfilter h3{
			font-size: 1.4em;
		}
	}
	@media (max-width:445px){
		.sponfilter h3{
			font-size: 1.3em;
		}
	}
	@media (max-width:384px){
		.sponfilter h3{
			font-size: 1.2em;
		}
		
	}
	
</style>
</head>
<body>
	<c:set var="pageinfo" value="${requestScope.pageinfo }"></c:set>
	<c:set var="list" value="${requestScope.list }"></c:set>
	<c:set var="tag" value="${requestScope.tag }"></c:set>
	<c:set var="search" value="${requestScope.search }"></c:set>
	<jsp:useBean id="now" class="java.util.Date"/>
	
	<div class="container-fluid sponfilter">
		<div class="container">
			<div class="row header">
				<div class="col-12 d-flex justify-content-center">
					<c:choose>
						<c:when test="${tag==null || tag=='' }">
							<h3>모든 프로젝트</h1>
						</c:when>
						<c:otherwise>
							<h3>${tag }</h1>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="dropdown col-md-4 col-sm-4 col-xs-4 d-flex justify-content-start filterline">
					<c:choose>
						<c:when test="${tag==null || tag=='' }">
							<a class="btn btn-default" data-toggle="dropdown" href="#">태그</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-default" data-toggle="dropdown" href="#">${tag }</a>
						</c:otherwise>
					</c:choose>
			   		<ul class="dropdown-menu" role="menu">
			   			<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do">모두</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("게임", "UTF-8")%>">게임</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("디자인", "UTF-8")%>">디자인</a>
				    	</li>
				    	<li role="presentation">
				    		<a role="menuitem" tabindex="-1" href="sponlist.do?tag=<%=URLEncoder.encode("책", "UTF-8")%>">책</a>
				    	</li>
			 		 </ul>
				</div>
				
				<div class="col-md-8 col-sm-8 col-xs-8 d-flex justify-content-end filterline">
					<input type="checkbox" id="finishcheck" name="finishcheck" value="true">
					<label for="finishcheck"><strong>마감 제외</strong></label>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="container site">
			<div class="row" style="position: relative;">
				<c:choose>
					<c:when test="${empty list }">
						<tr><td colspan="5">게시물이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="board" items="${list }">
							<c:set var="date" value="${board.finaldate }"/>
							<fmt:parseDate var="parsedate" value="${date }" pattern="yyyy-MM-dd"></fmt:parseDate>
							<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 d-flex justify-content-center">
								<div class="thumbnail">
									<a class="fancybox" rel="img" href="upload/${board.imagepath }"><img class="img-responsive" src="upload/${board.imagepath }" alt="img"></a>
         							<div class="caption">
            							<h5><a href="spondetail.do?no=${board.boardno }">${board.boardtitle }</a> </h5>
            								<p>${board.boardwriter }</p>
            							<div class="progress">
            								<div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: ${board.nowmoney div board.destmoney *100}%;">
            									<span class="sr-only">90% Complete</span>
            								</div>
            							</div>
            							
            								<fmt:parseNumber value="${now.time/(1000*60*60*24) }" integerOnly="true" var="nowDays"/>
            								<fmt:parseNumber value="${parsedate.time/(1000*60*60*24) }" integerOnly="true" var="oldDays"/>
            								<c:set value="${oldDays - nowDays }" var="dateDiff"/>
            								<div class="row">
            									<p class="col-7"><span class="glyphicon glyphicon-gift"></span><span>${dateDiff }일</span></p>
            									<p class="col-5 d-flex justify-content-center"><span class="glyphicon glyphicon-usd"></span><span>${board.nowmoney }만원</span></p>
            								</div>
            								
            							
       								</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>	
				</c:choose>
		</div>
		
	<div class="row d-flex">
		<div class="col-md-8 d-flex justify-content-end">
			<form class="form-inline" role="form" action="sponlist.do?tag=${tag}&isFinish=${isFinish}" method="post" id="frm">
				<div class="form-group">
					<label for="search" class="sr-only">검색</label>
					<input type="text" class="form-control" id="search" name="search" value="${search }" placeholder="입력해주세요">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-sm btn-default" value="검색">
				</div>
			</form>
		</div>
		<div class="col-md-2 col-md-offset-2 d-flex justify-content-end"><a class="btn btn-success" href="sponadd.do">게시글 작성</a></div>
	</div>
	<div class="row d-flex justify-content-center">
		<ul class="pagination">
			<c:if test="${pageinfo.startblock > 1 }">
				<li><a href="sponlist.do?currpage=${pageinfo.startblock-1 }&search=${search}&tag=${tag}&isFinish=${isFinish}">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${pageinfo.startblock }" end="${pageinfo.endblock }">
				<c:if test="${i==pageinfo.currpage }">
					<li class="active"><a href="#"><c:out value="${i }"></c:out></a></li>
				</c:if>
				<c:if test="${i!=pageinfo.currpage }">
					<li><a href="sponlist.do?currpage=${i }&search=${search}&tag=${tag}&isFinish=${isFinish}"><c:out value="${i}"></c:out></a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pageinfo.endblock < pageinfo.totalpage }">
				<li><a href="sponlist.do?currpage=${pageinfo.endblock+1}&search=${search}&tag=${tag}&isFinish=${isFinish}">▶</a></li>
			</c:if>
		</ul>
	</div>
	<div><a href="download.do?currpage=${pageinfo.currpage }&search=${search}&tag=${tag}&isFinish=${isFinish}">엑셀 파일 다운로드</a></div>
	</div>
	<hr>

</body>
</html>
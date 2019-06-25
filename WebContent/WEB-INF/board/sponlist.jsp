<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<%
	boolean isFinish = (boolean)request.getAttribute("isFinish");
%>
<script>
	$(function(){
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
		height:270px; width:200px;
		margin-top:20px;
		padding:7px;
	}
	
	.sponfilter{
		background-image: url("image/slide1_bg.jpg");
		background-size: cover;
		margin:10px 0px;
		height:50px;
	}
	.filterline{
		margin-top:10px;
	}
	
	.thumbnail img{
		height:150px;
	}
	
	hr{
		margin-top:10px;
		margin-bottom:0;
	}
	
	.caption{
		border: 1px solid silver;
		margin-top: 5px;
	}
	.caption h5{
		margin:0;
		margin-bottom: 5px;
		text-align: center;
	}

</style>
</head>
<body>
	<c:set var="pageinfo" value="${requestScope.pageinfo }"></c:set>
	<c:set var="list" value="${requestScope.list }"></c:set>
	<c:set var="tag" value="${requestScope.tag }"></c:set>
	<c:set var="search" value="${requestScope.search }"></c:set>
	
	<div class="container-fluid sponfilter">
		<div class="container">
		<div class="dropdown col-md-4 col-sm-4 col-xs-4 filterline">
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
		
		<div class="col-md-6 col-md-offset-2 col-sm-6 col-sm-offset-2 col-xs-6 col-xs-offset-2 d-flex justify-content-end filterline">
			<input type="checkbox" id="finishcheck" name="finishcheck" value="true">
			<label for="finishcheck"><strong>마감 제외</strong></label>
		</div>
		</div>
	</div>
	<hr>
	<div class="container">
			<div class="row" style="position: relative;">
				<c:choose>
					<c:when test="${empty list }">
						<tr><td colspan="5">게시물이 없습니다.</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="board" items="${list }">
							<div class="col-md-3 col-sm-4 col-xs-12 d-flex justify-content-center">
								<div class="thumbnail">
									<img class="img-responsive" src="upload/${board.imagepath }" alt="img">
         							<div class="caption">
            							<h5><a href="spondetail.do?no=${board.boardno }">${board.boardtitle }</a> </h5>
            							<div class="row">
            								<p class="col-4">${board.boardwriter }</p>
            								<p class="col-8">${board.finaldate }</p>
            							</div>
       								</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>	
				</c:choose>
		</div>
		
	<div class="row d-flex">
		<div class="col-md-7 d-flex justify-content-end">
			<form class="form-inline" role="form" action="sponlist.do?tag=${tag}&isFinish=${isFinish}" method="post" id="frm">
				<div class="form-group">
					<label for="search" class="sr-only">검색</label>
					<input type="text" class="form-control" id="search" name="search" value="${search }" placeholder="입력해주세요">
				</div>
				<div class="form-group">
					<input type="submit" value="검색">
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
		<div class="col-md-3 col-md-offset-2"><a class="btn btn-default" href="sponadd.do">게시글 작성</a></div>
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
	</div>
	<hr>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
<style>
* {
	padding: 0;
	margin: 0 auto;
}
#detailwrap {
	margin: 50px;
	padding: 30px;
	width: 70%;
	border: 1px solid #ccc;
}
#detailwrap ul li {
	list-style:none;
	padding: 10px 0;
	margin: 30px;
}
.rowname {
	width:90%;
	height: 30px;

	border:1px solid #fff;
	border-bottom:1px solid #CCC;
}
.qacontent {
	width:90%;
	letter-spacing:1px;padding:5px;
	border:1px solid #ccc; 
	border-radius:5px;margin:0px;
}
.btnbtn {
	text-align: center;
}
p a {
	text-decoration: none;
	color:inherit;
}
.textbtn {
	padding: 10px;
	margin: 10px;
	border: 1px solid #ccc;
}
</style>
</head>
<body>
	<c:set var="dto" value="${requestScope.dto }"></c:set>
	<c:set var="member" value="${ sessionScope.member }"></c:set>
	<div id="detailwrap">
	<ul>
		<li class="rowname">${dto.title }</li>
		<li class="rowname">${dto.date }</li>
		<li class="qacontent">${dto.content }</li>
		
		<c:if test="${member.mno==dto.mno}">
		<li class="btnbtn">
			<p><a class="textbtn" href="qamodify.do?qano=${dto.qano }">수정</a>
			<a class="textbtn" href="qadelete.do?qano=${dto.qano }">삭제</a></p>
		</li>
		</c:if>
	</ul>
	</div>
</body>
</html>
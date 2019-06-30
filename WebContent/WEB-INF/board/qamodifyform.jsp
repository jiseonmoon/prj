<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify</title>
<style>
* {
	padding: 0;
	margin: 0 auto;
}
#insertwrap {
	margin: 50px;
	padding: 30px;
	width: 70%;
	border: 1px solid #ccc;
}
#insertwrap ul li {
	list-style:none;
	padding: 15px 0;
}
.labelname {
	height: 30px;
}
input {
	width:90%;
	padding:5px;
	margin-bottom:5px;
	border:1px solid #fff;
	border-bottom:1px solid #CCC;
}
textarea {
	width:90%;
	letter-spacing:1px;padding:5px;
	border:1px solid #ccc; 
	border-radius:5px;margin:0px;
}
</style>
</head>
<body>
	<c:set var="dto" value="${ requestScope.dto }"></c:set>
	<div id="insertwrap">
	<form method="post" action="qamodifyform.do">
	<input type="hidden" name="qano" value="${ dto.qano }" >
		<ul>
			<li class="labelname">제목</li>
			<li><input type="text" name="title" id="title" value="${ dto.title }"></li>
			<li class="labelname">내용</li>
			<li><textarea rows="30" name="content" id="content">${ dto.content }</textarea></li>
			<li><input type="submit" value="수정"></li>
		</ul>
	</form>
	</div>
</body>
</html>
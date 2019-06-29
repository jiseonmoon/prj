<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="dto" value="${ requestScope.dto }"></c:set>

	<form method="post" action="qamodifyform.do">
	<input type="hidden" name="qano" value="${ dto.qano }" >
		<ul>
			<li>제목</li>
			<li><input type="text" name="title" id="title" value="${ dto.title }"></li>
			<li>내용</li>
			<li><textarea cols="30" rows="30" name="content" id="content">${ dto.content }</textarea></li>
			<li><input type="submit" value="수정"></li>
		</ul>
	</form>
</body>
</html>
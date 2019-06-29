<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="member" value="${ sessionScope.member }"></c:set>
	<c:if test="${member==null }">
		null
	</c:if>
	<form method="post" action="qainsertform.do">
	<input type="hidden" name="mno" value="${member.mno }" >
		<ul>
			<li>제목</li>
			<li><input type="text" name="title" id="title"></li>
			<li>내용</li>
			<li><textarea cols="30" rows="30" name="content" id="content"></textarea></li>
			<li><input type="submit" value="등록"></li>
		</ul>
	</form>
</body>
</html>
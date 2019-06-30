<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="dto" value="${requestScope.dto }"></c:set>
	<c:set var="member" value="${ sessionScope.member }"></c:set>
	
	<ul>
		<li> ${dto.title }
		</li>
		<li>
		${dto.date }
		</li>
		<li>
		${dto.content }
		</li>
		<li>
		
		<c:if test="${member.mno==dto.mno}">
		<li>
			<a href="qamodify.do?qano=${dto.qano }"">수정</a>
			<a href="qadelete.do?qano=${dto.qano }">삭제</a>
		</li>
		</c:if>
	</ul>
</body>
</html>
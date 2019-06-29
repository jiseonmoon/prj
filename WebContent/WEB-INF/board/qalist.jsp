<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QAList</title>
</head>
<body>
	<c:set var="list" value="${requestScope.list }"></c:set>

	<table>
		<thead>
			<tr><th>제목</th><th>작성자</th><th>날짜</th></tr>
		</thead>
		<tbody>
			<c:if test="${list==null }">
				<tr><td cols="3">게시글이 없습니다.</td></tr>
			</c:if>
			<c:forEach var="i" items="${ list }">
				<tr>
					<td><a href="qadetail.do?qano=${i.qano }">${ i.title }</a></td>
					<td>${ i.mid }</td>
					<td>${ i.date }</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="qainsert.do">문의하기</a>

</body>
</html>
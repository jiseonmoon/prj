<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Notice Board List</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  $(document).ready(function(){
	   $('#insert').click(function(){
		     location.href="qainsert.do";
	   });
  });
 
</script>
</head>
<body>
<c:set var="list" value="${requestScope.list }"></c:set>
<c:set var="member" value="${requestScope.member }"></c:set>
<div>
<ul>
	<li><a href="qalist.do?category=<%=URLEncoder.encode("NOTICE", "UTF-8")%>">NOTICE</a></li>
	<li><a href="qalist.do?category=<%=URLEncoder.encode("FAQ", "UTF-8")%>">FAQ</a></li>
	<li><a href="qalist.do?category=<%=URLEncoder.encode("Q&A", "UTF-8")%>">Q&A</a></li>
</ul>
</div>
<table>
<thead>
	<tr><th>카테고리</th><th>제목</th><th>작성자</th></tr>
</thead>
<tbody>
	<c:forEach var="QAList" items="${list }">
		<tr>
			<td>${QAList.category }</td>
			<td>
			<c:choose>
				<c:when test="${QAList.secret.equals('y') }">
				<c:choose>
					<c:when test="${member.mid == QAList.mid || member.mtier == 1 }">
						<a href="/qalist.do?num=${QAList.qano}">${QAList.title }</a>
					</c:when>
				<c:otherwise>비밀글입니다.</c:otherwise>
				</c:choose>
				</c:when>
				<c:otherwise><a href="/qalist.do?num=${QAList.qano}">${QAList.title }</a></c:otherwise>
				</c:choose>
			<td>${QAList.mid }</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<button id="insert">등록</button>

</body>
</html>
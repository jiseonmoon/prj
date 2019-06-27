<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Notice Board List</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
  $(document).ready(function(){
	   $('#add').click(function(){
		     location.href="add.do";
	   });
  });
 
</script>
</head>
<body>
<c:set var="list" value="${requestScope.list }"></c:set>
<div>
<ul>
	<li role="presentation">
		<a href="qalist.do?category=<%=URLEncoder.encode("NOTICE", "UTF-8")%>">NOTICE</a>
	</li>
	<li role="presentation">
		<a href="qalist.do?category=<%=URLEncoder.encode("FAQ", "UTF-8")%>">FAQ</a>
	</li>
	<li role="presentation">
		<a href="qalist.do?category=<%=URLEncoder.encode("Q&A", "UTF-8")%>">Q&A</a>
	</li>
</ul>
</div>
<table>
<thead>
	<tr><th>카테고리</th><th>제목</th><th>작성자</th><th>날짜</th></tr>
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
			<td>${QAList.date }</td>
		</tr>
	</c:forEach>
</tbody>
</table>
<button id="add">등록</button>

</body>
</html>
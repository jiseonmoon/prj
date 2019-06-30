<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QAList</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<style>
* { margin:0 auto; padding:0; }
body {
	font-family: '맑은 고딕' 돋움; font-size:0.75em; color:#333
}
table.qa {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	width: 80%;
}
table.qa thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	text-align: center;
	color: #369;
	border-bottom: 3px solid #036;
}
table.qa td {
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
.td1 {
	width: 15%;
	text-align: center;
}
.td2 {
	width: 25%;
	text-align: center;
}
.td3 {
	width: 45%;
	
}
td a, p a {
	text-decoration: none;
	color:inherit
}
</style>

</head>
<body>
	<c:set var="currpage" value="${requestScope.currpage }"></c:set>
	<c:set var="startblock" value="${requestScope.startblock }"></c:set>
	<c:set var="endblock" value="${requestScope.endblock }"></c:set>
	<c:set var="list" value="${requestScope.list }"></c:set>
	<c:set var="totalpage" value="${requestScope.totalpage }"></c:set>
	<c:set var="member" value="${ sessionScope.member }"></c:set>
	
			<table class="qa">
			<thead>
				<tr><th class="td1">분류</th><th class="td3">제목</th><th class="td1">작성자</th><th class="td2">날짜</th></tr>
			</thead>
			<tbody>
				<c:if test="${list==null }">
					<tr><td cols="4">게시글이 없습니다.</td></tr>
				</c:if>
				<c:forEach var="i" items="${ list }">
				<tr>
					<td class="td1">문의</td>
					<td class="td3"><p><a href="qadetail.do?qano=${i.qano }">${ i.title }</a></p></td>
					<td class="td1">${ i.mid }</td>
					<td class="td2">${ i.date }</td>
				<tr>
				</c:forEach>
			</tbody>
		</table>
		
			<c:if test="${startblock>1 }">
				<a href="qalist.do?currpage=${startblock-1 }">이전</a>
			</c:if>
			<span>
			<c:forEach var="page" begin="${startblock }" end="${endblock }">
				<c:if test="${page==currpage }">
					<c:out value="${page }"></c:out>
			</c:if>
			<c:if test="${page!=currpage }">
				<a href="qalist.do?currpage=${page }"><c:out value="${page }"></c:out></a>
			</c:if>
			</c:forEach>
			</span>
			<c:if test="${endblock<totalpage }">
				<a href="qalist.do?currpage=${endblock+1 }">다음</a>
			</c:if>
		<c:if test="${member.mno!=no}">
			<p><a href="qainsert.do">문의하기</a></p>
		</c:if>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	/* 삭제할 값 넘겨주기 */
	function del(subNo, sponNo) {  
		location.href="sponsubdel.do?subNo="+subNo+"&sponNo="+sponNo;
	}
</script>
<body>
	<c:set var="list" value="${ requestScope.list }"></c:set>
	<c:set var="member" value="${ sessionScope.member }"></c:set>
	
	<table class="table table-hover">
		<c:if test="${ list == null || list.size() == 0 }">
			<tr><td>댓글이 없습니다</td></tr>
		</c:if>
		<c:if test="${ list != null || list.size() != 0 }">
			<c:forEach var="i" items="${ list }">
				<tr>
					<td>${ i.subContent }</td><td>${ i.memberId }</td>
					<!-- 자신이 작성한 댓글만 삭제할 수 있게 -->
					<c:if test="${ member.mid == i.memberId }">
						<td><input class="btn btn-default" type="button" value="삭제" onclick="del(${ i.subNo },${ i.sponNo })"></td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$("input:checkbox").change(function() {
	if(this.checked) {
		$(this).attr('value','y');
	}else{
		$(this).attr('value','n');
	}
});
</script>
</head>
<body>

<form method="post" action="qainsertresult.do">
		<ul>
			<li>
				<select name="category" >
				<c:choose>
					<c:when test="${member.mtier != 1 }">
						<option value="Q&A">Q&A</option>
					</c:when>
				<c:otherwise>
					<option value="NOTICE">NOTICE</option>
					<option value="FAQ">FAQ</option>
				</c:otherwise>
				</c:choose>
					</select>
			</li>
			<li>
				<label for="mid">작성자</label> 
				<input type="text" name="mid" id="mid" value="${member.mid }">
			</li>

			<li>
				<label for="title">제목</label> 
				<input type="text" name="title" id="title" required="required">
			</li>
			<li>
				<label for="content">내용</label> 
				  <textarea rows="30" cols="20" id="content" name="content" required="required"></textarea>
			</li>
			<li>
				<label for="secret">비밀글</label> 
				<input type="checkbox" name="secret" value="n">
			</li>
			<li>
				<input type="submit" value="등록"> 
				<input type="reset"	value="취소">
			</li>

		</ul>
	</form>
</body>
</html>
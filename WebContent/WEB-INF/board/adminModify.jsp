<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 등급 수정</title>
<style type="text/css">
	table{
			padding: 60px 0px;
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
	}
	td{
			border:1px solid skyblue
		}
	p{
			margin: auto;
			text-align: center;
	}
</style>
<script type="text/javascript">
	function goFirstForm() {
		location.href="memberlist.do";
	}
</script>
</head>
<body>
<div id="wrap">
	
		<br><br>
		<p><b><font size="6" color="gray">회원 등급 수정</font></b></p>
		<br><br><br>
	
		<form method="post" action="adminmodifyresult.do">
		<table>
		<td>
					<label for="Mtier">회원 등급</label>
						<select name="Mtier" id="Mtier">
							<option value="1">일반 회원</option>
							<option value="2">후원 회원</option>
							<option value="3">관리자</option>
						</select>
						<input type="hidden" name="id" value="${requestScope.id }">
		</td>
		</table>
			<br>
			<center>
				<input type="submit" value="수정"/>
   				<input type="reset" value="취소" onclick="goFirstForm()">
			</center>
		</form>
</div>	
</body>
</html>
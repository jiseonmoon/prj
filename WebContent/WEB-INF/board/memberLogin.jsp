<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
		request.setCharacterEncoding("euc-kr"); 
%>
	<title>로그인 화면</title>

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
		
		#title{
			background-color:skyblue
		}
		
		p{
			margin: auto;
			text-align: center;
		}
	</style>

	<script type="text/javascript">

		function checkValue()
		{
			inputForm = eval("document.loginInfo");
			if(!inputForm.id.value)
			{
				alert("아이디를 입력하세요");	
				inputForm.id.focus();
				return false;
			}
			if(!inputForm.password.value)
			{
				alert("비밀번호를 입력하세요");	
				inputForm.password.focus();
				return false;
			}
		}
	
		function goFirstForm() {
			location.href="sponlist.do";
		}
	</script>
</head>
<body>
<div id="wrap">
	
		<br><br>
		<p><b><font size="6" color="gray">로그인</font></b><p>
		<br><br><br>
	
		<form name="loginInfo" method="post" action="loginresult.do" 
				onsubmit="return checkValue()">

			<table>
				<tr>
					<td bgcolor="skyblue">아이디</td>
					<td><input type="text" name="id" maxlength="50"></td>
				</tr>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
		
			</table>
			<br>
			<center>
				<input type="submit" value="로그인"/>
				<input type="button" value="취소" onclick="goFirstForm()">
			</center>
		</form>
		<% 
			String loginMsg = (String)request.getAttribute("fail");
				
			if(loginMsg!=null && loginMsg.equals("0")) 
			{
				out.println("<br>");
				out.println("<p><font color='red' size='3'>비밀번호를 확인해 주세요.</font><p>");
			}
			else if(loginMsg!=null && loginMsg.equals("-1"))
			{	
				out.println("<br>");
				out.println("<p><font color='red' size='3'>아이디를 확인해 주세요.</font><p>");
			}
		%>	
	</div>	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결과 페이지</title>
<style type="text/css">
		p{
			margin: auto;
			text-align: center;
		}
</style>
</head>
<body>
<br><br><br>
	<%
		String msg = (String)session.getAttribute("msg");
	
		if(msg != null)
		{
			if(msg.equals("0"))
				out.println("<p><font size='6'>회원정보가 수정되었습니다.</font></p>");
			else if(msg.equals("1"))
				out.println("<p><font size='6'>회원가입을 축하드립니다.</font></p>");
			
			session.removeAttribute("msg");
		}
		else
		{
			out.println("<p><font size='6'>회원정보가 삭제되었습니다.</font></p>");
		}
	%>
	<br><br>
	<center><input type="button" value="메인" onclick="javascript:window.location='main.do'"/></center>
</body>
</html>
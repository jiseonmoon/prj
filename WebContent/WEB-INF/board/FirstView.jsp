<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
	<head>
		<title>ùȭ��</title>
	</head>
	<body>		
	<%
		if(session.getAttribute("sessionID") == null) // �α����� �ȵǾ��� ��
		{ 
	%>
			<br><br><br>
			<br><br><br>
			<font size=6>�ݰ����ϴ�. ��Ʈ �ݵ��Դϴ�.</font>
			<br><br>	
	<%
		}else{ // �α��� ���� ���	
	%>
			<br><br><br>
			<font size=6 color="darkblue"><%=session.getAttribute("sessionID") %></font>
			<font size=6>�� ȯ���մϴ�.</font>
	<%	} %>
	</body>
</html>
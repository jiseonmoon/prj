<%@page import="com.bitcamp.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	MemberDTO dto=(MemberDTO)request.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<style type="text/css">
		table{
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
	
		function changeForm(val){
			if(val == "-1"){
				location.href="main.do";
			}else if(val == "0"){
				location.href="modify.do";
			}else if(val == "1"){
				location.href="delete.do";
			}else if(val=="2"){
				location.href="givefundlist.do";
			}else if(val=="3"){
				location.href="receivefundlist.do";
			}
		}
		
	</script>
</head>
<body>
	<br><br>
	<p><b><font size="6" color="gray">ȸ�� ����</font></b><p>
	<br><br><br>

	<table>
	
		<tr>
			<td id="title">ȸ����ȣ</td>
			<td><%=dto.getMno() %></td>
		</tr>
		
		<tr>
			<td id="title">ȸ�� ���</td>
				<% String grade="";
					if(dto.getMtier()==1)
						grade="�Ϲ� ȸ��";
					else if(dto.getMtier()==2)
						grade="�Ŀ� ȸ��";
					else if(dto.getMtier()==3)
						grade="������"; %>
			<td><%=grade %></td>
		</tr>
	
		<tr>
			<td id="title">���̵�</td>
			<td><%=dto.getMid() %></td>
		</tr>
		
 		<tr>
    		<td id="title">��й�ȣ</td>
    		<td><%=dto.getMpwd() %></td>
    	</tr>
 		
 		<tr>
 			<td id="title">�̸���</td>
 			<td>
 				<%=dto.getEmail1() %>@<%=dto.getEmail2() %>
 			</td>
 		</tr>
 		
 		<tr>
 			<td id="title">��ȭ��ȣ</td>
 			<td><%=dto.getTel() %></td>
 		</tr>
 		
 		<tr>
 			<td id="title">�ּ�</td>
 			<td><%=dto.getAddr() %></td>
 		</tr>
 		
 		<tr>
 			<td id="title">������ ����</td>
 			<td><%=dto.getBank() %></td>
 		</tr>
 		
 		<tr>
 			<td id="title">ī���ȣ</td>
 			<td><%=dto.getCard() %></td>
 		</tr>

 	</table>
 		
 	<br>
 	<center>
 		<input type="button" value="��������" onclick="changeForm(-1)">
 		<input type="button" value="ȸ������ ����" onclick="changeForm(0)">
 		<input type="button" value="ȸ�� Ż��" onclick="changeForm(1)">
 		<br><br>
 		<input type="button" value="���� �Ŀ� ������Ʈ" onclick="changeForm(2)">
 		<input type="button" value="���� �Խ� ������Ʈ" onclick="changeForm(3)">
 	</center>
</body>
</html>
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
<title>Insert title here</title>
<title>ȸ������ ����</title>
	
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
	
		function init(){
			setComboValue("<%=dto.getEmail2()%>");
		}

		function setComboValue(val) {
			var selectMail = document.getElementById('email2');
			for (i = 0, j = selectMail.length; i < j; i++)
			{
				if (selectMail.options[i].value == val)
				{
					selectMail.options[i].selected = true;
					break;
				}
			}
		}
		
		function checkValue() {
			if(!document.userInfo.password.value){
				alert("��й�ȣ�� �Է��ϼ���.");
				return false;
			}
		}
		
	</script>
</head>
<body onload="init()">
	<br><br>
		<p><b><font size="6" color="gray">ȸ������ ����</font></b></p>
		<br><br><br>
		
		<form method="post" action="modifyresult.do" name="memberInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">ȸ����ȣ</td>
					<td bgcolor="skyblue"><%=dto.getMno() %></td>
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
					<td bgcolor="skyblue"><%=grade %></td>
				</tr>
			
				<tr>
					<td id="title">���̵�</td>
					<td bgcolor="skyblue"><%=dto.getMid() %></td>
				</tr>
				
				<tr>
					<td id="title">��й�ȣ</td>
					<td>
						<input type="password" name="password" maxlength="50" 
							value="<%=dto.getMpwd() %>">
					</td>
				</tr>
					
				<tr>
					<td id="title">�̸���</td>
					<td>
						<input type="text" name="email1" maxlength="50" 
							value="<%=dto.getEmail1() %>">@<select name="email2" id="email2">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net" >daum.net</option>
							<option value="nate.com">nate.com</option>						
						</select>
					</td>
				</tr>
					
				<tr>
					<td id="title">��ȭ��ȣ</td>
					<td>
						<input type="text" name="phone" value="<%=dto.getTel() %>"/>
					</td>
				</tr>
				
				<tr>
					<td id="title">�ּ�</td>
					<td>
						<input type="text" size="50" name="addr" value="<%=dto.getAddr() %>"/>
					</td>
				</tr>
				
				<tr>
					<td id="title">������ ����</td>
					<td>
						<input type="text" size="50" name="bank" value="<%=dto.getBank() %>"/>
					</td>
				</tr>
				
				<tr>
					<td id="title">ī���ȣ</td>
					<td>
						<input type="text" name="card" value="<%=dto.getCard() %>"/>
					</td>
				</tr>
				
				
			</table>
			<br>
			<center>
				<input type="button" value="���" onclick="javascript:window.location='memberinfo.do'">
				<input type="submit" value="����">
			</center>
		</form>

</body>
</html>
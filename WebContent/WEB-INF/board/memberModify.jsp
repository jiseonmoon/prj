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
<title>회원정보 수정</title>
	
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
				alert("비밀번호를 입력하세요.");
				return false;
			}
		}
		
	</script>
</head>
<body onload="init()">
	<br><br>
		<p><b><font size="6" color="gray">회원정보 수정</font></b></p>
		<br><br><br>
		
		<form method="post" action="modifyresult.do" name="memberInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td id="title">회원번호</td>
					<td bgcolor="skyblue"><%=dto.getMno() %></td>
				</tr>
			
				<tr>
					<td id="title">회원 등급</td>
						<% String grade="";
						if(dto.getMtier()==1)
							grade="일반 회원";
						else if(dto.getMtier()==2)
							grade="후원 회원";
						else if(dto.getMtier()==3)
							grade="관리자"; %>
					<td bgcolor="skyblue"><%=grade %></td>
				</tr>
			
				<tr>
					<td id="title">아이디</td>
					<td bgcolor="skyblue"><%=dto.getMid() %></td>
				</tr>
				
				<tr>
					<td id="title">비밀번호</td>
					<td>
						<input type="password" name="password" maxlength="50" 
							value="<%=dto.getMpwd() %>">
					</td>
				</tr>
					
				<tr>
					<td id="title">이메일</td>
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
					<td id="title">전화번호</td>
					<td>
						<input type="text" name="phone" value="<%=dto.getTel() %>"/>
					</td>
				</tr>
				
				<tr>
					<td id="title">주소</td>
					<td>
						<input type="text" size="50" name="addr" value="<%=dto.getAddr() %>"/>
					</td>
				</tr>
				
				<tr>
					<td id="title">무통장 계좌</td>
					<td>
						<input type="text" size="50" name="bank" value="<%=dto.getBank() %>"/>
					</td>
				</tr>
				
				<tr>
					<td id="title">카드번호</td>
					<td>
						<input type="text" name="card" value="<%=dto.getCard() %>"/>
					</td>
				</tr>
				
				
			</table>
			<br>
			<center>
				<input type="button" value="취소" onclick="javascript:window.location='memberinfo.do'">
				<input type="submit" value="수정">
			</center>
		</form>

</body>
</html>
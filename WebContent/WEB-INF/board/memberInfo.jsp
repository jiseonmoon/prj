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
<title>회원 정보</title>
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
	<p><b><font size="6" color="gray">회원 정보</font></b><p>
	<br><br><br>

	<table>
	
		<tr>
			<td id="title">회원번호</td>
			<td><%=dto.getMno() %></td>
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
			<td><%=grade %></td>
		</tr>
	
		<tr>
			<td id="title">아이디</td>
			<td><%=dto.getMid() %></td>
		</tr>
		
 		<tr>
    		<td id="title">비밀번호</td>
    		<td><%=dto.getMpwd() %></td>
    	</tr>
 		
 		<tr>
 			<td id="title">이메일</td>
 			<td>
 				<%=dto.getEmail1() %>@<%=dto.getEmail2() %>
 			</td>
 		</tr>
 		
 		<tr>
 			<td id="title">전화번호</td>
 			<td><%=dto.getTel() %></td>
 		</tr>
 		
 		<tr>
 			<td id="title">주소</td>
 			<td><%=dto.getAddr() %></td>
 		</tr>
 		
 		<tr>
 			<td id="title">무통장 계좌</td>
 			<td><%=dto.getBank() %></td>
 		</tr>
 		
 		<tr>
 			<td id="title">카드번호</td>
 			<td><%=dto.getCard() %></td>
 		</tr>

 	</table>
 		
 	<br>
 	<center>
 		<input type="button" value="메인으로" onclick="changeForm(-1)">
 		<input type="button" value="회원정보 변경" onclick="changeForm(0)">
 		<input type="button" value="회원 탈퇴" onclick="changeForm(1)">
 		<br><br>
 		<input type="button" value="나의 후원 프로젝트" onclick="changeForm(2)">
 		<input type="button" value="나의 게시 프로젝트" onclick="changeForm(3)">
 	</center>
</body>
</html>
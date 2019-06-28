<%@page import="com.bitcamp.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
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
			if(val == "1"){
				location.href="main.do";
			}
		}	
	</script>
</head>
<body>
	<br><br>
	<p><b><font size="6" color="gray">전체 회원정보</font></b><p>
	<br><br>
	
	<table>
		<tr align="center">
			<td id=title>회원번호</td>
			<td id=title>회원등급</td>
			<td id=title>아이디</td>
			<td id=title>비밀번호</td>
			<td id=title>이메일</td>
			<td id=title>전화번호</td>
			<td id=title>주소</td>
			<td id=title>무통장 계좌</td>
			<td id=title>카드번호</td>
			<td id=title>등급 수정</td>
			<td id=title>회원 삭제</td>
		</tr>
		
	<%
		ArrayList<MemberDTO> arr=(ArrayList<MemberDTO>)request.getAttribute("memberlist");
		if(arr==null||arr.size()==0)
		{%>
		<tr><td colspan="8">해당 자료가 없습니다</td></tr>
		<%
		}else{
			for(int i=0; i<arr.size(); i++){
				MemberDTO dto=arr.get(i);
				
				%>
				
		<% String grade="";
		if(dto.getMtier()==1)
			grade="일반 회원";
		else if(dto.getMtier()==2)
			grade="후원 회원";
		else if(dto.getMtier()==3)
			grade="관리자"; %>
				
				<tr>
					<td><%=dto.getMno() %>
					<td><%=grade %>
					<td><a href="detail.do?id=<%=dto.getMid()%>"><%=dto.getMid() %></a></td>
					<td><%=dto.getMpwd() %></td>
					<td><%=dto.getEmail1() %></td>
					<td><%=dto.getTel() %></td>
					<td><%=dto.getAddr() %></td>
					<td><%=dto.getBank() %></td>
					<td><%=dto.getCard() %></td>
					<td><a href="adminmodify.do?id=<%=dto.getMid() %>">수정</a></td>
					<td><a href="admindelete.do?id=<%=dto.getMid() %>">삭제</a></td>
				</tr>
				<%
			}
		}
				
				%>
	</table>
	
	<br>
 	<center><input type="button" value="메인으로" onclick="changeForm(1)"></center>
</body>
</html>
<%@page import="com.bitcamp.dto.MySponDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펀딩 리스트</title>
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
	<p><b><font size="6" color="gray">나의 후원정보</font></b><p>
	<br><br>
	
	<table>
		<tr align="center">
			<td id=title>프로젝트 번호</td>
			<td id=title>프로젝트명</td>
			<td id=title>프로젝트 내용</td>
			<td id=title>결제일</td>
			<td id=title>결제금액</td>
		</tr>
		
	<%
		ArrayList<MySponDTO> arr=(ArrayList<MySponDTO>)request.getAttribute("givefundlist");
		if(arr==null||arr.size()==0)
		{%>
		<tr><td colspan="8">해당 자료가 없습니다</td></tr>
		<%
		}else{
			for(int i=0; i<arr.size(); i++){
				MySponDTO dto=arr.get(i);
				
				%>
				
				
				<tr>
					<td><%=dto.getSno() %></td>
					<td><%=dto.getStitle() %></td>
					<td><%=dto.getScontent() %></td>
					<td><%=dto.getPdate() %></td>
					<td><%=dto.getPmoney() %>
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
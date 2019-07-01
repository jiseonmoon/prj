<%@page import="java.util.ArrayList"%>
<%@page import="com.bitcamp.dto.ReceiveFundDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시 프로젝트 리스트</title>
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
			if(val=="0"){
				location.href="memberinfo.do";
			}
			else if(val == "1"){
				location.href="main.do";
			}
		}	
	</script>
</head>
<body>
<br><br>
	<p><b><font size="6" color="gray">나의 게시 프로젝트</font></b><p>
	<br><br>
	
	<%
		int sum=0;
		ArrayList<ReceiveFundDTO> arr=(ArrayList<ReceiveFundDTO>)request.getAttribute("receivefundlist");
		if(arr==null||arr.size()==0)
		{
			sum=0;
		}else{
			for(int i=0; i<arr.size(); i++){
				ReceiveFundDTO dto=arr.get(i);
				sum+=dto.getNowmoney();
			}
		}
		%>
	<font size=5>현재 </font>
	<font size=5 color="darkblue"><%=session.getAttribute("sessionID") %></font>
	<font size=5>님의 총 모금액은 </font>
	<font size=5 color="red"><%=sum %></font>
	<font size=5>만 원입니다.</font>
	<br><br>
	<table>
		<tr align="center">
			<td id=title>프로젝트 번호</td>
			<td id=title>프로젝트명</td>
			<!-- <td id=title>프로젝트 내용</td> -->
			<td id=title>목표금액(단위: 만 원)</td>
			<td id=title>최소후원금액(단위: 원)</td>
			<td id=title>마감일</td>
			<td id=title>모금액(단위: 만 원)</td>
		</tr>
		
	<%
				ArrayList<ReceiveFundDTO> arr1=(ArrayList<ReceiveFundDTO>)request.getAttribute("receivefundlist");
					if(arr1==null||arr1.size()==0)
					{
			%>
		<tr><td colspan="8">해당 자료가 없습니다</td></tr>
		<%
			}else{
			for(int i=0; i<arr1.size(); i++){
				ReceiveFundDTO dto=arr1.get(i);
		%>
				
				
				<tr>
					<td><%=dto.getSno() %></td>
					<td><a href="spondetail.do?no=<%=dto.getSno()%>"><%=dto.getStitle() %></a></td>
					<%-- <td><%=dto.getScontent() %></td> --%>
					<td><%=dto.getDestmoney() %></td>
					<td><%=dto.getMinmoney() %></td>
					<td><%=dto.getFinaldate() %></td>
					<td><%=dto.getNowmoney() %></td>
				</tr>
				<%
			}
		}
				
				%>
	</table>
	
	<br>
 	<center>
 		<input type="button" value="회원 정보" onclick="changeForm(0)">
 		<input type="button" value="메인" onclick="changeForm(1)">
 	</center>
</body>
</html>
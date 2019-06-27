

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>comment list</title>
<style>
    table td{ border-bottom: 1px solid silver;
             height:60px;
             width:450px;            
    
    }
</style>
<script>
  function del(num, boardno)
  {  
	 location.href="qcdel.do?no="+num+"&boardno="+boardno;
  }

</script>
</head>
<body>
  <table>
  
     <%
      List<QCDTO> list=(List)request.getAttribute("qclist");
     if(list==null || list.size()==0){
    	 %>
    	 <tr><td>댓글정보가 없습니다</td></tr>
     <%	 
     }else{
    	 for(int i=0; i<list.size(); i++){
    	     QCDTO dto=list.get(i);
    	 %>
   <tr><td><%=dto.getQccontent()%></td>
   	<td>
   	<input type="button" value="삭제" 
   	onclick="del(<%=dto.getQcno()%>,<%=dto.getBoardno()%>)">
     </td>
   </tr>
    	 <% 
    	 }
     }
  %> 


</table>



</body>
</html>
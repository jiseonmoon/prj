<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 회원 삭제 결과</title>
</head>
<body>
<%  
      int su=(Integer)request.getAttribute("result");
      if(su>0)
      {
    	  %>
    	    <script>
    	      alert('삭제 성공');
    	      location.href="memberlist.do";  
    	    </script>
    	  <% 
      }
      else{
    	  %>
    	    <script>
    	      alert('삭제 실패');
    	      location.href="memberlist.do";
    	    </script>
    	  <% 
      }
  
  %>
</body>
</html>
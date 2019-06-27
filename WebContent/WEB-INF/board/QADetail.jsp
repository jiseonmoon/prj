
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
#aa{ width:400px;}
#result{
   margin-top:15px; 
   margin-left:30px;
   border:1px solid silver;
   width:500px;
   height:300px;
}

</style>
<script>
     function send()
     {
    	 if(document.frm.title.value!="")
    		 document.frm.submit();
     }
      $(document).ready(function(){
    	   let num=$('#test').text();
    	  // console.log($('#test').text());
    	   $.ajax({
                url:"qcdetail.do" 		   
    		    , data:"num="+num
    		    , dataType:"html"
    		    ,success:function(data)
    		    {
    			    $('#result').append(data);
    		    }
    		    ,error:function(data)
    		    {
    			    console.log('error');
    		    }
    	   });
      });
     
     
</script>
</head>
<body>
<%
	QADTO dto=(QADTO)request.getAttribute("dto");
%>
<table class="table table-hover" id="aa">
  <tr><td>제목</td><td><%=dto.getTitle()%></td></tr>
  <tr><td>작성자</td><td><%=dto.getMid()%></td></tr>
  <tr><td>내용</td><td><%=dto.getContent()%></td></tr>
 
</table>
<form method="post" action="subadd.do?num=<%=dto.getQano()%>" name="frm">
<textarea rows="5" cols="50" name="content" id="title"></textarea><br>
<input type="text" id="writer" name="writer">
<input type="button" onclick='send()'  value="추가">
</form>
<div id="result"></div>

	<a href="del.do?no=<%=dto.getQano() %>">삭제</a>
	<a href="modify.do?no=<%=dto.getQano() %>">수정</a>
	<a href="list.do">목록으로</a>

</body>
</html>
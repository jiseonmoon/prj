<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>탈퇴</title>

<style type="text/css">
	table{
		margin-left: auto;
		margin-right: auto;
		border: 3px solid skyblue;
	}
	td{
		border: 1px solid skyblue;
	}
	#title{
		background-color: skyblue;
	}
	p{
		margin: auto;
		text-align: center;
	}
</style>

<script type="text/javascript">
	/* function checkExit(){
		var dialog=document.getElementById("dialog");
		dialog.showModel();
		dialog.addEventListener("close", function(event){
			if(dialog.returnValue=="예"){
				alert("예");
			}else{
				alert("아니오");
			}
		});
	} */
	
	function submit_event(){
		if(confirm("정말 탈퇴하시겠습니까?")==true){
			document.form.submit();
		}else{
			return;
		}
	}
	
	function chechkValue(){
		if(!document.deleteform.password.value){
			alert("비밀번호를 입력하지 않았습니다.");
			return false;
		}
	}
</script>

</head>
<body>
	<br><br>
	<p><b><font size="6" color="gray">회원 탈퇴</font></b></p>
	<br><br><br>
	
	<form name="deleteform" method="post" action="deleteresult.do" onsubmit="return checkValue()">
		<table>
				<tr>
					<td bgcolor="skyblue">비밀번호</td>
					<td><input type="password" name="password" maxlength="50"></td>
				</tr>
		</table>
				
			<br>
			<center>
				<input type="button" value="취소" onclick="javascript:window.location='main.do'">
				<input type="submit" value="탈퇴" onclick="submit_event()">
			</center>
		</form>
		
	<!-- <dialog id="dialog">
	  <form method="dialog">
	    <p>정말로 탈퇴하시겠습니까?</p>
	    <button type="submit" value="yes">Yes</button>
	    <button type="submit" value="no" autofocus>No</button>
	  </form>
	</dialog> -->

</body>
</html>
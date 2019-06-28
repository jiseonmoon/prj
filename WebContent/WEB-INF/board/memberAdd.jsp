<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue;
		}
		
		#title{
			background-color:skyblue;
		}
		
		p{
			margin: auto;
			text-align: center;
		}
		
		div{
			margin-top: 5px;
			margin-left: 210px;
		}
	</style>
	
	<script type="text/javascript">
		function checkValue(){
			var form=document.userInfo;
			
			if(!form.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(form.idDuplication.value!="idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(!form.password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if(form.password.value != form.passwordcheck.value ){
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}
			
			/* if(!form.name.value){
				alert("이름을 입력하세요.");
				return false;
			} */
			
			if(!form.email1.value){
				alert("메일 주소를 입력하세요.");
				return false;
			}
			
			if(!form.phone.value){
				alert("전화번호를 입력하세요.");
				return false;
			}
			
			/* if(isNaN(form.phone.value)){
				alert("전화번호는 - 제외한 숫자만 입력해주세요.");
				return false;
			} */
			
			if(!form.addr.value){
				alert("주소를 입력하세요.");
				return false;
			}
			
			/* if(!form.card.value){
				alert("카드번호를 입력하세요.");
				return false;
			} */
		}
	
		function goFirstForm() {
			location.href="main.do";
		}
		
		function openIdChk(){
			window.name = "parentForm";
			window.open("MemberIdCheckAction.do",
					"chkForm", "width=500, height=300, resizable = no, scrollbars = no");	
		}
		
		function inputIdChk(){
			document.userInfo.idDuplication.value="idUncheck";
		}
	</script>
</head>
<body>
	<br><br>
	<p><b><font size="6" color="gray">회원 가입</font></b></p>
	<br><br><br>
	<form method="post" action="addresult.do" 
				name="userInfo" onsubmit="return checkValue()">
		<table>
 			<tr>
    			<td id="title">아이디<b><font color=red>*</font></b></td>
    			<td>
    				<input type="text" name="id" maxlength="50" onkeydown="inputIdChk()">
    				<input type="button" value="중복 확인" onclick="openIdChk()">
    				<input type="hidden" name="idDuplication" value="idUncheck">
 				</td>
 			</tr>
 			
 			<tr>
    			<td id="title">비밀번호<b><font color=red>*</font></b></td>
    			<td>
    				<input type="password" name="password" maxlength="50">
    			</td>
    		</tr>
    
 			<tr>
 				<td id="title">비밀번호 확인<b><font color=red>*</font></b></td>
 				<td>
 					<input type="password" name="passwordcheck" maxlength="50">
 				</td>
 			</tr>
 			
 			<tr>
    			<td id="title">이메일<b><font color=red>*</font></b></td>
    			<td>
    				<input type="text" name="email1" maxlength="50">@<select name="email2">
    					<option>naver.com</option>
    					<option>daum.net</option>
    					<option>gmail.com</option>
    					<option>nate.com</option>
    				</select>
 				</td>
 			</tr>
 			
			<tr>
    			<td id="title">전화번호<b><font color=red>*</font></b></td>
    			<td>
    				<input type="text" name="phone">
    			</td>
 			</tr>
 			
 			<tr>
    			<td id="title">주소<b><font color=red>*</font></b></td>
    			<td>
    				<input type="text" size="50" name="addr">
    			</td>
 			</tr>
 			
 			<tr>
    			<td id="title">무통장 계좌</td>
    			<td>
    				<input type="text" size="50" name="bank">
    			</td>
 			</tr>
 			
 			<tr>
    			<td id="title">카드번호</td>
    			<td>
    				<input type="text" name="card" maxlength="50">
    			</td>
 			</tr>
 		</table>
 		<div><b><font color="red" size="2">* 필수 입력 항목</font></b></div>
 		<br>
 		<center>
 			<input type="submit" value="가입">
   			<input type="button" value="취소" onclick="goFirstForm()">
   		</center>
 	</form>
</body>
</html>
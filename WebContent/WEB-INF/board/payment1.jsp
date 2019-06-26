<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="memberdto" value="${sessionScope.memberdto }"></c:set>
	<c:set var="spondto" value="${requestScope.spondto }"></c:set>
	<form method="post" action="payment2.do">
		<div>
			<h3>후원 정보</h3>
			<ul>
				<li><label for="amount">후원 금액 입력</label><input type="number"
					name="amount" id="amount" min="${spondto.minmoney}"></li>
			</ul>
		</div>
		<div>
			<h3>배송지 정보</h3>
			<ul>
				<li><label for="name">이름</label><input type="text" name="name"
					id="name" required></li>
				<li><label for="tel">연락처</label><input type="text" name="tel"
					id="tel" required></li>
				<li><label for="addr">주소</label><input type="text" name="addr"
					id="addr" required></li>
				<li><input type="hidden" name="boardno"
					value=${spondto.boardno }></li>
			</ul>
		</div>
		<div>
			<ul>
				<li><input type="submit" value="결제하기"></li>
			</ul>
		</div>
	</form>
</body>
</html>
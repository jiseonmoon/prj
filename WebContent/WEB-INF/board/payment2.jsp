<%@page import="com.bitcamp.dto.DeliveryDTO"%>
<%@page import="com.bitcamp.dto.SponDTO"%>
<%@page import="com.bitcamp.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	MemberDTO memberdto = (MemberDTO) session.getAttribute("member");
	SponDTO spondto = (SponDTO) request.getAttribute("spondto");
	DeliveryDTO deliverydto = (DeliveryDTO) request.getAttribute("deliverydto");
	int amount = Integer.parseInt(request.getAttribute("amount").toString());
%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(document).ready(function(){
	$("#payment").click(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp85472948'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		IMP.request_pay({
			pg : 'html5_inicis', // version 1.1.0부터 지원.
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '<%=spondto.getBoardtitle()%>',
			amount : <%=amount%>,
			buyer_name : '<%=deliverydto.getName()%>',
			buyer_tel : '<%=deliverydto.getTel()%>',
			buyer_addr : '<%=deliverydto.getAddr()%>'
			//,
			//m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					alert(msg);
					location.href = "psuccess.do?boardno=<%=spondto.getBoardno()%>&amount=<%=amount%>";
																} else {
																	var msg = '결제에 실패하였습니다.';
																	msg += '에러내용 : '
																			+ rsp.error_msg;
																	alert(msg);
																	location.href = "pfailure.do"
																}
															});
										});
					});
</script>
<style>
#wrapper {
	padding: 3%;
	width: 50%;
	margin: 0 auto;
}

.card.border-primary.mb-3 {
	margin: 5%;
}

.card-body {
	padding: 10%;
}

.amount, .btn.btn-primary.btn-lg {
	display: inline-block;
	margin: 0 auto;
}

.button {
	padding: 5%;
	position: relative;
	left: 70%;
	position: relative;
}
</style>
</head>
<body>
	<div id="wrapper">
		<h1>결제 정보 확인</h1>
		<div class="card border-primary mb-3">
			<div class="card-header">
				<h3>후원 정보</h3>
			</div>
			<div class="card-body">
				<table class="table table-hover">
					<tbody>
						<tr class="table-default">
							<th scope="row">후원 이름</th>
							<td><c:out value="${spondto.boardtitle }"></c:out></td>
						</tr>
						<tr class="table-primary">
							<th scope="row">현재 모금액</th>
							<td><c:out value="${spondto.nowmoney }"></c:out></td>
						</tr>
						<tr class="table-default">
							<th scope="row">목표 금액</th>
							<td><c:out value="${spondto.destmoney }"></c:out></td>
						</tr>
						<tr class="table-primary">
							<th scope="row">마감일</th>
							<td><c:out value="${spondto.finaldate }"></c:out></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="card border-primary mb-3">
			<div class="card-header">
				<h3>배송지 정보</h3>
			</div>
			<div class="card-body">
				<table class="table table-hover">
					<tbody>
						<tr class="table-default">
							<th scope="row">이름</th>
							<td><c:out value="${deliverydto.name }"></c:out></td>
						</tr>
						<tr class="table-primary">
							<th scope="row">연락처</th>
							<td><c:out value="${deliverydto.tel }"></c:out></td>
						</tr>
						<tr class="table-default">
							<th scope="row">배송 주소</th>
							<td><c:out value="${deliverydto.addr }"></c:out></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="button">
			<h3 class="amount">
				<c:out value="${amount }"></c:out>
				원
			</h3>
			<button type="button" id="payment" class="btn btn-primary btn-lg">결제하기</button>
		</div>
	</div>
</body>
</html>
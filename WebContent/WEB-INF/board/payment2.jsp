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
	MemberDTO memberdto = (MemberDTO) session.getAttribute("memberdto");
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
</head>
<body>
	<div>
		<h1>결제 정보 확인</h1>
		<h3>후원 정보</h3>
		<c:out value="${spondto.boardno }"></c:out>
		<br>
		<c:out value="${spondto.boardtitle }"></c:out>
		<br>
		<c:out value="${spondto.boardcontent }"></c:out>
		<br>
		<c:out value="${spondto.boardtag }"></c:out>
		<br>
		<c:out value="${spondto.destmoney }"></c:out>
		<br>
		<c:out value="${spondto.finaldate }"></c:out>
		<br>
		<c:out value="${spondto.nowmoney }"></c:out>
		<br>
		<h3>배송지 정보</h3>
		<c:out value="${deliverydto.name }"></c:out>
		<br>
		<c:out value="${deliverydto.tel }"></c:out>
		<br>
		<c:out value="${deliverydto.addr }"></c:out>
		<br>
		<button type="button" id="payment">결제하기</button>
		<br>
	</div>
</body>
</html>
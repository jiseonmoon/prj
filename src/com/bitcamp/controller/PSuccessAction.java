package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.PaymentService;

public class PSuccessAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberDTO memberdto = (MemberDTO) session.getAttribute("memberdto");
		SponDTO spondto = (SponDTO) request.getAttribute("spondto");
		int amount = Integer.parseInt(request.getAttribute("amount").toString());
		PaymentService service = PaymentService.getInstance();
		service.plusNowmoney(spondto.getBoardno(), amount);
		service.plusPmoney(memberdto.getMno(), amount);
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/psuccess.jsp");
		return forward;
	}

}

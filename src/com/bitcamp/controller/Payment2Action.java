package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.DeliveryDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.SponService;

public class Payment2Action implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		int amount = Integer.parseInt(request.getParameter("amount"));
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		DeliveryDTO deliverydto = new DeliveryDTO();
		deliverydto.setName(name);
		deliverydto.setTel(tel);
		deliverydto.setAddr(addr);
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		SponService service = SponService.getService();
		SponDTO spondto = service.getDetail(boardno);
		request.setAttribute("amount", amount);
		request.setAttribute("deliverydto", deliverydto);
		request.setAttribute("spondto", spondto);
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/payment2.jsp");
		return forward;
	}

}

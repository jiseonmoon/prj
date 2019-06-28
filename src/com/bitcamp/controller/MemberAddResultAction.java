package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.service.SponService;

public class MemberAddResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
    	
		ForwardAction act=new ForwardAction();
		
		SponService service=SponService.getService();
		
		String Mid=request.getParameter("id");
		String Mpwd=request.getParameter("password");
		String email1=request.getParameter("email1");
		String email2=request.getParameterValues("email2")[0];
		String tel=request.getParameter("phone");
		String addr=request.getParameter("addr");
		String bank=request.getParameter("bank");
		String card=request.getParameter("card");
		
		
		service.memberAddService(Mid, Mpwd, email1, email2, tel, addr, bank, card);
		
		
		act.setRedirect(true);
		act.setPath("result.do");
		
		/*HttpSession session=request.getSession();
		session.setAttribute("sessionID", Mid);*/
		
		request.getSession().setAttribute("msg", "1");
		
		return act;
	}

}

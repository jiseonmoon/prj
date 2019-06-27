package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.service.SponService;

public class MemberModifyResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		ForwardAction act=new ForwardAction();
		
		SponService service=SponService.getService();
		
		HttpSession session=request.getSession();
		String Mid=session.getAttribute("sessionID").toString();
		
		MemberDTO dto=new MemberDTO();
		dto.setMid(Mid);
		dto.setMpwd(request.getParameter("password"));
		dto.setEmail1(request.getParameter("email1"));
		dto.setEmail2(request.getParameterValues("email2")[0]);
		dto.setTel(request.getParameter("phone"));
		dto.setAddr(request.getParameter("addr"));
		dto.setBank(request.getParameter("bank"));
		dto.setCard(request.getParameter("card"));
		
		service.memberModifyService(dto);
		
		act.setRedirect(true);
		act.setPath("result.do");
		
		session.setAttribute("msg", "0");
		
		return act;
	}

}

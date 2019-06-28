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

public class MemberLoginResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ForwardAction act= new ForwardAction();
		HttpSession session=request.getSession();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		SponService service=SponService.getService();
		MemberDTO dto=service.memberInfoService(id);
		System.out.println("dto:"+dto);
		
		int check=service.memberLoginService(id, password);
		
		if(check == 0)
		{ 
	   		request.setAttribute("fail", "0");
	   		
	   		act.setRedirect(false);
	   		act.setPath("login.do");
		}
		else if(check == -1)
		{
			request.setAttribute("fail", "-1");

	   		act.setRedirect(false);
	   		act.setPath("login.do");
		}
		else
		{
	   		session.setAttribute("sessionID", id);
	   		session.setAttribute("member", dto);
	   		System.out.println(session.getAttribute("sessionID"));
	   		System.out.println(session.getAttribute("member"));
	   		act.setRedirect(true);
	   		act.setPath("main.do");
		}
   		
		return act;
	}

}

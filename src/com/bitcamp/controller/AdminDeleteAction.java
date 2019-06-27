package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.service.SponService;

public class AdminDeleteAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ForwardAction act=new ForwardAction();
		
		String Mid=request.getParameter("id");
		SponService service=SponService.getService();
		int result=service.adminDeleteService(Mid);
		request.setAttribute("result", result);
		
		act.setRedirect(false);
		act.setPath("/WEB-INF/board/adminResult.jsp");
		
		return act;
	}

}

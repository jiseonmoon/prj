package com.bitcamp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.service.SponService;

public class MemberIdCheckAction1 implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Mid=request.getParameter("id");
		SponService service=SponService.getService();
		
		boolean result=service.memberIdCheckService(Mid);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		if(result)
			out.println("0");
		else {
			out.println("1");
		}
		
		return null;
	}

}

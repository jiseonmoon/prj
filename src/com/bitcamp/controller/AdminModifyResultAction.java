package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.service.SponService;

public class AdminModifyResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ForwardAction act=new ForwardAction();
		
		SponService service=SponService.getService();
		
		//String id=(String)request.getAttribute("id");
		int Mtier=Integer.parseInt(request.getParameter("Mtier"));
		String Mid=request.getParameter("id");
		//System.out.println(id +",   "+grade);
		service.adminModifyService(Mid, Mtier);
		
		act.setRedirect(true);
		act.setPath("memberlist.do");
		
		return act;
	}

}

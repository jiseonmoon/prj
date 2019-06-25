package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.service.SponService;

public class SponSubDelAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int subNo = Integer.parseInt(request.getParameter("subNo"));
		int sponNo = Integer.parseInt(request.getParameter("sponNo"));
		
		SponService service = SponService.getService();
		service.subDelete(subNo);
		
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("spondetail.do?no="+sponNo);
		
		return forward;
	}

}

package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.service.SponService;

public class AdminModifyAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ForwardAction act=new ForwardAction();
		
		String Mid=request.getParameter("id");
		request.setAttribute("id", Mid);
		
		/*
		 * SponService service=SponService.getInstance(); MemberDTO
		 * dto=service.memberInfoService(id);
		 * 
		 * request.setAttribute("memberDetail", dto);
		 */
		
		act.setRedirect(false);
		act.setPath("/WEB-INF/board/adminModify.jsp");
		
		return act;
	}

}

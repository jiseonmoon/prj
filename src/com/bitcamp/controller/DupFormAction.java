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

public class DupFormAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ForwardAction act= new ForwardAction();
		HttpSession session=request.getSession();
		
		String Mid = request.getParameter("id");
		
		SponService service=SponService.getService();
		/*MemberDTO dto=service.memberInfoService(id);*/
		
		boolean check=service.memberIdCheckService(Mid);
		
		
		if(!check)
		{ 
	   		request.setAttribute("msg", "0");
		}
		else
		{
			request.setAttribute("msg", "1");
		}
//		act.setRedirect(false);
//		act.setPath("/WEB-INF/board/dupResult.jsp");
		act.setRedirect(true);
		act.setPath("result.do");
		return act;
	}

}

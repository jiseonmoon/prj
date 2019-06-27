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

public class MemberModifyAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ForwardAction act=new ForwardAction();
		
		HttpSession session=request.getSession();
		String Mid=session.getAttribute("sessionID").toString();
		
		SponService service=SponService.getService();
		MemberDTO dto=service.memberInfoService(Mid);
		
		request.setAttribute("memberInfo", dto);
		
		act.setRedirect(false);
		act.setPath("/WEB-INF/board/memberModify.jsp");
		
		return act;
	}

}

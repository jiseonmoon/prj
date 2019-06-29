package com.bitcamp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.service.SponService;

public class MemberListAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ForwardAction act=new ForwardAction();
		
		SponService service=SponService.getService();
		ArrayList<MemberDTO> memberlist=service.memberListService();
		
		request.setAttribute("memberlist", memberlist);
		
		act.setRedirect(false);
		act.setPath("/WEB-INF/board/memberList.jsp");
		
		return act;
	}

}

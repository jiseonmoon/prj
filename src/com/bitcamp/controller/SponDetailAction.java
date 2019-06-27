package com.bitcamp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.SponService;

public class SponDetailAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int boardno = Integer.parseInt(request.getParameter("no"));
		SponService service = SponService.getService();
		SponDTO result = service.getDetail(boardno);
		
		int memNo = result.getWriterno();
		MemberDTO member = service.getMemberDetail(memNo);
		
		request.setAttribute("result", result);
		request.setAttribute("member", member);
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=spondetail.jsp");
		
		return forward;
	}

}

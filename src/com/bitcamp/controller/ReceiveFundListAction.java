package com.bitcamp.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.GiveFundDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.ReceiveFundDTO;
import com.bitcamp.service.SponService;

public class ReceiveFundListAction implements Action{

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ForwardAction act=new ForwardAction();
		HttpSession session=request.getSession();
		
		MemberDTO dto=(MemberDTO)session.getAttribute("member");
		int Mno=dto.getMno();
		
		SponService service=SponService.getService();
		
		ArrayList<ReceiveFundDTO> receivefundlist=service.receiveFundListService(Mno);
		
		request.setAttribute("receivefundlist", receivefundlist);
		
		act.setRedirect(false);
		act.setPath("/WEB-INF/board/receivefundlist.jsp");
		
		return act;
	}

}

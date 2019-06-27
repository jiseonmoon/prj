package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.service.SponService;

public class MemberDeleteResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ForwardAction act=new ForwardAction();
		
		HttpSession session=request.getSession();
		String Mid=session.getAttribute("sessionID").toString();
		String Mpwd=request.getParameter("password");
		
		SponService service=SponService.getService();
		int check=service.memberDeleteService(Mid, Mpwd);
		
		if(check==1) {
			//session.invalidate();
			session.removeAttribute("sessionID");
			act.setRedirect(true);
			act.setPath("result.do");
		}else {
			/*
			 * System.out.println("회원 삭제 실패"); return null;
			 */
			act.setRedirect(false);
			act.setPath("WEB-INF/board/deleteResult.jsp");
		}
		
		return act;
	}

}

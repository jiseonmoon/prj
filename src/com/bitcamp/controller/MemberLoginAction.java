package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;

public class MemberLoginAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ForwardAction act=new ForwardAction();
		act.setRedirect(false);
		act.setPath("/WEB-INF/board/templete.jsp?page=memberLogin.jsp");
		
		return act;
	}

}

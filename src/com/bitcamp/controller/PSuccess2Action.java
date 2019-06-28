package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;

public class PSuccess2Action implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=psuccess.jsp");
		return forward;
	}

}

package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import comm.Action;
import comm.ActionForward;
import dto.QADTO;
import service.BoardService;

public class QInsertResultAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		//MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String mid=(String)session.getAttribute("mid");
		int mtier = ((Integer)(session.getAttribute("mtier"))).intValue();
    	
		int qano=request.getParameter("qano");
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String secret=request.getParameter("secret");
		
		QADTO dto=new QADTO();
		BoardService service=BoardService.getInstance();
		service.QAinsertService(dto);
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("qalist.do");
		
		return forward;
	}

}

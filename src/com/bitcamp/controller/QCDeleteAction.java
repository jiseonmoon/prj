package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.Action;
import comm.ActionForward;
import service.BoardService;

public class QCDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("num"));
		int boardno=Integer.parseInt(request.getParameter("boardno"));
		BoardService service=BoardService.getInstance();
		service.QCdelete(num);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("detail.do?num="+boardno);
		return forward;
	}

}

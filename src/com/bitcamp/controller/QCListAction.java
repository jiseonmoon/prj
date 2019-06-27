package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import comm.Action;
import comm.ActionForward;
import dto.QCDTO;
import service.BoardService;

public class QCListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  int num=Integer.parseInt(request.getParameter("num"));
		  BoardService service=BoardService.getInstance();
		  List<QCDTO> qclist= service.QCdetailService(num);
		   request.setAttribute("qclist", qclist);
		   ActionForward forward=new ActionForward();
		   forward.setRedirect(false);
		   forward.setPath("/WEB-INF/board/qclist.jsp");
		return forward;
	}

}

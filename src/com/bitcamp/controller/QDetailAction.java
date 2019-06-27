package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.Action;
import comm.ActionForward;
import dto.QADTO;
import service.BoardService;

public class QDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num=request.getParameter("num");
		   int boardnum=1;
		   if(num!=null && !num.equals(""))
			   boardnum=Integer.parseInt(num);
			
		   BoardService service=BoardService.getInstance();
		   QADTO data= service.QAdetailService(boardnum);
		   request.setAttribute("data", data);
		  	ActionForward forward=new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("WEB-INF/board/qadetail.jsp");
		  	
			return forward;
	}

}

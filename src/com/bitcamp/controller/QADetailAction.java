package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.QADTO;
import com.bitcamp.service.BoardService;

public class QADetailAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int qano=Integer.parseInt(request.getParameter("qano"));
		
		BoardService service=BoardService.getService();
		QADTO dto=service.qaDetail(qano);
		System.out.println(dto+"DTO");
		
		request.setAttribute("dto", dto);
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=qadetail.jsp");
		
		return forward;
	}

}

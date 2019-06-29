package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.QADTO;
import com.bitcamp.service.BoardService;

public class QAModifyFormAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int qano=Integer.parseInt(request.getParameter("qano"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		QADTO dto=new QADTO();
		dto.setQano(qano);
		dto.setTitle(title);
		dto.setContent(content);
		
		BoardService service=BoardService.getService();
		service.QAmodify(dto);
		
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("qalist.do");
		
		return forward;
	}

}

package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.QADTO;
import com.bitcamp.service.BoardService;

public class QAInsertFormAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int mno=Integer.parseInt(request.getParameter("mno"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		QADTO dto=new QADTO();
		BoardService service=BoardService.getService();
		dto.setMno(mno);
		dto.setTitle(title);
		dto.setContent(content);
		
		service.QAinsert(dto);
		
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("qalist.do");
		
		return forward;
	}

}

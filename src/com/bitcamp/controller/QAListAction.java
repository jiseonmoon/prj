package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.QADTO;
import com.bitcamp.service.BoardService;

public class QAListAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BoardService service=BoardService.getService();
		List<QADTO> list=service.getList();
		request.setAttribute("list", list);
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=qalist.jsp");
		
		return forward;
	}

}

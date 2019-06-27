package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.Action;
import comm.ActionForward;

public class QCInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num=Integer.parseInt(request.getParameter("num"));
		String content=request.getParameter("content");
		String writer=request.getParameter("writer");
		SubBoardDTO dto=new SubBoardDTO();
		dto.setBoardno(num);
		dto.setSubcontent(content);
		dto.setWriter(writer);
        
		BoardService service=BoardService.getInstance();
		int result=service.subAdd(dto);
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("detail.do?num="+num);
		return forward;
	}

}

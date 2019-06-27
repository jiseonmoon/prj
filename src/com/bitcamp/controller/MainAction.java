package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.Action;
import comm.ActionForward;
import dto.QADTO;
import dto.SponDTO;
import service.BoardService;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardService service=BoardService.getInstance();
		
		List<SponDTO> pop = service.poplistService();
		List<SponDTO> close = service.closelistService();
		List<SponDTO> newest = service.newestlistService();
		List<QADTO> newn = service.newNoticeService();
		
		request.setAttribute("pop", pop);
		request.setAttribute("close", close);
		request.setAttribute("newest", newest);
		request.setAttribute("newn", newn);
		
		ActionForward forward = new ActionForward();
	    forward.setRedirect(false);
	    forward.setPath("/WEB-INF/board/templete.jsp?page=main.jsp");
	      
	    return forward;
	}

}

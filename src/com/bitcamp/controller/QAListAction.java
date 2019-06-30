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
		request.setCharacterEncoding("utf-8");
		String curr = request.getParameter("currpage");
		int currpage= 1;
		if(curr!=null) {
			currpage = Integer.parseInt(curr);
		} 	
		int pagepercount = 10; 
		BoardService service=BoardService.getService();
		int totalcount = service.getPageCount();
		int totalpage=(totalcount/pagepercount)+((totalcount%pagepercount==0)? 0:1);
		int startrow=(currpage-1)*pagepercount;
		
		int blocksize=5;
		int startblock=((currpage-1)/blocksize)*blocksize+1;
		int endblock=startblock+blocksize-1;
		if(totalpage<endblock)
			endblock=totalpage;
		List<QADTO> list = service.QAListService(startrow,pagepercount);
		
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("currpage", currpage);
		request.setAttribute("startblock", startblock);
		request.setAttribute("endblock",endblock);
		
		//∆‰¿Ã¬°
		
		/*BoardService service=BoardService.getService();
		List<QADTO> list=service.getList();
		request.setAttribute("list", list);*/
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=qalist.jsp");
		
		return forward;
	}

}

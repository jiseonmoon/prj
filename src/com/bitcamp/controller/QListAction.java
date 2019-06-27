package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comm.Action;
import comm.ActionForward;
import dto.QADTO;
import service.BoardService;

public class QListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 
		//현재페이지
		String curr = request.getParameter("currpage");
		int currpage= 1;
		if(curr!=null) {
			currpage = Integer.parseInt(curr);
		}
		//1페이지에 보여지는 자료의 수 	
		int pagepercount = 10; 
		//service 호출 
		BoardService service=BoardService.getInstance();
		//service에서 있는 getCount를 받아서 totalcount값으로 넣기
		int totalcount = service.getCount();
		//totalpage 계산!
		int totalpage=(totalcount/pagepercount)+((totalcount%pagepercount==0)? 0:1);
		//시작페이지 계산!
		int startrow=(currpage-1)*pagepercount+1;
		//끝페이지 계산!
		int endrow = startrow+pagepercount-1;
		if(endrow>totalcount)
			endrow=totalcount;
		//block에 관한 정보를 계산!
		int blocksize=5;
		int startblock=((currpage-1)/blocksize)*blocksize+1;
		int endblock=startblock+blocksize-1;
		if(totalpage<endblock)
			endblock=totalpage;
		// arrylist로 자료 받아서 dto로 넣기->service에 getList메서드 만들기
		List<QADTO> list = service.QAListService(startrow,endrow);
		request.setAttribute("list", list);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("currpage", currpage);
		request.setAttribute("startblock", startblock);
		request.setAttribute("endblock",endblock);
	
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=QAlist.jsp");
		
		
		return forward;
	}

}

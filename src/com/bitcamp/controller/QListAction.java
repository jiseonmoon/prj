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
		 
		//����������
		String curr = request.getParameter("currpage");
		int currpage= 1;
		if(curr!=null) {
			currpage = Integer.parseInt(curr);
		}
		//1�������� �������� �ڷ��� �� 	
		int pagepercount = 10; 
		//service ȣ�� 
		BoardService service=BoardService.getInstance();
		//service���� �ִ� getCount�� �޾Ƽ� totalcount������ �ֱ�
		int totalcount = service.getCount();
		//totalpage ���!
		int totalpage=(totalcount/pagepercount)+((totalcount%pagepercount==0)? 0:1);
		//���������� ���!
		int startrow=(currpage-1)*pagepercount+1;
		//�������� ���!
		int endrow = startrow+pagepercount-1;
		if(endrow>totalcount)
			endrow=totalcount;
		//block�� ���� ������ ���!
		int blocksize=5;
		int startblock=((currpage-1)/blocksize)*blocksize+1;
		int endblock=startblock+blocksize-1;
		if(totalpage<endblock)
			endblock=totalpage;
		// arrylist�� �ڷ� �޾Ƽ� dto�� �ֱ�->service�� getList�޼��� �����
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

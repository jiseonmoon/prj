package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.BoardDTO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.service.BoardService;

public class SponAddResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		
		BoardDTO dto = new BoardDTO();
		dto.setBoardtitle(title);
		dto.setBoardwriter(writer);
		dto.setBoardcontent(content);
		
		BoardService service=BoardService.getInstance();
		service.AddService(dto);
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("list.do");
		
		return forward;
	}

}

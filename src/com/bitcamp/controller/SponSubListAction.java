package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.SponSubDTO;
import com.bitcamp.service.SponService;

public class SponSubListAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no")); // 댓글이 작성된 글번호
		SponService service = SponService.getService();
		List<SponSubDTO> list = service.subList(no);
		request.setAttribute("list", list);
		
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/sponsublist.jsp");
		
		return forward;
	}

}

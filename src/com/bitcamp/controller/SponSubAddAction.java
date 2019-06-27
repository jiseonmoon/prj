package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.SponSubDTO;
import com.bitcamp.service.SponService;

public class SponSubAddAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content"); // 댓글내용
		int boardno = Integer.parseInt(request.getParameter("boardno")); // 댓글을 작성할 글번호
		int memberNo = Integer.parseInt(request.getParameter("mno")); // 댓글을 작성할 회원번호
		
		System.out.println(memberNo);
		
		SponSubDTO dto = new SponSubDTO();
		dto.setSubContent(content);
		dto.setSponNo(boardno);
		dto.setMemberNo(memberNo);
		
		SponService service = SponService.getService();
		service.subAdd(dto);
		
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("spondetail.do?no="+boardno);
		
		return forward;
	}

}

package com.bitcamp.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.SponService;

public class SponDetailAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int boardno = Integer.parseInt(request.getParameter("no"));
		SponService service = SponService.getService();
		SponDTO result = service.getDetail(boardno);
		
		MemberDTO writer = service.getMemberDetail(boardno);
		
		// true면 후원 활성, false이면 비활성되게
		SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = df.format(date);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date day1 = null;
		Date day2 = null;
		try {
			day1 = format.parse(result.getFinaldate());
			day2 = format.parse(today);
		} catch (ParseException e) {
			System.out.println(e);
		}
		int dateResult = day1.compareTo(day2);
		
		request.setAttribute("result", result);
		request.setAttribute("writer", writer);
		request.setAttribute("dateResult", dateResult);
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=spondetail.jsp");
		
		return forward;
	}

}

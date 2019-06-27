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
		
		int memNo = result.getWriterno();
		MemberDTO member = service.getMemberDetail(memNo);
		
		
		// true면 후원 활성, false이면 비활성되게
		SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String today = df.format(date);
	
		String date1 = result.getFinaldate();
		String date2 = today;
		
		System.out.println(date1);
		System.out.println(date2);
		
		boolean dateResult = false;
		
		try{ 
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			       
			Date FirstDate = format.parse(date1);
			Date SecondDate = format.parse(date2);
			dateResult = FirstDate.getTime() >= SecondDate.getTime();
			System.out.println(dateResult);
			        
		} catch(ParseException e) {
			System.out.println(e);
		}
		
		
		request.setAttribute("result", result);
		request.setAttribute("member", member);
		request.setAttribute("dateResult", dateResult);
		ForwardAction forward = new ForwardAction();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/board/templete.jsp?page=spondetail.jsp");
		
		return forward;
	}

}

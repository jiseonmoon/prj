package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.comm.JexcelWriter;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.SponService;

public class SponDownloadAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDTO dto = (MemberDTO)request.getSession().getAttribute("member");
		dto = new MemberDTO();
		
		
		request.setCharacterEncoding("utf-8");
		
		//tag값 초기화
		String tag = request.getParameter("tag");
		if(tag==null) {
			tag = "";
		}
		System.out.println("tag : " + tag);
		
		//마감 체크 초기화
		String checkFinish = request.getParameter("isFinish");
		boolean isFinish = false;
		if(checkFinish!=null && checkFinish!="") {
			isFinish = Boolean.parseBoolean(checkFinish);
		}
		System.out.println("isFinish : " + isFinish);
		
		//search값 초기화
		String search = request.getParameter("search");
		if(search==null) {
			search = "";
		}
		System.out.println("search : " + search);
		
		//currpage값 초기화
		String curr = request.getParameter("currpage");
		int currpage = 1;
		if(curr!=null && curr!="") {
			currpage = Integer.parseInt(curr);
		}
		System.out.println("curr : " + currpage);
		
		int pagepercount=8;
		SponService service = SponService.getService();
		int totalcount = service.getCountService(isFinish, tag, search);
		System.out.println("total count : " + totalcount);
		
		int totalpage = (int)Math.ceil(totalcount/(double)pagepercount);
		int startrow = (currpage - 1)*pagepercount + 1;
		int endrow = startrow + pagepercount - 1;
		if(endrow > totalcount) {
			endrow = totalcount;
		}
		
		int blocksize = 5; //5개까지 보여줌
		int blockstart = ((currpage - 1)/blocksize)*blocksize + 1;
		int blockend = blockstart + blocksize - 1;
		if(blockend > totalpage) {
			blockend = totalpage;
		}
		
		PageDTO pageinfo = new PageDTO();
		pageinfo.setBlocksize(blocksize);
		pageinfo.setEndblock(blockend);
		pageinfo.setStartblock(blockstart);
		pageinfo.setPagepercount(pagepercount);
		pageinfo.setStartrow(startrow);
		pageinfo.setEndrow(endrow);
		pageinfo.setTotalcount(totalcount);
		pageinfo.setTotalpage(totalpage);
		pageinfo.setCurrpage(currpage);
		
		List<SponDTO> list = service.getListService(isFinish, tag, search, pageinfo);
		System.out.println("list size : " + list.size());	
		
		//excel 정보 작성
		String realPath = request.getServletContext().getRealPath("/upload");
		JexcelWriter jx = JexcelWriter.getInstance();
		String exlname = jx.createExl(list, dto.getMno(), realPath);
		
		//다운로드 처리
		
		
		//파일 삭제
		int deleteok = jx.deleteExl(exlname);
		
		
		request.setAttribute("list", list);
		request.setAttribute("pageinfo", pageinfo);
		request.setAttribute("tag", tag);
		request.setAttribute("isFinish", isFinish);
		request.setAttribute("search", search);
		
		ForwardAction forward = new ForwardAction();
	    forward.setRedirect(false);
	    forward.setPath("/WEB-INF/board/templete.jsp?page=sponlist.jsp");
	      
	    return forward;
	}

}

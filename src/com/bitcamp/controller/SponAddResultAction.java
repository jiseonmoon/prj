package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.SponService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SponAddResultAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession(false);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		
		String realPath = request.getServletContext().getRealPath("/upload");
		System.out.println(realPath);
		
		int maxSize = 5*1024*1024;
		
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		String stitle = multi.getParameter("stitle");
		String scontent = multi.getParameter("scontent");
		String tag = multi.getParameter("tag");
		String imgpath = multi.getFilesystemName("imgpath");
		int destmoney = Integer.parseInt(multi.getParameter("destmoney"));
		int minmoney = Integer.parseInt(multi.getParameter("minmoney"));
		String finaldate = multi.getParameter("finaldate");
		int bankno = Integer.parseInt(multi.getParameter("bankno"));
		SponDTO dto = new SponDTO();
		dto.setBankno(bankno);
		dto.setBoardcontent(scontent);
		dto.setBoardtag(tag);
		dto.setBoardtitle(stitle);
		dto.setBoardwriter(member.getMid());
		dto.setDestmoney(destmoney);
		dto.setFinaldate(finaldate);
		dto.setImagepath(imgpath);
		dto.setMinmoney(minmoney);
		dto.setWriterno(member.getMno());
		
		System.out.println("원 파일 이름: " + multi.getOriginalFileName("imgpath"));
		System.out.println("시스템에 올린 파일 이름 : " + multi.getFilesystemName("imgpath"));
		System.out.println("파일 확장자 : " + multi.getContentType("filename"));
		
		SponService service=SponService.getService();
		service.sponDataAddService(dto);
		
		ForwardAction forward=new ForwardAction();
		forward.setRedirect(true);
		forward.setPath("sponlist.do");
		
		return forward;
	}

}

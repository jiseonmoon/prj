package com.bitcamp.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
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
		
		//tag�� �ʱ�ȭ
		String tag = request.getParameter("tag");
		if(tag==null) {
			tag = "";
		}
		System.out.println("tag : " + tag);
		
		//���� üũ �ʱ�ȭ
		String checkFinish = request.getParameter("isFinish");
		boolean isFinish = false;
		if(checkFinish!=null && checkFinish!="") {
			isFinish = Boolean.parseBoolean(checkFinish);
		}
		System.out.println("isFinish : " + isFinish);
		
		//search�� �ʱ�ȭ
		String search = request.getParameter("search");
		if(search==null) {
			search = "";
		}
		System.out.println("search : " + search);
		
		//currpage�� �ʱ�ȭ
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
		
		int blocksize = 5; //5������ ������
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
		
		//excel ���� �ۼ�
		String folder = request.getServletContext().getRealPath("/upload");
		JexcelWriter jx = JexcelWriter.getInstance();
		String fileName = jx.createExl(list, dto.getMno(), folder);
			
		request.setAttribute("list", list);
		request.setAttribute("pageinfo", pageinfo);
		request.setAttribute("tag", tag);
		request.setAttribute("isFinish", isFinish);
		request.setAttribute("search", search);
		
		// ������ �ִ� �����θ� �����´�.
		// ���� ���ε�� ������ UploadFolder ������ �ִ�.
		
		// ������ �����θ� �����.
		String filePath = folder + "/" + fileName;

		try {
			File file = new File(filePath);
			byte b[] = new byte[(int) file.length()];
			
			// page�� ContentType���� �������� �ٲٱ� ���� �ʱ�ȭ��Ŵ
			response.reset();
			response.setContentType("application/octet-stream");
			
			// �ѱ� ���ڵ�
			String encoding = new String(fileName.getBytes("utf-8"),"8859_1");
			
			// ���� ��ũ�� Ŭ������ �� �ٿ�ε� ���� ȭ���� ��µǰ� ó���ϴ� �κ�
			response.setHeader("Content-Disposition", "attachment;filename="+ encoding);
			response.setHeader("Content-Length", String.valueOf(file.length()));
			
			if (file.isFile()) // ������ �������
			{
				FileInputStream fileInputStream = new FileInputStream(file);
				ServletOutputStream servletOutputStream = response.getOutputStream();
				
				//  ������ �о Ŭ���̾�Ʈ������ �����Ѵ�.
				int readNum = 0;
				while ( (readNum = fileInputStream.read(b)) != -1) {
					servletOutputStream.write(b, 0, readNum);
				}
				
				servletOutputStream.close();
				fileInputStream.close();
			}else {
				ForwardAction forward = new ForwardAction();
			    forward.setRedirect(false);
			    forward.setPath("/WEB-INF/board/templete.jsp?page=sponlist.jsp");
			      
			    return forward;
			}
			
		} catch (Exception e) {
			System.out.println("Download Exception : " + e.getMessage());
		}
		
		return null;
	}

}

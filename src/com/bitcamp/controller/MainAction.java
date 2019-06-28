package com.bitcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Synthesizer;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.service.SponService;

public class MainAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//�ֽż� ������ ����
		request.setCharacterEncoding("utf-8");
		//currpage�� �ʱ�ȭ
		int currpage = 1;
		int pagepercount=5;
		SponService service = SponService.getService();
		int startrow = (currpage - 1)*pagepercount + 1;
		PageDTO pageinfo = new PageDTO();
		pageinfo.setPagepercount(pagepercount);
		pageinfo.setStartrow(startrow);
		
		List<SponDTO> list1 = service.getListNewService(pageinfo);
		System.out.println(list1);
		//��ݾ׼� ������ ����
				
		List<SponDTO> list2 = service.getListNowService(pageinfo);
		System.out.println(list2);
		
		//������ �� ������ ����
		
		List<SponDTO> list3 = service.getListFinalService(pageinfo);
		System.out.println(list3);
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		
		//������ �׼�
		ForwardAction act=new ForwardAction();
		
		act.setRedirect(false);
		act.setPath("/WEB-INF/board/templete.jsp?page=main.jsp");
		
		return act;
	}

}

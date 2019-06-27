package com.bitcamp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.dto.MemberDTO;

public class SponAddAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		//�׽�Ʈ ��� ó��
		MemberDTO testMember = new MemberDTO();
		testMember.setMid("ding");
		testMember.setMno(1);
		session.setAttribute("member", testMember);
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		//
		ForwardAction act=new ForwardAction();
		//��� ó��
		if(member != null) {
			act.setRedirect(false);
			act.setPath("/WEB-INF/board/templete.jsp?page=sponaddform.jsp");
		}else {
			//����� ���� ��� �α��� ������ �̵�
			act.setRedirect(false);
			act.setPath("/WEB-INF/board/templete.jsp?page=sponaddform.jsp");
		}
		//
		
		
		return act;
	}

}

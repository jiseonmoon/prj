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
		
		//테스트 멤버 처리
	
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		//
		ForwardAction act=new ForwardAction();
		//멤버 처리
		
		if(member == null) {
			System.out.println("로그인 안됌");
			act.setRedirect(false);
			act.setPath("/WEB-INF/board/templete.jsp?page=memberLogin.jsp");
		}else if(member.getMtier()!=1) {
			System.out.println("후원가능자");
			act.setRedirect(false);
			act.setPath("/WEB-INF/board/templete.jsp?page=sponaddform.jsp");
		}else if(member.getMtier()==1){
			System.out.println("일반회원");
			act.setRedirect(false);
			act.setPath("/WEB-INF/board/sponwritecheck.jsp");
		}
		
		return act;
	}

}

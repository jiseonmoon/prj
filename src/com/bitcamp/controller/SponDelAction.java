package com.bitcamp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitcamp.comm.Action;
import com.bitcamp.comm.ForwardAction;
import com.bitcamp.service.SponService;

public class SponDelAction implements Action {

	@Override
	public ForwardAction execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int boardno = Integer.parseInt(request.getParameter("boardno"));
		String imagepath = request.getParameter("imagepath");
		
		System.out.println(boardno);
		
		
		// �̹��� ���� ����
		File file = new File("C:/bitcamp/prj/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/prj/upload/"+imagepath);
        
		System.out.println(file);
		
        if( file.exists() ){
            if(file.delete()){
                System.out.println("���ϻ��� ����");
            }else{
                System.out.println("���ϻ��� ����");
            }
        }else{
            System.out.println("������ �������� �ʽ��ϴ�.");
        }
		// �̹��� ���� ���� ��
		
        SponService service = SponService.getService();
        int result = service.sponDel(boardno);
        System.out.println(result);
        
        ForwardAction forward = new ForwardAction();
        forward.setRedirect(true);
        forward.setPath("sponlist.do");
        
		return forward;
	}

}

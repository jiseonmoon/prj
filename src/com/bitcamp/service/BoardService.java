package com.bitcamp.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.bitcamp.comm.DBConn;
import com.bitcamp.dao.QADAO;
import com.bitcamp.dto.QADTO;

public class BoardService {
	private static BoardService service=new BoardService();
	public static BoardService getService() {
		return service;
	}
	private BoardService() {}
	
	public List<QADTO> getList() {
		Connection conn=null;
		List<QADTO> list=null;
		try {
			conn=DBConn.getDB().getConnection();
			QADAO dao=QADAO.getDAO();
			list=dao.getList(conn);
			
		}catch(SQLException | NamingException e) {
			System.out.println(e);
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return list;
	}
	
	public QADTO qaDetail(int qano) {
		Connection conn=null;
		QADTO dto=null;
		try {
			conn=DBConn.getDB().getConnection();
			QADAO dao=QADAO.getDAO();
			dto=dao.getQAdetail(conn, qano);
			
		}catch(SQLException | NamingException e) {
			System.out.println(e);
		}finally {
			if(conn!=null) try {conn.close();} catch(SQLException e) {}
		}
		return dto;
	}
}

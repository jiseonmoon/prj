package com.bitcamp.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.bitcamp.comm.DBConn;
import com.bitcamp.dao.SponDAO;
import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.dto.SponSubDTO;

public class SponService {
	private static SponService instance = new SponService();
	private SponService() {}
	public static SponService getService() {
		return instance;
	}
	
	public int getCountService(boolean isFinish, String tag, String search) {
		DBConn db = DBConn.getDB();
		int count = 0;
		try(Connection conn = db.getConnection();) {
			SponDAO dao = SponDAO.getSponDAO();
			count = dao.getCount(conn, isFinish, tag, search);
		}catch(SQLException | NamingException e) {
			System.out.println(e);
		}
		return count;
	}
	
	public List<SponDTO> getListService(boolean isFinish, String filter, String search, PageDTO pageinfo){
		DBConn db = DBConn.getDB();
		List<SponDTO> result = null;
		try(Connection conn = db.getConnection();){
			SponDAO dao = SponDAO.getSponDAO();
			result = dao.getList(conn, isFinish, filter, search, pageinfo);
		}catch(SQLException | NamingException e) {
			System.out.println(e);
		}
		return result;
	}
	
	public int sponDataAddService(SponDTO dto) {
		Connection conn=null;
		int result = 0;
		try{
		
		conn=DBConn.getDB().getConnection();
		conn.setAutoCommit(false);
		SponDAO dao=SponDAO.getSponDAO();
		result = dao.sponDataAdd(conn, dto);
		
		conn.commit();
		} catch(SQLException | NamingException e)
		{
			System.out.println(e);
			try{conn.rollback();} catch(SQLException e1){}
		}catch(RuntimeException e)
		{
			System.out.println(e);
			try{ conn.rollback();} catch(SQLException e1){}
		}
		finally{
			if(conn!=null) {
				try {
					conn.close();
				}catch(SQLException e) {}
			}
		}
		return result;
	}
	
	
	
	// Detail
	public SponDTO getDetail(int boardno) {
		DBConn db = DBConn.getDB();
		SponDTO result = null;
		try(Connection conn = db.getConnection();){
			SponDAO dao = SponDAO.getSponDAO();
			result = dao.getDetail(conn, boardno);
		} catch(SQLException | NamingException e) {
			System.out.println(e);
		}
		return result;
	}
	
	// 펀딩글 삭제
	public int sponDel(int boardno) {
		DBConn db = DBConn.getDB();
		int result = 0;
		try(Connection conn = db.getConnection();) {
			SponDAO dao = SponDAO.getSponDAO();
			result = dao.sponDel(conn, boardno);
		} catch(SQLException | NamingException e) {
			System.out.println(e);
		}
		return result;
	}
	
	// 댓글 추가
	public int subAdd(SponSubDTO dto) {
		DBConn db = DBConn.getDB();
		int result = 0;
		try(Connection conn = db.getConnection();) {
			SponDAO dao = SponDAO.getSponDAO();
			result = dao.subAdd(conn, dto);
		} catch(SQLException | NamingException e) {
			System.out.println(e);
		}
		return result;
	}
	
	// 댓글 리스트 가져오기
	public List<SponSubDTO> subList(int no) {
		DBConn db = DBConn.getDB();
		List<SponSubDTO> list = null;
		try(Connection conn = db.getConnection();) {
			SponDAO dao = SponDAO.getSponDAO();
			list = dao.subList(conn, no);
		} catch (SQLException | NamingException e) {
			System.out.println(e);
		} 
		return list;
	}
	
	// 댓글 삭제
	public int subDelete(int subNo) {
		DBConn db = DBConn.getDB();
		int result = 0;
		
		try(Connection conn = db.getConnection();) {
			SponDAO dao = SponDAO.getSponDAO();
			result = dao.subDelete(conn, subNo);
		} catch (SQLException | NamingException e) {
			System.out.println(e);
		}
		return result;
	}
	
	// 펀딩글 작성자 정보 가져오기
	public MemberDTO getMemberDetail(int boardno) {
		DBConn db = DBConn.getDB();
		MemberDTO member = null;
		try(Connection conn = db.getConnection();) {
			SponDAO dao = SponDAO.getSponDAO();
			member = dao.getMemberDetail(conn, boardno);
		} catch (SQLException | NamingException e) {
			System.out.println(e);
		}
		return member;
	}
	
}

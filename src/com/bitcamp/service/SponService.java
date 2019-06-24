package com.bitcamp.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.bitcamp.comm.DBConn;
import com.bitcamp.dao.SponDAO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.SponDTO;

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
	
	public int sponDataAddService(SponDTO spondata) {
		return 0;
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
}

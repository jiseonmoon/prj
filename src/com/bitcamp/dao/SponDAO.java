package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.SponDTO;

public class SponDAO {
	private static SponDAO instance = new SponDAO();
	private SponDAO() {}
	public static SponDAO getSponDAO() {
		return instance;
	}
	
	public int getCount(Connection conn, boolean isFinish, String tag, String search) throws SQLException{
		StringBuilder sql = new StringBuilder();
		sql.append(" select count(*) ");
		sql.append(" from SponBoard ");
		if(isFinish) {
			sql.append(" where tag like ? and stitle like ? and (finaldate > sysdate()) ");
		}else {
			sql.append(" where tag like ? and stitle like ? ");
		}
		System.out.println("sql : " + sql.toString());
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("getCount isFinish : " + isFinish);
		System.out.println("getCount tag : " + tag);
		System.out.println("getCount search : " + search);
		try{
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%"+tag+"%");
			System.out.println("setstring : " + "%"+tag+"%");
			pstmt.setString(2, "%"+search+"%");
			System.out.println("setstring2 : " + "%"+search+"%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println("getCount result : " + result);
			}
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(SQLException e){}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException e){}
			}
		}
		return result;
	}
	
	public List<SponDTO> getList(Connection conn, boolean isFinish, String tag, String search, PageDTO pageinfo) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		ArrayList<SponDTO> list = new ArrayList<>();
		sql.append(" select sno, e.mno, mid, Stitle, Scontent, imgpath, tag, destmoney, minmoney, finaldate, nowmoney ");
		sql.append(" from SponBoard e inner join Member m on e.mno = m.mno ");
		if(isFinish) {
			sql.append(" where tag like ? and stitle like ? and (finaldate > sysdate()) ");
			sql.append(" limit ?, ? ");
			
		}else {
			sql.append(" where tag like ? and stitle like ? ");
			sql.append(" limit ?, ? ");
			
		}
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%"+tag+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setInt(3, pageinfo.getStartrow()-1);
			pstmt.setInt(4, pageinfo.getPagepercount());			
			System.out.println("getList search : " + search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SponDTO dto = new SponDTO();
				dto.setBoardno(rs.getInt("sno"));
				dto.setWriterno(rs.getInt("mno"));
				dto.setBoardwriter(rs.getString("mid"));
				dto.setBoardtitle(rs.getString("Stitle"));
				dto.setBoardcontent(rs.getString("Scontent"));
				dto.setImagepath(rs.getString("imgpath"));
				dto.setBoardtag(rs.getString("tag"));
				dto.setDestmoney(rs.getInt("destmoney"));
				dto.setMinmoney(rs.getInt("minmoney"));
				dto.setFinaldate(rs.getDate("finaldate").toString());
				dto.setNowmoney(rs.getInt("nowmoney"));
				list.add(dto);
			}
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException e) {}
			}
			if(rs!=null) {
				try {
					rs.close();
				}catch(SQLException e) {}
			}
		}
		return list;
	}
	
	public int sponDataAdd(Connection conn, SponDTO spondata) {
		return 0;
	}
}

package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitcamp.dto.QADTO;

public class QADAO {
	private static QADAO dao=new QADAO();
	public static QADAO getDAO() {
		return dao;
	}
	private QADAO() {}
	
	public List<QADTO> getList(Connection conn) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" select qano, m.mno, m.mid, title, content, date ");
		sql.append(" from QAboard q join Member m on q.mno=m.mno     ");
		sql.append(" order by qano desc                              ");
		
		List<QADTO> list=new ArrayList<>();
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QADTO dto=new QADTO();
				dto.setQano(rs.getInt("qano"));
				dto.setMno(rs.getInt("mno"));
				dto.setMid(rs.getString("mid"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getString("date"));
				
				list.add(dto);
			}
			
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
		}
		
		return list;
		
	}
	public QADTO getQAdetail(Connection conn, int qano) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" select qano, title, content, date ");
		sql.append(" from QAboard  ");
		sql.append(" where qano = ? ");
		QADTO dto=new QADTO();
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, qano);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				dto.setQano(rs.getInt("qano"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setDate(rs.getString("date"));
			}
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException e) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
		}
		return dto;
	}
	
	public int QAdelete(Connection conn, int qano) {
		PreparedStatement pstmt=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" delete ");
		sql.append(" from QAboard ");
		sql.append(" where qano = ? ");
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, qano);
			result=pstmt.executeUpdate();	
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
		}
		return result;
	}
	
	public int QAinsert(Connection conn, QADTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" insert into QAboard ( mno, title, content, date ) ");
		sql.append(" values ( ?, ?, ?, now() ) ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getMno());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
		}
		return result;
	}
	
	public int QAmodify(Connection conn, QADTO dto) {
		int result=0;
		PreparedStatement pstmt=null;
		StringBuilder sql=new StringBuilder();
		sql.append(" update QAboard set ");
		sql.append(" title = ?, content = ? ");
		sql.append(" where qano = ? ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getQano());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			if(pstmt!=null) try {pstmt.close();}catch(SQLException e) {}
		}
		
		return result;
	}

	
	
}
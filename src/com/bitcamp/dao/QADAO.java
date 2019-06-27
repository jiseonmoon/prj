package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import dto.QADTO;
import src.notice.board.dao.BoardVO;

public class QADAO {
	private static QADAO dao = new QADAO();
	public static QADAO getDAO() {
		return dao;
	}
	private QADAO() {}

	public int getCount(Connection conn) throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append(" select count(*) from QABoard ");
		int datacount = 0;

		try (PreparedStatement pstmt = conn.prepareStatement(sql.toString()); ResultSet rs = pstmt.executeQuery();) {

			if (rs.next()) {
				datacount = rs.getInt(1);
			}

		}
		return datacount;
	}
	public List<QADTO> getData(Connection conn, int startrow, int endrow) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();

		sql.append(" select *                     ");
		sql.append(" from ( select rownum as rnum, category, title, mid, mno, mtier, date, secret ");
		sql.append("        from QABoard Q      ");
		sql.append("        where rownum<=?       ");
		sql.append("        )                     ");
		sql.append(" where rnum>=?                ");
		List<QADTO> arr = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, endrow);
			pstmt.setInt(2, startrow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QADTO dto = new QADTO();
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setMid(rs.getString("mid"));
				dto.setMno(rs.getInt("mno"));
				dto.setMtier(rs.getInt("mtier"));
				dto.setDate(rs.getDate("date"));
				arr.add(dto);
			}
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return arr;
	}
	
	public List<QADTO> getQAList(Connection conn) {
   	 PreparedStatement pstmt=null;
   	 ResultSet rs=null;
   	 StringBuilder sb=new StringBuilder();
   	 ArrayList<QADTO> arr=new ArrayList<>();
   	 sb.append(" select qano, category, title, mid, date, mtier ");
   	 sb.append(" from QAboard                      ");
   	 try{
   	 	 pstmt=conn.prepareStatement(sb.toString());
   		 rs=pstmt.executeQuery();
   		 while(rs.next()){
   			QADTO dto=new QADTO();
   			dto.setQano(rs.getInt("qano"));
   			dto.setCategory(rs.getString("category"));
   			dto.setTitle(rs.getString("title"));
   			dto.setMid(rs.getString("mid"));
   			dto.setDate(rs.getDate("date"));
   			dto.setMtier(rs.getInt("mtier"));
            arr.add(dto);
   		 }
   	 } catch(SQLException e){
   		 throw new RuntimeException();
   	 }finally{
   		 rsClose(rs);
   		 pstmtClose(pstmt);
   	 }
   	 return arr;
    }
	
	public void QAinsert(Connection conn, QADTO dto){
		PreparedStatement pstmt = null;
		StringBuilder sql=new StringBuilder();
		sql.append(" insert into QAboard (qano, category, mid, mtier, title, content, date, secret)");
		sql.append(" values (?, ?, ?, ?, ?, ?, ?, ?) ");

		try{
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getQano());
			pstmt.setString(2, dto.getCategory());
			pstmt.setString(3, dto.getMid());
			pstmt.setInt(4, dto.getMtier());
			pstmt.setString(5, dto.getTitle());
			pstmt.setString(6, dto.getContent());
			pstmt.setDate(7, (Date) dto.getDate());
			pstmt.setString(8, dto.getSecret());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			System.out.println(e);
		}finally{
			
		}
	}
	

 	public void delData(Connection conn, int num) throws SQLException {
 		 StringBuilder sql=new StringBuilder();
 		  sql.append(" delete from QCboard   ");
 		  sql.append(" where qcno =?         ");
 		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());){
 			pstmt.setInt(1, num);
 			pstmt.executeUpdate();
 		}
 	}
	
    public QADTO ReadData(Connection conn, int num) {
   	 PreparedStatement pstmt=null;
   	 StringBuilder sql=new StringBuilder();
   	 ResultSet rs=null;
   	 sql.append(" select qano, title, content ");
   	 sql.append(" from QAboard                ");
   	 sql.append(" where qano=?                ");
   	 QADTO data=new QADTO();
   	 try{
   		 pstmt=conn.prepareStatement(sql.toString());
   		 pstmt.setInt(1, num);
   		 rs=pstmt.executeQuery();
   		 if(rs.next()){
   		   data.setQano(rs.getInt("qano"));
   		   data.setTitle(rs.getString("title"));
   		   data.setContent(rs.getString("content"));
   		 }
   	 }catch(SQLException e)
   	 {
   		throw  new RuntimeException();
   	 }finally{
   		 rsClose(rs);
         pstmtClose(pstmt);
   	 }
   	 return data;
    }
    private void  pstmtClose(PreparedStatement pstmt){
		 if(pstmt!=null) try{ pstmt.close();} catch(SQLException e){}
	}
    private void rsClose(ResultSet rs){
   	 if(rs!=null) try{ rs.close();} catch(SQLException e){}
    }
    

	
	public List<QADTO> newNotice(Connection conn){
		List<QADTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql=new StringBuilder();
		sql.append(" select * ");
		sql.append(" from (select * from QAboard where category='NOTICE' order by qano desc ) ");
		sql.append(" where rownum <= 3 ");
		
		try{
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()){
				QADTO dto = new QADTO();
				dto.setTitle(rs.getString("title"));
				dto.setDate(rs.getTimestamp("date"));
				list.add(dto);
			}
		}catch (SQLException e) {
			System.out.println(e);
		}finally{
		}
		return list;
	}
	
}

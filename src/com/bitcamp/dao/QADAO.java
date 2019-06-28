package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitcamp.dto.QADTO;
import com.bitcamp.dto.SponDTO;

public class QADAO {
		private static QADAO dao = new QADAO();
		public static QADAO getDAO() {
			return dao;
		}
		private QADAO() {}

		public int getCount(Connection conn) throws SQLException {
			StringBuilder sql = new StringBuilder();
			sql.append(" select count(*) from QAboard ");
			int datacount = 0;

			try (PreparedStatement pstmt = conn.prepareStatement(sql.toString()); ResultSet rs = pstmt.executeQuery();) {

				if (rs.next()) {
					datacount = rs.getInt(1);
				}
				System.out.println("data count"+datacount);
			}
			return datacount;
		}
		public List<QADTO> getData(Connection conn, int startrow, int pagepercount) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sql = new StringBuilder();
			sql.append(" select qano, category, mid, title, secret, content, date, mtier  ");
			sql.append(" from QAboard                     ");
			sql.append(" order by qano desc    ");
			sql.append(" limit ?, ? ");
			List<QADTO> arr = new ArrayList<>();
			try {
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, pagepercount);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					QADTO dto = new QADTO();
					dto.setCategory(rs.getString("category"));
					dto.setTitle(rs.getString("title"));
					dto.setMid(rs.getString("mid"));
					dto.setMtier(rs.getInt("mtier"));
					arr.add(dto);
				}
			} catch (SQLException e) {
				System.out.println(e);
			} finally {
				if (rs != null) try { rs.close(); } catch (SQLException e) {}
				if (pstmt != null) try { pstmt.close();} catch (SQLException e) {}
			}
			return arr;
		}
		
		public List<QADTO> getQAList(Connection conn) {
	   	 PreparedStatement pstmt=null;
	   	 ResultSet rs=null;
	   	 StringBuilder sql=new StringBuilder();
	   	 List<QADTO> arr=new ArrayList<>();
	   	 sql.append(" select qano, category, m.mtier, m.mid, title, content, secret ");
	   	 sql.append(" from QAboard q join Member m on q.mid=m.mid               ");
	   	 try{
	   	 	 pstmt=conn.prepareStatement(sql.toString());
	   		 rs=pstmt.executeQuery();
	   		 while(rs.next()){
	   			QADTO dto=new QADTO();
	   			dto.setQano(rs.getInt("qano"));
	   			dto.setCategory(rs.getString("category"));
	   			dto.setMtier(rs.getInt("mtier"));
	   			dto.setMid(rs.getString("mid"));
	   			dto.setTitle(rs.getString("title"));
	   			dto.setContent(rs.getString("content"));
	   			dto.setSecret(rs.getString("secret"));
	            arr.add(dto);
	   		 }
	   	 } catch(SQLException e){
	   		 throw new RuntimeException();
	   	 }finally{
	   		if(rs!=null) {try {rs.close();}catch(SQLException e) {}}
	   		 if(pstmt!=null) {try {pstmt.close();}catch(SQLException e) {}}
			
	   	 }
	   	 return arr;
	    }
		
		public int QAinsert(Connection conn, QADTO dto){
			PreparedStatement pstmt = null;
			StringBuilder sql=new StringBuilder();
			sql.append(" insert into QAboard (category, mtier, mid, title, content, secret) ");
			sql.append(" values (?, ?, ?, ?, ?, ?) ");
			int result=0;
			try{
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getCategory());
				pstmt.setInt(2, dto.getMtier());
				pstmt.setString(3, dto.getMid());
				pstmt.setString(4, dto.getTitle());
				pstmt.setString(5, dto.getContent());
				pstmt.setString(6, dto.getSecret());
				pstmt.executeUpdate();
			}catch(SQLException e){
				System.out.println(e);
			}finally{
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException e) {}}
			}
			return result;
		}

	 	public void delData(Connection conn, int num) throws SQLException {
	 		 StringBuilder sql=new StringBuilder();
	 		  sql.append(" delete from QCboard ");
	 		  sql.append(" where qcno =?       ");
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
	   		if(rs!=null) {try {rs.close();}catch(SQLException e) {}}
	   		 if(pstmt!=null) {try {pstmt.close();}catch(SQLException e) {}}
			
	   	 }
	   	 return data;
	    }
	    
		public List<QADTO> newNotice(Connection conn){
			List<QADTO> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			StringBuilder sql=new StringBuilder();
			sql.append(" select * ");
			sql.append(" from (select * from QAboard where category='NOTICE' order by qano desc ) ");
			sql.append(" where rownum <= 4 ");
			try{
				pstmt = conn.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				while(rs.next()){
					QADTO dto = new QADTO();
					dto.setCategory(rs.getString("category"));
					dto.setTitle(rs.getString("title"));
					list.add(dto);
				}
			}catch (SQLException e) {
				System.out.println(e);
			}finally{
				if(rs!=null) {try {rs.close();}catch(SQLException e) {}}
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException e) {}}
			}
			return list;
		}
		
		public List<SponDTO> getPopList(Connection conn) {
			List<SponDTO> pop=new ArrayList<>();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			StringBuilder sql=new StringBuilder();
			sql.append(" select sno, e.mno, mid, Stitle, imgpath, destmoney, minmoney, finaldate, nowmoney ");
			sql.append(" from SponBoard e inner join Member m on e.mno = m.mno            ");
			sql.append(" order by (nowmoney/destmoney) desc limit 5 ");
			try {
				pstmt=conn.prepareStatement(sql.toString());
		   		rs=pstmt.executeQuery();
		   		 while(rs.next()){
		   			SponDTO dto=new SponDTO();
		   			dto.setBoardno(rs.getInt("sno"));
					dto.setWriterno(rs.getInt("mno"));
					dto.setBoardwriter(rs.getString("mid"));
					dto.setBoardtitle(rs.getString("Stitle"));
					dto.setImagepath(rs.getString("imgpath"));
					dto.setDestmoney(rs.getInt("destmoney"));
					dto.setMinmoney(rs.getInt("minmoney"));
					dto.setFinaldate(rs.getDate("finaldate").toString());
					dto.setNowmoney(rs.getInt("nowmoney"));
		            pop.add(dto);
		   		 }
			}catch(SQLException e) {
				System.out.println(e);
			}finally {
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException e) {}}
			}
			return pop;
		}
		
		public List<SponDTO> getCloseList(Connection conn) {
			List<SponDTO>  list=new ArrayList<>();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			StringBuilder sql=new StringBuilder();
			sql.append(" select sno, e.mno, mid, Stitle, imgpath, destmoney, minmoney, finaldate, nowmoney ");
			sql.append(" from SponBoard e inner join Member m on e.mno = m.mno            ");
			sql.append(" order by finaldate asc limit 5 ");
			try {
				pstmt=conn.prepareStatement(sql.toString());
		   		rs=pstmt.executeQuery();
		   		 while(rs.next()){
		   			SponDTO dto=new SponDTO();
		   			dto.setBoardno(rs.getInt("sno"));
					dto.setWriterno(rs.getInt("mno"));
					dto.setBoardwriter(rs.getString("mid"));
					dto.setBoardtitle(rs.getString("Stitle"));
					dto.setImagepath(rs.getString("imgpath"));
					dto.setDestmoney(rs.getInt("destmoney"));
					dto.setMinmoney(rs.getInt("minmoney"));
					dto.setFinaldate(rs.getDate("finaldate").toString());
					dto.setNowmoney(rs.getInt("nowmoney"));
		            list.add(dto);
		   		 }
			}catch(SQLException e) {
				System.out.println(e);
			}finally {
				if(rs!=null) try { rs.close();} catch(SQLException e) {}
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException e) {}}
			}
			return list;
		}
		
		public List<SponDTO> getNewestList(Connection conn) {
			List<SponDTO> newest=new ArrayList<>();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			StringBuilder sql=new StringBuilder();
			sql.append(" select sno, e.mno, mid, Stitle, imgpath, destmoney, minmoney, finaldate, nowmoney ");
			sql.append(" from SponBoard e inner join Member m on e.mno = m.mno            ");
			sql.append(" order by sno desc limit 5 ");
			try {
				pstmt=conn.prepareStatement(sql.toString());
				rs=pstmt.executeQuery();
		   		 while(rs.next()){
		   			SponDTO dto=new SponDTO();
		   			dto.setBoardno(rs.getInt("sno"));
					dto.setWriterno(rs.getInt("mno"));
					dto.setBoardwriter(rs.getString("mid"));
					dto.setBoardtitle(rs.getString("Stitle"));
					dto.setImagepath(rs.getString("imgpath"));
					dto.setDestmoney(rs.getInt("destmoney"));
					dto.setMinmoney(rs.getInt("minmoney"));
					dto.setFinaldate(rs.getDate("finaldate").toString());
					dto.setNowmoney(rs.getInt("nowmoney"));
		            newest.add(dto);
		   		 }
			}catch(SQLException e) {
				System.out.println(e);
			}finally {
				if(rs!=null) try { rs.close();} catch(SQLException e) {}
				if(pstmt!=null) {try {pstmt.close();}catch(SQLException e) {}}
			}
			return newest;
		}

}

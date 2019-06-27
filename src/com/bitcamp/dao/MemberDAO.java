package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bitcamp.dto.MemberDTO;

public class MemberDAO {
	private void  pstmtClose(PreparedStatement pstmt){
		 if(pstmt!=null) try{ pstmt.close();} catch(SQLException e){}
	}
    private void rsClose(ResultSet rs){
   	 if(rs!=null) try{ rs.close();} catch(SQLException e){}
    }

	public int memberAdd(Connection conn, String Mid, String Mpwd, String email1, String email2,
			String tel, String addr, String bank, String card) {
	   PreparedStatement pstmt=null;
 	   StringBuilder sql=new StringBuilder();
 	   sql.append("  insert   into   Member 							             ");
 	   sql.append("  (Mtier, Mid, Mpwd, email, tel, addr, bank, card)  ");
 	   sql.append("  values (3, ?, ?, ?, ?, ?, ?, ?)                              ");
 	   int result=0;
 	   try{
 		   pstmt=conn.prepareStatement(sql.toString());
 		   pstmt.setString(1, Mid);
 		   pstmt.setString(2, Mpwd);
 		   pstmt.setString(3, email1+"@"+email2);
 		   pstmt.setString(4, tel);
 		   pstmt.setString(5, addr);
 		   pstmt.setString(6, bank);
 		   pstmt.setString(7, card);
 		   result=pstmt.executeUpdate();
 		   conn.commit();
 	   }catch(SQLException e)
 	   {
 		   System.out.println(e);
 		   throw new RuntimeException();
 	   }finally{
 		   pstmtClose(pstmt);
 	   }
 	   return result;
	}
	
	public int memberLogin(Connection conn, String Mid, String Mpwd) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
	 	StringBuilder sql=new StringBuilder();
		
	 	String dbpw="";
	 	int result=-1;
	 	
	 	sql.append(" select Mpwd from Member ");
	 	sql.append(" where Mid=?                  ");
	 	try {
	 		pstmt=conn.prepareStatement(sql.toString());
	 		pstmt.setString(1, Mid);
	 		rs=pstmt.executeQuery();
	 		
	 		if(rs.next()) {
	 			dbpw=rs.getString("Mpwd");
	 			
	 			if(dbpw.equals(Mpwd))
	 				result=1;
	 			else
	 				result=0;
	 		}else {
	 			result=-1;
	 		}
	 	}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
	 	}finally{
	 		   pstmtClose(pstmt);
	 		   rsClose(rs);
	 	}
	 	   return result;
	}
	
	@SuppressWarnings("null")
	public MemberDTO memberInfo(Connection conn, String Mid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberDTO dto= new MemberDTO();
		StringBuilder sql=new StringBuilder();
		
		sql.append(" select * from Member ");
		sql.append("          where Mid=?  ");
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, Mid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				String email=rs.getString("memail");
				int idx=email.indexOf("@");
				String email1=email.substring(0, idx);
				String email2=email.substring(idx+1);
				
				dto.setMno(rs.getInt("mno"));
				
				dto.setMtier(rs.getInt("mtier"));
				
				dto.setMid(rs.getString("mid"));
				
				dto.setMpwd(rs.getString("mpwd"));
				
				dto.setEmail1(email1);
				dto.setEmail2(email2);
				dto.setTel(rs.getString("mtel"));
				dto.setAddr(rs.getString("maddr"));
				dto.setBank(rs.getString("bank"));
				dto.setCard(rs.getString("card"));
			}
		}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
	 	}finally{
	 		   pstmtClose(pstmt);
	 		   rsClose(rs);
	 	}
		
		return dto;
	}
	
	public void memberModify(Connection conn, MemberDTO dto) {
		PreparedStatement pstmt=null;
	 	StringBuilder sql=new StringBuilder();
	 	
	 	sql.append(" update Member set ");
	 	sql.append(" Mpwd=?, email=?, tel=?, addr=?, bank=?, card=? ");
	 	sql.append(" where Mid=? ");
	 	
	 	try {
	 		pstmt=conn.prepareStatement(sql.toString());
	 		
	 		pstmt.setString(1, dto.getMpwd());
	 		pstmt.setString(2, dto.getEmail1()+"@"+dto.getEmail2());
	 		pstmt.setString(3, dto.getTel());
	 		pstmt.setString(4, dto.getAddr());
	 		pstmt.setString(5, dto.getBank());
	 		pstmt.setString(6, dto.getCard());
	 		
	 		pstmt.executeUpdate();
	 	}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
	 	}finally{
	 		   pstmtClose(pstmt);
	 	}
	}
	
	@SuppressWarnings("resource")
	public int memberDelete(Connection conn, String Mid, String Mpwd) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuilder sql1=new StringBuilder();
		StringBuilder sql2=new StringBuilder();
		
		String dbpw="";
		int result=-1;
		
		sql1.append(" select Mpwd from Member where Mid=? ");
		sql2.append(" delete from Member where Mid=? ");
		
		try {
			pstmt=conn.prepareStatement(sql1.toString());
			pstmt.setString(1, Mid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dbpw=rs.getString("Mpwd");
				if(dbpw.equals(Mpwd)) {
					pstmt=conn.prepareStatement(sql2.toString());
					pstmt.setString(1, Mid);
					pstmt.executeUpdate();
					conn.commit();
					result=1;
				}else {
					result=0;
				}
			}
		}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
			}finally{
	 		   pstmtClose(pstmt);
	 		   rsClose(rs);
			}
		return result;
	}
	
	public boolean memberIdCheck(Connection conn, String Mid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		boolean result=false;
		
		StringBuilder sql=new StringBuilder();
		sql.append(" select Mid from Member where Mid=? ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, Mid);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				result=true;
		}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
			}finally{
	 		   pstmtClose(pstmt);
	 		   rsClose(rs);
			}
		
		return result;
	}
	
	public ArrayList<MemberDTO> memberList(Connection conn) {
		ArrayList<MemberDTO> arr=new ArrayList<>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuilder sql=new StringBuilder();
		sql.append(" select * from Member ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto=new MemberDTO();
				dto.setMno(rs.getInt("mno"));
				dto.setMtier(rs.getInt("mtier"));
				dto.setMid(rs.getString("mid"));
				dto.setMpwd(rs.getString("mpwd"));
				dto.setEmail1(rs.getString("memail"));
				dto.setTel(rs.getString("mtel"));
				dto.setAddr(rs.getString("maddr"));
				dto.setBank(rs.getString("bank"));
				dto.setCard(rs.getString("card"));
				arr.add(dto);
			}
		}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
			}finally{
	 		   pstmtClose(pstmt);
	 		   rsClose(rs);
			}
		
		return arr;
	}
	
	public int adminDelete(Connection conn, String Mid) {
		PreparedStatement pstmt=null;
		int result=0;
		StringBuilder sql=new StringBuilder();
		sql.append(" delete from Member ");
		sql.append(" where Mid=?         ");
		
		try {
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, Mid);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
			}finally{
	 		   pstmtClose(pstmt);
			}
		
		return result;
	}
	
	public void adminModify(Connection conn, String Mid, int Mtier) {
		PreparedStatement pstmt=null;
	 	StringBuilder sql=new StringBuilder();
	 	
	 	sql.append(" update Member set ");
	 	sql.append(" Mtier=? ");
	 	sql.append(" where Mid=? ");
	 	
	 	try {
	 		pstmt=conn.prepareStatement(sql.toString());
	 		
	 		pstmt.setInt(1, Mtier);
	 		pstmt.setString(2, Mid);
	 		
	 		pstmt.executeUpdate();
	 	}catch(SQLException e){
	 		   System.out.println(e);
	 		   throw new RuntimeException();
	 	}finally{
	 		   pstmtClose(pstmt);
	 	}
		
	}

}

package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.QCDTO;

public class QCDAO {

	public int addQC(Connection conn, QCDTO dto) {
		   StringBuilder sql=new StringBuilder();
		   sql.append(" insert into qcboard( qcno, qccontent, mid ) ");
		   sql.append(" values ( ?, ?, ? )                       ");
		   int result=0;
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());
				) {
			   pstmt.setInt(1, dto.getQcno());
			   pstmt.setString(2, dto.getQccontent());
			   pstmt.setString(3, dto.getMid());
			   result=pstmt.executeUpdate();
		   }catch(SQLException e){
			  throw new RuntimeException();
		  }
		return result;
	}
	
	public List<QCDTO> QCList(Connection conn, int num) throws SQLException{
		StringBuilder sql=new StringBuilder();
		sql.append("  select qcno, qccontent, Qno, m.mid ");
		sql.append("  from qcboard qc join Member m on qc.mid=m.mid ");
		sql.append("  where Qno= ?                ");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<QCDTO> qclist=new ArrayList<>();
		try {
		   pstmt=conn.prepareStatement(sql.toString()); 
		   pstmt.setInt(1, num);
		   rs=pstmt.executeQuery();
		   while(rs.next()){
			    QCDTO dto=new QCDTO();
			    dto.setQcno(rs.getInt("qcno"));
			    dto.setQccontent(rs.getString("qccontent"));
			    dto.setBoardno(rs.getInt("Qno"));
			    dto.setMid(rs.getString("mid"));
			   qclist.add(dto);
		   }
		 }finally {
			 if(rs!=null) try { rs.close();} catch(SQLException e) {}
			 if(pstmt!=null) try { pstmt.close();} catch(SQLException e) {}
			 
		 }
		return qclist;
	}
}

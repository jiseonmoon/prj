package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitcamp.dto.QCDTO;

public class QCDAO {

	/*public int insertQC(Connection conn, QCDTO dto) {
		   StringBuilder sql=new StringBuilder();
		   sql.append("  insert into QCboard(qccontent, mid, qano ) ");
		   sql.append("  values ( ?,?,? )       ");
		   int result=0;
		try(PreparedStatement pstmt=conn.prepareStatement(sql.toString());
				) {
			   pstmt.setString(1, dto.getQccontent());
			   pstmt.setString(2,  dto.getMid());
			   pstmt.setInt(3, dto.getQAno());
			   result=pstmt.executeUpdate();
			   
		   }catch(SQLException e){
			  throw new RuntimeException();
		  }
		return result;
	}*/

	/*public List<QCDTO> QClist(Connection conn, int no) throws SQLException{
		StringBuilder sql=new StringBuilder();
		sql.append(" select qcno, qccontent, qano ");
		sql.append(" from QCboard        ");
		sql.append(" where qano=?      ");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<SubBoardDTO> list=new ArrayList<>();
		try {
		   pstmt=conn.prepareStatement(sql.toString()); 
		   pstmt.setInt(1, no);
		   rs=pstmt.executeQuery();
		   while(rs.next()){
			    QCDTO dto=new QCDTO();
			    dto.setQcno(rs.getInt("qcno"));
			    dto.setQccontent(rs.getString("qccontent"));
			    dto.setQano(rs.getInt("qano"));
			   list.add(dto);
		   }
		 }finally {
			 if(rs!=null) try { rs.close();} catch(SQLException e) {}
			 if(pstmt!=null) try { pstmt.close();} catch(SQLException e) {}
			 
		 }
		return list;
	}*/
}

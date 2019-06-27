package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bitcamp.dto.MemberDTO;
import com.bitcamp.dto.PageDTO;
import com.bitcamp.dto.SponDTO;
import com.bitcamp.dto.SponSubDTO;

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
		sql.append(" select sno, e.mno, mid, Stitle, Scontent, imgpath, tag, destmoney, minmoney, finaldate, nowmoney, bankno ");
		sql.append(" from SponBoard e inner join Member m on e.mno = m.mno ");
		if(isFinish) {
			sql.append(" where tag like ? and stitle like ? and (finaldate > sysdate()) ");
			sql.append(" order by sno desc ");
			sql.append(" limit ?, ? ");
			
			
		}else {
			sql.append(" where tag like ? and stitle like ? ");
			sql.append(" order by sno desc");
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
	
	public int sponDataAdd(Connection conn, SponDTO dto) throws SQLException{
		PreparedStatement pstmt=null;
		StringBuilder sb=new StringBuilder();
 	   	sb.append("  insert   into   SponBoard 							      ");
 	   	sb.append("  (mno, stitle, scontent, imgpath, tag, destmoney, minmoney, finaldate, bankno)  ");
 	   	sb.append(" values (?, ?, ?, ?, ?, ?, ?, ?, ?)                   ");
 	   	int result=0;
 	   	try{
 	   		pstmt=conn.prepareStatement(sb.toString());
 	   		pstmt.setInt(1, dto.getWriterno());
 	   		pstmt.setString(2, dto.getBoardtitle());
 	   		pstmt.setString(3, dto.getBoardcontent());
 	   		pstmt.setString(4, dto.getImagepath());
 	   		pstmt.setString(5, dto.getBoardtag());
 	   		pstmt.setInt(6, dto.getDestmoney());
 	   		pstmt.setInt(7, dto.getMinmoney());
 	   		pstmt.setDate(8, Date.valueOf(dto.getFinaldate()));
 	   		pstmt.setString(9, dto.getBankno());
 	   		result=pstmt.executeUpdate();
 	   	}finally{
 	   		if(pstmt!=null) {
 	   			try {
 	   				pstmt.close();
 	   			}catch(SQLException e) {}
 	   		}
 	   	}
 	   	return result;
	}
	
	
	
	// Detail
	public SponDTO getDetail(Connection conn, int boardno) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		SponDTO dto = new SponDTO();
		StringBuilder sql = new StringBuilder();
		sql.append(" select sno, e.mno, mid, Stitle, Scontent, imgpath, tag, destmoney, minmoney, finaldate, nowmoney ");
		sql.append(" from SponBoard e inner join Member m on e.mno = m.mno ");
		sql.append(" where sno = ? ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
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
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		} finally {
			if ( rs != null) try { rs.close(); } catch(SQLException e) {}
			if ( pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return dto;
	}
	
	// 펀딩글 삭제
	public int sponDel(Connection conn, int boardno) {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append(" delete from SponBoard ");
		sql.append(" where sno = ? ");
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, boardno);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println(e);
		} finally {
			if ( pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return result;
	}
	
	
	// 댓글 추가
	public int subAdd(Connection conn, SponSubDTO dto) {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append(" insert into SubBoard (Sno, Mno, SBcontent) ");
		sql.append(" values (?, ?,?) ");
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getSponNo());
			pstmt.setInt(2, dto.getMemberNo());
			pstmt.setString(3, dto.getSubContent());
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println(e);
		} finally {
			if ( pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		
		return result;
	}
	
	// 댓글 가져오기
	public List<SponSubDTO> subList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select SBno, m.Mno, Sno, SBcontent, m.mid ");
		sql.append(" from SubBoard sb join Member m on sb.Mno = m.mno ");
		sql.append(" where Sno = ? ");
		
		List<SponSubDTO> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SponSubDTO sdto = new SponSubDTO();
				sdto.setSubNo(rs.getInt("SBno")); // 댓글 번호
				sdto.setMemberNo(rs.getInt("Mno")); // 멤버 번호
				sdto.setSponNo(rs.getInt("Sno")); // 글 번호
				sdto.setSubContent(rs.getString("SBcontent")); // 댓글 내용
				sdto.setMemberId(rs.getString("mid"));
				list.add(sdto);
			}
		} catch(SQLException e) {
			System.out.println(e);
		} finally {
			if ( pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return list;
	}
	
	// 댓글 삭제하기
	public int subDelete(Connection conn, int subNo) {
		PreparedStatement pstmt = null;
		StringBuilder sql = new StringBuilder();
		int result = 0;
		
		sql.append(" delete from SubBoard ");
		sql.append(" where SBno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, subNo);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println(e);
		} finally {
			if ( pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return result;
	}
	
	// 펀딩글 작성한 멤버 정보 가져오기
	public MemberDTO getMemberDetail(Connection conn, int memNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO member = new MemberDTO();
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select mid, memail, mtel ");
		sql.append(" from Member ");
		sql.append(" where mno = ? ");
		
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, memNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member.setMid(rs.getString("mid"));
				String email = rs.getString("memail");
				int idx = email.indexOf("@");
				member.setEmail1(email.substring(0, idx));
				member.setEmail2(email.substring(idx+1, email.length()));
				member.setTel(rs.getString("mtel"));
			}
			
		} catch(SQLException e) {
			System.out.println(e);
		} finally {
			if ( rs != null) try { rs.close(); } catch(SQLException e) {}
			if ( pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
		}
		return member;
	}
	
}

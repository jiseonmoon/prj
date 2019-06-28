package com.bitcamp.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.bitcamp.comm.DBConn;
import com.bitcamp.dao.QADAO;
import com.bitcamp.dao.QCDAO;
import com.bitcamp.dto.QADTO;
import com.bitcamp.dto.QCDTO;
import com.bitcamp.dto.SponDTO;

public class BoardService {
	private static BoardService instance=new BoardService();
	public static BoardService getInstance(){
		  return instance;
	  }
	private BoardService(){}
	
	public List<QADTO> QAListService(){
		Connection conn=null;
		List<QADTO> list=null;
		try{
			DBConn db=DBConn.getDB();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			QADAO dao=QADAO.getDAO();
			list=dao.getQAList(conn);
			System.out.println("리스트 사이즈"+list.size());
			conn.commit();
			} catch(SQLException|NamingException e){
				System.out.println(e);
				try{ conn.rollback();} catch(SQLException e1){}
			}catch(RuntimeException e){
				try{conn.rollback();} catch(SQLException e1){}
			}finally{
				if(conn!=null) try{ conn.close();} catch(SQLException e){}
			}
			return list;
		}
		
	   public QADTO QAdetailService(int num){
			Connection conn=null;
			QADTO data=new QADTO();
			try{
				conn=DBConn.getDB().getConnection();
				conn.setAutoCommit(false);
				QADAO dao=QADAO.getDAO();
				data=dao.ReadData(conn, num);
				conn.commit();
			}catch(SQLException e){
				System.out.println(e);
				try{conn.rollback();} catch(SQLException e1){}
			}catch(RuntimeException e){
				System.out.println(e);
				try{ conn.rollback();} catch(SQLException e1){}
			}catch(NamingException e){
				System.out.println(e);
			}finally{
				if(conn!=null) try{ conn.close();} catch(SQLException e){}
			}
			return data;
		}//detail service
		
	public void QAinsertService(QADTO dto){
			Connection conn=null;
			try{
			conn=DBConn.getDB().getConnection();
			conn.setAutoCommit(false);
			QADAO dao=QADAO.getDAO();
			int result=dao.QAinsert(conn, dto);
			conn.commit();
			} catch(SQLException|NamingException e)
			{
				System.out.println(e);
				 if(conn!=null) try{conn.rollback();} catch(SQLException e1){}
			}catch(RuntimeException e){
				System.out.println(e);
				 if(conn!=null)try{ conn.rollback();} catch(SQLException e1){}
			}
			finally{
				if(conn!=null)  try{ conn.close();} catch(SQLException e){}
			}
		}
	/*public int QCadd(QCDTO dto) {
		 DBConn  db=DBConn.getDB();   
		 Connection conn=null;
		 int result=0;
		 try {
			 conn=db.getConnection();
			 conn.setAutoCommit(false);
		     QCDAO dao=new QCDAO();
			 result= dao.insertQC(conn, dto);
		    	 conn.commit();
		     }catch(SQLException|NamingException e){ 
		    	 System.out.println(e);
		    	 try{conn.rollback();} catch(SQLException e2) {}
		     }catch(RuntimeException e){
		         try{conn.rollback();} catch(SQLException e2) {}	
		     }
		  return result;
	 }*/
	/*public List<QCDTO> QCdetailService(int num) {
		Connection conn=null;  
		List<QCDTO> list=null;
		try {
			  DBConn db=DBConn.getDB();
			  conn= db.getConnection();
			  conn.setAutoCommit(false);
			  QCDAO dao=new QCDAO();
			  //list=dao.QCList(conn, num);
			  conn.commit();	  
		}catch(SQLException|NamingException e){
			 try { conn.rollback();} catch(SQLException e2) {}
		}finally {
			 if(conn!=null) try { conn.close();} catch(SQLException e) {}
		}
		return list;
	}*/
	public void QCdelete(int num) {
		   DBConn db=DBConn.getDB();
		   Connection conn=null;
		   try {
			     conn=db.getConnection();
			     conn.setAutoCommit(false);
			     QADAO dao=QADAO.getDAO();
			     dao.delData(conn, num);
			     conn.commit();
		   }catch(SQLException|NamingException e)
		   {
			   System.out.println(e);
			   try { conn.rollback();} catch(SQLException e2) {}
		   }finally {
			   if(conn!=null) try { conn.close();} catch(SQLException e) {}
		   }
	}

	// 최다 후원 게시글
	public List<SponDTO> poplistService(){
		Connection conn=null;
		List<SponDTO> pop=null;
		try{
			DBConn db=DBConn.getDB();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			QADAO dao=QADAO.getDAO();
			pop=dao.getPopList(conn);
			conn.commit();
			} catch(SQLException|NamingException e){
				System.out.println(e);
				try{ conn.rollback();} catch(SQLException e1){}
			}catch(RuntimeException e){
				try{conn.rollback();} catch(SQLException e1){}
			}finally{
				if(conn!=null) try{ conn.close();} catch(SQLException e){}
			}
			return pop;
	}
	
	// 마감 임박 후원글
	public List<SponDTO> closelistService(){
		Connection conn=null;
		List<SponDTO> close=null;
		try{
			DBConn db=DBConn.getDB();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			QADAO dao=QADAO.getDAO();
			close=dao.getCloseList(conn);
			conn.commit();
			} catch(SQLException|NamingException e){
				System.out.println(e);
				try{ conn.rollback();} catch(SQLException e1){}
			}catch(RuntimeException e){
				try{conn.rollback();} catch(SQLException e1){}
			}finally{
				if(conn!=null) try{ conn.close();} catch(SQLException e){}
			}
			return close;
	}
	
	// 메인 최신 후원글 출력
	public List<SponDTO> newestlistService(){
		Connection conn=null;
		List<SponDTO> newest=null;
		try{
			DBConn db=DBConn.getDB();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			QADAO dao=QADAO.getDAO();
			newest=dao.getNewestList(conn);
			conn.commit();
			} catch(SQLException|NamingException e){
				System.out.println(e);
				try{ conn.rollback();} catch(SQLException e1){}
			}catch(RuntimeException e){
				try{conn.rollback();} catch(SQLException e1){}
			}finally{
				if(conn!=null) try{ conn.close();} catch(SQLException e){}
			}
			return newest;
	}
	
	// 메인 최신 공지사항 출력
	public List<QADTO> newNoticeService(){
		Connection conn=null;
		List<QADTO> newn=null;
		try{
			DBConn db=DBConn.getDB();
			conn=db.getConnection();
			conn.setAutoCommit(false);
			QADAO dao=QADAO.getDAO();
			newn=dao.newNotice(conn);
			conn.commit();
			} catch(SQLException|NamingException e){
				System.out.println(e);
				try{ conn.rollback();} catch(SQLException e1){}
			}catch(RuntimeException e){
				try{conn.rollback();} catch(SQLException e1){}
			}finally{
				if(conn!=null) try{ conn.close();} catch(SQLException e){}
			}
			return newn;
	}
	
	
	// 페이징
		public int getCount() {
			DBConn db = DBConn.getDB();
			Connection conn = null;
			int datacount = 0;
			try {
				conn = db.getConnection();
				QADAO dao = QADAO.getDAO();
				datacount = dao.getCount(conn);

			} catch (SQLException | NamingException e) {
				System.out.println(e);
			} finally {
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException e) {
					}
				}
			}
			return datacount;
		}
		public List<QADTO> QAListService(int startrow, int pagepercount) {
			DBConn db = DBConn.getDB();
			Connection conn=null;
			List<QADTO> list = null;
			try {
				conn=db.getConnection();
				QADAO dao = QADAO.getDAO();
				 list = dao.getData(conn,startrow,pagepercount);
				 System.out.println("사이즈"+list.size());
			}catch(SQLException | NamingException e) {
				System.out.println(e);
			}finally {
				if(conn!=null) try {conn.close();}catch(SQLException e) {}
			}
			return list;
		}
		public int subAdd(QCDTO dto) {
			return 0;
		}
}

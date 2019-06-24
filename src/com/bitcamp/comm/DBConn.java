package com.bitcamp.comm;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConn {
	private static DBConn db=new DBConn();
	public static  DBConn getDB()
	{
		return db;
	}
	private DBConn()
	{
		
      }
	
	 public  Connection getConnection() throws NamingException,SQLException  
	{
	        InitialContext initContext = new InitialContext();
	        DataSource ds  
	  			= (DataSource)initContext.lookup("java:/comp/env/jdbc/bitcamp");
	  		Connection conn=ds.getConnection();   
	    	return conn;
	}
}

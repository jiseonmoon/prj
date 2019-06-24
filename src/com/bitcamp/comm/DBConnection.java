package com.bitcamp.comm;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	
	private static DBConnection dbconn = new DBConnection();
	private DBConnection() {}
	public static DBConnection getDB() {
		return dbconn;
	}
	
	public Connection getConnection() throws SQLException, NamingException {
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/bitcamp");
		Connection conn = ds.getConnection();
		return conn;
	}
}

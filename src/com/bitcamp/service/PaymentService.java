package com.bitcamp.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.bitcamp.comm.DBConn;
import com.bitcamp.dao.PaymentDAO;

public class PaymentService {
	private PaymentService() {
	}

	private static PaymentService instance = new PaymentService();

	public static PaymentService getInstance() {
		return instance;
	}

	public int plusNowmoney(int sno, int money) {
		DBConn db = DBConn.getDB();
		Connection conn = null;
		int result = 0;
		try {
			conn = db.getConnection();
			PaymentDAO dao = PaymentDAO.getInstance();
			result = dao.plusNowmoney(conn, sno, money);
		} catch (NamingException | SQLException e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return result;
	}

	public int plusPmoney(int mno, int money) {
		DBConn db = DBConn.getDB();
		Connection conn = null;
		int result = 0;
		try {
			conn = db.getConnection();
			PaymentDAO dao = PaymentDAO.getInstance();
			result = dao.plusNowmoney(conn, mno, money);
		} catch (NamingException | SQLException e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return result;
	}
}

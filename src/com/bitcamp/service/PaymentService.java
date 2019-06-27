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

	public int plusMoney(int sno, int mno, int money) {
		DBConn db = DBConn.getDB();
		Connection conn = null;
		int result = 0;
		try {
			conn = db.getConnection();
			conn.setAutoCommit(false);
			PaymentDAO dao = PaymentDAO.getInstance();
			result = dao.plusNowmoney(conn, sno, money);
			result = dao.insertPaymentInfo(conn, sno, mno, money);
			// 프로젝트 번호 insert
			// 결제일
			conn.commit();
		} catch (NamingException | SQLException e) {
			System.out.println(e);
			try {
				conn.rollback();
			} catch (SQLException ee) {
			}
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

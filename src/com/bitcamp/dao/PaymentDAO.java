package com.bitcamp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PaymentDAO {
	private PaymentDAO() {
	}

	private static PaymentDAO instance = new PaymentDAO();

	public static PaymentDAO getInstance() {
		return instance;
	}

	public int plusNowmoney(Connection conn, int sno, int money) throws SQLException {
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		int result = 0;
		sql.append(" update SponBoard set nowmoney=nowmoney+? ");
		sql.append(" where sno=? ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, money);
			pstmt.setInt(2, sno);
			result = pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return result;
	}

	public int insertPaymentInfo(Connection conn, int sno, int mno, int money) throws SQLException {
		StringBuilder sql = new StringBuilder();
		PreparedStatement pstmt = null;
		int result = 0;
		sql.append(" insert into PayInfo values ( ");
		sql.append(" ?,?,sysdate,?) ");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			pstmt.setInt(2, mno);
			pstmt.setInt(2, money);
			result = pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
		return result;
	}
}

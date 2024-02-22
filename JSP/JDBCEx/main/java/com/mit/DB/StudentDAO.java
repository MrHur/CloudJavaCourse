package com.mit.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDAO {
	Connection conn = null;
	PreparedStatement pstmt;
	
	/*
	 * Connection conn = DriverManager.getConnection(
	 * 'jdbc:oracle:thin:@localhost:1521:xe', 'ora_uesr', '1234');
	 */
	
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "ora_user","1234");			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
<<<<<<< HEAD
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bg", "bg");
=======
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "javajsp", "12345");
>>>>>>> 8b7e7cd625f18be0867f2d4115585945e3f9d31a
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("rs.close() 오류 발생 : " + e);
			}
		}
		
		close(pstmt, conn);
	}
	
	public static void close(PreparedStatement pstmt, Connection conn) {	
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("pstmt.close() 오류 발생 : " + e);
			}
		}
		
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("conn.close() 오류 발생 : " + e);
			}
		}
	}
}

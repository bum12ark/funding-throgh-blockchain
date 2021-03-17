package exe.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.jdbc.OracleCallableStatement;

public class DBConnectionMgr {
	// 싱글톤
	private DBConnectionMgr() {}
	private static class LazyHolder {
		public static final DBConnectionMgr INSTANCE = new DBConnectionMgr();
	}
	public static DBConnectionMgr getInstance() {
		return LazyHolder.INSTANCE;
	}
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String _URL = "jdbc:oracle:thin:@192.168.0.211:1521:orcl11";
	public static final String _USER = "FTBC";
	public static final String _PW = "happychain";
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(_DRIVER);
			con = DriverManager.getConnection(_URL, _USER, _PW);
		} catch (ClassNotFoundException ce) {
			System.out.println("드라이버 클래스를 찾을 수 없다.");
		} catch(Exception e) {
			System.out.println("오라클 서버 연결 실패!!!.");
		}
		return con;
	}
	
	public void freeConnection(Connection con, PreparedStatement pstmt) {
		try {
			if (pstmt!=null) { // 자원반납은 객체 생성의 역순으로 해줘야 한다.
				pstmt.close();
			}
			if (con!=null) {
				con.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//** 커서가 필요한 경우 ***///
	public void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs) {
		try {
			if (rs!=null) {
				rs.close();
			}
			if (pstmt!=null) { // 자원반납은 객체 생성의 역순으로 해줘야 한다.
				pstmt.close();
			}
			if (con!=null) {
				con.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//** 커서가 필요 없는 경우 **// - UPDATE, DELETE, INSERT
	public void freeConnection(Connection con, CallableStatement cstmt) {
		try {
			if (cstmt!=null) { // 자원반납은 객체 생성의 역순으로 해줘야 한다.
				cstmt.close();
			}
			if (con!=null) {
				con.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//** 커서가 필요한 경우 **// - SELECT
	public void freeConnection(Connection con, CallableStatement cstmt, ResultSet rs) {
		try {
			if (rs!=null) {
				rs.close();
			}
			if (cstmt!=null) { // 자원반납은 객체 생성의 역순으로 해줘야 한다.
				cstmt.close();
			}
			if (con!=null) {
				con.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	//** REF_CURSOR를 쓸때 **//
	public void freeConnection(Connection con, CallableStatement cstmt, ResultSet rs, OracleCallableStatement ocstmt) {
		try {
			if (rs!=null) {
				rs.close();
			}
			if (ocstmt!=null) {
				ocstmt.close();
			}
			if (cstmt!=null) { // 자원반납은 객체 생성의 역순으로 해줘야 한다.
				cstmt.close();
			}
			if (con!=null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

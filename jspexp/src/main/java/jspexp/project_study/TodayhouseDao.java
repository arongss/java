package jspexp.project_study;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jspexp.a13_database.DB;

public class TodayhouseDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public boolean login(String id, String password) {
		boolean isSuccess = false;
		String sql = "SELECT *\r\n"
				+ "FROM THMEMBER\r\n"
				+ "WHERE id=? and password=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			isSuccess = rs.next(); // 해당 id, pass로 조회 될때만 true 그 외는 false
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isSuccess;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}

}

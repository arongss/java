package jspexp.project_4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jspexp.project_4.vo.Member_s;
import jspexp.project_4.vo.Professor;

public class eduloginDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public Member_s login(Member_s m) {
		Member_s mem = null;
		String sql = "SELECT * \r\n" + "      FROM member_s\r\n" + "      WHERE id=? and password=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPassword());
			rs = pstmt.executeQuery();
			if (rs.next()) { // 해당 id, pass로 조회 될때만 true 그 외는 false\
				mem = new Member_s(rs.getString(1), rs.getString(2), rs.getInt(3));
			}
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}

	// 교수 정보 할당 메서드
	public Professor loginName(Professor log) {
		Professor p = null;
		String sql = "SELECT *\r\n" + "FROM professor_s\r\n" + "WHERE id = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, log.getId());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				p = new Professor(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}
		} catch (SQLException e) {
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return p;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
}

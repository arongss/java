package jspexp.project_4;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jspexp.project_4.vo.Notice_p;

public class noticeDao {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 공지 조회
	public List<Notice_p> getNotices(Notice_p sch) {
		List<Notice_p> list = new ArrayList<Notice_p>();
		String sql = "SELECT noticeNo, title, contents, to_char(noticeDate,'YYYY-MM-DD'), views, adminId"
				+ "	FROM notice\r\n" + "	WHERE title LIKE '%'||'" + sch.getTitle() + "'||'%'\r\n"
				+ "	AND contents LIKE '%'||'" + sch.getContents() + "'||'%'";
		try {
			con = DB.con();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Notice_p e = new Notice_p(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5),
						rs.getString(6));
				list.add(e);
			}
			System.out.println("데이터건수:" + list.size());
			// 자원해제
			DB.close(rs, stmt, con);
		} catch (SQLException e) {
			System.out.println("DB 관련예외:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외:" + e.getMessage());
		}
		return list;
	}

	// 공지 등록
	public void insertNotice(Notice_p sch) {
		String sql = "INSERT INTO notice VALUES(noticeNo1_seq.nextval, ?, ?, sysdate, 0, 'admin1004')";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getTitle());
			pstmt.setString(2, sch.getContents());
			int cnt = pstmt.executeUpdate();
			System.out.println("등록건수:" + cnt);
			con.commit();
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				System.out.println("rollback 예외:" + e1.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 예외:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}
}

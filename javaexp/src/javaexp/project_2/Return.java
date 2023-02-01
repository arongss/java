package javaexp.project_2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.project_2.vo.Lending;
import javaexp.project_2.vo.Rlist;

public class Return {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Scanner sc = new Scanner(System.in);

	public List<Lending> LendingCk(Lending sch) {
		List<Lending> list = new ArrayList<Lending>();
		String sql = "SELECT id, bnumber, ldate, extension, ldate+14 duedate, sysdate,\r\n" + "	CASE\r\n"
				+ "	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))\r\n"
				+ "	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,\r\n" + "	CASE\r\n"
				+ "	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0\r\n"
				+ "	ELSE 300*(floor(sysdate-(ldate+14)))\r\n" + "	end charge\r\n" + "FROM lending\r\n"
				+ "WHERE bnumber = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sch.getBnumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Lending(rs.getString("id"), rs.getInt("bnumber"), rs.getDate("ldate"),
						rs.getInt("extension"), rs.getDate("duedate"), rs.getDate("sysdate"), rs.getString("days"),
						rs.getInt("charge")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return list;
	}

	public void ReturnBook(int bnumber) {
		String sql = "DELETE FROM Lending WHERE bnumber = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnumber);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

	public void ReturnBook2(Rlist a) {
		String sql = "INSERT INTO Rlist values(?,?,sysdate)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, a.getId());
			pstmt.setInt(2, a.getBnumber());
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

	public void ReturnBook3(int bnumber) {
		String sql = "UPDATE LIBRARY_BOOK SET POSSIBLE = '가능' WHERE BNUMBER = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnumber);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("roolback 에러:" + e.getMessage());
			}
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
	}

	public void RunReturnBook() {
		Return dao = new Return();
		System.out.println("# 도서반납 #");
		System.out.println("반납할 아이디와 도서번호를 입력해주세요.");
		System.out.print("▶아이디 : ");
		String id = sc.nextLine();
		System.out.print("▶도서번호 : ");
		int bnumber = sc.nextInt();
		dao.ReturnBook(bnumber);
		dao.ReturnBook2(new Rlist(id, bnumber));
		dao.ReturnBook3(bnumber);
	}

}

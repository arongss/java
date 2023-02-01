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
import javaexp.project_2.vo.Library_Book;
import javaexp.project_2.vo.Llist;

public class Lend {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Scanner sc = new Scanner(System.in);

	public List<Library_Book> PossibleCk(Library_Book sch) {
		List<Library_Book> sblist = new ArrayList<Library_Book>();
		String sql = "SELECT * \r\n" + "FROM LIBRARY_BOOK lb \r\n" + "WHERE BNUMBER = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sch.getBnumber());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sblist.add(new Library_Book(rs.getInt("bnumber"), rs.getString("isbn"), rs.getString("bname"),
						rs.getString("writer"), rs.getString("publisher"), rs.getString("cont"),
						rs.getString("possible")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return sblist;
	}

	public void LendBook(Lending a) {
		String sql = "INSERT INTO Lending values(?,?,sysdate,0)";
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

	public void LendBook2(Llist a) {
		String sql = "INSERT INTO Llist values(?,?,sysdate)";
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

	public void LendBook3(int bnumber) {
		String sql = "UPDATE LIBRARY_BOOK SET POSSIBLE = '불가능' WHERE BNUMBER = ?";
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

	public void RunLendBook() {
		Lend dao = new Lend();
		System.out.println("# 도서대여 #");
		System.out.println("대출할 아이디와 도서번호를 입력해주세요.");
		System.out.print("▶아이디 : ");
		String id = sc.nextLine();
		System.out.print("▶도서번호 : ");
		int bnumber = sc.nextInt();
		dao.LendBook(new Lending(id, bnumber));
		dao.LendBook2(new Llist(id, bnumber));
		dao.LendBook3(bnumber);
	}

}
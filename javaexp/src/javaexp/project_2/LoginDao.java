package javaexp.project_2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.project_2.vo.Member;

public class LoginDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Scanner sc = new Scanner(System.in);

	// 관리자회원가입
	public boolean InsertManager(Member ins) {
		String sql = "INSERT INTO Member values(?,?,?,?,0,?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPassword());
			pstmt.setString(3, ins.getMname());
			pstmt.setString(4, ins.getCivilNum());
			pstmt.setString(5, ins.getJdateS());
			pstmt.setString(6, ins.getAuth());
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
		return false;
	}

	public void RunInsertManager() {
		LoginDao dao = new LoginDao();
		System.out.println("# 관리자 회원가입 #");
		System.out.println("회원정보를 입력해주세요.");
		System.out.print("▶아이디 : ");
		String id = sc.nextLine();
		System.out.print("▶비밀번호(4자리이상) : ");
		String password = sc.nextLine();
		System.out.print("▶이름 : ");
		String mname = sc.nextLine();
		System.out.print("▶주민번호(ex.950527-2222222) : ");
		String civilNum = sc.nextLine();
		System.out.print("▶입사일(ex.1995-05-27) : ");
		String jdateS = sc.nextLine();
		if (password.length() < 4) {
			System.out.println("가입실패! 비밀번호는 4자리이상 입력하세요.");
		} else {
			Member mgr = new Member(id, password, mname, civilNum, jdateS, "관리자");
			boolean m = dao.InsertManager(mgr);
			if (m) {
				System.out.println("회원가입이 정상적으로 이루지지 않았습니다.");
			} else {
				System.out.println("회원가입이 정상적으로 완료되었습니다.");
			}
		}
	}

	// 이용자회원가입
	public boolean InsertUser(Member ins) {
		String sql = "INSERT INTO Member values(?,?,?,?,1000,sysdate,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPassword());
			pstmt.setString(3, ins.getMname());
			pstmt.setString(4, ins.getCivilNum());
			pstmt.setString(5, ins.getAuth());
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
		return false;
	}

	public void RunInsertUser() {
		LoginDao dao = new LoginDao();
		System.out.println("# 이용자 회원가입 #");
		System.out.println("회원정보를 입력해주세요.");
		System.out.print("▶아이디 : ");
		String id = sc.nextLine();
		System.out.print("▶비밀번호(4자리이상) : ");
		String password = sc.nextLine();
		System.out.print("▶이름 : ");
		String mname = sc.nextLine();
		System.out.print("▶주민번호(ex.950527-2222222) : ");
		String civilNum = sc.nextLine();
		if (password.length() < 4) {
			System.out.println("가입실패! 비밀번호는 4자리이상 입력하세요.");
		} else {
			Member user = new Member(id, password, mname, civilNum, "이용자");
			boolean u = dao.InsertUser(user);
			if (u) {
				System.out.println("회원가입이 정상적으로 이루지지 않았습니다.");
			} else {
				System.out.println("회원가입이 정상적으로 완료되었습니다.");
				System.out.println("가입을 축하드립니다. 1000포인트 적립!");
			}
		}
	}

	// 로그인
	public List<Member> Login(Member m) {
		List<Member> mlist = new ArrayList<Member>();
		String sql = "SELECT * FROM member where id=? and password=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPassword());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				mlist.add(new Member(rs.getString("id"), rs.getString("password"), rs.getString("mname"),
						rs.getString("civilNum"), rs.getInt("point"), rs.getDate("jdate"), rs.getString("auth")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mlist;
	}

	// 회원탈퇴
	public void Delete(Member del) {
		String sql = "DELETE FROM Member WHERE id = ? and password = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, del.getId());
			pstmt.setString(2, del.getPassword());
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

	public void RunDelete() {
		LoginDao dao = new LoginDao();
		System.out.println("# 회원탈퇴 #");
		System.out.println("회원정보를 입력해주세요.");
		System.out.print("▶아이디 : ");
		String id = sc.nextLine();
		System.out.print("▶비밀번호 : ");
		String password = sc.nextLine();
		if (id.equals(id) && password.equals(password)) {
			System.out.println("회원탈퇴 되었습니다.");
		} else {
			System.out.println("일치하는 정보가 없습니다.");
		}
		Member del = new Member(id, password);
		dao.Delete(del);
	}

}
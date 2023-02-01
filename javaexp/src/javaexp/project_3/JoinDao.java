package javaexp.project_3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.project_3.vo.Users;

public class JoinDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Scanner sc = new Scanner(System.in);
	Scanner sc1 = new Scanner(System.in);

	// 회원가입
	public boolean JoinUsers(Users ins) {
		String sql = "INSERT INTO Users values(?,?,?,?,?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPass());
			pstmt.setString(3, ins.getEmail());
			pstmt.setString(4, ins.getNickname());
			pstmt.setString(5, ins.getEnterYear());
			pstmt.setString(6, ins.getUniversity());
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

	public void RunJoinUsers() {
		JoinDao dao = new JoinDao();
		System.out.println("# 회원가입 #");
		System.out.println("회원정보를 입력해주세요.");
		System.out.print("▶아이디 : ");
		String id = sc.nextLine();
		System.out.print("▶비밀번호(8자리이상) : ");
		String pass = sc.nextLine();
		System.out.print("▶이메일 : ");
		String email = sc1.nextLine();
		System.out.print("▶닉네임 : ");
		String nickname = sc.nextLine();
		System.out.print("▶입학년도(YYYY) : ");
		String enterYear = sc1.nextLine();
		System.out.print("▶대학교(@@@대) : ");
		String university = sc.nextLine();
		if (pass.length() < 8) {
			System.out.println("가입실패! 비밀번호는 8자리이상 입력하세요.");
		} else {
			Users users = new Users(id, pass, email, nickname, enterYear, university);
			boolean m = dao.JoinUsers(users);
			if (m) {
				System.out.println("회원가입이 정상적으로 이루지지 않았습니다.");
			} else {
				System.out.println("회원가입이 정상적으로 완료되었습니다.");
			}
		}
	}

	// 회원탈퇴
	public int Delete(String id, String pass) {
		int result = 0;
		String sql = "DELETE FROM Users WHERE id = ? and pass = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
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
		return result;
	}

	public void RunDelete() {
		JoinDao dao = new JoinDao();
		String id, pass;
		System.out.print("탈퇴 할 아이디:");
		id = sc.next();
		System.out.print("비밀번호 확인:");
		pass = sc.next();
		int result = dao.Delete(id, pass);
		if (result != 0)
			System.out.println("탈퇴에 실패했습니다.\n영원히 회원으로 남아주세요:)");
		else
			System.out.println("성공적으로 탈퇴하였습니다.\n다음에 다시 가입해주세요!");
	}

}

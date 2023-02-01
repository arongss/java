package javaexp.project_3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javaexp.a13_database.DB;
import javaexp.project_3.vo.Post;
import javaexp.project_3.vo.Users;

public class MypageDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	Scanner sc = new Scanner(System.in);

	// 내정보 조회
	public List<Users> Mypage(Users sch) {
		List<Users> list = new ArrayList<Users>();
		String sql = "SELECT * FROM Users WHERE id = ? and pass = ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			pstmt.setString(2, sch.getPass());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Users(rs.getString("id"), rs.getString("pass"), rs.getString("email"),
						rs.getString("nickname"), rs.getString("enterYear"), rs.getString("university")));
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

	// 내정보 수정
	public void UpdateInform(String id, Users upt) {
		String sql = "UPDATE USERS \r\n" + "SET PASS =?,\r\n" + "	EMAIL =?,\r\n" + "	NICKNAME =?\r\n" + "WHERE id=?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, upt.getPass());
			pstmt.setString(2, upt.getEmail());
			pstmt.setString(3, upt.getNickname());
			pstmt.setString(4, id);
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

	// 게시글 조회
	public List<Post> Postck(Post sch) {
		List<Post> list = new ArrayList<Post>();
		String sql = "SELECT * \r\n" + "FROM POST p \r\n" + "WHERE id=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sch.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new Post(rs.getInt("pno"), rs.getString("pcontents"), rs.getInt("likecnt"), rs.getInt("bno"),
						rs.getString("id")));
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

	// 게시글 삭제
	public int DeletePost(int pno) {
		int result = 0;
		String sql = "DELETE FROM POST WHERE pno = ?";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pno);
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

	public void RunDeletePost() {
		MypageDao dao = new MypageDao();
		int pno;
		System.out.print("삭제할 게시글 번호를 입력해주세요:");
		pno = sc.nextInt();
		int result = dao.DeletePost(pno);
		if (result != 0)
			System.out.println("게시글 삭제에 실패했습니다. 게시글번호를 확인 해 주세요!");
		else
			System.out.println("성공적으로 삭제하였습니다.");
	}

}

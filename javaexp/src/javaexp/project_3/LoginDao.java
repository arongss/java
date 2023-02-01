package javaexp.project_3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javaexp.a13_database.DB;
import javaexp.project_3.vo.Users;

public class LoginDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 로그인
	public List<Users> Login(Users u) {
		List<Users> list = new ArrayList<Users>();
		String sql = "SELECT * FROM users where id=? and pass=?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u.getId());
			pstmt.setString(2, u.getPass());
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

}

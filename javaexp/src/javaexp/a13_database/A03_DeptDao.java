package javaexp.a13_database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javaexp.a13_database.vo.Dept;

public class A03_DeptDao {
	// 공통 필드 선언
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
	// 출력 기능메서드
	public void showDeptAll() {
		// 연결객체
		try {
			con = DB.con();
			// 대화객체
			stmt = con.createStatement();
			// 결과객체
			String sql = "select * from dept";
			rs = stmt.executeQuery(sql);
			// while문처리 - 부서번호 출력 select * from dept
			while(rs.next()) {
				// String s = ""+25; (O) : 문자열로 다 표현하는 건 가능
				// int num = "홍길동"; (X)
				// 데이터 유형은 가능한한 맞게 처리하여야 한다.				
				System.out.print(rs.getInt("deptno")+"\t");
				System.out.print(rs.getString("dname")+"\t");
				System.out.print(rs.getString("loc")+"\n");
			}
			// 자원해제 : 제일마지막에 생성 ==> 가장 최초 생성
			rs.close(); // 중간에 예외가 발생해서 자원해제가 안되는 경우.
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQL 처리에러:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기타 예외 처리:"+e.getMessage());
		} finally { // 예외 여부에 상관없이 처리할 내용
			if(rs!=null) rs = null;
			if(stmt!=null) stmt = null;
			if(con!=null) con = null;
			
		}
		System.out.println("종료!!");
	
	}

//	1. vo만들기
	//	2. 메서드 선언
	 	public void deptSch(String dname, String loc){
	//		3. 연결
	 		try {
	 			con = DB.con();
	//			4. 대화 - sql
	 			String sql = "SELECT * \r\n"
	 					+ "FROM emp01\r\n"
	 					+ "WHERE ename LIKE '%'||'"+dname+"'||'%'\r\n"
	 					+ "AND loc LIKE '%'||'"+loc+"'||'%'";
	 			stmt = con.createStatement();
	//			5. 결과
	 			rs = stmt.executeQuery(sql);
	//			while()
	 			while(rs.next()) {
	 				System.out.println(rs.getInt("deptno")+"\t");
	 				System.out.println(rs.getString("dname")+"\t");
	 				System.out.println(rs.getString("loc")+"\n");
	 			}
	// 			6. 자원해제 및 기타 예외
	 			DB.close(rs, stmt, con);
	 		} catch (SQLException e) {
	 			System.out.println("DB관련 예외:"+e.getMessage());
	 		} catch (Exception e) {
	 			System.out.println("기타 예외:"+e.getMessage());
	 		}
	
		}

//	1. vo만들기
//	2. 메서드 선언
 	public void deptSch(Dept sch){
//		3. 연결
 		try {
 			con = DB.con();
//			4. 대화 - sql
 			String sql = "SELECT * \r\n"
 					+ "FROM emp01\r\n"
 					+ "WHERE ename LIKE '%'||'"+sch.getDname()+"'||'%'\r\n"
 					+ "AND loc LIKE '%'||'"+sch.getLoc()+"'||'%'";
 			stmt = con.createStatement();
//			5. 결과
 			rs = stmt.executeQuery(sql);
//			while()
 			while(rs.next()) {
 				System.out.println(rs.getInt("deptno")+"\t");
 				System.out.println(rs.getString("dname")+"\t");
 				System.out.println(rs.getString("loc")+"\n");
 			}
// 			6. 자원해제 및 기타 예외
 			DB.close(rs, stmt, con);
 		} catch (SQLException e) {
 			System.out.println("DB관련 예외:"+e.getMessage());
 		} catch (Exception e) {
 			System.out.println("기타 예외:"+e.getMessage());
 		} finally {
 			// 6. 자원해제
 			DB.close(rs, stmt, con);
 		}

	}
	public void insertDept(Dept ins) {
		String sql = "insert into dept100 values("+
					ins.getDeptno()+",'"+ins.getDname()
					+"','"+ins.getLoc()+"')";
		System.out.println(sql);
		try {
			con = DB.con();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			int cnt = stmt.executeUpdate(sql);
			System.out.println("등록 건수:"+cnt);
			con.commit();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				System.out.println("rollback에러:"+e1.getMessage());
			}
		}catch(Exception e) {
			System.out.println("기타 에러:"+e.getMessage());
		}finally {
			DB.close(rs, stmt, con);
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 객체 생성
		A03_DeptDao dao = new A03_DeptDao();
		dao.insertDept(new Dept(12,"회계","대전"));
		// 부서정보 호출 기능메서드
//		dao.showDeptAll();
//		dao.deptSch(new Dept("",""));
//		dao.deptSch("SALES","");
		try {
			DB.con();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("접속에러:"+e.getMessage());
		}
	}

}

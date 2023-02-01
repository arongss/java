package javaexp.z01_homework2;

public class A29_1012 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		2022-10-12
[1단계:개념] 1. 데이터베이스의 연결 공통 객체 생성에 필요한 객체들과 정보를 소스를 통해 설명하세요.
1) database 서버 접속 객체
	연결객체(Connection), 대화객체(Statement),
	결과값처리객체(ResultSet), 자원해제(.close()), 
	예외처리(try{}catch(SQLException e){})
2) 전역변수로 위 핵심 객체를 선언
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
3) 기능별 메서드 선언
	public void setCommection(){} - DB연결을 위한 기본 기능메서드
[1단계:개념] 2. select문을 통해서 데이터를 가져와서 출력할려고 한다. 객체들간의 연관관계를 기술하세요.
		드라이버 메모리로딩 ==> 특정서버에 접속 DriverManager ===>
		연결객체 Connection ==> 서버와 대화(sql) Statement 
		선택적 처리 ===> 등록/수정/삭제 ==> 서버에 데이터를 처리 ==> commit, rollback
				 ===> 조회(select) ==> 서버에서 sql결과를 ResultSet 통해 전달
		ResultSet : next() - 행단위로 이동 처리
					getXXXX("컬럼명") - 열단위에 데이터유형에 맞게 접근
					   XXXX
						char/varchar2() ==> String
						number() ===> int/double
						date ==> Date
			while(rs.next()){ ## 데이터가 마지막행까지 행단위로 이동
				rs.getInt("empno") : 각 행의 empno컬럼의 데이터를 정수형으로 가져옴
				rs.getString("ename")
				rs.getDate("hiredate")
			}
		==> 자원해제 및 예외처리
			만들어진 단계별 객체 .close() 메모리 해제
			필수예외에 대한 내용을 try{}catch(SQLException e){} 예외 처리
[1단계:코드] 3. 부서별 최고 급여자를 sql를 만들고 이것을 출력하는 기능메서드를 만들고 출력처리하세요.
String sql = "SELECT *\r\n"
				+ "FROM emp \r\n"
				+ "WHERE (deptno,sal) IN (\r\n"
				+ "	SELECT deptno,max(sal)\r\n"
				+ "	FROM emp \r\n"
				+ "	GROUP BY deptno)";
[1단계:개념] 4. ResultSet 객체의 기능메서드를 기능별로 분류하여 기술하세요.
ResultSet : next() - 행단위로 이동 처리
			getXXXX("컬럼명") - 열단위에 데이터유형에 맞게 접근
[1단계:개념] 5. Dao의 자원해제 순서와 방법을 기술하세요
자원해제 및 예외처리 : 만들어진 단계별 객체 .close() 메모리 해제
				필수예외에 대한 내용을 try{}catch(SQLException e){} 예외 처리
[1단계:순서] 6. 검색조건에 대한 dao 처리를 위하여 처리되는 순서를 기술하세요.
1) sql 만들어 실행
		SELECT * 
		FROM emp01
		WHERE ename LIKE '%'||'A'||'%'
		AND job LIKE '%'||'ER'||'%';
2) sql 안에 조건으로 넘길 데이터 유형과 이름 정리
		ename, job
		==> String ename, String job
3) 기능 메서드에 매개변수 타입 결정
		데이터유형으로 선언 : schEmp(String ename, String job)
		객체로 선언 : - vo 객체를 생성(ename, job 포함)
			schEmp(Emp sch)
4) 문자열 sql에 동적 문자열로 선언처리
		- 데이터유형으로 선언
		String sql = "SELECT * " + 
					 "FROM emp01 " + 
					 "WHERE ename LIKE '%'||'"+ename+"'||'%' " + 
					 "AND job LIKE '%'||'"+job+"'||'%'";
		- 객체유형으로 선언
		String sql = "SELECT * " + 
					 "FROM emp01 " + 
					 "WHERE ename LIKE '%'||'"+sch.getEname()+"'||'%' " + 
					 "AND job LIKE '%'||'"+sch.getJob()+"'||'%'";
[1단계:코드] 7. salgrade테이블을 등급별, 급여별 데이터를 검색할려고 한다. Dao에 추가하여 처리하세요.
String sql = "SELECT * FROM salgrade";
[1단계:코드] 8. select deptno, empno, ename, job, sal 
         from emp01 where sal between @@@ and @@#
      를 처리할려고 한다. VO를 만들고 ArrayList<VO>로 리턴한 결과를 처리하세요.
      
	public List<Emp> getEmpSch(Emp sch){
		List<Emp> list = new ArrayList<Emp>();
		try {
			con = DB.con();
			String sql = "select deptno, empno, ename, job, sal \r\n"
				+ "from emp01 \r\n"
				+ "where sal between "+sch.getFrSal()+" and "+sch.getToSal();
			System.out.println(sql); 
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Emp e = new Emp(
							rs.getInt(1),
							rs.getInt(2),
							rs.getString(3),
							rs.getString(4),
							rs.getDouble(5)
						);
				list.add(e);
			}
			System.out.println("데이터 건수:"+list.size());
			DB.close(rs, stmt, con);
		} catch(SQLException e) {
			System.out.println("DB관련예외:"+e.getMessage());
		} catch(Exception e) {
			System.out.println("기본 예외:"+e.getMessage());
		}
		return list;
	}

== 평가대비(자바) 객관식 문제 ==
1. 자바에서 데이터베이스 연결에 필요한 객체가 아닌 것은?
1) Connection  2) Statement
3) Result      4) Sql 
정답:4
==> 연결에 필요한 객체 : Connection,Statement,Result
2. 데이터베이스 처리시 처리할 예외 ?
1) NullPointerException  2) NumberFormatException
3) SQLException      4) 
정답:3
==> 데이터베이스 처리시 처리할 예외는 SQLException이다.
		 * */
		
	}

}

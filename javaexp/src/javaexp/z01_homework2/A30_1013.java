package javaexp.z01_homework2;

// 해당 패키지 하위 클래스 모두 import
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaexp.a13_database.DB;
import javaexp.a13_database.vo.Emp;

public class A30_1013 {
	
	private Connection con;
	private Statement stmt;
	private ResultSet rs;
/*
2022-10-13
[1단계:개념] 1. sql을 통한 데이터 처리(dao)의 핵심 단계와 핵심 소스를 기술하세요.
1. sql 작성
	1) 매개변수로 조건처리할 데이터 확인
	2) 리턴값으로 리턴 List의 단위 데이터 확인
2. VO만들기 ==> 저장할 수 있는 단위 VO객체 선언 ==> ArrayList<VO>
			생성자로 전체데이터를 가져오는 생성자1
			생성자로 조회조건 가져오는 생성자2
3. List 메서드 초기에 선언하고, while()를 통해서 객체 하나씩 생성해서 추가하기
	리턴한 기능메서드와 매개변수 처리할 내용 선언
4. ResultSet 객체를 통해서 데이터를 가져와서 list에 while문을 통해서 할당.
5. 호출하는 곳에서 향상된 for문으로 처리
[1단계:코드] 2. 다음의 내용을 dao 처리를 하세요
	# 처리 순서
	1. sql
	2. vo
	3. 기능메서드 선언
	4. 내용 처리
			1) 분기별 또는 부서명 조건으로 사원의 이름, 부서명, 급여와 급여등급 출력
			*2) 조건없음. 연도별 사원의 수와 최대급여를 출력하세요.
*/
	public List<Exp02> getExp02List(){
		List<Exp02> list = new ArrayList<Exp02>();
		String sql = "SELECT to_char(hiredate,'YYYY') year,\r\n"
				+ "	count(*) count, max(sal) sal\r\n"
				+ "FROM emp \r\n"
				+ "GROUP BY to_char(hiredate,'YYYY')";
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과/반복문
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				list.add(
					new Exp02(
						rs.getString("year"), rs.getInt("count"),
						rs.getDouble("sal")
					)
				);
			}
			System.out.println("데이터의 건수:"+list.size());
			// 4. 예외/자원해제
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return list;
	}
/*
			*3) 사번을 기준으로 홀/짝인 경우 홀인경우 보너스를 50%, 짝인 경우 보너스를 100% 추가하여 급여를 계산하기로 했다.
			조건(홀/짝/전체)  이름, 사번, 구분, 급여, 보너스(%), 총급여   를 출력하세요
*/
	public List<Exp03> getExp03List(String div){
		if(div!=null) {
			if(div.equals("")||div.equals("전체")) {
				div = "0, 1";
			}
			if(div.equals("짝")) div="0";
			if(div.equals("홀")) div="1";
		}else {
			div = "0, 1";
		}
		List<Exp03> list = new ArrayList<Exp03>();
		String sql = "SELECT e.*, decode(div,0,'짝','홀') div2,\r\n"
				+ "		decode(div,0,'100%','50%') bonus_per, -- 보너스 표시\r\n"
				+ "		round(decode(div,0,1,0.5)*sal) bonus, -- 보너스 금액\r\n"
				+ "		sal + round(decode(div,0,1,0.5)*sal) totpay -- 총 금액\r\n"
				+ "FROM (\r\n"
				+ "SELECT empno, MOD(empno,2) div, \r\n"
				+ "		ename, sal\r\n"
				+ "FROM emp) e\r\n"
				+ "WHERE div IN ("+div+")";
		System.out.println(sql);
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과/반복문
			rs = stmt.executeQuery(sql);
//			System.out.println("rs 객체 생성");
			
			while(rs.next()) {
				//System.out.println(rs.getString(1));
				list.add(
					new Exp03(
						rs.getString("ename"),
						rs.getInt("empno"),
						rs.getString("div2"),
						rs.getDouble("sal"),
						rs.getString("bonus_per"),
						rs.getInt("bonus"),
						rs.getInt("totpay")
					)
				);
			}
			System.out.println("데이터의 건수:"+list.size());
			// 4. 예외/자원해제
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return list;
	}
/*
			*4) 사원정보의 특정 근무일(YYYY/MM/DD)기준(조건)으로 근무연한/개월 수를 표현하세요
*/
	public List<Exp04> getExp04List(String std){
		List<Exp04> list = new ArrayList<Exp04>();
		if(std==null || std.equals("")) std="2022/10/14";
		String sql = "SELECT ename, \r\n"
				+ "	floor(mm/12)||'년 '||floor(MOD(mm, 12))||'개월' workmonth\r\n"
				+ "FROM (\r\n"
				+ "	SELECT ename,\r\n"
				+ "		MONTHS_BETWEEN(to_date('"+std+"','YYYY/MM/DD'),\r\n"
				+ "						hiredate) mm\r\n"
				+ "	FROM emp\r\n"
				+ ")";
		System.out.println(sql);
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과/반복문
			rs = stmt.executeQuery(sql);			
			while(rs.next()) {
				list.add(
					new Exp04(
						rs.getString("ename"),
						rs.getString("workmonth")
					)
				);
			}
			System.out.println("# 기준일:"+std);
			System.out.println("데이터의 건수:"+list.size());
			// 4. 예외/자원해제
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return list;
	}
/*  
			*5) 사원명을 조건으로 해당 사원과 같은 입사일의 분기를 가진 사원전체 정보를 출력하세요.
*/
	public List<Emp> getExp05List(String ename){
		List<Emp> list = new ArrayList<Emp>();
		String sql = "SELECT *\r\n"
				+ "FROM emp \r\n"
				+ "WHERE to_char(hiredate,'Q') = (\r\n"
				+ "	SELECT to_char(hiredate,'Q') \r\n"
				+ "	FROM emp \r\n"
				+ "	WHERE ename = '"+ename+"'\r\n"
				+ ")";
		System.out.println(sql);
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과/반복문
			rs = stmt.executeQuery(sql);			
			while(rs.next()) {
				list.add(
					new Emp(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getDate(5),
						rs.getDouble(6),
						rs.getDouble(7),
						rs.getInt(8)
					)
				);
			}
			System.out.println("데이터의 건수:"+list.size());
			// 4. 예외/자원해제
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return list;
	}
/*
			*6) 관리자명을 기준(조건)으로 관리자 하위에 포함된 직원정보(직원명, 부서번호, 급여) 출력하세요.
*/
	public List<Emp> getExp06List(String ename){
		List<Emp> list = new ArrayList<Emp>();
		String sql = "SELECT ename, deptno, sal \r\n"
				+ "FROM emp \r\n"
				+ "WHERE mgr in (\r\n"
				+ "	SELECT empno \r\n"
				+ "	FROM emp \r\n"
				+ "	WHERE ename = '"+ename+"'\r\n"
				+ ")";
		System.out.println(sql);
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과/반복문
			rs = stmt.executeQuery(sql);			
			while(rs.next()) {
				list.add(
					new Emp(
						rs.getString("ename"),
						rs.getDouble("sal"),
						rs.getInt("deptno")
					)
				);
			}
			System.out.println("데이터의 건수:"+list.size());
			// 4. 예외/자원해제
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return list;
	}
/*
			*7) 조건(월) 에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.
*/
	public List<Emp> getExp07List(String mm){
		List<Emp> list = new ArrayList<Emp>();
		String sql = "SELECT *\r\n"
				+ "FROM emp\r\n"
				+ "WHERE deptno in(\r\n"
				+ "	SELECT deptno \r\n"
				+ "	FROM emp \r\n"
				+ "	WHERE to_char(hiredate,'MM') = '"+mm+"'\r\n"
				+ ")";
		System.out.println(sql);
		// 1. 연결
		try {
			con = DB.con();
			// 2. 대화
			stmt = con.createStatement();
			// 3. 결과/반복문
			rs = stmt.executeQuery(sql);			
			while(rs.next()) {
				list.add(
					new Emp(
							rs.getInt(1),
							rs.getString(2),
							rs.getString(3),
							rs.getInt(4),
							rs.getDate(5),
							rs.getDouble(6),
							rs.getDouble(7),
							rs.getInt(8)
					)
				);
			}
			System.out.println("데이터의 건수:"+list.size());
			// 4. 예외/자원해제
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB에러:"+e.getMessage());
		} catch (Exception e) {
			System.out.println("기타에러:"+e.getMessage());
		} finally {
			DB.close(rs, stmt, con);
		}
		return list;
	}
/*
[1단계:개념] 3. 액터와 유스케이스와의 관계를 기술하세요.
1) 액터
	개발할 시스템 외부에 존재, 이벤트 흐름을 시작하게 하는 객체
2) 유스케이스
	시스템 내부에 해당되는 단위기능, 사용자 관점에서 시스템을 모델링
	actor1		usercase
3) 일반적인 연관 관계 외에 다양한 관계가 존재할 수 있음.
[1단계:개념] 4. 유스케이스의 종류에 대하여 기술하세요.
1) 유스케이스 사이의 포함 관계(include)
	다른 유스케이스에서 기존 유스케이스를 재사용할 수 있음을 나타냄
2) 유스케이스 사이의 확장 관계(extend)
	기존 유스케이스에 진행 단계를 추가하여 새로운 유스케이스를 만들어내는 관계
3) 액터 사이의 일반화 관계
4) 연관 관계
	해당 액터와 정보를 주고받는 유스케이스와 설정함
[1단계:개념] 5. 유스케이스의 확장관계와 포함관계의 차이점을 기술하세요
1. 확장과 포함 관계의 차이(확장 관계)
	1) 기준 유스케이스 이후의 이벤트 흐름은 확장 유스케이스의 수행 결과에 의존한다.
		ex) 결제  (확장관계)  신용카드결제
						  포인트결제
		- 기준 유스케이스인 결제에 기술된 이벤트 흐름이 차례로 수행
		- 확장 부분에서 확장 유스케이스인 신용카드 결제나 포인트 결제로 분기
		- 확장 유스케이스에 기술된 이벤트 흐름의 수행이 완료
		- 다시 기준 유스케이스로 되돌아와서 이후의 이벤트 흐름을 수행
	2) 목적
		기준 유스케이스에 부가적으로 추가된 기능 표현하기위해 사용된다.
	3) 이벤트 흐름
		기준 유스케이스에 기술된 조건에 따라 분기가 선택적으로 수행된다.
		기준 유스케이스 이후에 이벤트 흐름이 확장 유스케이스의 결과에 의존하지 않는다.
2. 확장과 포함 관계의 차이(포함 관계)
	1) 포함 유스케이스의 수행 결과에 따라서 기준 유스케이스의 이벤트 흐름이 영향을 받음
		ex) 동전투입  (포함관계)  금액표시
		- 기준 유스케이스인 동전 투입에 기술된 이벤트 흐름이 차례로 수행
		- 특정 지점에서 포함된 유스케이스(금액 표기)로 바로 분기
		- 금액 표시 유스케이스의 이벤트 흐름이 모두 수행되면 다시 동적 투입
		- 유스케이스의 이벤트 흐름으로 돌아와 이후의 이벤트를 수행
	2) 목적
		여러 유스케이스에 공통적인 기능을 표현하기 위해 사용된다.
	3) 이벤트 흐름
		포함 유스케이스로 분기되는 이벤트 흐름이 필수적이다.
		기준 유스케이스 이후의 이벤트 흐름이 포함 유스케이스의 수행 결과에 의존한다.
[1단계:실습] 6. actor로 회원/비회원/쇼핑몰 관리자, 유즈케이스로 로그인, 회원가입, 회원관리, 물건조회, 구매, 물품등록
               유즈케이스를 작성하세요.
 * */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A30_1013 dao = new A30_1013();

//		for(Exp02 e:dao.getExp02List()) {
//			System.out.print(e.getYear()+"\t");
//			System.out.print(e.getCount()+"\t");
//			System.out.print(e.getSal()+"\n");
//		};
//		for(Exp03 e:dao.getExp03List("")) { // 짝/홀/전체/null
//			System.out.print(e.getEname()+"\t");
//			System.out.print(e.getBonus_per()+"\t");
//			System.out.print(e.getSal()+"\t");
//			System.out.print(e.getTotpay()+"\n");
//		};
//		for(Exp04 e:dao.getExp04List("2001/01/01")) {
//			System.out.print(e.getEname()+"\t");
//			System.out.print(e.getWorkmonth()+"\n");
//		};
//		dao.getExp05List("ALLEN");
//		dao.getExp06List("BLAKE");
		dao.getExp07List("12");
	}

}
class Exp04{
	private String ename;
	private String workmonth;
	public Exp04() {
		// TODO Auto-generated constructor stub
	}
	public Exp04(String ename, String workmonth) {
		super();
		this.ename = ename;
		this.workmonth = workmonth;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getWorkmonth() {
		return workmonth;
	}
	public void setWorkmonth(String workmonth) {
		this.workmonth = workmonth;
	}
	
}
class Exp03{
	private String ename;
	private int empno;
	private String div2;
	private double sal;
	private String bonus_per;
	private int bonus;
	private int totpay;
	public Exp03() {
		// TODO Auto-generated constructor stub
	}
	public Exp03(String ename, int empno, String div2, double sal, String bonus_per, int bonus, int totpay) {
		super();
		this.ename = ename;
		this.empno = empno;
		this.div2 = div2;
		this.sal = sal;
		this.bonus_per = bonus_per;
		this.bonus = bonus;
		this.totpay = totpay;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getDiv2() {
		return div2;
	}
	public void setDiv2(String div2) {
		this.div2 = div2;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	public String getBonus_per() {
		return bonus_per;
	}
	public void setBonus_per(String bonus_per) {
		this.bonus_per = bonus_per;
	}
	public int getBonus() {
		return bonus;
	}
	public void setBonus(int bonus) {
		this.bonus = bonus;
	}
	public int getTotpay() {
		return totpay;
	}
	public void setTotpay(int totpay) {
		this.totpay = totpay;
	}
	
}
class Exp02{
	private String year;
	private int count;
	private double sal;
	public Exp02() {
		// TODO Auto-generated constructor stub
	}
	public Exp02(String year, int count, double sal) {
		super();
		this.year = year;
		this.count = count;
		this.sal = sal;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getSal() {
		return sal;
	}
	public void setSal(double sal) {
		this.sal = sal;
	}
	
}
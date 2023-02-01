SELECT * 
FROM emp;
-- ex1) 부서를 조건으로 부서번호, 사원명, 직책명, 급여을 출력하세요
--		sql ==> vo ==> 기능메서드 선언(A04_DapExp.java)
--	sql 작성완료 손들기.
SELECT deptno, ename, job, sal
FROM emp 
WHERE deptno = 10;
--	vo 작성완료 손들기 select : List<VO>, where : 매개변수
--	type와 이름
/*
private int deptno;
private String ename;
private String job;
private double sal;

ex) 기능 메서드 선언 : 리턴값, 매개변수, 기본 객체 생성
리턴값은 select ==> Vo ==> List<Vo>
매개변수는 where ==> Vo/int 
public List<Emp01> getSch01(Emp01 sch){
	
}
public List<Emp01> getSch01(int deptno){
	List<Emp01> list = new ArrayList<Emp01>();
	
	return list;
}
 * */
-- 사원명(키워드검색), 급여(시작~끝)으로 조건으로 
-- 사원번호, 사원명, 급여를 출력하세요.
SELECT empno, ename, sal 
FROM emp
WHERE ename LIKE '%'||'A'||'%'
AND sal BETWEEN 1000 AND 2000;
/* -- select, where
private int empno;
private String ename;
private double sal;
private int frSal;
private int toSal;

기능메서드
1. 리턴유형
2. 매개변수
private List<Emp02> getSch02(Emp02 sch){
	List<Emp02> list = new ArrayList<Emp02>();
	
	return list;
}

ex) 직책(키워드검색) 또는 부서번호를 조건으로 사원번호, 사원명, 직책명, 부서번호를 검색하세요.
	1) sql 작성
	2) vo 작성
	3) 기능메서드 작성
 * */
SELECT * FROM emp;
SELECT empno, ename, job, deptno
FROM emp 
WHERE job LIKE '%'||'A'||'%'
OR deptno = 10;
/*
select
where
private int empno;
private String ename;
private String job;
private int deptno;

private List<Emp03> getSch03(Emp03 sch){
	List<Emp03> list = new ArrayList<Emp03>();
	return list;
}
 * */
SELECT *
FROM emp;
-- ex) dept와 조건을 통해서 부서명(키워드)와 입사분기별 조건으로 
--		부서명, 사원명, 입사일, 급여를 출력하세요
-- 1) sql
SELECT dname, ename, hiredate, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno 
AND dname LIKE '%'||''||'%'
AND to_char(hiredate,'Q') = '2';
-- 2) vo
/*
private String dname;
private String ename;
private Date hiredate;
private double sal;
private String div; // 분기
 * */
-- 3) 기능메서드
/*
public List<Emp04> getSch04(Emp04 sch){
	List<Emp04> list = new ArrayList<Emp04>();
	return list;
}
 * */
SELECT deptno, ename, job, sal
FROM emp 
WHERE deptno = 10;
/*
ResultSet : 조회 결과의 데이터를 가지고 있다.
1. next() : 행단위로 이동
2. get타입("컬럼명"), get타입(1) 1부터 select의 순서대로
	while(rs.next()){ 데이터가 있을 때까지 이동
		rs.getInt("empno")
		rs.getString("ename")
		rs.getString(3)
		rs.getDouble(4)
	}
3. 위 반복 프로세스에서 리턴으로 선언한 객체에 단위 데이터를 입력(생성자)하고
		Emp e = new Emp(rs.getInt("empno"), rs.getString("ename"),
				rs.getString(3), rs.getDouble(4))
4. List<Emp>에 하나씩 반복문을 통해서 담기.
		list.add(e);
		
 * */
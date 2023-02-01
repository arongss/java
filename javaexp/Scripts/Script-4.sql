--1) 분기별 또는 부서명 조건으로 사원의 이름, 부서명, 급여와 급여등급 출력
SELECT ename, dname, sal, grade
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno 
AND sal BETWEEN losal AND hisal
AND to_char(hiredate,'Q') = '1'
AND dname LIKE '%'||''||'%';
--2) 조건없음. 연도별 사원의 수와 최대급여를 출력하세요.
SELECT to_char(hiredate,'YYYY') year,
	count(*) count, max(sal) sal
FROM emp 
GROUP BY to_char(hiredate,'YYYY');
/* VO
class Exp02{
pirvate String year;
private int count;
private double sal;
}
 * */
--3) 사번을 기준으로 홀/짝인 경우 홀인경우 보너스를 50%, 짝인 경우 보너스를 100% 추가하여 급여를 계산하기로 했다.
--	조건(홀/짝/전체)  이름, 사번, 구분, 급여, 보너스(%), 총급여   를 출력하세요
SELECT e.*, decode(div,0,'짝','홀') div,
		decode(div,0,'100%','50%') bonus_per, -- 보너스 표시
		decode(div,0,1,0.5)*sal bonus, -- 보너스 금액
		sal + decode(div,0,1,0.5)*sal totpay -- 총 금액
FROM (
SELECT empno, MOD(empno,2) div, 
		ename, sal
FROM emp) e;
SELECT e.*, decode(div,0,'짝','홀') div2,
		decode(div,0,'100%','50%') bonus_per, -- 보너스 표시
		round(decode(div,0,1,0.5)*sal) bonus, -- 보너스 금액
		sal + round(decode(div,0,1,0.5)*sal) totpay -- 총 금액
FROM (
SELECT empno, MOD(empno,2) div, 
		ename, sal
FROM emp) e
WHERE div IN (0,1);
-- 프로그램상에 0:짝, 1:홀, 0,1:전체
/* VO
	매개변수 : String div
class Exp03{
	private String ename;
	private int empno;
	private String div2;
	private double sal;
	private String bonus_per;
	private int bonus;
	private int totpay;
}
public List<Exp03> getExp03List(String div){
	List<Exp03> list = new ArrayList<Exp03>();
	
	return list;
}
 * */
--4) 사원정보의 특정 근무일(YYYY/MM/DD)기준(조건)으로 근무연한/개월 수를 표현하세요   
SELECT ename, 
	floor(mm/12)||'년 '||floor(MOD(mm, 12))||'개월' workmonth
FROM (
	SELECT ename,
		MONTHS_BETWEEN(to_date('2001/01/01','YYYY/MM/DD'),
						hiredate) mm
	FROM emp
) ; 
/* VO
class Exp04{
	private String ename;
	private String workmonth;
}
public List<Exp04> getExp04List(String std){}
 * */
--5) 사원명을 조건으로 해당 사원과 같은 입사일의 분기를 가진 사원전체 정보를 출력하세요.
SELECT *
FROM emp 
WHERE to_char(hiredate,'Q') = (
	SELECT to_char(hiredate,'Q') 
	FROM emp 
	WHERE ename = 'ALLEN'
);
/* VO --Emp
public List<Emp> getExp05List(String ename){}
 * */
--6) 관리자명을 기준(조건)으로 관리자 하위에 포함된 직원정보(직원명, 부서번호, 급여) 출력하세요.
SELECT ename, deptno, sal 
FROM emp 
WHERE mgr in (
	SELECT empno 
	FROM emp 
	WHERE ename = 'BLAKE'
);
/* VO --Emp ==> 생성자 추가.
public List<Emp> getExp06List(String ename){}
 * */
--7) 조건(월) 에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.
SELECT *
FROM emp
WHERE deptno in(
	SELECT deptno 
	FROM emp 
	WHERE to_char(hiredate,'MM') = '02'
);
/*VO --Emp
public List<Emp> getExp07List(String mm){}
 */
		create table emp100
		as select * from emp;
		alter table emp100
		modify (
			job varchar2(50),
			ename varchar2(50),
			empno number(1000) primary key
		);
	
		create sequence emp100_seq
			start with 1000
			minvalue 1000
			maxvalue 9999;

		insert into emp100 values(emp100_seq.nextval,'홍길동',
			'사원',7800,to_date('2022/01/01','YYYY/MM/DD'), 
			3500, 100, 10);
SELECT * FROM emp100;

CREATE TABLE emp100
AS SELECT * from emp;
ALTER TABLE emp100
MODIFY (
	dname varchar2(50),
	loc varchar2(50)
);
CREATE TABLE dept100
AS SELECT * FROM dept;
insert into dept100 values(11,'인사','서울');
SELECT * FROM dept100;
-- A03_DeptDao.java 에 추가 기능 메서드 처리.
-- 1. sql : insert into dept100 values(11,'인사','서울')
-- 2. vo
-- 3. public void insertDept(Dept ins){
--	}

CREATE TABLE person(
	name varchar2(50),
	age NUMBER,
	loc varchar2(50)
);
SELECT * FROM person;
INSERT INTO person VALUES('홍길동',25,'서울 신림');
/*
 A04_DaoExp.java
 1. VO
 2. 메서드 정의
 3. main() 추가 처리
 4. DB로 확인
 
 class Person{
 	private String name;
 	private int age;
 	private String loc;
 }
 public void insertPerson(Person ins)
 * */
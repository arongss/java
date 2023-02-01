--2
CREATE TABLE salgrade1000 
AS SELECT * FROM salgrade;
SELECT * FROM salgrade1000;
INSERT INTO salgrade1000 VALUES(0,1,699);
/* VO
 class Salgrade1000{
 	private int grade;
 	private int losal;
 	private int hisal;
 }
 public void insertSalgrade1000(Salgrade1000 ins)
 * */
--3
CREATE TABLE EmpDept100
AS SELECT e.*, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;
SELECT * FROM EmpDept100;
ALTER TABLE EMPDEPT100 
MODIFY (
	ename varchar2(50),
	job varchar2(50),
	dname varchar2(50),
	loc varchar2(50)
);
ALTER TABLE empdept100
DROP COLUMN deptno;
CREATE SEQUENCE empdept100_seq
	START WITH 1000
	MINVALUE 1000
	MAXVALUE 9999;
INSERT INTO EmpDept100 VALUES(empdept100_seq.nextval,'홍길동',
'사원',7566,to_date('20200101','YYYYMMDD',3500,100,'인사','서울강남');
/* VO empdept100
class EmpDept100{
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private Date hiredate;
	private String hiredateS;
	private double sal;
	private double comm;
	private String dname;
	private String loc;
}
public void insertEmpDept100(EmpDept100 ins)
 * */
--4 member100(아이디, 패스워드, 이름, 권한, 포인트, 등록일) 만들고
DROP TABLE member100;
CREATE TABLE member100(
	id varchar2(50) PRIMARY KEY,
	pass varchar2(20),
	name varchar2(50),
	auth varchar2(20),
	point NUMBER,
	regdte date
);
DELETE FROM member100 WHERE id='himan';
SELECT * FROM member100;
INSERT INTO member100 VALUES('himan','7777','홍길동','관리자',1000,sysdate);
SELECT * FROM member100;
SELECT * FROM member100 
WHERE id LIKE '%'||''||'%'
OR name LIKE '%'||''||'%';
/* VO
class Member100{
	private String id;
	private String pass;
	private String name;
	private String auth;
	private int point;
	private Date regdte;
}
public List<Member100> getMember100List(String ename)
 * */

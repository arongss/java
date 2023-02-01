SELECT * FROM emp100;
SELECT * FROM EMP100 e WHERE empno=7369;
SELECT * FROM EMP100 e WHERE ename='SMITH';
-- 최대 급여인 사원의 정보
SELECT * FROM EMP100
WHERE sal = (SELECT max(SAL) FROM EMP100);
--		*2) 부서번호가 10인 부서정보 (Dept alias 등록 필요 - dept - 공통 mybatis에)
-- 1. sql
SELECT * 
FROM dept100
WHERE deptno =10;
/*
   2. vo Dept
   3. dao
   public Dept getDeptByDeptno();
   4. XXXMapper.xml
   	  사용할 vo등록
   	  Dept
   4. XXXMapper.xml
    <select id="getDeptByDeptno" resultType="dept">
    	SELECT * 
		FROM dept100
		WHERE deptno =10
    </select>
 */
--      *4) 최초 입사자의 사원 정보 
SELECT * FROM EMP100
WHERE HIREDATE = (
	SELECT min(hiredate)
	FROM emp100);
/*
2. vo
3. dao : public Emp getInitHire();
4. mapper : 
	<select id="getInitHire" resultType="emp">
		SELECT * FROM EMP100
		WHERE HIREDATE = (
			SELECT min(hiredate)
			FROM emp100)
	</select>
5. main()
	Emp initEmp = dao.getInitHire();
	System.out.print("#최초입사자#");
	System.out.print("사원번호:"+initEmp.getEmpno());
	System.out.print("사원명:"+initEmp.getEname());
	
 */
--      *5) 2/4분기 최고 급여자의 정보
SELECT * 
FROM EMP100
WHERE sal = (SELECT max(sal)
	FROM emp100
	where to_char(hiredate,'Q')='2');
SELECT e.*, dname, loc 
FROM emp e, dept d
WHERE e.deptno = d.deptno;
-- 1000~3000사이의 사원(emp100)을 
--		등급정보(salgrade)와 함께 출력하세요.
SELECT e.*, grade
FROM EMP100 e , SALGRADE s
where e.sal between s.losal and s.hisal
AND sal BETWEEN 1000 AND 3000;
SELECT empno NO, ename name, 
		sal+nvl(comm,0) tot
FROM EMP100;
-- no,    name,  tot : column
-- empno, ename, sal : Emp안에 property에 할당
-- 1. result mapper에서 선언 id값을 가져오기.

-- 0125과제
SELECT * FROM SALGRADE;
DELETE 
FROM SALGRADE s 
WHERE LOSAL =0;
/*
private int grade;
private double losal;
private double hisal;
*/
select e.*, dname, loc
from emp e, dept d
where e.deptno = d.deptno;
SELECT e.*, grade
FROM EMP100 e , SALGRADE s 
WHERE e.sal between s.losal and s.hisal;
SELECT * FROM EMP100 e ;
SELECT emp100_seq.nextval FROM dual;
-- product, member, buyinfo
SELECT * FROM product111;
SELECT * FROM member111;
SELECT * FROM buyinfo111;
CREATE TABLE product111(
	pid varchar2(100) PRIMARY KEY,
	name varchar2(100),
	price NUMBER,
	rcnt number
);
INSERT INTO product111 values('1000','사과',2000,100);
INSERT INTO product111 values('1001','바나나',4000,200);
INSERT INTO member111 values('himan','7777','홍길동','관리자');
INSERT INTO member111 values('higirl','8888','홍현아','관리자');
INSERT INTO buyinfo111 values('1000','himan',5,sysdate);
CREATE TABLE member111(
	mid varchar2(100) PRIMARY KEY,
	pass varchar2(100),
	name varchar2(100),
	auth varchar2(100)
);
CREATE TABLE buyinfo111(
	pid varchar2(100),
	mid varchar2(100),
	bcnt NUMBER,
	buydate date
);

SELECT p.*, m.*
FROM product111 p, member111 m, buyinfo111 b
WHERE p.pid = b.pid and m.mid=b.mid;

SELECT p.name pname, price, m.mid, m.name, pass, auth, b.bcnt
FROM product111 p, member111 m, buyinfo111 b
WHERE p.pid = b.pid and m.mid=b.mid;


SELECT DISTINCT e.mgr, m.ename 
FROM emp100 e, emp100 m
WHERE e.mgr = m.empno;

SELECT DISTINCT job
FROM emp100;

select e.empno, e.ename, d.dname, m.ename mename, e.job
from emp100 e, emp100 m, dept d
where e.mgr = m.empno
and e.deptno =d.deptno;

SELECT * FROM MEMBER200;
CREATE TABLE member200(
	id varchar2(100) PRIMARY KEY,
	pass varchar2(100),
	name varchar2(100),
	auth varchar2(100),
	point NUMBER
);
INSERT INTO member200 values('himan','7777','홍길동','admin',1000);
INSERT INTO member200 values('higirl','8888','홍현아','admin',2000);
INSERT INTO member200 values('goodMan','5555','오길동','normal',1000);
INSERT INTO member200 values('badGirl','3333','신영희','quest',100);
INSERT INTO member200 values('helloMan','8888','오영심','quest',3000);

select * from member200
	where id like '%'||''||'%'
	and name like '%'||''||'%'
	AND auth = 'admin';
	--<if test="auth!=''">
	--and auth = #{auth}
	--</if>
	select * from member200;
	where id = 'himan';
	update member200
		set name='홍길동',
			pass='9999',
			point='3000',
			auth='admin'
		where id = 'himan';
	delete member200
	where id = #{id};

SELECT DISTINCT auth
FROM member200;
-- 2022-10-07
/*
# 다음 내용을 모두 포함하는 데이터베이스를 설계하세요.
(설계-erd + 테이블 생성-제약사항포함 + 데이터 입력)
1. 회사는 네 개의 부서를 운영한다. 부서는(부서번호, 부서이름)을 저장한다.
2. 부서는 1명 이상의 직원(직원번호, 직원이름, 직책)을 두고 있다. 각 직원은 하나의 
	부서에 소속된다.
3. 직원은 부양가족(이름, 나이)이 있을 수 있다.
4. 각 직원은 근무했던 부서에 대한 근무 기록(기간, 직책)이 있다.
~ 월 18:00
 * */
/*
객체 관계 모델링 실습
1. 회사는 네 개의 부서를 운영한다. 
	부서는(부서번호, 부서이름)
	depart(deptno, dname)
2. 부서는 1명 이상의 직원(직원번호, 직원이름, 직책)을 두고 있다. 각 직원은 하나의 부서에 소속된다.
	employee(empno, ename, job, deptno) - deptno는 foreign key depart(deptno) 비식별자 처리
3. 직원은 부양가족(이름, 나이)이 있을 수 있다.
	=> 부양가족(부양가족번호, 이름, 나이, 사원번호)
	empfamily(efno, name, age, empno) - empno는 froeign key employee(empno) 비식별자 처리
4. 각 직원은 근무했던 부서에 대한 근무 기록(기간, 직책)이 있다.
	직책은 사원정보를 통해서 가져올 수 있기 때문에 설정하지 않는다. 기간(startDte, endDte)
	==> 근무기록(근무기록번호, 사원번호, 부서번호, 시작일, 마지막일)
	=> hisemploy(hisno, empno, deptno, startDte, endDte) - empno, deptno 비식별자 처리
		ex) 1000(홍길동), 10(인사), 2022/01/01, 2022/01/31)
			1000(홍길동), 20(총무), 2022/02/01, 2022/02/28)
			1000(홍길동), 10(인사), 2022/03/01, 2022/03/31)
 * */
-- 정답
CREATE TABLE depart(
	deptno number(4) PRIMARY KEY,
	dname varchar2(50) 
);
INSERT INTO depart VALUES(1000,'회계');
INSERT INTO depart VALUES(1001,'인사');
INSERT INTO depart VALUES(1002,'재무');
SELECT * FROM depart;

CREATE TABLE employee(
	empno number(4) PRIMARY KEY,
	ename varchar2(50),
	job varchar2(50)
);
INSERT INTO employee values(7000,'홍길동','대리');
INSERT INTO employee values(7001,'김길동','사원');
INSERT INTO employee values(7002,'신길동','과장');
INSERT INTO employee values(7003,'마혜영','사원');
SELECT * FROM employee;

CREATE TABLE hisemploy(
	hisno NUMBER PRIMARY KEY,
	startdte DATE,
	enddte DATE,
	deptno number(4) REFERENCES depart(deptno),
	empno number(4) REFERENCES employee(empno)
);
-- 2022/01/01, 2022/01/31, 1001(인사), 7000(홍길동)
-- 2022/02/01, 2022/02/28, 1002(총무), 7000(홍길동)
-- 2022/03/01, 2022/03/31, 1002(총무), 7000(홍길동)
INSERT INTO hisemploy values(1, to_date('2022/01/01','YYYY/MM/DD'),
						to_date('2022/01/31','YYYY/MM/DD'), 1001, 7000);
INSERT INTO hisemploy values(2, to_date('2022/02/01','YYYY/MM/DD'),
						to_date('2022/02/28','YYYY/MM/DD'), 1002, 7000);
INSERT INTO hisemploy values(3, to_date('2022/03/01','YYYY/MM/DD'),
						to_date('2022/03/31','YYYY/MM/DD'), 1001, 7000);
SELECT * FROM hisemploy;

CREATE TABLE empfamily(
	efno NUMBER PRIMARY KEY,
	name varchar2(50),
	age NUMBER,
	empno number(4) REFERENCES employee(empno)
);
-- 1 이연아 28, 7000
-- 2 홍마리 5, 7000
-- 3 홍철수 2, 7000
INSERT INTO empfamily values(1,'이연아',28,7000);
INSERT INTO empfamily values(2,'홍마리',5,7000);
INSERT INTO empfamily values(3,'홍철수',2,7000);
SELECT * FROM employee;
SELECT * FROM depart;
SELECT * FROM hisemploy;
SELECT * FROM empfamily;
SELECT *
FROM employee e, hisemploy h, depart d
WHERE e.empno = h.empno
AND h.deptno = d.deptno;
SELECT *
FROM employee e, empfamily f
WHERE e.empno = f.empno;





-- 내가쓴거
CREATE TABLE dept1(
	deptno NUMBER PRIMARY KEY,
	dname varchar2(30)
);
INSERT INTO dept1 values(1,'인사');
INSERT INTO dept1 values(2,'회계');
INSERT INTO dept1 values(3,'연구');
INSERT INTO dept1 values(4,'사무');
SELECT * FROM dept1;

CREATE TABLE emp1(
	empno NUMBER PRIMARY KEY,
	ename varchar2(50),
	job varchar2(50)
);
INSERT INTO emp1 values(11,'홍길동','인사');
INSERT INTO emp1 values(12,'김길동','회계');
INSERT INTO emp1 values(13,'마길동','연구');
SELECT * FROM emp1;

CREATE TABLE family1(
	fname varchar2(50),
	age NUMBER 
);
INSERT INTO family1 values('홍길순',28);
INSERT INTO family1 values('마길순',20);
SELECT * FROM family1;

CREATE TABLE record1(
	workdate DATE,
	job varchar2(50) CONSTRAINT record1_job_fk REFERENCES emp1(job)
);
INSERT INTO record1 values(to_date('2019-10-31','YYYY-MM-DD'),'연구');
INSERT INTO record1 values(to_date('2010-12-05','YYYY-MM-DD'),'인사');
SELECT * FROM record1;
--2022-10-04
--[1단계:개념] 1. EQUI join과 NON EQUI join의 차이점을 기술하세요
--- EQUI join : 조인 대상 테이블에서 공통 컬럼을 '=' equal 비교를 통해 같은 값을 가지는 행을 연결하여 결과를 생성하는 조인 방법
--- NON EQUI join : 조인하는 두개의 테이블의 값이 동일하지 않고, 범위로서 조인하는 경우를 말한다.
--[1단계:코드] 2. 직책이 SALESMAN의 급여와 등급을 출력하요
SELECT job, sal, grade
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal
AND job = 'SALESMAN';
--[2단계:코드] 3. 1사분기에 입사한 사원중, 부서명이 ACCOUNTING인 사원의 이름, 급여와 급여등급 출력하세요.
SELECT ename, sal, grade
FROM emp e, dept d, salgrade s
WHERE e.deptno(+) = d.deptno
AND sal BETWEEN losal AND hisal
AND dname = 'ACCOUNTING'
AND to_char(hiredate,'Q') ='1';
--[1단계:개념] 4. outer join의 기본 형식과 equi join과의 차이점을 기술하세요.
--- equi join : 조인 대상 테이블에서 공통 컬럼을 '=' equal 비교를 통해 같은 값을 가지는 행을 연결하여 결과를 생성하는 조인 방법
--- outer join : equi join의 조인 조건에서 양 테이블의 컬럼 값 중, 어느 하나라도 null이면
--		'=' 비교 결과가 거짓이 되어 null값을 가진 행은 조인 결과로 출력 불가
--		null에 대하여 어떠한 연산을 적용하더라도 연산 결과는 null로 처리된다.
--	기본 형식
--		select 테이블1.컬럼1, 테이블1.공통컬럼, 테이블2.공통컬럼, 테이블2.컬럼1
--		from 테이블1, 테이블2
--		where 테이블1.공통컬럼(+) = 테이블2.공통컬럼
--[2단계:코드] 5. 부서별 최고급여액을 출력하되 사원정보가 없는 부서는 0으로 표현하여 출력하세요.
SELECT dname, max(nvl(sal,0))
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno 
GROUP BY dname;
--[1단계:코드] 6. 관리자하위에 포함된 사원을 기준으로 관리자의 하위 직원의 수를 관리자명, 사원수로 출력하세요.
SELECT m.ename, count(m.ename) 사원수
FROM emp e, emp m
WHERE e.mgr = m.empno
GROUP BY m.ename;
--[1단계:개념] 7. subquery란 무엇인가? 여러가지 유형과 함께 기술하세요. 
--subquery : 하나의 sql 명령문의 결과를 다른 sql명령문에 전달하기 위해 두 개 이상의
--		sql명령문을 하나의 sql명령문으로 연결하여 처리하는 방법
--[1단계:코드] 8. JAMES와 같은 입사일의 분기를 가진 사원을 출력하세요.
SELECT *
FROM emp 
WHERE to_char(hiredate,'Q') = (
	SELECT to_char(hiredate,'Q')
	FROM emp 
	WHERE ename = 'JAMES'
);
--[1단계:코드] 9. ALLEN과 같은 관리자를 둔 사원을 출력하세요.
SELECT * FROM emp;
SELECT *
FROM emp 
WHERE mgr =(
	SELECT mgr
	FROM emp 
	WHERE ename = 'ALLEN'
);
--[1단계:코드] 10. 보너스가 가장 많은 사원정보(사원명, 부서명, 보너스)를 출력하세요.
SELECT ename, dname, comm 
FROM emp e, dept d
WHERE e.deptno(+) = d.deptno
AND comm =(
	SELECT max(COMM)
	FROM emp
);
--[1단계:코드] 11. 12월에 입사한 사원과 동일한 부서번호를 가진 사원을 출력하세요.
SELECT *
FROM emp 
WHERE deptno in(
	SELECT deptno
	FROM emp 
	WHERE to_char(hiredate,'MM') = '12'
);
--[1단계:개념] 12. 다중행/다중열의 SUBQUERY의 종류와 차이점을 예제를 통해 기술하세요. 
--단일행 : select *
--		from emp
--		where sal <= (
--			select max(sal)
--			from emp
--			where deptno = 10);
--다중행 : select *
--		from emp
--		where job in(
--			select job
--			from emp
--			where sal between 1000 and 2000);
--다중열 : select *
--		from
--		where (조건1컬럼,조건2컬럼) in( 다중열/다중행 sub query )
--
--== 평가대비(오라클) 객관식 문제 ==
--1. 다중행 서버쿼리로 사용되는 구문이 아닌 것은 ?
--1) in 2) any 3) some 4) between
--==> 다중행 비교연산자 : in, any, some, all, exists 등을 활용할 수 있다.
--정답:4
--
--2. 사람의 머리로 이해할 수 있는 현실 세계를 모델링은 하는 것은 어느 분류에 해당하는가?
--1) 단계적 - 개념적 모델링
--2) 단계적 - 논리적 모델링
--3) 도구적 - 개념적 모델링  
--4) 도구적 - 논리적 모델링
--==> 도구적 입장에서 데이터 모델링
--	1) 데이터 모델링의 결과물을 표현하는 도구
--	2) 개념적 데이터 모델
--		- 사람의 머리로 이해할 수 있는 현실 세계를 개념적 모델링하여 데이터베이스의 개념적 구조로 표현하는 도구
--	3) 논리적 데이터 모델
--		- 개념적 구조를 논리적 모델링하여 데이터베이스의 논리적 구조로 표현하는 도구
--	단꼐적 데이터 모델링
--	1) 개념적 데이터 모델링(Conceptual modeling)
--		- 현실 세계의 중요 데이터를 추출하여 개념 세계로 옮기는 작업
--	2) 논리적 데이터 모델링(Logical modeling)
--		- 개념 세계의 데이터를 데이터베이스에 저장하는 구조로 표현하는 작업
--정답:3
--
--3. 개념적 데이터 모델의 도형으로 틀린 것은?
--1) 엔티티 - 원
--2) 관계 - 마름모
--3) 속성 - 타원
--4) 개체 - 사각형
--==> 개체 - 사각형, 관계 - 마름모, 속성 - 타원
--정답:1
--
--4. subquery로 사용하는 비교연산자가 아닌 것은?
--1) both
--2) any
--3) some
--4) exists
--==> 다중행 비교연산자 : in, any, some, all, exists 등을 활용할 수 있다.
--정답:1
/*
정답
[2단계:코드] 3. 1사분기에 입사한 사원중, 부서명이 ACCOUNTING인 사원의 이름, 급여와 급여등급 출력하세요.
	1) 1사분기에 입사한 사원
	2) 조건1 부서명이 ACCOUNTING : 부서테이블 조인
	3) 급여와 급여등급 출력하세요. : salgrade테이블 조인
	4) 조인 : 사원, 부서, 등급,  조건 : 1사분기에 입사, 부서명이 ACCOUNTING
		출력내용(select) : ename, sal, grade
SELECT ename, sal, grade -- , to_char(hiredate, 'Q') 분기, dname
FROM emp e, dept d, salgrade s
WHERE e.deptno = d.deptno -- 각 테이블의 기본 조인조건을 선언
AND sal BETWEEN losal AND hisal
AND to_char(hiredate, 'Q') = '1'
AND dname = 'ACCOUNTING';
[1단계:코드] 6. 관리자하위에 포함된 사원을 기준으로 관리자의 하위 직원의 수를 관리자명, 사원수로 출력하세요.
	1) 관리자하위에 포함된 사원을 기준(mgr, empno의 self join 테이블 처리)
	2) 관리자 정보 m, 기본사원 정보를 e로 처리
	3) 관리자명(곤리자 정보의 사원명), 사원수(기본사원정보의 count 수)
SELECT m.ename, count(e.empno) 사원수
FROM emp e, emp m
WHERE e.mgr = m.empno
GROUP BY m.ename;
SELECT * FROM emp;
[1단계:코드] 8. JAMES와 같은 입사일의 분기를 가진 사원을 출력하세요.
	1) JAMES와 같은 입사일의 분기 ==> JAMES의 입사 분기(subquery)
	2) 위 분기와 동일한 사원 where to_char(hiredate,'Q') = (서브쿼리);
SELECT to_char(hiredate,'Q') 분기, e.*
FROM emp e
WHERE to_char(hiredate,'Q') = (
	SELECT to_char(hiredate,'Q')
	FROM emp 
	WHERE ename = 'JAMES'
);
[1단계:코드] 10. 보너스가 가장 많은 사원정보(사원명, 부서명, 보너스)를 출력하세요.
	1) 보너스가 가장 많은 사원 : 최고보너스(subquery) ==> main query
	2) 사원명, 부서명, 보너스 : 부서정보와 조인
-- 최고 보너스
SELECT max(comm)
FROM emp;
-- 최고 보너스를 가진 사원
SELECT *
FROM EMP 
WHERE comm =(
	SELECT max(comm)
	FROM emp
);
-- 부서명을 위한 부서테이블과 조인 및 출력할 컬럼 지정.
SELECT ename, dname, comm
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND comm = (
	SELECT max(comm)
	FROM emp
);
 * */
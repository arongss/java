--2022-10-11
--[1단계:코드] *1. 직책별 최저급여의 사원정보(사원명, 직책명, 급여)를 inline view를 통해서 출력하세요. 
SELECT job, min(sal)
FROM emp 
GROUP BY job;
SELECT ename, job, sal
FROM emp 
WHERE (job, sal) IN (
	SELECT job, min(sal)
	FROM emp
	GROUP BY job
);
--[1단계:개념] *2. 수정의 기본형식과 SUBQUERY(단일열/다중열) 형식을 예제를 통하여 기술하세요.
--데이터 수정 : update 명령문은 테이블에 저장된 데이터 수정을 위한 조작어이다.
--update 테이블명
--set 컬럼1 = 변경할데이터,
--	컬럼2 = 변경할데이터
--	...
--where 조건문
--단일열 - 한개의 컬럼 set 컬럼명 = (결과가 1개인 컬럼)
--다중열 - 두개이상의 컬럼 set (컬럼명,....) = (결과가 2개 이상 컬럼 query)
--[1단계:코드] 3. EMP10의 3/4분기 최고급여를 7521 사원의 급여로 수정하세요.
SELECT max(sal) 
FROM emp10 
WHERE to_char(hiredate,'Q') = '3';
UPDATE emp10 
	SET sal = (
		SELECT max(sal) 
		FROM emp10 
		WHERE to_char(hiredate,'Q') = '3'
	)
	WHERE empno = 7521;
SELECT * FROM emp10;
--[1단계:코드] 4. emp10 부서별 최저 급여자를 삭제 처리하세요.
SELECT deptno, min(sal)
FROM emp10 
GROUP BY deptno;
DELETE
FROM emp10 
WHERE (deptno, sal) IN (
	SELECT deptno, min(sal)
	FROM emp10 
	GROUP BY deptno
);
SELECT * FROM emp10;
--[1단계:개념] *5. DB 서버 접속을 위한 프로젝트(자바프로그램단위) 설정할 내용에 대하여 기술하세요.
--서버에 접속계정이 만들어지면, DB서버에 client은 jdbc드라이버 설정, 아이디, 패스워드, 서버 주소, port, DB명, 계정, 비번으로 접속을 할 수 있다.
--[1단계:개념] *6. jdbc는 어떤 역할을 하는지 기술하세요. 
--자바프로그램이 데이터베이스와 연결되어 데이터를 주고 받을 수 있게 해주는 프로그래밍 인터페이스
--응용프로그램과 DBMS간의 통신을 중간에서 번역해주는 역할
--[1단계:개념] 7. 자바의 DB처리 순서를 코드와 함께 기술하세요.
--Class.forName("") : jdbc 드라이버를 메모리에 로딩
--DriverManager : getConnection("접속정보","계정","비번") static 메서드로 연결을
--		driver ==> 특정한 연결와 mapping
--		Connection 객체를 만들어 준다.
--[1단계:개념] 8. DB 접속시, 필요한 예외 처리의 내용 처리방법을 기술하세요.
--1) Class.forName() : 컴파일예외 처리.
--2) DriverManager.getConnection(info, "scott", "tiger");
--	연결정보 SQLEception : 컴파일예외 처리, throws로 예외를 위임 처리.
--[1단계:실습] *9. javaexp2프로젝트를 만들어, javaexp2.a01_database 패키지와 A01_Dao.java를 만들어 연결처리하세요. 
--                처리한 내용캡쳐하시고, java 소스 코드를 text를 붙여주세요.


-- 정답
-- [1단계:코드] 1. 직책별 최저급여의 사원정보(사원명, 직책명, 급여)를 inline view(sql을 통해 만든 가상테이블)를 통해서 출력하세요. 
-- 직책별 최저급여
SELECT job, min(sal) msal
from emp10
GROUP BY job;
SELECT *
FROM emp e, ( SELECT job, min(sal) msal
			  from emp10
			  GROUP BY job
	) me 
WHERE e.job = me.job
AND e.sal = me.msal;
-- inline view : 테이블선언대신에 sql을 통해서 가상의 테이블을
-- 만들어서 기존 테이블 또는 다른 inline view를 만들어서 조인을 하여
-- 데이터를 처리하는 목적으로 사용된다.  
-- [1단계:개념] 2. 수정의 기본형식과 SUBQUERY(단일열/다중열) 형식을 예제를 통하여 기술하세요.
-- [1단계:개념] 5. DB 서버 접속을 위한 프로젝트(자바프로그램단위) 설정할 내용에 대하여 기술하세요.
-- 1) jdbc드라이버 다운로드
-- 2) 메모리 로딩을 위한 build path설정 : classpath
-- [1단계:개념] 6. jdbc는 어떤 역할을 하는지 기술하세요. 
-- 각 밴드(소프트웨어 회사)에서 DB서버를 위해 만들어진 
-- 공통 프로그램을 컴파일된 class만 패키지별로 압축해서 지원하는 프로그램을 
-- 말한다. java database connection
-- DB 연결시 프로그래밍이나 툴에서 사용한다.
-- @@.jar은 jre 환경이 설정된 곳에서 여러 프로그램을 실행할 수 있다.
-- 윈도우 프로그램의 vc++의 exe, bat 파일과 유사하다.
-- [1단계:실습] 9. javaexp2프로젝트를 만들어, javaexp2.a01_database 패키지와 A01_Dao.java를 만들어 연결처리하세요. 
--                처리한 내용캡쳐하시고, java 소스 코드를 text를 붙여주세요.

 * */
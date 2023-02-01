--2022-10-06
--[1단계:개념] 1. 테이블의 구조 변경형식(추가, 삭제, 수정)을 기본예제를 통해 기술하세요.
--컬럼의 추가 : alter table 테이블명 add 컬럼명 데이터유형 [default 디폴트데이터, 제약 조건];
--컬럼의 삭제 : alter table 테이블명 drop column 컬럼명;
--컬럼의 수정 : alter table 테이블명 modify 컬럼명 변경할데이터유형;
--[1단계:코드] 2. 부서테이블을 dept12 복사테이블을 만들고, 부서관리자명, 부서생성일을 추가하세요.
DROP TABLE dept12;
CREATE TABLE dept12
AS SELECT * FROM dept;
SELECT * FROM dept12;
ALTER TABLE dept12
ADD (dmgrname varchar2(50),
	deptdate DATE);
--[1단계:코드] 3. 사원테이블과 등급테이블을 조인해서 복사테이블 emp17만들고, losal, hisal을 삭제 처리하세요.
DROP TABLE emp17;
SELECT * FROM salgrade;
CREATE TABLE emp17
AS SELECT e.*, s.*
FROM emp e, salgrade s
WHERE sal BETWEEN losal AND hisal;
ALTER table emp17 drop column losal;
ALTER table emp17 drop column hisal;
SELECT * FROM emp17;
--[1단계:코드] 4. emp20 복사테이블을 만들고, 사원명의 최대 byte크기를 확인한 후, char(최대크기)로 변경하세요.
DROP TABLE emp20;
CREATE TABLE emp20
AS SELECT * FROM emp;
ALTER TABLE emp20
MODIFY ename char(10);
SELECT * FROM emp20;
--[1단계:개념] 5. 무결성 제약 조건의 장점과 종류를 예시를 통해서 기술하세요.
--데이터 무결성 제약조건의 장점
--	1) 테이블 생성시 무결성 제약조건을 정의 가능
--		- 생성후 제약조건 설정도 테이블 구조변경 명령을 통해 가능
--	2) 테이블에 대한 정의, 데이터 딕션너리에 저장되므로 응용프로그램에서
--		입력된 모든 데이터에 대한 동일하게 적용 가능
--	3) 제약조건을 활성화/비활성화 할 수 있는 융통성을 가지고 있다.
--무결성 제약조건의 종류
--	1) not null : 해당 컬럼이 null을 포함할 수 없음. 즉 반드시 데이터를 입력하여야
--		하는 컬럼 지정
--	2) unique key : 테이블의 모든 행에서 고유한 값을 갖는 열 또는 열 조합을
--		지정하여야 한다.
--		ex) 학번, 주민번호, 사원번호를 중복하지 않아야 한다.
--		- null을 처리가 가능하고, null은 중복이 가능하다.
--	3) primary key : 해당 컬럼 값은 반드시 존재해야 하면 유일해야 한다.
--		not null과 unique가 결합된 형태
--		주로 테이블에서 식별해야할 컬럼 즉, key를 지정할 때 사용된다.
--	4) froeign key : 한 열과 참조된 테이블의 열간에 외래 키 관계를 설정하고
--		ex) 사원의 테이블의 부서번호는 반드시 부서테이블에 있는 부서번호이어야 한다.
--	5) check : 해당 컬럼에 저장 가능한 데이터 값의 범위나 조건을 지정처리
--		ex) 학생테이블의 학년은 1~4만 데이터로 입력할 수 있다.
--[1단계:코드] 6. 물품정보테이블(물품번호, 물건명, 가격, 재고량)을 만들되, 물품번호, 물건명을 not null 제약 조건을 선언하여 생성하고, 생성된 여부를 메타테이블을 통해 확인하세요.
DROP TABLE PRODUCT;
CREATE TABLE product(
	pno NUMBER CONSTRAINT product_pno_nn NOT NULL,
	pname varchar2(50) CONSTRAINT product_pname_nn NOT NULL,
	price NUMBER,
	pcnt NUMBER
);
SELECT * FROM sys.ALL_CONSTRAINTS 
WHERE CONSTRAINT_NAME LIKE 'PRODUCT%';
--[1단계:코드] 7. 도서대여시스템의 테이블 (도서, 대여, 회원)에서 대여 테이블의 회원아이디와 도서일련번호 두개 컬럼을 primary key로 설정하세요.
CREATE TABLE rentbooks(
	id VARCHAR2(30),
	isbn char(4),
	rentdate DATE,
	rentcnt NUMBER,
	CONSTRAINT rentbooks_id_isbn_pk PRIMARY KEY(id, isbn)
);
--[1단계:코드] 8. 회원테이블(회원아이디, 패스워드, 이름, 권한, 포인트) 권한이 관리자, 일반사용자, 방문객만 입력가능, 포인트가 0이상 입력가능하게 제약사항을 처리해서 테이블을 생성하세요.
CREATE TABLE MEMBER(
	id VARCHAR2(30),
	pass VARCHAR2(20),
	name VARCHAR2(50),
	auth VARCHAR2(20) CONSTRAINT MEMBER_auth_fk REFERENCES auth(mgr,USER,visitor),
	point NUMBER CONSTRAINT check( point >= 0)
);
CREATE TABLE auth(
	mgr VARCHAR2(20) PRIMARY KEY,
	USER VARCHAR2(20) PRIMARY KEY,
	visitor VARCHAR2(20) PRIMARY KEY
);
--[1단계:코드] 9. 캡쳐로 제시 화면의 ERD의 실제테이블을 제약사항을 적용하여 테이블을 생성하고, 데이터를 입력 확인하세요.
CREATE TABLE customer(
	id varchar2(30) PRIMARY KEY,
	name varchar2(30),
	point NUMBER);
INSERT INTO customer values();
INSERT INTO customer values();
INSERT INTO customer values();
SELECT * FROM customer;

CREATE TABLE book(
	isbn char(4) PRIMARY KEY,
	title varchar2(50),
	writer varchar2(30),
	price number);
INSERT INTO book values();
INSERT INTO book values();
SELECT * FROM book;

CREATE TABLE publishing(
	pno char(4) PRIMARY KEY,
	name varchar2(30),
	loc varchar2(100),
	call NUMBER(11) );
INSERT INTO publishing values();
INSERT INTO publishing values();
SELECT * FROM publishing;

CREATE TABLE buy(
	id varchar2(30),
	isbn char(4),
	buydate DATE,
	paycheck varchar2(30) );
INSERT INTO buy values();
INSERT INTO buy values();
SELECT * FROM buy;

CREATE TABLE supply(
	isbn char(4),
	pno char(4));
INSERT INTO supply values();
INSERT INTO supply values();
SELECT * FROM supply;

SELECT *
FROM customer c, book bk, buy b
WHERE bk.isbn = b.isbn
AND c.id = b.id;

SELECT *
FROM book bk, publishing p, supply s
WHERE bk.isbn = s.isbn
AND p.pno = s.pno;
--[1단계:개념] 10. 시퀀스의 기본 생성 형식과 호출 속성을 정리해보세요.
--create sequence 시퀀스명
--		increment by 증가단위
--		start with 시작번호
--		maxvalue 최대값|nomaxvalue
--		minvalue 최소값|nominvalue
--		cycle|nocycle - 반복여부 설정
--		cache n|noccache -- 속도 개선을 위해 메모리 캐시 시퀀스 수
--[1단계:코드] 11. 아래의 여러가지 시퀀스를 생성해보세요.
--                 1) 9999~1000 2씩 감소  2) 5000~9999 1씩 증가 3) 0~21 3씩 증가 반복 4) 5~1000 5씩 증가

--[1단계:코드] 12. 게시판테이블(번호, 내용)을 만들고, sequence를 만들어 1부터 시작하여 번호가 증가되어 입력되게 처리하세요.

--[1단계:개념] 13. DML의 종류를 기술하세요.
--insert : 입력 처리
--update : 수정 처리
--delete : 삭제 처리
--merge : 병합처리명령어(논리적 테이블의 병합/수정과 동시에 입력)
--== 평가대비(오라클) 객관식 문제 ==
--1. 테이블의 구조를 변경하는 명령어는?
--1) alter table 테이블명  2) update  table 테이블명 
--3) create table 테이블명 4) drop table 테이블명 
--정답:1
--==> 테이블 구조의 변경 :
--alter table 테이블명
--2. 무결성 제약 조건의 종류가 아닌 것은?
--1) not null
--2) unique
--3) second key
--4) foreign key
--정답:3
--==> 무결성 제약 조건의 종류 : not NULL, unique KEY, primary KEY, froeign KEY, check
--3. 아래 설명중 틀린 것은 무엇인가?
--1) 테이블 생성시 무결성 제약조건을 정의 가능
--2) not null 제약은 기존 데이터를 NULL로 수정하는 경우에는 가능
--3) 테이블레벨이 아닌 열 레벨로만 지정가능하다
--4) 제약조건을 활성화, 비활성화 할 수 있는 융통성애 있음
--정답:2
--==> not null : 해당 컬럼이 null을 포함할 수 없음. 즉 반드시 데이터를 입력하여야하는 컬럼 지정
--4. 데이터 무결성 제약조건의 장점이 아닌 것은?
--1) 테이블 생성시만 제약조건이 가능하므로 일관성을 확보
--2) 응용 프로그램에서 입력된 모든 데이터에 대해 동일하게 적용
--3) 제약조건을 활성화, 비활성화 할 수 있는 융통성
--4) 테이블 생성시 무결성 제약조건을 정의 가능
--정답:1
--==> 테이블 생성시 무결성 제약조건을 정의 가능
--	- 생성후 제약조건 설정도 테이블 구조변경 명령을 통해 가능
--5. 시퀀스의 속성 아닌 것은?
--1) increment by
--2) start with
--3) minvalue
--4) circle
--정답:4
--==> increment by 증가단위
--	start with 시작번호
--	maxvalue 최대값|nomaxvalue
--	minvalue 최소값|nominvalue
--	cycle|nocycle - 반복여부 설정
--	cache n|noccache -- 속도 개선을 위해 메모리 캐시 시퀀스 수
/*
정답
[1단계:코드] 8. 회원테이블(회원아이디, 패스워드, 이름, 권한, 포인트) 권한이 관리자, 일반사용자, 방문객만 입력가능, 포인트가 0이상 입력가능하게 제약사항을 처리해서 테이블을 생성하세요.
	1) 권한 조건문 auth in ('관리자','일반사용자','방문객')
	2) 포인트 조건 point >= 0
*/create table member999(
	id varchar2(50) PRIMARY KEY,
	pass varchar2(10),
	name varchar2(50),
	auth varchar2(15) check(auth in ('관리자','일반사용자','방문객')),
	point NUMBER check(point >= 0)
);
-- check 제약조건에 의해서 권한과 포인트 컬럼은 해당 데이터만 입력/수정 가능
/*
[1단계:코드] 12. 게시판테이블(번호, 내용)을 만들고, sequence를 만들어 1부터 시작하여 번호가 증가되어 입력되게 처리하세요.
*/
CREATE TABLE board(
	NO NUMBER PRIMARY KEY,
	content varchar2(500)
);
CREATE SEQUENCE board_seq
	START WITH 1
	MINVALUE 1
	MAXVALUE 99999;
INSERT INTO board100 values(board_seq.nextval,'내용'||board_seq.currval);
SELECT * FROM board100;
/*
 * */








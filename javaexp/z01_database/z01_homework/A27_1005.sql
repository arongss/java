--2022-10-05
--[1단계:개념] 1. 테이블 생성/삭제 기본 코드를 기술하세요.
--create table 테이블명(컬럼명 데이터유형 제약조건); -- 생성
--drop table 테이블명; -- 삭제
--[1단계:코드] 2. 온라인 컴퓨터 부품판매 사이트에서 컴퓨터정보를 테이블로 만들려고 한다. 온라인 사이트를 참고하여 테이블을 만들어 보세요.
CREATE TABLE computer(
	kind varchar2(20),
	os varchar2(30),
	ram varchar2(30),
	ssd varchar2(20)
	price NUMBER
);
--[1단계:개념] 3. database 모델링에서 엔티티, 속성, 엔티티 타입, 인스턴스, 객체 집합을 예제와 함께 개념을 정리해보세요.
--1. entity
--	1) 처리 순서
--		요구사항정의서 ==> 데이터로 관리할 부분 식별 ==> 테이블
--	2) 테이블 만들기 전에
--		개체(entity)를 식별하여 포함되어있는 속성(컬럼)을 구분하여 처리한다.
--	3) 개체란?
--		- 현실 세계에서 조직을 운영하는 데 꼭 필요한 사람이나 사물과 같이 구별되는 모든 것
--		- 저장할 가치*가 있는 중요 데이터를 가지고 있는 사람이나 사물, 개념, 사건
--			ex) 쇼핑몰에서 판매물품, 회원, 구매한물품, 장바구니에 담은 물건, 배송할 정보 등등
--		- 다른 개체와 구별되는 이름을 가지고 있고, 각 개체만의 고유한 특성이나 상태, 즉 속성을 하나 이상 가지고 있음
--			ex1) 서점에 필요한 개체 : 고객, 책
--			ex2) 학교에 필요한 개체 : 학과, 과목
--		- 파일 구조의 레코드와 대응됨
--		- E-R 다이어그램에서 사각형으로 표현하고 사각형 안에 이름을 표기
--2. 속성(Attribute)
--	1) 개체나 관계가 가지고 있는 고유한 특성
--	2) 의미 있는 데이터의 가장 작은 논리적 단위
--		ex) 회원 엔티티의 회원아이디
--	3) 파일 구조의 필드와 대응됨
--		ex) 테이블의 컬럼에 대응
--	4) ER다이어그램에서 타원으로 표현하고 타원 안에 이름을 표기
--3. 객체 타입(entity type)
--	1) 개체를 고유한 이름과 속성들로 정의한 것
--	2) 파일 구조의 레코드 타입(record type)에 대응된
--4. 객체 인스턴스(entity instance)
--	1) 개체를 구성하고 있는 속성이 실제 값을 가짐으로써 실체화된 개체
--	2) 개체 어커런스(entity occurrence)라고도 함
--	3) 파일 구조의 레코드 인스턴스(record instance)에 대응됨
--		ex) 테이블에 입력되는 구체적인 데이터하나하나에 대응된다.
--5. 개체 집함(entity set) : 특정 개체 타입에 대한 개체 인스턴스들을 모아놓은 것
--[1단계:개념] 4. 모델링에서 유도속성에 대하여 기술하세요.
--기존의 다른 속성값에서 유도되어 결정되는 속성
--값이 별도로 저장되지 않음(추후 컬럼으로 발전하지 않음)
--[1단계:개념] 5. 데이터를 입력하는 형식 2가지 및 삭제처리를 기술하세요.
--전체 데이터 입력 : 생성된 컬럼 순위로 데이터 유형에 맞게 입력
--		insert into 테이블명 values(데이터1,데이터2....)
--부분 특정 컬럼 입력 : 특정한 컬럼을 지정하여 입력한다.
--		insert into emp(empno, job, deptno) values(1001,'대리',20);
--		emp(입력할 컬럼 순서 지정) values(왼쪽에 선언한 컬럼 순서대로 데이터 입력)
--삭제처리 : DELETE FROM 테이블명 WHERE 삭제할데이터;
--[1단계:코드] 6. 부서테이블을 기준으로 dept10 복사테이블을 만들고 컬럼 크기를 변경후, 데이터를 입력하세요.
CREATE TABLE dept10
AS SELECT * FROM dept;
SELECT * FROM dept10;
--[1단계:코드] 8. 도서관의 도서대여시스템에 도서, 도서대여, 회원 정보를 만들어 erd 생성(논리/물리모델) 처리하세요 
--[1단계:코드] 9. 위 내용을 실제 테이블 생성 및 join 된 sql 처리하세요
CREATE TABLE books(
	isbn char(4),
	title varchar2(50),
	writer barchar2(30)
);
INSERT INTO books values('1000','자바기초','자바맨');
INSERT INTO books values('1001','오라클중급','DB맨');
INSERT INTO books values('1002','스프링고급','백맨');
SELECT * FROM books;
CREATE TABLE members(
	id varchar2(30),
	pass varchar2(20),
	name varchar2(50)
);
INSERT INTO members values('himan','1111','홍길동');
INSERT INTO members values('higirl','7777','마길동');
INSERT INTO members values('goodman','1234','김길동');
SELECT * FROM members;
CREATE TABLE rentbooks(
	isbn char(4),
	id varchar2(30),
	rentdate DATE,
	rentcnt NUMBER
);
INSERT INTO rentbooks values('1000','himan',to_date('2022-10-05','YYYY-MM-DD'),1);
INSERT INTO rentbooks values('1001','higirl',to_date('2022-10-01','YYYY-MM-DD'),1);
INSERT INTO rentbooks values('1002','goodman',to_date('2022-10-03','YYYY-MM-DD'),1);
SELECT * FROM rentbooks;
SELECT *
FROM books b, members m, rentbooks r
WHERE b.isbn = r.isbn
AND m.id = r.id;
--
--== 평가대비(오라클) 객관식 문제 ==
--1. 오라클에서 사용하는 데이터 유형이 아닌 것은 ?
--1) char 2) varchar2 3) boolean 4) number
--==> boolean은 자바에서 사용
--정답:3
--
--2. 모델링에서 복합 속성을 의미하는 말이 맞는 것은?
--1) 의미를 분해할 수 있는 속성
--2) 의미를 더는 분해할 수 없는 속성
--3) 값을 하나만 가질 수 있는 속성
--4) 값을 여러 개 가질 수 있는 속성
--==> 단순 속성 : 의미를 더는 분해할 수 없는 속성
--	복합 속성 : 의미를 분해할 수 있는 속성
--	단일값 속성 : 값을 하나만 가질 수 있는 속성
--	다중값 속성 : 값을 여러 개 가질 수 있는 속성
--정답:1
--
--3. 키속성의 내용이 아닌 것은?
--1) 각 개체 인스턴스를 식별하는 데 사용되는 속성
--2) 모든 개체 인스턴스의 키 속성 값이 다름
--3) 둘 이상의 속성들로 구성되기도 함
--4) 개체 집합들 사이의 대응 관계, 즉 매핑(mapping)을 의미
--==> 관계 : 개체 집합들 사이의 대응 관계, 즉 매핑(mapping)을 의미
--정답:4
--
--4. ER 모델에 대한 설명으로 옮지 않은 것은?
--1) ER 다이어그램으로 표현하여 피터 첸이 제안하였다.
--2) 일대일(1:1) 관계 유형만 표현할 수있다.
--3) 객체 타입과 이들 간의 관계 타입을 이용해 현실 세계를 개념적으로 표현한다.
--4) ER 다이어그램은 ER 모델을 그래프 방식으로 표현한 것이다.
--==> 1) 개체 - 관계 모델(E-R model : entitiy-relationship model)
--		- 피터 첸이 제안한 개념적 데이터 모델
--		- 개체와 객체 간의 관계를 이용해 현실 세계를 개념적 구조로 표현
--		- 핵심 요소 : 개체, 속성, 관계
--	2) 개체 - 관계 다이어그램(E-R diagram)
--		- E-R다이어그램
--		- 객체-관계 모델을 이용해 현실 세계를 개념적으로 모델링한 결과물을 그림으로 표현한 것
--정답:2

-- a17_constraints.sql
/*
# check
1. 특정한 데이터를 조건이나 범위를 지정해서, 해당 범위에 데이터만 입력되도록 처리한 것을
	말한다.
2. 형식
	컬럼명 데이터유형 constraint 제약명 check ( where 조건문 형식 설정 )
	ex) check(컬럼명 = '데이터'), check(컬럼명 between 1000 and 2000)
	컬럼명 데이터유형 check ( where 조건문 형식 설정 )
 * */
/*
# check
1. 컬럼명 데이터유형 constraint 제약명
	check( where조건문형식동일 )
	ex) 'A', 'B', 'C'라는 3가지 문자열로된 등급만 
		입력가능하게 check 처리
		grade char(1) constraint emp_grade_ck check( grade in('A', 'B', 'C') )
	ex) 0~100 까지 데이터
		 point number(3) check( point between 0 and 100 )
	ex) 과목(subject)을 국어, 영어, 수학만 입력하게 정의
		subject char(6) check( subject in('국어','영어','수학'))
	주의) check는 null입력은 가능하다. 
 * */
DROP TABLE emp04;
CREATE TABLE emp04(
	gender varchar2(1) CONSTRAINT emp04_gender_ck check( gender IN('F','M'))
);
INSERT INTO EMP04 VALUES('F');
INSERT INTO EMP04 VALUES('M');
INSERT INTO EMP04 VALUES('K'); -- 에러발생
SELECT *
FROM sys.ALL_CONSTRAINTS 
WHERE TABLE_NAME = 'EMP04';
-- ex) student05 테이블 이름, 학년(1~4), 국어(1~100) 제약조건을 설정하여 테이블을
--		생성하고 확인하세요.
DROP TABLE student05;
CREATE TABLE student05(
	name varchar2(50),
	grade number(1) CONSTRAINT student05_grade_ck check( grade between 1 and 4),
	kor number(3) CONSTRAINT check( kor between 1 and 100)
);
INSERT INTO student05 values('홍길동',1,100);
INSERT INTO student05 values('김길동',5,100); -- 에러
INSERT INTO student05 values('신길동',1,101); -- 에러
SELECT * FROM student05;

/*
# 외래키 설정(froeign key)
1. 연관관계에 있는 두 테이블에 대하여, 한쪽 테이블에 있는 데이터 기준으로 다른쪽 테이블의
	데이터를 입력할 수 있게 하는 것을 말한다.
2. 기본 형식
	컬럼명 데이터유형 constraint 테이블명_컬럼명_fk references 테이블명(컬럼명)
 * */
-- 교수테이블과 학생테이블의 담당교수지정컬럼
CREATE TABLE professor01(
	tno NUMBER PRIMARY KEY,
	name varchar2(50)
);
DROP TABLE student06;
CREATE TABLE student06(
	name varchar2(50),
	tno NUMBER CONSTRAINT student06_tno_fk REFERENCES professor01(tno)
);
INSERT INTO professor01 values(1000,'홍길동교수');
INSERT INTO student06 values('김길동학생',1000);
INSERT INTO student06 values('마길동학생',1000);
INSERT INTO student06 values('오길동학생',1001); -- 참조에러발생
SELECT * FROM professor01;
SELECT * FROM student06;
-- ex) 물건테이블(물건번호, 물건명, 가격), 
--      구매테이블(구매번호, 구매수량, 물건번호- 외래키설정)
CREATE TABLE product11 (
   pno char(8) PRIMARY KEY,
   name varchar2(50),
   price number
);
CREATE TABLE buyprod11 (
   bno char(10),
   bcnt NUMBER,
   pno NUMBER CONSTRAINT buyprod11_pno_fk REFERENCES product11(pno)
);
INSERT INTO product11 values(1000,'사과',1200);
INSERT INTO product11 values(10,5,1000);
INSERT INTO product11 values(11,2,1001); --에러발생
SELECT name, price, bcnt
FROM product11 p, buyprod11 b
WHERE p.pno = b.pno;
SELECT * FROM product11;
SELECT * FROM buyprod11;

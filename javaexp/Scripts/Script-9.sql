CREATE TABLE MEMBER(
	id varchar2(30),
	pass varchar2(20),
	name varchar2(50),
	auth varchar2(20),
	point NUMBER,
	address varchar2(200)
);
SELECT *
FROM MEMBER
WHERE name LIKE '%'||''||'%'
AND auth LIKE '%'||''||'%';
INSERT INTO MEMBER VALUES ('himan','7777','홍길동','슈퍼고객',10000,'서울');
INSERT INTO MEMBER VALUES ('higril','8888','홍리나','일반고객',5000,'부산');
INSERT INTO MEMBER VALUES ('goodman','5555','이철희','방문고객',1000,'대전');
SELECT * FROM MEMBER;
DROP TABLE MEMBER;


SELECT name, auth
FROM MEMBER
WHERE name LIKE '%'||''||'%'
AND auth LIKE '%'||''||'%';

SELECT * 
FROM salgrade
WHERE grade BETWEEN 1 AND 5;

SELECT * FROM SALGRADE;
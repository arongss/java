SELECT * FROM ovMember;
SELECT * FROM ovCategory;
SELECT * FROM ovProduct;
SELECT * FROM ovShoppingCart;
SELECT * FROM ovQuestion;

SELECT * FROM OVMEMBER 
WHERE name LIKE '%'||''||'%'
AND id LIKE '%'||''||'%'
AND auth LIKE '%'||''||'%';
SELECT DISTINCT auth FROM OVMEMBER;

DROP TABLE ovQuestion;
DROP TABLE ovShoppingCart;
DROP TABLE ovProduct;
DROP TABLE ovCategory;
DROP TABLE ovMember;

CREATE TABLE ovMember(
	id varchar2(50) PRIMARY KEY,
	pass varchar2(50),
	name varchar2(50),
	auth varchar2(20),
	address varchar2(100),
	joindate DATE,
	birthday DATE,
	phone varchar2(100),
	email varchar2(100),
	point NUMBER 
);
CREATE TABLE ovCategory(
	ctgNo varchar2(100) PRIMARY KEY,
	ctgName varchar2(300)
);
CREATE TABLE ovProduct(
	prodNo varchar2(10) PRIMARY KEY,
	ctgNo varchar2(100) CONSTRAINT ovCategory_ctgNo_fk REFERENCES ovCategory(ctgNo),
	id varchar2(50) CONSTRAINT ovMember_id_fk REFERENCES ovMember(id),
	seller varchar2(100),
	prdName varchar2(300),
	prdKind varchar2(2000),
	prdPrice NUMBER,
	prdImg varchar2(500),
	prdDescript varchar2(4000),
	prdDelivery varchar2(4000)
);
CREATE TABLE ovShoppingCart(
	id varchar2(50) CONSTRAINT ovMember_id_fk2 REFERENCES ovMember(id),
	prodNo varchar2(10) CONSTRAINT ovProduct_prodNo_fk REFERENCES ovProduct(prodNo),
	addDate DATE,
	addCnt NUMBER
);
CREATE TABLE ovQuestion(
	cstmrId varchar2(50) CONSTRAINT ovMember_id_fk3 REFERENCES ovMember(id),
	adminId varchar2(50) CONSTRAINT ovMember_id_fk4 REFERENCES ovMember(id),
	quDate DATE,
	quKind varchar2(200),
	quContent varchar2(1000),
	quImg varchar2(500),
	anDate DATE,
	anContent varchar2(500)
);
DELETE FROM ovMember WHERE id='';
INSERT INTO ovMember VALUES ('admin123','7777','홍길동','관리자','서울 마포구',sysdate,'1995-05-27','010-1111-2222','ad123@naver.com',0);
INSERT INTO ovMember VALUES ('baby123','7777','김길동','베이비올리브','서울 종로구',sysdate,'1999-01-01','010-3333-4444','bb123@naver.com',1000);
INSERT INTO ovMember VALUES ('pink123','7777','신길동','핑크올리브','서울 강북구',sysdate,'1996-07-23','010-5555-6666','pk123@naver.com',5000);
INSERT INTO ovMember VALUES ('green123','7777','마길동','그린올리브','서울 강남구',sysdate,'1998-11-12','010-7777-8888','gr123@naver.com',10000);
INSERT INTO ovMember VALUES ('black123','7777','오길동','블랙올리브','서울 구로구',sysdate,'1997-05-04','010-9999-0000','bk123@naver.com',15000);
INSERT INTO ovMember VALUES ('gold123','7777','하길동','골드올리브','서울 강서구',sysdate,'2000-03-20','010-1234-1234','gd123@naver.com',20000);
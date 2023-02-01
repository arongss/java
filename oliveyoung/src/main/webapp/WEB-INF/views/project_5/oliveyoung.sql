SELECT * FROM ovMember;
SELECT * FROM ovCategory;
SELECT * FROM ovProduct;
SELECT * FROM ovShoppingCart;
SELECT * FROM ovQuestion;

DROP TABLE ovQuestion;
DROP TABLE ovShoppingCart;
DROP TABLE ovProduct;
DROP TABLE ovCategory;
DROP TABLE ovMember;

CREATE TABLE ovMember(
	id varchar2(50) PRIMARY KEY,
	pass varchar2(50),
	auth varchar2(20),
	nickname varchar2(50),
	address varchar2(100),
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
INSERT INTO ovMember VALUES ('admin123','7777','관리자','ad123','서울 마포구',0);
INSERT INTO ovMember VALUES ('user123','7777','사용자','ur123','서울 마포구',1000);
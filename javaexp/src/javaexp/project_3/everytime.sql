CREATE TABLE USERS(
	id varchar2(20) PRIMARY KEY,
	pass varchar2(20),
	email varchar2(50),
	nickname varchar2(20),
	enterYear varchar2(10),
	university varchar2(50)
);
CREATE TABLE GRADE(
	gno varchar2(10) PRIMARY KEY,
	gyear varchar2(10),
	gsemester varchar2(10),
	avggrade NUMBER,
	id varchar2(20) CONSTRAINT GRADE_id_FK REFERENCES USERS (id)
);
CREATE TABLE BOARD(
	bno varchar2(10) PRIMARY KEY,
	btitle varchar2(50),
	notice varchar2(50),
	crdate DATE,
	id varchar2(20) CONSTRAINT BOARD_id_FK REFERENCES USERS (id)
);
CREATE TABLE POST(
	pno varchar2(10) PRIMARY KEY,
	pcontents varchar2(200),
	likecnt NUMBER,
	bno varchar2(10) CONSTRAINT POST_bno_FK REFERENCES BOARD (bno),
	id varchar2(20) CONSTRAINT POST_id_FK REFERENCES USERS (id)
);
CREATE TABLE COMMENTS(
	cno varchar2(10) PRIMARY KEY,
	ccontents varchar2(200),
	pno varchar2(10) CONSTRAINT COMMENTS_pno_FK REFERENCES POST (pno),
	id varchar2(20) CONSTRAINT COMMENTS_id_FK REFERENCES USERS (id)
);
CREATE TABLE PROFESSOR(
	prono varchar2(10) PRIMARY KEY,
	proname varchar2(50),
	promajor varchar2(50)
);
CREATE TABLE COURSE(
	cosname varchar2(50) PRIMARY KEY,
	code varchar2(50),
	major varchar2(50),
	point NUMBER,
	score varchar2(10),
	classroom varchar2(50),
	weekday varchar2(10),
	startTime timestamp,
	endTime timestamp,
	prono varchar2(10) CONSTRAINT COURSE_prono_FK REFERENCES PROFESSOR (prono),
	id varchar2(20) CONSTRAINT COURSE_id_FK REFERENCES USERS (id)
);
CREATE TABLE TIMETABLE(
	tno varchar2(10) PRIMARY KEY,
	tyear varchar2(10),
	tsemester varchar2(10),
	tname varchar2(50),
	cosname varchar2(50) CONSTRAINT TIMETABLE_cosname_FK REFERENCES COURSE (cosname)
);

DELETE FROM USERS;
DELETE FROM GRADE;
DELETE FROM BOARD;
DELETE FROM POST;
DELETE FROM COMMENTS;
DELETE FROM PROFESSOR;
DELETE FROM COURSE;
DELETE FROM TIMETABLE;

SELECT * FROM USERS;
SELECT * FROM GRADE;
SELECT * FROM BOARD;
SELECT * FROM POST;
SELECT * FROM COMMENTS;
SELECT * FROM PROFESSOR;
SELECT * FROM COURSE;
SELECT * FROM TIMETABLE;

INSERT INTO BOARD VALUES ('1','자유게시판','자유게시판입니다!','2020-01-01','taetae');
INSERT INTO BOARD VALUES ('2','졸업생게시판','졸업생게시판입니다!','2020-01-01','taetae');
INSERT INTO POST VALUES (pno_seq.nextval,'안녕하세요!','0','1','taetae');
INSERT INTO POST VALUES (pno_seq.nextval,'안녕하세요! 졸업생입니다','0','2','taetae');
INSERT INTO POST VALUES (pno_seq.nextval,'도서관에서 조용히 해주세요','0','1','taetae');

CREATE SEQUENCE pno_seq
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;

INSERT INTO USERS VALUES ('taetae','@@aa1234','taetae@naver.com','tt77','2014','서울대');
INSERT INTO USERS VALUES ('love12','@@love12','love12@naver.com','lees2','2020','연세대');
INSERT INTO USERS VALUES ('lucky','##1234kk','lucky@naver.com','lucky','2018','고려대');
INSERT INTO USERS VALUES ('kiyuu','kiyu777!','kiyuu@naver.com','kiyu','2018','경북대');
INSERT INTO USERS VALUES ('goood','gg00000@','goood@naver.com','goood','2015','경북대');
INSERT INTO USERS VALUES ('abcabc1','123@@abc','abcabc1@naver.com','abcabc','2017','부산대');
INSERT INTO USERS VALUES ('abcdef99','1234aa!!','abcdef99@naver.com','abcdef99','2021','부산대');
INSERT INTO USERS VALUES ('dbalsdn','7777abc!','dbalsdn@naver.com','dbalsdn','2022','경희대');
INSERT INTO USERS VALUES ('alsn1','36452a@@','alsn1@naver.com','alsn','2021','중앙대');
INSERT INTO USERS VALUES ('happygirl','@@@aa111','happygirl@naver.com','happy','2022','성균관대');
INSERT INTO USERS VALUES ('happyman','#1234567a','happyman@naver.com','hman','2018','단국대');
INSERT INTO USERS VALUES ('strongman','112233!a','strongman@naver.com','strman','2019','성균관대');
INSERT INTO USERS VALUES ('smileman','@smile00','smileman@naver.com','smileman','2017','중앙대');
INSERT INTO USERS VALUES ('abc123','123abc!#','abc123@naver.com','abc123','2016','이화여대');
INSERT INTO USERS VALUES ('user001','!!a12345','user001@naver.com','user001','2014','건국대');
INSERT INTO USERS VALUES ('user002','##abcd11','user002@naver.com','user002','2020','홍익대');
INSERT INTO USERS VALUES ('user003','@a123456','user003@naver.com','user003','2015','중앙대');
INSERT INTO USERS VALUES ('user004','123456a!','user004@naver.com','user004','2017','경북대');
INSERT INTO USERS VALUES ('user005','@000000a','user005@naver.com','user005','2020','연세대');
INSERT INTO USERS VALUES ('user006','!777777a','user006@naver.com','user006','2021','고려대');

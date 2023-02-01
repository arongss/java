SELECT * FROM admin;
SELECT * FROM major;
SELECT * FROM member_s;
SELECT * FROM student;
SELECT * FROM schRecord;
SELECT * FROM notice;
SELECT * FROM lecture;
SELECT * FROM scholarahip;
SELECT * FROM stdLecture;
SELECT * FROM tuition;
SELECT * FROM professor_s;

DELETE FROM lecture;

DROP TABLE professor_s;
DROP TABLE tuition;
DROP TABLE stdLecture;
DROP TABLE scholarahip;
DROP TABLE lecture;
DROP TABLE notice;
DROP TABLE schRecord;
DROP TABLE student;
DROP TABLE member_s;
DROP TABLE major;
DROP TABLE admin;

CREATE TABLE admin(
   adminId varchar2(20) PRIMARY KEY,
   adminPw varchar2(20)
);
--관리자
INSERT INTO admin VALUES ('admin1004','manager1004');

CREATE TABLE major(
   majorNo NUMBER PRIMARY KEY,
   majorName varchar2(30)
);
--농업생명과학대학
INSERT INTO major VALUES (10,'농산학과');
INSERT INTO major VALUES (11,'바이오섬유소재학과');
INSERT INTO major VALUES (12,'식품자원경제학과');
--사회과학대학
INSERT INTO major VALUES (20,'문헌정보학과');
INSERT INTO major VALUES (21,'사회학과');
INSERT INTO major VALUES (22,'심리학과');
--사범대학
INSERT INTO major VALUES (30,'가정교육과');
INSERT INTO major VALUES (31,'교육학과');
INSERT INTO major VALUES (32,'국어교육과');
--예술대학
INSERT INTO major VALUES (40,'국악학과');
INSERT INTO major VALUES (41,'디자인학과');
INSERT INTO major VALUES (42,'미술학과');
--공과대학
INSERT INTO major VALUES (50,'전자공학과');
INSERT INTO major VALUES (51,'화학공학과');
INSERT INTO major VALUES (52,'컴퓨터공학과');
--인문대학
INSERT INTO major VALUES (60,'고고인류학과');
INSERT INTO major VALUES (61,'국어국문학과');
INSERT INTO major VALUES (62,'노어노문학과');
--자연과학대학
INSERT INTO major VALUES (70,'물리학과');
INSERT INTO major VALUES (71,'수학과');
INSERT INTO major VALUES (72,'통계학과');
--간호대학
INSERT INTO major VALUES (80,'간호학과');
--의과대학
INSERT INTO major VALUES (90,'의예과');
INSERT INTO major VALUES (91,'의학과');

CREATE TABLE member_s(
   id varchar2(20) PRIMARY KEY,
   password varchar(20),
   code NUMBER
);
--교수
INSERT INTO member_s VALUES ('pro1010','1234',2);
INSERT INTO member_s VALUES ('pro1011','3154',2);
INSERT INTO member_s VALUES ('pro1012','5475',2);
INSERT INTO member_s VALUES ('pro1020','4538',2);
INSERT INTO member_s VALUES ('pro1021','4354',2);
INSERT INTO member_s VALUES ('pro1022','1235',2);
INSERT INTO member_s VALUES ('pro1030','3895',2);
INSERT INTO member_s VALUES ('pro1031','3899',2);
INSERT INTO member_s VALUES ('pro1032','6867',2);
INSERT INTO member_s VALUES ('pro1040','7535',2);
INSERT INTO member_s VALUES ('pro1041','4867',2);
INSERT INTO member_s VALUES ('pro1042','9874',2);
INSERT INTO member_s VALUES ('pro1050','3783',2);
INSERT INTO member_s VALUES ('pro1051','2136',2);
INSERT INTO member_s VALUES ('pro1052','7876',2);
INSERT INTO member_s VALUES ('pro1060','7856',2);
INSERT INTO member_s VALUES ('pro1061','6944',2);
INSERT INTO member_s VALUES ('pro1062','1346',2);
INSERT INTO member_s VALUES ('pro1070','4545',2);
INSERT INTO member_s VALUES ('pro1071','7867',2);
INSERT INTO member_s VALUES ('pro1072','4936',2);
INSERT INTO member_s VALUES ('pro1080','4665',2);
INSERT INTO member_s VALUES ('pro1090','4587',2);
INSERT INTO member_s VALUES ('pro1091','3413',2);
--농업생명과학대학
INSERT INTO member_s VALUES ('20191000','8574',1);
INSERT INTO member_s VALUES ('20191001','9657',1);
INSERT INTO member_s VALUES ('20191002','0015',1);
INSERT INTO member_s VALUES ('20201003','4465',1);
INSERT INTO member_s VALUES ('20201004','3652',1);
INSERT INTO member_s VALUES ('20201005','9587',1);
INSERT INTO member_s VALUES ('20211006','3365',1);
INSERT INTO member_s VALUES ('20211007','4452',1);
INSERT INTO member_s VALUES ('20211008','9986',1);
INSERT INTO member_s VALUES ('20211009','7845',1);
--사회과학대학
INSERT INTO member_s VALUES ('20192000','9512',1);
INSERT INTO member_s VALUES ('20192001','7946',1);
INSERT INTO member_s VALUES ('20192002','7625',1);
INSERT INTO member_s VALUES ('20202003','9635',1);
INSERT INTO member_s VALUES ('20202004','7985',1);
INSERT INTO member_s VALUES ('20202005','0202',1);
INSERT INTO member_s VALUES ('20212006','7451',1);
INSERT INTO member_s VALUES ('20212007','9632',1);
INSERT INTO member_s VALUES ('20212008','8452',1);
INSERT INTO member_s VALUES ('20212009','0301',1);
--사범대학
INSERT INTO member_s VALUES ('20193000','6588',1);
INSERT INTO member_s VALUES ('20193001','3235',1);
INSERT INTO member_s VALUES ('20193002','6698',1);
INSERT INTO member_s VALUES ('20203003','1415',1);
INSERT INTO member_s VALUES ('20203004','8684',1);
INSERT INTO member_s VALUES ('20203005','3516',1);
INSERT INTO member_s VALUES ('20213006','6548',1);
INSERT INTO member_s VALUES ('20213007','3215',1);
INSERT INTO member_s VALUES ('20213008','6944',1);
INSERT INTO member_s VALUES ('20213009','2315',1);
--예술대학
INSERT INTO member_s VALUES ('20194000','6439',1);
INSERT INTO member_s VALUES ('20194001','1513',1);
INSERT INTO member_s VALUES ('20194002','8522',1);
INSERT INTO member_s VALUES ('20204003','4132',1);
INSERT INTO member_s VALUES ('20204004','3262',1);
INSERT INTO member_s VALUES ('20204005','8342',1);
INSERT INTO member_s VALUES ('20214006','0926',1);
INSERT INTO member_s VALUES ('20214007','5723',1);
INSERT INTO member_s VALUES ('20214008','0970',1);
INSERT INTO member_s VALUES ('20214009','0230',1);
--공과대학
INSERT INTO member_s VALUES ('20195000','7549',1);
INSERT INTO member_s VALUES ('20195001','8854',1);
INSERT INTO member_s VALUES ('20195002','6947',1);
INSERT INTO member_s VALUES ('20205003','1652',1);
INSERT INTO member_s VALUES ('20205004','3254',1);
INSERT INTO member_s VALUES ('20205005','9984',1);
INSERT INTO member_s VALUES ('20215006','6224',1);
INSERT INTO member_s VALUES ('20215007','3021',1);
INSERT INTO member_s VALUES ('20215008','1214',1);
INSERT INTO member_s VALUES ('20215009','7361',1);
--인문대학
INSERT INTO member_s VALUES ('20196000','4545',1);
INSERT INTO member_s VALUES ('20196001','7894',1);
INSERT INTO member_s VALUES ('20196002','2012',1);
INSERT INTO member_s VALUES ('20206003','6595',1);
INSERT INTO member_s VALUES ('20206004','1114',1);
INSERT INTO member_s VALUES ('20206005','6587',1);
INSERT INTO member_s VALUES ('20216006','7895',1);
INSERT INTO member_s VALUES ('20216007','3202',1);
INSERT INTO member_s VALUES ('20216008','9200',1);
INSERT INTO member_s VALUES ('20216009','7846',1);
--자연과학대학
INSERT INTO member_s VALUES ('20197000','1547',1);
INSERT INTO member_s VALUES ('20197001','6685',1);
INSERT INTO member_s VALUES ('20197002','2561',1);
INSERT INTO member_s VALUES ('20207003','9546',1);
INSERT INTO member_s VALUES ('20207004','3215',1);
INSERT INTO member_s VALUES ('20207005','6632',1);
INSERT INTO member_s VALUES ('20217006','9748',1);
INSERT INTO member_s VALUES ('20217007','1238',1);
INSERT INTO member_s VALUES ('20217008','9844',1);
INSERT INTO member_s VALUES ('20217009','6535',1);
--간호대학
INSERT INTO member_s VALUES ('20198000','1392',1);
INSERT INTO member_s VALUES ('20198001','3312',1);
INSERT INTO member_s VALUES ('20198002','2417',1);
INSERT INTO member_s VALUES ('20208003','5453',1);
INSERT INTO member_s VALUES ('20208004','2054',1);
INSERT INTO member_s VALUES ('20208005','1301',1);
INSERT INTO member_s VALUES ('20218006','9849',1);
INSERT INTO member_s VALUES ('20218007','3573',1);
INSERT INTO member_s VALUES ('20218008','5326',1);
INSERT INTO member_s VALUES ('20218009','9927',1);
--의과대학
INSERT INTO member_s VALUES ('20199000','8578',1);
INSERT INTO member_s VALUES ('20199001','1302',1);
INSERT INTO member_s VALUES ('20199002','9855',1);
INSERT INTO member_s VALUES ('20209003','7848',1);
INSERT INTO member_s VALUES ('20209004','9595',1);
INSERT INTO member_s VALUES ('20209005','6541',1);
INSERT INTO member_s VALUES ('20219006','7856',1);
INSERT INTO member_s VALUES ('20219007','2587',1);
INSERT INTO member_s VALUES ('20219008','9632',1);
INSERT INTO member_s VALUES ('20219009','0254',1);

CREATE TABLE student(
   id varchar2(20) PRIMARY KEY CONSTRAINT member_s_id_fk4 REFERENCES member_s(id),
   stdName varchar2(30),
   stdYear NUMBER,
   enterYear NUMBER,
   address varchar2(100),
   birthday DATE,
   stdEmail varchar2(100),
   stdPhone varchar2(30),
   status varchar2(20),
   majorNo NUMBER CONSTRAINT major_majorNo_fk REFERENCES major(majorNo)
);
--학생정보
INSERT INTO student VALUES ('20191000','성해은',4,2021,'서울시 마포구 월드컵북로21','2000-11-11','abc123@ssangyong.com','010-1111-8574','재학',10);
INSERT INTO student VALUES ('20191001','정규민',4,2021,'서울시 마포구 월드컵북로21','2000-01-22','abc123@ssangyong.com','010-1111-9657','재학',11);
INSERT INTO student VALUES ('20191002','이나연',4,2021,'서울시 마포구 월드컵북로21','2000-05-20','abc123@ssangyong.com','010-1111-0015','재학',12);
INSERT INTO student VALUES ('20201003','남희두',3,2021,'서울시 마포구 월드컵북로21','2001-03-01','abc123@ssangyong.com','010-1111-4465','재학',10);
INSERT INTO student VALUES ('20201004','김태이',3,2021,'서울시 마포구 월드컵북로21','2001-05-07','abc123@ssangyong.com','010-1111-3652','재학',11);
INSERT INTO student VALUES ('20201005','박나언',3,2021,'서울시 마포구 월드컵북로21','2001-07-09','abc123@ssangyong.com','010-1111-9587','재학',12);
INSERT INTO student VALUES ('20211006','이지수',2,2021,'서울시 마포구 월드컵북로21','2002-08-30','abc123@ssangyong.com','010-1111-3365','재학',10);
INSERT INTO student VALUES ('20211007','박원빈',2,2021,'서울시 마포구 월드컵북로21','2002-04-05','abc123@ssangyong.com','010-1111-4452','재학',11);
INSERT INTO student VALUES ('20211008','정현규',2,2021,'서울시 마포구 월드컵북로21','2002-09-13','abc123@ssangyong.com','010-1111-9986','재학',12);
INSERT INTO student VALUES ('20211009','이지연',2,2021,'서울시 마포구 월드컵북로21','2002-12-16','abc123@ssangyong.com','010-1111-7845','재학',12);

CREATE TABLE schRecord(
   id varchar2(20) CONSTRAINT student_id_fk3 REFERENCES student(id),
   rYear NUMBER,
   semester NUMBER,
   grade NUMBER 
);

CREATE TABLE notice(
   noticeNo NUMBER PRIMARY KEY,
   title varchar2(100),
   contents varchar2(500),
   noticeDate DATE,
   views NUMBER,
   adminId varchar2(20) CONSTRAINTS admin_adminId_fk REFERENCES admin(adminId)
);
--공지사항
INSERT INTO NOTICE VALUES (1,'※공지사항※','공지사항입니다.','2023-01-01',0,'admin1004');

CREATE TABLE lecture(
   lecNum NUMBER PRIMARY KEY,
   lecName varchar2(30),
   lecLoc varchar2(30),
   lecPlan varchar2(500),
   lecYear varchar2(30),
   semester varchar2(30),
   grade NUMBER,
   major varchar2(30),
   times varchar2(20),
   sort varchar2(20),
   class_l NUMBER,
   id varchar(20) CONSTRAINTS member_s_id_fk3 REFERENCES member_s(id),
   majorNo NUMBER CONSTRAINTS major_majorNo_fk3 REFERENCES major(majorNo)
);
INSERT INTO LECTURE VALUES (1001,'동물과 가축','농대4호관403',null,'2022','1',3,'농산학과','월12','전공','pro1010',2,10);
INSERT INTO LECTURE VALUES (1002,'농업과 환경','농대4호관404',null,'2022','1',3,'농산학과','화12','전공','pro1010',3,10);
INSERT INTO LECTURE VALUES (1003,'농업정책의 이해','농대4호관405',null,'2022','1',3,'농산학과','목34','전공','pro1010',4,10);
INSERT INTO LECTURE VALUES (1101,'바이오섬유소재화학','농대2호관301',null,'2022','1',3,'바이오섬유소재학과','금12','전공','pro1011',2,11);
INSERT INTO LECTURE VALUES (1102,'고분자화학','농대2호관302',null,'2022','1',3,'바이오섬유소재학과','수56','전공','pro1011',3,11);
INSERT INTO LECTURE VALUES (1103,'단백질섬유소재공학','농대2호관303',null,'2022','1',3,'바이오섬유소재학과','목78','전공','pro1011',4,11);
INSERT INTO LECTURE VALUES (1201,'농업경제학','농대4호관401',null,'2022','1',3,'식품자원경제학과','월12','전공','pro1012',2,12);
INSERT INTO LECTURE VALUES (1202,'생산경제학','농대4호관402',null,'2022','1',3,'식품자원경제학과','수34','전공','pro1012',3,12);
INSERT INTO LECTURE VALUES (1203,'자원경제학','농대4호관403',null,'2022','1',3,'식품자원경제학과','금34','전공','pro1012',4,12);
UPDATE LECTURE SET lecPlan ='2022_1_lecplan.jpg' WHERE lecNum = '1';
SELECT lecNum,lecName,lecLoc,times,grade,lecPlan
FROM lecture
WHERE lecNum='';
SELECT * FROM LECTURE l ;
SELECT l.LECNUM , LECNAME , GRADE , SORT , s.LECEVAL, s2.id 
FROM LECTURE l , STDLECTURE s ,STUDENT s2 
WHERE l.LECNUM = s.LECNUM 
AND s.ID = s2.ID 
AND s2.id='20219009';

CREATE TABLE scholarahip(
   id varchar2(20) CONSTRAINT student_id_fk2 REFERENCES student(id),
   sort varchar2(30),
   schYear NUMBER,
   semester NUMBER,
   amount NUMBER 
);

CREATE TABLE stdLecture(
   lecNum NUMBER CONSTRAINTS lecture_lecNum_fk REFERENCES lecture(lecNum),
   id varchar2(20) CONSTRAINT student_id_fk REFERENCES student(id),
   attendance NUMBER,
   midtest NUMBER,
   endtest NUMBER,
   total varchar2(20),
   lecEval varchar2(100)
);
SELECT l.LECNUM , LECNAME , GRADE , SORT , s.LECEVAL, s.ID 
FROM LECTURE l , STDLECTURE s ,STUDENT s2
WHERE l.LECNUM = s.LECNUM
AND s.ID = s2.ID AND s.LECEVAL IS NULL
AND s2.id='20219009';
UPDATE STDLECTURE SET LECEVAL ='만족' WHERE id = '20219009' and lecNum = '1';
SELECT id, s.LECNUM ,s.LECEVAL FROM STDLECTURE s ;
DELETE FROM STDLECTURE ;
SELECT * FROM STDLECTURE s ;
INSERT INTO STDLECTURE VALUES (1001,'20191000',20,30,40,'A',null);
INSERT INTO STDLECTURE VALUES (1002,'20191001',20,30,40,'A',null);
SELECT l.LECNUM , LECNAME , SORT ,GRADE ,s.MIDTEST ,s.ENDTEST ,s.ATTENDANCE ,s.TOTAL
FROM LECTURE l ,STDLECTURE s  
WHERE l.LECNUM = s.LECNUM 
AND LECYEAR ='2022' AND SEMESTER ='1'
AND s.LECEVAL IS NULL ;

CREATE TABLE tuition(
   id varchar2(20) CONSTRAINT member_s_id_fk REFERENCES member_s(id),
   fileName varchar2(50),
   filePath varchar2(100)
);
INSERT INTO TUITION(id,FILENAME) VALUES ('20219009','tui_20201003.png');

CREATE TABLE professor_s(
   id varchar2(20) CONSTRAINTS member_s_id_fk2 REFERENCES member_s(id),
   majorNo NUMBER CONSTRAINT major_majorNo_fk2 REFERENCES major(majorNo),
   proName varchar2(30),
   proEmail varchar2(100),
   proPhone varchar2(30)
);
--교수정보
INSERT INTO PROFESSOR_S VALUES ('pro1010',10,'이용진','prolee@ssangyong.com','010-1234-1234');
INSERT INTO PROFESSOR_S VALUES ('pro1011',11,'권유라','progwon@ssangyong.com','010-1234-3154');
INSERT INTO PROFESSOR_S VALUES ('pro1012',12,'정기석','projung@ssangyong.com','010-1234-5475');
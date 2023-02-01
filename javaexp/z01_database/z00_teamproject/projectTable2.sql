
CREATE TABLE LIBRARY_BOOK(
   bnumber NUMBER PRIMARY KEY,
   isbn varchar2(20),
   bname varchar2(100),
   writer varchar2(200),
   publisher varchar2(50),
   cont varchar2(10),
   possible varchar2(10)
);

CREATE TABLE MEMBER(
   id varchar2(10) PRIMARY KEY,
   password varchar2(10),
   mname varchar2(20),
   civilNum varchar2(14) UNIQUE,
   point NUMBER,
   jdate DATE,
   auth varchar2(10)
);

CREATE TABLE APPLICATION(
   id varchar2(10) CONSTRAINT APPLICATION_id_FK REFERENCES MEMBER (id),
   bookname varchar2(100),
   writer varchar2(30)
);

CREATE TABLE LENDING(
   id varchar2(10) CONSTRAINT LENDING_id_FK REFERENCES MEMBER (id),
   bnumber NUMBER CONSTRAINT LENDING_bnumber_FK REFERENCES LIBRARY_BOOK (bnumber),
   ldate DATE,
   extension NUMBER
);

CREATE TABLE LLIST(
   ID varchar2(10) CONSTRAINT LLIST_ID_fk REFERENCES MEMBER(ID),
   bnumber NUMBER CONSTRAINT LLIST_bnumber_fk REFERENCES LIBRARY_BOOK(bnumber),
   ldate DATE 
);

CREATE TABLE RLIST(
   ID varchar2(10) CONSTRAINT RLIST_ID_fk REFERENCES MEMBER(ID),
   bnumber NUMBER CONSTRAINT RLIST_bnumber_fk REFERENCES LIBRARY_BOOK(bnumber),
   rdate DATE 
);

CREATE TABLE REVIEW(
   ID varchar2(10) CONSTRAINT REVIEW_ID_FK REFERENCES MEMBER(ID),
   bnumber NUMBER CONSTRAINT REVIEW_bnumber_fk REFERENCES LIBRARY_BOOK(bnumber),
   score NUMBER,
   contents varchar2(500)
);

CREATE SEQUENCE bnum_seq
   START WITH 1
   MINVALUE 1
   MAXVALUE 9999;

-- 도서 테이블에 도서추가
-- 000 인문
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791192300245,'마흔에 읽는 니체','장재형','유노북스','000','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791192300214,'과거가 남긴 우울 미래가 보낸 불안','김아라','유노북스','000','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788996991342,'미움받을 용기','기시미 이치로, 고가 후미타케','인플루엔셜','000','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788978496629,'초역 니체의 말','프리드리히 니체','삼호미디어','000','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791192488080,'지나치게 연결된 사회','마르쿠스 가브리엘','베가북스','000','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791140701728,'어두운 숲길을 단테와 함께 걸었다','마사 벡','더퀘스트','000','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191517286,'내 인생의 친구 공황장애','최구원','에이원북스','000','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788935213900,'다산,어른의 하루','조윤제','청림출판','000','가능');
-- 100 기술/공학
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788962630619,'침묵의 봄','레이첼 카슨','에코리브르','100','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791188679164,'땅은 잘못 없다','신민재','집','100','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791166542015,'2023 전기기사 5주완성','전기기사수험연구회','한솔아카데미','100','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788966769292,'2023 드론조종자격시험','BTB PD연구소','책과상상','100','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788970174952,'산업안전보건법','정진우','중앙경제','100','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788927444947,'최신 건설안전기술사 1','한경보 ','예문사','100','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788942906154,'제관 및 판금공학','박병우,하인섭','일진사','100','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791160078503,'10대가 알아야 할 프로그래밍과 코딩 이야기','우혁,이설아','한스미디어','100','가능');
-- 200 종교
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788938814623,'목적이 이끄는 삶','릭 워렌','디모데','200','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791165041434,'쓰담쓰닮 잠언','햇살콩','규장','200','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791187297413,'법륜 스님의 반야심경 강의','법륜','정토출판','200','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788936513269,'순전한 기독교','C. S. 루이스','홍성사','200','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788989590972,'현재 삶으로 돌아오다','임순희','침묵의향기','200','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788970715896,'성도들이 일으킨 혁명','마이클 왈쩌','대장간','200','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791192476599,'불교를 꿰뚫다','등현','불광출판사','200','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788932118369,'당신을 만나봤으면 합니다','허영엽','가톨릭출판사','200','가능');
-- 300 경제/경영
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191056372,'돈의 심리학','모건 하우절','인플루엔셜','300','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791130634432,'돈의 시나리오','김종봉','다산북스','300','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791186463628,'십대들이여, 주식을 탐하라','최무연','행복한미래','300','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791190067591,'위대한 세일즈맨의 원칙','주훈','치읓','300','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791188167128,'실전 투자의 정석','남석관','프롬북스','300','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788957821305,'현명한 투자자','벤저민 그레이엄','국일증권경제연구소','300','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788964621813,'반도체 삼국지','권석준','뿌리와이파리','300','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191517279,'생각을 바꿔야 주식이 보인다','이승조,정유리','새빛','300','가능');
-- 400 과학
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788983711892,'코스모스','칼 세이건','사이언스북스','400','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788950991913,'사소해서 물어보지 못했지만 궁금했던 이야기','사물궁이 잡학지식','아르테(arte)','400','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788938115515,'전자자기학','임헌찬','동일출판사','400','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788964945773,'직감하는 양자역학','마쓰우라 소','보누스','400','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791130693057,'다정한 물리학','해리 클리프','다산사이언스','400','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788932473901,'이기적 유전자(40주년 기념판)','리처드 도킨스','을유문화사','400','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791158083656,'장바구니에 담긴 화학','Ben Selinger,Russell Barrow','자유아카데미','400','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788997788507,'유전상담','대한의학유전학회','다니엘123','400','가능');
-- 500 컴퓨터/IT
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791190665476,'업무와 일상을 정리하는 새로운 방법 노션 Notion','이해봄','제이펍','500','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791192445076,'이토록 신기한 IT는 처음입니다','정철환','경이로움','500','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788942917501,'AI프로그래밍 기초와 실습','장은진','일진사','500','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791140701452,'코딩 개념 잡는 자바 코딩 문제집','앵겔 레너드','길벗','500','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788988474846,'SQL 자격검정 실전문제','한국데이터진흥원','한국데이터산업진흥원','500','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791162245651,'혼자 공부하는 파이썬','윤인성','한빛미디어','500','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191268263,'인공지능 시대의 주요기술','배정철','육일문화사','500','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791166751028,'정보공학과 문제해결','이종빈','북두출판사','500','가능');
-- 600 예술/대중문화
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191825145,'위로의 미술관','진병관','빅피시','600','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791155815403,'컬러의 방','폴 심프슨','윌북','600','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791134933968,'굿 아트 일러스트','워크디자인북 편집부','워크디자인북','600','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791169500708,'궁궐건축의 역학적기능 2','월드해피북스 편집부','월드해피북스','600','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191825145,'위로의 미술관','진병관','빅피시','600','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788932474755,'헤어질 결심 각본','정서경 , 박찬욱','을유문화사','600','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788961964210,'미술품 감정과 위작','송향선','아트북스','600','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791168870840,'조선공예전람회도록','조선공예연구회','한국학자료원','600','가능');
-- 700 외국어
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791165219727,'영어 감정 표현 사전','Sam Norris','길벗이지톡','700','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791166833069,'바로 쓰는 영어','셀리','넥서스','700','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791166833069,'바로 쓰는 영어','셀리','넥서스','700','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791140700424,'시나공 토익 950 실전 모의고사','김병기, 고경희, 박재형','길벗이지톡','700','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788965423737,'해커스 토익 실전 1200제 RC Reading 리딩','해커스어학연구소','해커스어학연구소','700','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788960499379,'거의 모든 행동 표현의 영어','서영조','사람in','700','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791166832093,'성공적인 회사생활을 위한 실전 비즈니스 영어','미소노 마키','넥서스','700','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791192428314,'중국어학 입문','오길용,김훈호','신아사','700','가능');
-- 800 소설
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788984374409,'당신, 거기 있어 줄래요?','기욤 뮈소','밝은세상','800','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788984373617,'아가씨와 밤','기욤 뮈소','밝은세상','800','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788998441012,'모순','양귀자','쓰다','800','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788954699914,'하얼빈','김훈','문학동네','800','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791158251284,'지와 사랑','헤르만 헤세','브라운힐','800','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791189770310,'안드로메다 구하기','김설아','아프로스미디어','800','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791162203620,'파과','구병모','위즈덤하우스','800','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788973814725,'멋진 신세계','올더스 헉슬리','소담출판사','800','가능');
-- 900 역사/문화
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191432848,'한니발','필립 프리먼','책과함께','900','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791164842254,'메트로폴리스','벤 윌슨','매일경제신문사','900','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191438406,'거꾸로 읽는 세계사','유시민','돌베개','900','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788932474649,'김헌의 그리스 로마 신화','김헌','을유문화사','900','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791138812832,'세기의 스파이','박상민','좋은땅','900','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791191131413,'식민지의 식탁','박현수','이숲','900','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9788932921372,'대서울의 길','김시덕','열린책들','900','가능');
INSERT INTO LIBRARY_BOOK VALUES (bnum_seq.nextval,9791160807844,'바다 인류','주경철','휴머니스트','900','가능');

-- 대출테이블에 대출내역추가
INSERT INTO LLIST values('abcdef99',35,to_date('2020-10-19','YYYY-MM-DD'));
INSERT INTO LLIST values('abcabc1',2,to_date('2018-05-20','YYYY-MM-DD'));
INSERT INTO LLIST values('user002',3,to_date('2018-12-25','YYYY-MM-DD'));
INSERT INTO LLIST values('user004',4,to_date('2020-10-10','YYYY-MM-DD'));
INSERT INTO LLIST values('prettygirl',5,to_date('2022-10-18','YYYY-MM-DD'));
INSERT INTO LLIST values('zzang1515',6,to_date('2021-01-26','YYYY-MM-DD'));
INSERT INTO LLIST values('strongman',7,to_date('2021-11-25','YYYY-MM-DD'));
INSERT INTO LLIST values('happyman',8,to_date('2021-12-19','YYYY-MM-DD'));
INSERT INTO LLIST values('abcdef99',9,to_date('2018-12-31','YYYY-MM-DD'));
INSERT INTO LLIST values('happyman',35,to_date('2022-09-05','YYYY-MM-DD'));
INSERT INTO LLIST values('taetae',35,to_date('2022-09-20','YYYY-MM-DD'));
INSERT INTO LLIST values('taetae',66,to_date('2022-05-20','YYYY-MM-DD'));
INSERT INTO LLIST values('happyman',60,to_date('2022-09-11','YYYY-MM-DD'));
INSERT INTO LLIST values('taetae',72,to_date('2022-10-01','YYYY-MM-DD'));
INSERT INTO LLIST values('taetae',44,to_date('2022-10-22','YYYY-MM-DD'));
-- 반납테이블에 반납내역추가
INSERT INTO RLIST values('abcdef99',35,to_date('2020-10-21','YYYY-MM-DD'));
INSERT INTO RLIST values('abcabc1',2,to_date('2018-05-29','YYYY-MM-DD'));
INSERT INTO RLIST values('user002',3,to_date('2018-12-30','YYYY-MM-DD'));
INSERT INTO RLIST values('user004',4,to_date('2020-10-20','YYYY-MM-DD'));
INSERT INTO RLIST values('prettygirl',5,to_date('2022-10-21','YYYY-MM-DD'));
INSERT INTO RLIST values('zzang1515',6,to_date('2021-01-28','YYYY-MM-DD'));
INSERT INTO RLIST values('strongman',7,to_date('2021-12-01','YYYY-MM-DD'));
INSERT INTO RLIST values('happyman',8,to_date('2021-12-28','YYYY-MM-DD'));
INSERT INTO RLIST values('abcdef99',9,to_date('2019-01-06','YYYY-MM-DD'));
INSERT INTO RLIST values('happyman',35,to_date('2022-09-15','YYYY-MM-DD'));
INSERT INTO RLIST values('taetae',35,to_date('2022-09-27','YYYY-MM-DD'));
INSERT INTO RLIST values('taetae',66,to_date('2022-05-30','YYYY-MM-DD'));
INSERT INTO RLIST values('happyman',60,to_date('2022-09-22','YYYY-MM-DD'));
INSERT INTO RLIST values('taetae',72,to_date('2022-10-10','YYYY-MM-DD'));
INSERT INTO RLIST values('taetae',44,to_date('2022-10-30','YYYY-MM-DD'));
-- 도서신청테이블에 신청도서추가
INSERT INTO APPLICATION values('strongman','철학자와 달리기','마크 롤랜즈'); --유노책주,9791192300320,000
INSERT INTO APPLICATION values('abcabc1','자이언트 임팩트','박종훈'); --웅진지식하우스,9788901266107,300
INSERT INTO APPLICATION values('minu05','아주개인적인 한국사','모지현');--더좋은책,9788998015411,900
-- 현재대출중인 도서
INSERT INTO LENDING values('minu05',5,to_date('2022-10-10','YYYY-MM-DD'),0);
INSERT INTO LENDING values('taetae',1,to_date('2022-10-05','YYYY-MM-DD'),0);
-- 현재 대출중인 도서 대출내역에 추가
INSERT INTO LLIST values('minu05',5,to_date('2022-10-10','YYYY-MM-DD'));
INSERT INTO LLIST values('taetae',1,to_date('2022-10-05','YYYY-MM-DD'));

SELECT * FROM LIBRARY_BOOK;
SELECT * FROM MEMBER;
SELECT * FROM APPLICATION;
SELECT * FROM LENDING;
SELECT * FROM LLIST;
SELECT * FROM RLIST;
SELECT * FROM REVIEW;

SELECT id, bnumber, ldate, ldate+14 duedate, sysdate,
	CASE
	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))
	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,
	CASE
	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0
	ELSE 300*(floor(sysdate-(ldate+14)))
	end charge
FROM lending;

SELECT id, bnumber, ldate, ldate+14 duedate, sysdate, extension,
	CASE
	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))
	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,
	CASE
	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0
	ELSE 300*(floor(sysdate-(ldate+14)))
	end charge
FROM lending
WHERE sysdate > ldate+14;

SELECT * 
FROM LIBRARY_BOOK lb 
WHERE BNUMBER = '5'
OR BNAME LIKE '%'||'다'||'%';

SELECT id, bnumber, ldate, ldate+14 duedate, sysdate,
	CASE
	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))
	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,
	CASE
	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0
	ELSE 300*(floor(sysdate-(ldate+14)))
	end charge
FROM lending
WHERE id = 'taetae'
AND bnumber = 1;

SELECT BNUMBER , COUNT(BNUMBER)
FROM RLIST l 
GROUP BY BNUMBER ;

SELECT max(cnt)
FROM LIBRARY_BOOK l, (SELECT BNUMBER , COUNT(BNUMBER) cnt 
FROM RLIST l 
GROUP BY BNUMBER ) b;


SELECT decode(mod(e.empno,2),0,'짝','홀') div, e.*
FROM emp e,(
	SELECT mod(empno,2) div, max(sal) msal
	FROM emp 
	GROUP BY mod(empno,2)
) e1 
WHERE mod(e.empno,2) = e1.div
AND e.sal = e1.msal;

SELECT * FROM RLIST r ;
SELECT * FROM LIBRARY_BOOK lb ;
SELECT * FROM LENDING l ;
SELECT * FROM LLIST l ;

SELECT l.id, l.bnumber, ldate, rdate
FROM LLIST l ,RLIST r 
WHERE l.ID = r.ID(+) 
AND l.BNUMBER = r.BNUMBER(+);
AND l.BNUMBER = 3; -- rlist,llist join

SELECT l.id, l.bnumber, l.ldate, extension
FROM LLIST l , LENDING l2 
WHERE l.ID = l2.ID 
AND l.BNUMBER =l2.BNUMBER 
AND l.LDATE = l2.LDATE ;

SELECT * FROM LLIST l2 ;
SELECT max(count(bnumber))
FROM LLIST l 
WHERE to_char(ldate,'YYYY') = 2022
GROUP BY BNUMBER ;

SELECT *
FROM LLIST l ;
SELECT count(bnumber)
FROM LLIST l 
GROUP BY BNUMBER ;

SELECT id, bnumber, ldate, extension, ldate+14 duedate, sysdate,
	CASE
	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))
	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,
	CASE
	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0
	ELSE 300*(floor(sysdate-(ldate+14)))
	end charge
FROM lending;
WHERE bnumber = 1;

SELECT * FROM LENDING l ;
SELECT * FROM LIBRARY_BOOK lb ;
SELECT * FROM "MEMBER" m ;

UPDATE lending 
SET EXTENSION = 1
WHERE id = ?
AND BNUMBER = ?;

SELECT * FROM LIBRARY_BOOK WHERE BNUMBER =?;
UPDATE LIBRARY_BOOK SET POSSIBLE = '불가능' WHERE BNUMBER =1;
INSERT INTO LENDING VALUES (?,?,sysdate,0);
INSERT INTO LLIST VALUES (?,?,sysdate);

SELECT id, bnumber, ldate, (ldate+14)+extension*7 duedate, sysdate, extension,
	CASE
	WHEN -1*ceil((ldate+14)-sysdate) > 0 THEN 'D+'||floor(sysdate-(ldate+14))
	ELSE 'D'||-1*ceil((ldate+14)-sysdate) END days,
	CASE
	WHEN 300*(floor(sysdate-(ldate+14))) < 0 THEN 0
	ELSE 300*(floor(sysdate-(ldate+14)))
	end charge
FROM lending;
SELECT *
FROM LENDING l ;
UPDATE LENDING SET EXTENSION = 1
WHERE BNUMBER = ?
AND (ldate+14)>sysdate;

SELECT * FROM RLIST r ;
SELECT id, BNUMBER  
FROM RLIST r 
WHERE to_char(rdate,'YYYY') = 2022;

SELECT id, count(id), RANK () OVER (ORDER BY count(id) DESC) RANK
FROM RLIST r 
WHERE to_char(rdate,'YYYY') = 2022
GROUP BY id;

SELECT id
FROM (SELECT id, count(id), RANK () OVER (ORDER BY count(id) DESC) RANK
FROM RLIST r 
WHERE to_char(rdate,'YYYY') = 2022
AND to_char(rdate,'MM') = 10
GROUP BY id) rk 
WHERE rk.RANK = 1; -- 이달의 독서왕

SELECT * FROM RLIST r2 ;
SELECT BNUMBER ,count(BNUMBER), RANK () OVER (ORDER BY count(BNUMBER) DESC) RANK
FROM RLIST r
GROUP BY BNUMBER;

SELECT bnumber 
FROM (SELECT BNUMBER ,count(BNUMBER), RANK () OVER (ORDER BY count(BNUMBER) DESC) RANK
FROM RLIST r
GROUP BY BNUMBER) rk 
WHERE rk.RANK = 1;

SELECT * FROM 
(SELECT id,count(id), to_char(sysdate, 'YYYY-MM') FROM RLIST
WHERE to_char(sysdate, 'YYYY-MM')=to_char(rdate,'YYYY-MM')
GROUP BY id ORDER BY count(id) desc)
WHERE rownum =1; --이달의 독서왕

SELECT * 
FROM (SELECT bnumber 
FROM RLIST
GROUP BY BNUMBER 
ORDER BY count(BNUMBER) DESC)
WHERE rownum = 1; -- 베스트도서

DELETE FROM RLIST r WHERE id='lucky';

SELECT * FROM LENDING WHERE BNUMBER =1;


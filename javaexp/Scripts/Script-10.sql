-- 파이썬 a10_database/a03_insert
SELECT * FROM EMP;
SELECT * FROM EMP100;
SELECT * FROM DEPT;
SELECT * FROM DEPT100;
CREATE TABLE EMP01
AS SELECT * FROM EMP;
CREATE TABLE DEPT01
AS SELECT * FROM DEPT;
SELECT * FROM EMP01;
SELECT * FROM DEPT01;
INSERT INTO emp01 values(7999,'마길동',
'대리',7902,to_date('2023-01-01','YYYY-MM-DD'),
3500,100,10);
/*
INSERT INTO emp01 values({},'{}',
'{}',{},to_date('{}','YYYY-MM-DD'),
{},{},{})
 */
COMMIT;
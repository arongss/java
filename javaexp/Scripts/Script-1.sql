SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno 
FROM emp01
WHERE ename LIKE '%'||''||'%'
AND job LIKE '%'||''||'%'
AND sal BETWEEN 1000 AND 2000
;
-- 매개변수에 의해 검색의 조건을 처리하는 기능메서드 만들기
SELECT * 
FROM emp01
WHERE ename LIKE '%'||'O'||'%'
AND loc LIKE '%'||''||'%';

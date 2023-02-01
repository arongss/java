/*
--2022-09-30
--[1단계:개념] 1. 그룹함수의 기본형식을 예제를 통해 설명하세요 
--select 기준컬럼, 그룹함수(컬럼)
--from 테이블명
--[where]
--group by 그룹컬럼
--having 그룹함수를 적용한 결과를 조건 처리
--[1단계:개념] 2. 그룹함수의 종류를 기술하세요.
--1) count() : 데이터의 건수, 행의 갯수
--2) max() : null을 제외한 모든 행의 최대값
--3) min() : null을 제외한 모든 행의 최소값
--4) sum() : null을 제외한 모든 행의 합
--5) avg() : null을 제외한 모든 행의 평균값
--6) stddev() : null을 제외한 모든 행의 표준편차
--7) variance() : null을 제외한 모든 행의 분산 값
--[1단계:코드] 3. 직책별 가장에 최근에 입사한 사원의 입사일을 출력하세요.
SELECT job, max(hiredate)
FROM emp 
GROUP BY job;
--[1단계:코드] 4. 직책별 평균급여가 2000이상인 경우를 출력하세요.
SELECT job, avg(sal)
FROM emp
GROUP BY job 
HAVING avg(sal)>=2000;
--[1단계:코드] 5. 월별로 가장 급여가 낮은 급여를 출력하세요.
SELECT to_char(hiredate,'MM') 월별, min(sal) 가장낮은급여
FROM emp
GROUP BY to_char(hiredate,'MM');
--[1단계:코드] 6. 사원번호가 짝수/홀수를 청/홍팀으로 나누고 청/홍팀 평균급여와 사원수를 출력하세요.
SELECT decode(mod(empno,2),0,'청','홍') 팀, avg(sal) 평균급여, count(ename) 사원수
FROM emp
GROUP BY decode(mod(empno,2),0,'청','홍');
--[1단계:코드] 7. 분기별, 입사 사원수의 수가 2명이상인 분기기준으로 분기 별의 최고 급여를 출력하세요.
SELECT to_char(hiredate,'Q') 분기, count(ename) 입사사원수, max(sal) 최고급여
FROM emp
GROUP BY to_char(hiredate,'Q')
HAVING count(ename)>=2
ORDER BY 분기;
--[1단계:개념] 8. 테이블의 조인의 기본 형식을 기술하세요.
--select 테이블1.컬럼명, 테이블2.컬럼명, ...
--from 테이블1, 테이블2 
--where 테이블1.공통컬럼 = 테이블2.공통컬럼
--[1단계:코드] 9. 입사일이 2~5월 사이인 사원의 부서명, 사원명, 입사일을 출력하세요
SELECT to_char(hiredate, 'MM') 입사일, dname, ename, hiredate
FROM emp e, dept d
WHERE e.deptno = d.deptno 
AND to_char(hiredate, 'MM')>=2
AND to_char(hiredate, 'MM')<=5;
--[1단계:코드] 10. 1/4분기에 입사하고, 연봉이 1000이상인 사원의 사원명, 
--      입사일, 입사분기, 부서명, 부서위치를 출력하세요
SELECT ename, hiredate, to_char(hiredate,'Q') 입사분기, dname, loc, sal
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal>=1000
AND to_char(hiredate,'Q')=1;
--[1단계:코드] 11. 부서위치(LOC)별, 최고 급여가 2000이상인 경우를 출력하세요.
SELECT loc, max(sal)
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal>=2000
GROUP BY loc;

== 평가대비(데이터베이스) 객관식 문제 ==
1. 어떤 데이터 모델로 데이터를 저장하는지를 나타내는 NoSQL의 종류가 아닌 것은?
1) 키-값(key-value) 데이터베이스
2) 문서 기반(document-based) 데이터베이스
3) 인덱스 기반(index-based) 데이터베이스
4) 컬럼 기반(column-based) 데이터베이스
==> 키-값 데이터베이스, 문서기반 데이터베이스, 컬럼기반 데이터베이스, 그래프기반 데이터베이스
2. NoSQL 데이터의 특징이 아닌 것은?
1) ACID(원자성, 일관성, 격리성, 지속성)를 위한 트랜잭션 기능을 제공
2) 빠른 속도로 생성되는 대량의 비정형 데이터를 저장하고 처리 
3) 저렴한 비용으로 여러 대의 컴퓨터에 데이터를 분산∙저장∙처리 
4) 대부분 오픈 소스로 제공
==> 빠른 속도로 생성되는 대량의 비정형 데이터를 저장하고 처리하기위해
	ACID(원자성, 일관성, 격리성, 지속성)을 위한 트랜잭션 기능을
	제공하지 않는 대신 저렴한 비용으로 여러 대의 컴퓨터에 데이터를
	분산.저장.처리하는 것이 가능한 데이터베이스이다.
3. 해당하는 분석기술이 맞게 매칭된 것은 무엇인가?
1) 텍스트 마이닝(text mining) - SNS, 블로그, 게시판 등에 기록된 사용자들의 의견을 수집
2) 오피니언 마이닝(opinion mining) - 제품이나 서비스에 대한 긍정, 부정, 중립 등의 선호도를 추출
3) 소셜 네트워크 분석(social network analysis) - 반정형 또는 비정형 텍스트에서 자연어 처리 기술
4) 군집 분석(cluster analysis) - 네트워크에 나타난 영향력, 관심사, 성향, 행동 패턴 등을 추출
==> - 텍스트 마이닝(text mining):반정형 또는 비정형 텍스트에서 자연어 처리 기술로 정보를 추출하고 가공함
	- 오피니언 마이닝(opinion mining):SNS, 블로그, 게시판 등에 기록된 사용자들의 의견을 수집하고 분석하여,
		제품이나 서비스에 대한 긍정, 부정, 중립 등의 선호도를 추출
	- 소셜 네트워크 분석(social network analysis):소셜 네트워크의 연결 구조나 강도 등을 바탕으로 소셜 네트워크에 나타난 
		영향력, 관심사, 성향, 행동 패턴 등을 추출
	- 군집 분석(cluster analysis):데이터간의 유사도를 측정한 후 이를 바탕으로 특성이 비슷한 데이터를 
		합쳐가면서 최종적으로 유사 특성의 데이터 집합을 추출
4. 빅데이터의 기본 특징가 3V이 아닌 것은?
1) Volume
2) Velocity
3) Veracity
4) Veriety
==> Volume 데이터량, Velocity 속도, Variety 다양성

정답:3,1,2,3
 * */
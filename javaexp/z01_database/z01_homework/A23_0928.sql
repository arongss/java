/*
2022-09-28
[1단계:코드] 1. salgrade 테이블 전체를 조회하고, 해당 컬럼을 조회해보세요.
SELECT trunc(losal,-2), trunc(hisal,-2)
FROM salgrade;
[1단계:개념] 2. lpad, rpad의 기본형식과 예제를 기술하세요
1. 전체 문자의 크기를 지정하고, 그 크기보다 못할 때,
	왼쪽/오른쪽에 특정한 문자를 추가하게 처리하는 기능을 말한다.
2. 형식
	lpad(데이터, 크기, 덧붙일문자열)
	rpad(데이터, 크기, 덧붙일문자열)
[1단계:코드] 3. 사원명을 10자리 기준 '&'는 왼쪽에, 직책명을 10자리기준 '!' 오른쪽으로 덧붙여 설정하여 출력하세요.
SELECT ename, lpad(ename,10,'&') 사원명, job, rpad(job,10,'!') 직책명
FROM emp;
[1단계:개념] 4. trim 처리 함수 3가지를 기술하고, 해당 옵션에 대하여 기술하세요.
1) ltrim(데이터, '제거할문자') : 왼쪽에 제거할 문자를 없애주는데 반복적으로 처린된다.
2) rtrim(데이터, '제거할문자') : 오른쪽에 제거할 문자를 없애주는데 반복적으로 처리된다.
3) trim('양쪽에삭제할문자' from 데이터) : 오른쪽/왼쪽 끝에 제거할 문자가 있을 때 한번에 제거 처리 한다.
[1단계:개념] 5. 숫자형 함수에서 소숫점 이하에 대한 처리를 예제와 함께 기술하세요.
1) round : 지정한 소숫점 자리로 반올림 처리를 해주는 함수
	round(데이터, 자릿수)
	자리수 : + 값은 소숫점 이하 자리수를 말하고,
		   - 값은 10단위(-1), 100단위(-2)로 반올림 처리를 하는 것을 말한다.
	ex) round(45.325,2) ==> 45.33
		round(2543.25,-2) ==> 2500
2) trunc : 지정한 소솟점 자리까지 남기고 절삭처리
	trunc(데이터, 자릿수)
		자리수는 round와 동일하게 해당 자리수 만큼 절삭처리해준다.
3) ceil(데이터) : 해당 데이터를 정수형으로 올림 처리한다.
4) floor(데이터) : 해당 데이터를 정수형으로 내림 처리한다.
[1단계:코드] 6. 급여를 부서번호(10==> 10%, 20==> 20%..)기준으로 인상을 하기로 했다.
         현재 급여와 인상된 급여를 처리하되 100자리 단위로 절삭하여, 사원명과 함께 출력하세요.
SELECT ename, trunc(sal,-2) 현재급여, trunc(sal+(sal*(deptno/100)),-2) 인상된급여
FROM emp;
[1단계:코드] 7. 사번을 기준으로 홀수인 경우 급여기준으로 보너스를 50% 추가하여 급여를 계산하기로 했다.
         이름, 사번, 구분, 급여, 총급여   를 출력하세요.
SELECT ename 이름, empno 사번, mod(empno,2) 구분, sal 급여, sal*1.5 총급여
FROM emp
WHERE MOD(empno,2)=1;
[1단계:개념] 8. 날짜 처리 단위별(초,분,시,일) 정리하고 예제를 dual 테이블로 나타내세요.
날짜 데이터 단위
	1/1000(초) ==> 1초 ==> (60)1분 ==> (60)1시간
	==> (24)1일 ==> (28,29,30,31)1월 ==> (12)1년
SELECT sysdate FROM dual;
[1단계:개념] 9. 날짜형 함수의 종류에 대하여 기술하세요.
1) sysdate : 현재 날짜와 시간을 나타낸다.
2) months_between(날짜1, 날짜2) : 날짜 사이의 개월 수를 표시한다.
3) add_months(날짜, 추가 또는 이전개월수) : 특정한 날짜를 기준으로 개월 수를 추가하여, 해당 이후 날짜는 해당 이전 개월수에 
	날짜를 처리할 때, 사용된다.
4) next_day(날짜데이터, '요일') : 해당 기준일로 명시된 요일에 가장 빠른 날짜.
5) last_day(기준일) : 해당 날짜가 속한 달의 마지막 날짜
[1단계:코드] 10. 사원명과 함께 근무연한을 @@년 @@개월 @@일이라고 표시하세요. (여러가지 중첩 함수 이용)
SELECT ename, 
		floor(months_between(sysdate, hiredate)/12)||'년'|| 
		MOD(floor(months_between(sysdate, hiredate)/12),12)||'개월'||
		MOD(floor(sysdate-hiredate),30)||'일' "@@년 @@개월 @@일"
FROM emp;
[1단계:코드] 11. @@월 @@째 수요일 등을 미국에서 쓰이는 공휴일 처리 방식인, 한국의 선거일의
      경우 임기종료 @@주째 전 수요일같이 날짜를 요일에 대한 날짜를 계산할 때 사용된다.
         오늘로 부터 3개월 후 해당월의 3번째 수요일을 출력하세요.
SELECT next_day(next_day(next_day(add_months(sysdate,3),'수'),'수'),'수') "3번째수요일"
FROM dual;
[1단계:코드] 12. 사원의 첫급여일이 다음달 첫 날로 지정하였다. 급여일과 입사월의 근무일수를 출력하세요..  
SELECT last_day(hiredate)+1 급여일, last_day(hiredate)+1-hiredate 근무일수
FROM emp;

== 평가대비(데이터베이스) 객관식 문제 ==
1. 데이터베이스에 저장되는 데이터 구조와 제약조건을 정의한 것을 무엇이라고 하는가 ?
1) 스키마
2) 레코드
3) 시스템 카타로그
4) 인스턴스
==> 스키마 : 데이터베이스에 저장되는 데이터 구조와 제약조건을 정의한 것
2. 데이터베이스를 쉽게 이해하고 이용할 수 있도록 하나의 데이터베이스를 관점에 따라 세 단계가 아닌 것은?
1) 외부 단계
2) 논리 단계
3) 개발 사용자 관점
4) 내부 단계
==> 외부 단계 : 개별 사용자 관점
	개념 단계 : 조직 전체의 관점
	내부 단계 : 저장 장치의 관점
3. 개념 스키마에 해당하는 내용을 나타내는 것은?
1) 각 사용자가 생각하는 데이터베이스의 모습, 즉 논리적 구조로 사용자마다 다름
2) 조직 전체의 관점에서 생각하는 데이터베이스의 모습
3) 서브 스키마(sub schema)라고도 함
4) 전체 데이터베이스가 저장 장치에 실제로 저장되는 방법을 정의한 것
==> 1,3번은 외부스키마에 대한 설명이고, 4번은 내부스키마에 대한 설명이다.
정답:1,2,2
 * */
/*
2022-09-28 - 정답
[1단계:코드] 6. 급여를 부서번호(10==> 10%, 20==> 20%..)기준으로 인상을 하기로 했다.
         현재 급여와 인상된 급여를 처리하되 100자리 단위로 절삭하여, 사원명과 함께 출력하세요.
부서번호를 기준으로 %처리 했으므로 %는 실제 데이터는 1/100이므로, /100으로 연산처리
인상분은 현재 급여 * 부서번호/100 으로 처리
최종금액은 급여 + (인상분)
100자리단위로 절삭은 trunc(금액,-2)
SELECT ename, sal 현재급여, deptno||'%' 인상율, deptno/100,
	(sal*deptno/100) 인상액,
	sal+(deptno/100) "인상급여",
	trunc(sal+(deptno/100),-2) "인상급여(최종)"
FROM emp;

[1단계:코드] 10. 사원명과 함께 근무연한을 @@년 @@개월 @@일이라고 표시하세요. (여러가지 중첩 함수 이용)
1. 전체근무개월수 현재일과 입사일을 차를 통해 도출:
		floor(months_between(sysdate, hiredate))
2. 근무 연한 계산 위 전체근무개월수를 /12로 처리
		floor(months_between(sysdate, hiredate)/12)
3. 연도를 제외한 근무 개월수 위 전체 근무개월수를 mod(전체근무개월수, 12)
		mod(floor(months_between(sysdate, hiredate)/12),12)
4. 연도/근무개월수를 제외한 날짜계산
	  전체 근무개월수 : 나머지 날짜를 뺀 순수한 개월수만 처리한 데이터
	  그러므로, 해당 개월수에 날짜는 나머지 일수가 포함되어 있지 않다
	식의 도출과정
	  1) 전체개월수 산정(현재일과 입사일) : floor(months_between(sysdate, hiredate))
	  2) 입사일로부터 전체개월 수 : 남은 날짜를 제외한 개월수에 대한 날짜를 처리
			==> add_months(입사일, 전체개월수)
			
			2021/09/14 : 입사를 했으면, 
			months_between(sysdate, hiredate) ==> 12.5
			현재날짜가 2022/09/29
			나머지날짜를 구할려면 일단, 월단위로 처리되는 날짜(2021/09/14)를 먼저 구하고
			sysdate - 구한날짜 : 실제 나머지 근무일수가 처리.
				sysdate - add_months(2021/09/14, 개월수)
				현재날	  2022/09/14
	  3) 현재날짜와 위 남은 날짜가 포함되지 않는 날짜를 빼주면
			근무연도/근무월을 뺀 나머지 날짜를 도출할 수 있다.
SELECT ename, hiredate,
		floor(months_between(sysdate, hiredate)) "전체개월수",
		floor(months_between(sysdate, hiredate)/12) "근무연한",
		mod(floor(months_between(sysdate, hiredate)),12) "월",
		add_months(hiredate, floor(months_between(sysdate, hiredate))) "날짜1",
		floor(sysdate-add_months(hiredate, floor(months_between(sysdate, hiredate)))) "날짜2"
FROM emp;
-- 위와 같이 연산된 내용이 중복적이고 복잡한 내용은 inlineView라는 개념으로 효과적으로 처리될 수 있다.
SELECR *
FROM (
	SELECT ename, hiredate, floor(months_between(sysdate,hiredate)) MM
	FROM emp
);	
SELECT ename, floor(mm/12)||'년 '||mod(mm,12)||'개월 '||
	floor(sysdate - add_months(hiredate, mm))||'일' "근무기간"
FROM (
	SELECT ename, hiredate, floor(months_between(sysdate, hiredate)) mm
	FROM emp
);

[1단계:코드] 12. 사원의 첫급여일이 다음달 첫 날로 지정하였다. 급여일과 입사월의 근무일수를 출력하세요..  
SELECT ename, hiredate,
		last_day(HIREDATE)+1 "급여일",
		last_day(HIREDATE)+1-hiredate "근무일수"
FROM emp;
 * */


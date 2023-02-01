/*
2022-09-29
[1단계:개념] 1. 명시적 형변환 함수 3가지를 기본 예제와 함께 기술하세요
- to_char(컬럼/데이터, '변환형식') : 숫자/날짜 타입을 문자열로 변환해주는 함수이다.
- to_number(컬럼/데이터) : 날짜/문자 타입을 숫자로 변환해주는 함수
- to_date(컬럼/데이터) : 문자/숫자 타입을 날짜로 변환해주는 함수
[1단계:코드] 2. 2/4분기에 입사한 사원을 다음 양식으로 표현하세요
             @@@ -  @/4분기 공채입사자  @@월 @@째주 입사
SELECT ename||' - '||to_char(hiredate,'Q"/4분기 공채입사자 "MM"월 "W"째주 입사') "show"
FROM emp
WHERE to_char(hiredate,'Q')=2;
[1단계:코드] 3. 분기별 입사자에게 급여의 30%,60%,90%,120%로 각가 보너스 금액을 산정할 때,
             입사자 분기 보너스(%) 급여 보너스 급여+보너스 를 출력하세요(decode,case문 사용X)
SELECT ename, to_char(hiredate,'Q') 분기, to_char(hiredate,'Q')*30||'%' "보너스%", 
		sal, sal*to_char(hiredate,'Q')*0.3 보너스, sal+sal*to_char(hiredate,'Q')*0.3 "급여+보너스"
FROM emp;
[1단계:개념] 4. 숫자 처리 기본형식을 예제와 함께 기술하세요.
to_number('숫자형문자열')
SELECT '25'+25 "자동형변환", to_number('25')+25 "명시적형변환" FROM dual;
[1단계:개념] 5. 명시적 형변환과 묵시적 형변환의 차이점을 기술하세요.
묵시적 데이터 타입의 변환 : 조건문에서 정확하게 해당 type을 맞게 설정하지 않더라도 결과를 검색해주는 경우가 있는데 
	이것은 오라클 시스템 내부적으로 타입을 변환했기 때문이다.
명시적 데이터 타입의 변환 : 일반적으로 데이터 베이스는 변환함수를 이용하여 데이터 타입을 변환하여 효과적으로 처리한다.
[1단계:코드] 6. 사원정보의 입사일에서 2000-01-01/2010-06-01/2020-12-31까지의 입사연한/개월 수를 표현하세요
SELECT ename, hiredate,
		floor(months_between(to_date('2000-01-01', 'YYYY-MM-DD'), hiredate)/12) "입사 연한1",
		mod(floor(months_between(to_date('2000-01-01', 'YYYY-MM-DD'), hiredate)),12) "개월 수1",
		floor(months_between(to_date('2010-06-01', 'YYYY-MM-DD'), hiredate)/12) "입사 연한2",
		mod(floor(months_between(to_date('2010-06-01', 'YYYY-MM-DD'), hiredate)),12) "개월 수2",
		floor(months_between(to_date('2020-12-31', 'YYYY-MM-DD'), hiredate)/12) "입사 연한3",
		mod(floor(months_between(to_date('2020-12-31', 'YYYY-MM-DD'), hiredate)),12) "개월 수3"
FROM emp;
[1단계:개념] 7. null관련 함수를 기본 예제와 함께 기능을 기술하세요
1. nvl(데이터, null값일 때 처리할 데이터)
-해당 데이터가 null값일 때, 처리할 데이터를 설정함으로 null에 대한 연산 처리를 하는 것을 말한다.
2. nvl2(데이터, null아닐때처리, null일때 처리)
- comm이 null일 때는 100, null이 아닐 때는 comm에서 10%더 추가해서 결과값 처리
3. nullif(데이터1, 데이터2)
- 두 개의 매개변수로 받는 데이터를 비교하여 동일하면 null을 반환하고, 동일하지 않으면 첫버째 데이터1을 반환하는 함수를 말한다.
[1단계:코드] 8. 회사에서 일괄보너스 지급 금액이 60이라고 정하는데, 연봉의 5%(10단위로 절삭)와 같으면 60, 다르면 연봉의 5%로 처리하는 sql을 작성하세요.
SELECT ename, sal, comm, trunc(sal*12*0.05,-1) 기준,
	nvl2(NULLIF(trunc(sal*12*0.05,-1),60),comm,60) "보너스"
FROM emp;
[1단계:코드] 9. 입사일의 분기(1~4)를 기준으로 출장으로 가기로 했다. 1: 부산,  2: 광주, 3:제주  4: 하와이 
                사원명, 입사일, 분기, 출장지 를 출력하세요
SELECT ename, hiredate, to_char(hiredate,'Q') 분기, 
	decode(to_char(hiredate,'Q'),1,'부산',2,'광주',3,'제주','하와이') 출장지
FROM emp;
[1단계:코드] 10. 급여의 구간별로 등급을 만들어, 사원번호, 이름, 급여, 등급을 출력하세요
		ex) 0~999 'A', 1000~2999 'B'...
1) decode문 처리
SELECT empno, deptno, ename, sal, decode(sal, sal<1000,'A',sal<3000,'B','C') 등급
FROM emp;
2) case문 처리
SELECT empno, deptno, ename, sal,
	CASE WHEN sal<1000 THEN 'A'
		 WHEN sal<3000 THEN 'B'
		 ELSE 'C'
	END 등급
FROM emp;

== 평가대비(오라클) 객관식 문제 ==
1. 오라클의 to_char()이용하여 데이터 변환 타입이 아닌 것은?
1) 문자열 2) 숫자형 3) 불형 4) 날짜형
==> 문자, 숫자, 날짜 변환 타입이다.
2. 문자열 형변환 형식이 적절하지 않는 것은?
1) 세기 - CC
2) 월 - MMM
3) 날짜 - D
4) 분기 - Q
==> MM/MONTH/MON : 월표기
3. 빅데이터 처리 대상이 아닌 것은?
1) 저장기술
2) 분석기술
3) 표현기술
4) 실용기술
==> 저장기술, 분석기술, 표현기술
4. DIKW 계층 구조에 해당하는 것이 아닌 것은?
1) 문서
2) 데이터
3) 정보
4) 지혜
==> 데이터,정보,지식,지혜
5. 오라클에서 to_char(데이터,'옵션')으로 시간을 표현하는 옵션은 무엇인가?
1) YYYY
2) DAY
3) MI
4) Q
==> MI : 분 표시 형식
정답 : 3,2,4,1,3
 * */
/* 정답
[1단계:코드] 3. 분기별 입사자에게 급여의 30%,60%,90%,120%로 각가 보너스 금액을 산정할 때,
             입사자 분기 보너스(%) 급여 보너스 급여+보너스 를 출력하세요(decode,case문 사용X)
		1. 분기 처리 to_char(hiredate,'Q') : 1, 2, 3, 4
		2. 보너스 표시 1, 2, 3, 4 * 30 ==> 30, 60, 90, 120 
		3. 보너스 : sal * (1, 2, 3, 4) * 0.3 ==> 0.3, 0.6, 0.9, 1.2
		4. 급여 + 보너스 : sal + 보너스
SELECT ename, 분기, sal, q*30||'%' "보너스(%)", sal*q*0.3 "보너스",
		sal + (sal*q*0.3) "합산(급여+보너스)"
FROM (
	SELECT ename, sal, to_char(hiredate,'Q') "분기", 
			to_number(to_char(hiredate,'Q')) q
	FROM emp
);
[1단계:코드] 6. 사원정보의 입사일에서 2000-01-01/2010-06-01/2020-12-31까지의 입사연한/개월 수를 표현하세요
		1) 문자열을 날짜형으로 변환 to_date('2000-01-01','YYYY-MM-DD') "근무1"
		2) 전체 개월수 표시 months_between(기준날짜, hiredate)
		3) 근무연한 : floor(전체 개월수/12) - 나머지 개월수는 절삭처리.
		4) 근무연한을 뺀 근무개월수 : mod(전체 개월수, 12) - mod는 나머지를
			처리하기에 몫은 근무연한을 빠지고, 나머지인 개월 수만 추출된다.
SELECT ename, to_char(hiredate,'YYYY"년"MM"월"DD"일"') 입사일,
		floor(ch1/12)||'년 '||mod(floor(ch1),12)||'개월' "2000-01-01까지 근무",
		floor(ch2/12)||'년 '||mod(floor(ch2),12)||'개월' "2010-06-01까지 근무",
		floor(ch3/12)||'년 '||mod(floor(ch3),12)||'개월' "2020-12-31까지 근무"
FROM ( 
	SELECT ename, hiredate,
		months_between(to_date('2000-01-01','YYYY-MM-DD'),hiredate) ch1,
		months_between(to_date('2010-06-01','YYYY-MM-DD'),hiredate) ch2,
		months_between(to_date('2020-12-31','YYYY-MM-DD'),hiredate) ch3
	FROM emp);
[1단계:코드] 8. 회사에서 일괄보너스 지급 금액이 60이라고 정하는데, 연봉의 5%(10단위로 절삭)와 같으면 60, 다르면 연봉의 5%로 처리하는 sql을 작성하세요.
		1. 연봉의 5%를 10단위 처리 : trunc(sal*0.05,-1)
		2. 기준금액 60과 비교 처리 : nullif(연봉5%,60) 같으면 null, 다르면 연봉5%
		3. 같으면 60, 다르면 연봉의 5%로 : 
			nvl(데이터, null일때 처리) : 
					같으면(null) 특정한 데이터 처리, 다르면 연봉 5% 처리
					nvl(기준, 60) ==> null이 나오면 60, 그렇지 않으면 연봉 50% 처리
			nvl2(데이터, null아닐때, null일때)
SELECT ename, sal, trunc(sal*0.05,-1) "연봉의5%",
		nullif(trunc(sal*0.05,-1),60) "60과 동일여부", -- NULL/첫번째 데이터
		nvl(nullif(trunc(sal*0.05,-1),60),60) "최종보너스"
		-- null일 때는 60 처리, 그 외는 첫번째 데이터로 보너스 최종 결정
FROM emp;
[1단계:코드] 10. 급여의 구간별로 등급을 만들어, 사원번호, 이름, 급여, 등급을 출력하세요
		ex) 0~999 'A', 1000~2999 'B'...
1) decode문 처리
등급구간별로 데이터처리에 대한 규칙성 확인(사칙연산, mod), floor(), ceil()
sal/1000
1000단위로 나누어서 floor 
0~999 ==> 0, 1000~1999 ==> 1, 2000~2999 ==> 2, 3000~3999 ==> 3....
규칙성이 파악되면 해당 규칙성에 따라 decode를 처리
SELECT ename, sal, sal/1000 g1, floor(sal/1000) g2,
		decode(floor(sal/1000),0,'A',1,'B',2,'C',3,'D',4,'E',5,'F','등급범위벗어남') "등급"
FROM emp;
 * */
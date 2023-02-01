package javaexp.z01_homework;

import java.util.ArrayList;

public class A00_Exam {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
== 평가대비(자바) 객관식 문제 ==0920
1. 문자열의 생성자 매개변수로 올 수 없는 데이터 유형은 ?
1) byte[] 2) char[] 3) short[] 4) int[]


2. 문자열안에 특정 문자열을 찾을 때, 사용하는 메서드는?
1) charAt() 2) indexOf() 3) length() 4) substring()


3. StringTokenizer에서 사용되는 주요메서드가 아닌 것은?
1) length() 2) countTokens() 3) nextToken() 4) hasMoreTokens()


4. 다음 중 StringBuffer에서 특정한 위치의 문자열을 대체하는 메서드는?
1) append() 2) replace() 3) setCharAt() 4) insert()


5. 다음 중 Wrapper클래스의 선언이 적절하지 않는 것은?
1) Double 2) Boolean 3) Char 4) Integer


정답 : 3,2,1,2,3

== 평가대비(알고리즘) 객관식 문제 ==
1. 문자열을 검색할 때, 검색하는 형식이 틀린 것은
    1) 
    	// 배열안에 잇는 검색을 전체를 하여 결과를 처리해야 되기에
    	// {"홍길동","김길동","신길동"} : members
    	// "홍" : schStr
    	// 전역변수로 검색 결과 선언..
        boolean hasData=false;
        for(String mem : members){
            if(mem.indexOf(schStr) !=-1){ // 비슷한 글자
                hasData=true;
            }
        }
        // 하나라도 검색이 되면 hasData=true;
    2) 
        boolean hasData=false;
        for(String mem : members){
            if(mem.equals(schStr)){ // 동일한 문자열 있을 때.
                hasData=true;
            }
        }
    3) 
    	// {"홍길동","김길동","신길동"} : members
    	// "홍" : schStr
        for(String mem : members){
            String result="";
            // for안에 들어 가서 초기값 설정..
            // 외부에서 for문에서 검색된 결과를 볼 수 없을 뿐만아니라.
            // 반복문을 통해 다시 ""으로 초기화가되어 배열 중에 한개 검색된 내용을
            // 정상적 처리가 되지 않는다.
            if(mem.indexOf(schStr) !=-1){
                result="검색됨";
            }
        }
    4)  String result="";
        for(String mem : members){
            if(mem.equals(schStr) ){
                result="검색됨";
            }
        }

정답 : 3

== 평가대비(자바) 객관식 문제 ==0921
1. Collections 유형이 아닌 것은 ?
1) Map 2) List 3) Set 4) Long


2. List 기능 메서드 가운데, 전체 데이터의 삭제를 처리해주는 메서드는?
1) get() 2) remove() 3) clear() 4) removeAll()


3. 빈번한 객체 삭제와 삽입이 일어나는 곳에서는 좋은 성능 가진 List 하위 객체는?
1) ArrayList 2) Vector 3) LinkedList 4) HashMap


4. 아래의 메서드에서 Set이 지원하지 않는 메서드를 선택하세요.
1) add(E) 2) contains(E) 3) clear() 4) remove(index)


5. 아래 기술된 내용 중, Map과 관련성이 먼 내용을 선택하세요.
1) 키(key)와 값(value)으로 구성된 Map.Entry 객체를 저장하는 구조
2) 순서를 유지하여 저장이 가능하다.
3) 키와 값은 모두 객체
4) 키는 중복될 수 없지만 값은 중복 저장 가능


정답 : 4,3,3,4,2

== 평가대비(알고리즘) 객관식 문제 ==
1. ArrayList<Integer>로 데이터를 1~100까지 임의로 할당 후, 가장 적은 데이터를 가져오는 로직 중,
   잘못된 line은 무엇인가?
   ArrayList<Integer> points = new ArrayList<Integer>();
1) points.add(new Integer(70));
2) points.add(90);
   points.add(new Integer("80"));
3) int minPoint = 100;
   for(int num01:points){
4)   if(minPoint < num01){
       minPoint=num01;
   }
   }
   System.out.println("최소값:"+minPoint);
==> 해설
		ArrayList<Integer> points = new ArrayList<Integer>();
		points.add(new Integer(70));
		points.add(90);
		points.add(new Integer("80"));
		int minPoint = 100;// 배열에서 최소값을 도출할 때는 나올 수 있는 최대값을
		int maxPoint = 0; // 최대값을 도출할 때는 나올 수 있는 최소값을 설정..
		// 초기값을 설정하고
		for(int num01:points){
			System.out.println("최소값-"+num01+":"+minPoint);
			System.out.println("최대값-"+num01+":"+maxPoint);
			// 초기 최소값보다 적은 값이 나올 때, 최소값으로 설정..
			if(minPoint > num01){
				minPoint=num01;
			}
			if(num01 > maxPoint) { // 나온값이 현재 설정된 최대값 보다 많을 때..
				maxPoint=num01;
			}
		}
		System.out.println("최소값:"+minPoint);
		System.out.println("최대값:"+maxPoint);
정답 4

== 평가대비(자바) 객관식 문제 ==0922
1.  바이트 단위 입출력을 위한 최상위 입력 스트림 클래스는?
1) File 2) OutputStream 3) InputStream 4) Reader

2.  아래 내용 중에 한글을 입력 처리해주는 Stream은 무엇인가?
1) InputStream 2) OutputStream 3) Writer 4) Reader

3. Reader객체의 하위 객체가 아닌 것은 무엇인가?
1) FileReader 2) BufferedReader 3) InputStreamReader 4) InputStream

4. 디렉토리에 포함되 파일 및 서브디렉토리 목록 배열로 리턴 File객체 하위의 기능메서드는?
1) list() 2) listFiles() 3) canRead() 4) getParentFile()


정답 : 3 4 4 1

== 평가대비(자바) 객관식 문제 ==0923
1. 바이트 기반 출력 스트림의 최상위 클래스로 추상 클래스는 무엇인가?
1) InputStream 2) OutputStream 3) Reader 4) Writer
정답:2
2. 바이트 기반 출력 스트림의 최상위 클래스로 추상 클래스는 무엇인가?
1) InputStream 2) OutputStream 3) Reader 4) Writer
정답:2

== 평가대비(데이터베이스) 객관식 문제 ==0926
1. 정보 시스템의 개념을 맞는 것은 ?
1) 데이터를 저장하고 있다가 필요할 때 제공하는 역할 담당
2) 특정 조직의 여러 사용자가 공유하여 사용할 수 있도록 통합해서 저장한 운영 데이터의 집합 
3) 조직 운영에 필요한 데이터를 수집하여 저장해두었다가 필요할 때 유용한 정보를 만들어 주는 수단
4) 구조화된 데이터, 즉 미리 정해진 구조에 따라 저장된 데이터
정답:3

2. 데이터베이스의 특징이 아닌 것은?
1) 실시간 접근성 
2) 개별적 공유
3) 계속 변화
4) 내용 기반 참조
정답:2

3. 아래 내용 중 반정형 데이터는 어떤 데이터인가?
1) 엑셀
2) pdf
3) sns 문서
4) xml
정답:4

4. 다음 데이터 중 범주형 데이터 중 명목형 데이터에 속하는 것은 어느 것인가?
1) 학년
2) 회원등급
3) 성별
4) 키
정답:3

== 평가대비(오라클) 객관식 문제 ==0927
1.  데이터베이스 관리 시스템의 단점이 아닌 것은?
1) 비용이 많이 든다
2) 백업과 회복 방법이 복잡하다.
3) 데이터에 대한 동시 공유, 보안, 회복 기능이 부족하다.
4) 중앙 집중 관리로 인한 취약점이 존재한다.

2. 파일 시스템의 내용이 아닌 것은?
1) 데이터를 파일로 관리
2) 파일을 생성·삭제·수정·검색하는 기능을 제공하는 소프트웨어
3) 응용 프로그램에 필요한 데이터를 공유해서 파일로 관리함
4) 같은 내용의 데이터가 여러 파일에 중복 저장된다.

3. 데이터베이스 관리시스템의 주요 기능이 아닌 것은?
1) 보안 기능 : 권한이 없는 사용자의 접근, 허용되지 않는 데이터와 연산에 대한 요청 차단
2) 정의 기능 : 데이터베이스 구조를 정의하거나 수정할 수 있다.
3) 조작 기능 : 데이터를 삽입,삭제,수정 검색하는 연산을 할 수 있다.
4) 제어 기능 : 데이터를 항상 정확하고 안전하게 유지할 수 있다.

4. 아래 내용에 해당 하는 데이터 유형은 무엇인가?
    - 비정형 데이터를 처리하는데 적합하고 확장성이 뛰어남
1) Oracle
2) HBase
3) Myria DB
4) Volt DB

5. NewSQL DBMS에 해당하는 설명이나 예제 DB가 아닌 것은?
1) 관계 DBMS의 장점 + NoSQL의 확장성 및 유연성
2) Cassandra
3) 정형 및 비정형 데이터를 안정적이고 빠르게 처리 가능
4) Spanner

정답 : 3 3 1 2 2

== 평가대비(데이터베이스) 객관식 문제 ==0928
1. 데이터베이스에 저장되는 데이터 구조와 제약조건을 정의한 것을 무엇이라고 하는가 ?
1) 스키마
2) 레코드
3) 시스템 카타로그
4) 인스턴스


2. 데이터베이스를 쉽게 이해하고 이용할 수 있도록 하나의 데이터베이스를 관점에 따라 세 단계가 아닌 것은?
1) 외부 단계
2) 논리 단계
3) 개발 사용자 관점
4) 내부 단계

3. 개념 스키마에 해당하는 내용을 나타내는 것은?
1) 각 사용자가 생각하는 데이터베이스의 모습, 즉 논리적 구조로 사용자마다 다름
2) 조직 전체의 관점에서 생각하는 데이터베이스의 모습
3) 서브 스키마(sub schema)라고도 함
4) 전체 데이터베이스가 저장 장치에 실제로 저장되는 방법을 정의한 것

정답:1,2,2

== 평가대비(오라클) 객관식 문제 ==0929
1. 오라클의 to_char()이용하여 데이터 변환 타입이 아닌 것은?
1) 문자열 2) 숫자형 3) 불형 4) 날짜형

2. 문자열 형변환 형식이 적절하지 않는 것은?
1) 세기 - CC
2) 월 - MMM
3) 날짜 - D
4) 분기 - Q

3. 빅데이터 처리 대상이 아닌 것은?
1) 저장기술
2) 분석기술
3) 표현기술
4) 실용기술

4. DIKW 계층 구조에 해당하는 것이 아닌 것은?
1) 문서
2) 데이터
3) 정보
4) 지혜

5. 오라클에서 to_char(데이터,'옵션')으로 시간을 표현하는 옵션은 무엇인가?
1) YYYY
2) DAY
3) MI
4) Q

정답 : 3,2,4,1,3

== 평가대비(데이터베이스) 객관식 문제 ==0930
1. 어떤 데이터 모델로 데이터를 저장하는지를 나타내는 NoSQL의 종류가 아닌 것은?
1) 키-값(key-value) 데이터베이스
2) 문서 기반(document-based) 데이터베이스
3) 인덱스 기반(index-based) 데이터베이스
4) 컬럼 기반(column-based) 데이터베이스

2. NoSQL 데이터의 특징이 아닌 것은?
1) ACID(원자성, 일관성, 격리성, 지속성)를 위한 트랜잭션 기능을 제공
2) 빠른 속도로 생성되는 대량의 비정형 데이터를 저장하고 처리 
3) 저렴한 비용으로 여러 대의 컴퓨터에 데이터를 분산∙저장∙처리 
4) 대부분 오픈 소스로 제공

3. 해당하는 분석기술이 맞게 매칭된 것은 무엇인가?
1) 텍스트 마이닝(text mining) - SNS, 블로그, 게시판 등에 기록된 사용자들의 의견을 수집
2) 오피니언 마이닝(opinion mining) - 제품이나 서비스에 대한 긍정, 부정, 중립 등의 선호도를 추출
3) 소셜 네트워크 분석(social network analysis) - 반정형 또는 비정형 텍스트에서 자연어 처리 기술
4) 군집 분석(cluster analysis) - 네트워크에 나타난 영향력, 관심사, 성향, 행동 패턴 등을 추출

4. 빅데이터의 기본 특징가 3V이 아닌 것은?
1) Volume
2) Velocity
3) Veracity
4) Veriety


정답:3,1,2,3

== 평가대비(오라클) 객관식 문제 ==1004
1. 다중행 서버쿼리로 사용되는 구문이 아닌 것은 ?
1) in 2) any 3) some 4) between
정답:4

2. 사람의 머리로 이해할 수 있는 현실 세계를 모델링은 하는 것은 어느 분류에 해당하는가?
1) 단계적 - 개념적 모델링
2) 단계적 - 논리적 모델링
3) 도구적 - 개념적 모델링  
4) 도구적 - 논리적 모델링
정답:3

3. 개념적 데이터 모델의 도형으로 틀린 것은?
1) 엔티티 - 원
2) 관계 - 마름모
3) 속성 - 타원
4) 개체 - 사각형
정답:1

4. subquery로 사용하는 비교연산자가 아닌 것은?
1) both
2) any
3) some
4) exists
정답:1

== 평가대비(오라클) 객관식 문제 ==1005
1. 오라클에서 사용하는 데이터 유형이 아닌 것은 ?
1) char 2) varchar2 3) boolean 4) number
정답:3

2. 모델링에서 복합 속성을 의미하는 말이 맞는 것은?
1) 의미를 분해할 수 있는 속성
2) 의미를 더는 분해할 수 없는 속성
3) 값을 하나만 가질 수 있는 속성
4) 값을 여러 개 가질 수 있는 속성

정답:1

3. 키속성의 내용이 아닌 것은?
1) 각 개체 인스턴스를 식별하는 데 사용되는 속성
2) 모든 개체 인스턴스의 키 속성 값이 다름
3) 둘 이상의 속성들로 구성되기도 함
4) 개체 집합들 사이의 대응 관계, 즉 매핑(mapping)을 의미

정답:4

4. ER 모델에 대한 설명으로 옮지 않은 것은?
1) ER 다이어그램으로 표현하여 피터 첸이 제안하였다.
2) 일대일(1:1) 관계 유형만 표현할 수있다.
3) 객체 타입과 이들 간의 관계 타입을 이용해 현실 세계를 개념적으로 표현한다.
4) ER 다이어그램은 ER 모델을 그래프 방식으로 표현한 것이다.

정답:2
== 평가대비(오라클) 객관식 문제 ==1006
1. 테이블의 구조를 변경하는 명령어는?
1) alter table 테이블명  2) update  table 테이블명 
3) create table 테이블명 4) drop table 테이블명 
정답:1

2. 무결성 제약 조건의 종류가 아닌 것은?
1) not null
2) unique
3) second key
4) foreign key
정답:3

3. 아래 설명중 틀린 것은 무엇인가?
1) 테이블 생성시 무결성 제약조건을 정의 가능
2) not null 제약은 기존 데이터를 NULL로 수정하는 경우에는 가능
3) 테이블레벨이 아닌 열 레벨로만 지정가능하다
4) 제약조건을 활성화, 비활성화 할 수 있는 융통성애 있음
정답:2

4. 데이터 무결성 제약조건의 장점이 아닌 것은?
1) 테이블 생성시만 제약조건이 가능하므로 일관성을 확보
2) 응용 프로그램에서 입력된 모든 데이터에 대해 동일하게 적용
3) 제약조건을 활성화, 비활성화 할 수 있는 융통성
4) 테이블 생성시 무결성 제약조건을 정의 가능
정답:1

5. 시퀀스의 속성 아닌 것은?
1) increment by
2) start with
3) minvalue
4) circle
정답:4

== 평가대비(자바) 객관식 문제 ==1012
1. 자바에서 데이터베이스 연결에 필요한 객체가 아닌 것은?
1) Connection  2) Statement
3) Result      4) Sql 
정답:4
2. 데이터베이스 처리시 처리할 예외 ?
1) NullPointerException  2) NumberFormatException
3) SQLException      4) 
정답:3
		 * */
		
	}

}

package javaexp.z01_homework;

import java.util.Scanner;

public class A06_0905 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0905과제 - 정답
		[1단계:개념] 1. stack영역과 heap영역의 차이점을 기술하세요.
			객체를 사용하느냐애 따라 heap영역의 사용여부를 결정한다.
			stack영역
			1. 기본데이터 유형 : 변수명 선언과 실제 데이터 할당
			2. 객체 유형 : 변쉬명 선언과 heap영역 주소값 할당. 
			heap영역
			1. 객체 유형에 실제 객체 유형의 데이터 할당.
			
		[1단계:코드] 2. 정수형 배열(arr05)로 물건의 가격을 3개 할당하고, 새로운 배열 변수(arr06)에 물건의 가격 변수(arry05)
      		를 할당하고 arr06에 중간데이터를 변경 후 두 변수를 비교시 동일한 데이터가 나오는 이유를 기술하세요.
      	
		int []arr05 = {3000,4000,5000};
		// stack영역에 arr05라는 이름으로 실제 할당되 heap영역의 주소를 저장
		// heap영역에는 {3000,4000,5000} 객체 데이터를 저장.
		int []arr06 = arr05;
		// arr05에 있는 할당되어 있는 stack영역에 있는 주소를 복사해서 arr06에 할당
		arr06[1]=7000;
		System.out.println("중간 데이터 변경(arr06[1]):"+arr06[1]);
		System.out.println("# 변경 후, 데이터 arr05[1]의 데이터 확인:"+arr05[1]);
		// 주소값이 같으므로 한쪽에 있는 데이터(arr06[1])를 변경하더라도 다른쪽 데이터(arr05[1]) 변경되는 것을 확인 할 수 있다.
		
		
		[1단계:개념] 3. 객체형 데이터를 선언하여 초기화(null)후, 구성요소를 호출할 때 나오는 에러와 원인을 예제를 통해서
      		설명하세요
      	
		int[] arry07;
		arry07 = null;
		Person p01;
		p01 = null;
//		System.out.println("배열 구성 요소 호출:"+arry07[0]); NullPointerException
//		System.out.println("객체 구성 요소 호출:"+p01.name); NullPointerException
//		heap영역에 객체가 만들어져 있지 않는 상황에서 구성요소를 호출하므로 에러가 발생한다.
		arry07 = new int[] {100,200,300};
		p01 = new Person();
		System.out.println("배열 구성 요소 호출:"+arry07[0]); 
		System.out.println("객체 구성 요소 호출:"+p01.name); 
//		heap영역에 객체가 만들어 진 후에는 구성요소를 호출하여도 에러가 발생하지 않는다.
		
		[1단계:개념] 4. 배열에서 사용하는 구성요소와 선언 및 할당 처리를 기본 예제와 함께 설명하세요.
		[1단계:코드] 5. 유럽챔피언스리그 팀과 성적을 배열로 선언하고 출력하세요.
		[1단계:코드] 6. 학생3명의 이름과 국어 점수를 배열로 선언하고 Scanner로 입력한 후, 출력하세요.
		
		// 데이터를 할당할 수 있게 배열 객체 선언/객체 생성
		String[]names = new String[3];
		int[] kors = new int[3];
		Scanner sc = new Scanner(System.in);
		for(int idx=0;idx<names.length;idx++) {
			System.out.print(idx+1+"번째 학생의 이름입력:");
			names[idx] = sc.nextLine();
			System.out.print(idx+1+"번째 학생의 국어점수입력:");
			kors[idx] = Integer.parseInt(sc.nextLine());
		}
		System.out.println("번호\t이름\t국어점수");
		for(int idx=0;idx<names.length;idx++) {
			System.out.println(idx+1+"\t"+names[idx]+"\t"+kors[idx]);
		}
		
		[3단계:코드] 7. 임시비번에 사용할 임의의 데이터를 입력후(갯수 입력 후 문자입력), 문자 5개로 구성된 임시 비밀번호를 생성출력하세요.
		
		// 임시비밀번호로 사용할 배열 선언 후,
		String []tmpStrs = new String[10];
		Scanner sc2 = new Scanner(System.in);
		System.out.println("임시 비번번호로 사용할 문자열 10개를 입력하세요");
		for(int idx=0;idx<tmpStrs.length;idx++) {
			System.out.print(idx+1+"번째 문자입력:");
			tmpStrs[idx] = sc2.nextLine();
		}
		System.out.println("비번호로 사용할 문자열");
		for(int idx=0;idx<tmpStrs.length;idx++) {
			System.out.print(tmpStrs[idx]+",");
		}
		String tmPass = "";
		for(int cnt=1;cnt<=5;cnt++) {
			int rIdx = (int)(Math.random()*tmpStrs.length);
			tmPass+=tmpStrs[rIdx];
		}
		System.out.println("임시비밀번호:"+tmPass);
		*/
		// 48~57, 65~90, 97~122 : 숫자, 소문자, 대문자 : 배열을 char로 만들어서 이 범위에 있는 문자만 입력, 랜덤
		// 33~126 : 숫자, 소문자, 대문자, 특수문자
		char []tmpPassC = new char[8];
		for(int idx=0;idx<tmpPassC.length;idx++) {
			int ranCod = (int)(Math.random()*93+33); // 경우의 수 93가지 시작수 33
			tmpPassC[idx] = (char)ranCod;
		}
		for(int idx=0;idx<tmpPassC.length;idx++) {
			System.out.print(tmpPassC[idx]);
		}
		System.out.println();
		// char[] ==> String으로 변환 처리
		String tmpPass = new String(tmpPassC);
		System.out.println("최종 임시비번:"+tmpPass);
		
		
		/*
		0905과제 - 신아령
		[1단계:개념] 1. stack영역과 heap영역의 차이점을 기술하세요.
		1) stack영역
		-정적 메모리 할당
		-함수의 호출과 관계되는 지역 변수와 매개변수가 저장되는 영역
		-함수의 호출과 함께 할당되며, 함수의 호출이 완료되면 소멸
		-푸시(push) 동작으로 데이터를 저장하고, 팝(pop) 동작으로 데이터를 인출
		-후입선출(LIFO, Last-In First-Out) 방식
		-메모리의 높은 주소에서 낮은 주소의 방향으로 할당
		2) heap영역
		-동적 메모리 할당
		-사용자가 직접 관리할 수 있는 ‘그리고 해야만 하는’ 메모리 영역
		-사용자에 의해 메모리 공간이 동적으로 할당되고 해제
		-메모리의 낮은 주소에서 높은 주소의 방향으로 할당
		[1단계:코드] 2. 정수형 배열(arr05)로 물건의 가격을 3개 할당하고, 새로운 배열 변수(arr06)에 물건의 가격 변수(arry05)
		      를 할당하고 arr06에 중간데이터를 변경 후 두 변수를 비교시 동일한 데이터가 나오는 이유를 기술하세요.
		같은 주소에 있는 데이터를 이름만 달리하고 호출하기에 데이터를 동일하게 가지고 있다.
		[1단계:개념] 3. 객체형 데이터를 선언하여 초기화(null)후, 구성요소를 호출할 때 나오는 에러와 원인을 예제를 통해서
		      설명하세요
		int num01;
		System.out.println(num01); // 초기화를 해야 사용가능
		num01=0;		// 초기데이터를 0 : stack
		System.out.println(num01);
		Person p01;
		System.out.println(p01);
		p01 = null;		// 객체는 초기화를 stack영역에 null
						// heap영역의 객체는 생성되지 않았다.
		System.out.println(p01);
		System.out.println(p01.age);
			java.lang.NullPointerException
			객체가 heap영역에 생성되지 않았을 때, 구성요소를
			호출하면 runtime error인 NullPointerException
		[1단계:개념] 4. 배열에서 사용하는 구성요소와 선언 및 할당 처리를 기본 예제와 함께 설명하세요.
		1)배열의 선언
		타입[] 변수명;
		타입 변수명[];
		2)배열의 초기화
		변수명 = null; // 주소는 할당되지 않음
		3)배열의 할당.
		변수명 = new 타입[크기];
		타입[] 변수명 = null;
		변수명 = new 타입[]{데이터1, 데이터2, 데이터3};
		타입[] 변수명 = {데이터1, 데이터2, 데이터3};
		[1단계:코드] 5. 유럽챔피언스리그 팀과 성적을 배열로 선언하고 출력하세요.
		String[] team = {"아스널","맨체스터","토트넘"};
		int[] score = {15,14,14};
		for(int idx=0;idx<team.length;idx++) {
			System.out.println(idx+1+"번팀: "+team[idx]);
		}
		for(int idx=0;idx<score.length;idx++) {
			System.out.println(idx+1+"번팀 점수:"+score[idx]);
		}
		[1단계:코드] 6. 학생3명의 이름과 국어 점수를 배열로 선언하고 Scanner로 입력한 후, 출력하세요.
		Scanner sc = new Scanner(System.in);
		System.out.print("학생의 이름을 입력:");
		String[] stdName = {"홍길동","신길동","김길동"};
		int[] point = {90,55,75};
		String cnt = sc.nextLine();
		for(int idx=0;idx<point.length;idx++) {
			System.out.println(stdName[idx]+"의 국어점수:"+point[idx]);
		}
		[3단계:코드] 7. 임시비번에 사용할 임의의 데이터를 입력후(갯수 입력 후 문자입력), 문자 5개로 구성된 임시 비밀번호를 생성출력하세요.
		
		 
		String[] books = null;
		String[] players = null;
		players = new String[] {"홍길동","신길동","김길동"};
		String[] elCom = new String[3];
		System.out.println(books);
		System.out.println(players);
		System.out.println(elCom);
		
		Scanner sc = new Scanner(System.in);
		System.out.println("등록할 회원의 인원을 입력:");
		int cnt = sc.nextInt();
		
		String []names = new String[3];
		System.out.println("# 회원"+cnt+"명의 이름을 입력하세요 #");
		
		for(int idx=0;idx<names.length;idx++) {
			System.out.print(idx+1+"번째 회원명:");
			names[idx] = sc.nextLine();
		}
		System.out.println("# 등록한 회원명단 #");
		for(int idx=0;idx<names.length;idx++) {
			System.out.println(idx+1+"번째회원 - "+names[idx]);
			
		}
		*/
		
		
		
	}
		

}
class Person{
	String name="홍길동";
}

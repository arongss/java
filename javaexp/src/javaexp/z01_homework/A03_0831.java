package javaexp.z01_homework;

import java.util.Scanner;

public class A03_0831 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
2022-08-31  - 정답
[1단계:개념] 1. Scanner객체의 사용방법을 예제를 통하여 기술하세요.
	1) import java.util.Scanner;
	2) 객체생성 Scanner sc01 = new scanner(System.in)'
	3) 기능메서드
		String strLine = sc01.nextLine();
		int num01 = sc01.nextInt();
		double num02 = sc01.nextDouble();
		String str = sc01.next();
			
[1단계:코드] 2. Scanner객체를 활용하여 타율계산방법을 확인(검색)하고, 선수명과 함께 입력데이터를 입력 받아 해당 타자의 타율을 출력하세요.
		Scanner sc = new Scanner(System.in);
		// ctrl+shift+o : import 처리 단축키
		System.out.println("# 타율 계산 #");
		System.out.println("타석의 횟수를 입력하세요:");
		int bset = sc.nextInt();
		System.out.println("안타수를 입력하세요:");
		int hit = sc.nextInt();
		double hitRatio = (double)hit/bset;
		System.out.println("타율:"+hitRatio);		
/*

/*
[1단계:개념] 3. 숫자형 문자열의 숫자 변환 형식을 예제를 통하여 기술하세요.
	정수형 변환 : int num01 = Integer.parseInt("25");
	실수형 변환 : double num02 = Double.parseDouble("25.25");
[1단계:코드] 4. args로 물건1 가격1 갯수1 물건2 가격2 갯수2로 입력받아 계산서를 출력하세요.
		String pname01 = args[0];
		int price01 = Integer.parseInt(args[1]);
		int cnt01 = Integer.parseInt(args[2]);
		int tot = 0;
		
		String pname02 = args[3];
		int price02 = Integer.parseInt(args[4]);
		int cnt02 = Integer.parseInt(args[5]);
		System.out.println("# 계산서 ");
		System.out.println("#물건명\t가격\t갯수\t계");
		System.out.println(pname01+"\t");
		System.out.println(price01+"\t");
		System.out.println(cnt01+"\t");
		System.out.println(price01*cnt01+"\t");
		tot += price01*cnt01;
		System.out.println(pname02+"\t");
		System.out.println(price02+"\t");
		System.out.println(cnt02+"\t");
		System.out.println(price02*cnt02+"\t");
		tot += price02*cnt02;
		System.out.println("총계:"+tot);
*/
		
/*
[1단계:개념] 5. 연산자와 피연산자, 연산식의 개념을 예제와 함께 기술하세요.
	연산자 : 산술연산자, 대입연산자, 비교연산자, 논리연산자로
		대상이 되는 데이터를 연산식으로 처리해주는 기능을 가지고 있다.
	피연산자 : 실제 연산자를 처리하는 대상이 되는 데이터를 말하고,
		리터럴 데이터(25,3.14..), 변수 등이 있다.
	연산식 : 연산자와 피연산자를 통해서 원하는 데이터를 처리하는 식을 말한다.
		25 + 30, num01 * num02, point>90
[2단계:코드] 6. 방어율 계산 방법을 찾아보고, 해당 항목을 입력받아 방어율을 출력하세요.
		방어율 : (총자책점*9)/총던진이닝수
		Scanner sc02 = new Scanner(System.in);
		System.out.print("총자책점을 입력하세요:");
		int pt = sc02.nextInt();
		System.out.print("총던진이닝수을 입력하세요:");
		int inning = sc02.nextInt();
		double defRatio = (double)pt*9/inning;
		System.out.println("방어율:"+defRatio);
*/
/*		
[1단계:개념] 7. 연산자의 종류를 기본 예제와 함께 기술해보세요
	산술 : +,-,*,/,%   25%3 ==> 1   정수형/정수형 ==> 정수값
	부호 : +,-   int num01 = -25;   -num01 ==> 25
	문자열 : +   "12" + "13" ==> "1213"
		ps) java에서는 엄격하게 산술연산자를 숫자인 경우만 처리
		하지만 script(파이썬, 자바스크립트)등에서는 숫자형 문자열
		의 경우 자동현변환으로 연산을 처리해준다.
		 "2"*"3" ==> 6 (자바에서는 지원하지 않음)
	대입 : =, +=, *=...  기본적으로 왼쪽에서 오른쪽으로 데이터 할당
		int num01 = 25;  num02+=3; 
	증감 : ++, --  num01++, ++num01 1씩 증가 감소
	비교 : ==, !=, >, <, >=, <= boolean(true/false)을 리턴하여
		결과를 처리해준다.
	논리 : 비교연산자를 두개 이상 또는 not(!)를 이용해서
	논리값을 처리하는 것을 말한다. &&(and), ||(or), !(not)
	조건(삼항연산자) : 조건식?true일때:false일때

[2단계:코드] 8. 아래와 같은 일일 가계부를 처리할려고 한다. 초기 잔액 10000
        	 Scanner를 통해 입력에 필요한 연산식을 만들고 아래 형식으로 출력하세요
	      날짜   내용   입금액    출금액     잔액
	      8/31  용돈   30000    0        40000
	      9/1   식사       0    5000     35000
	1) Scanner 2개(문자열 처리, 숫자형처리)
	2) 문자열을 다 잉력 후, 숫자형을 입력..(순서가 맞지 않음)
	3) .nextLine() 받고, 정수형이 필요한 경우.
		Integer.parseInt(sc.nextLine());

		// 문자열 변수 선언
		String date01, cont01, date02, cont02;
		// 숫자형 변수 선언
		int incom01, spend01, incom02, spend02;
		// 누적변수
		int rest = 10000;
		Scanner sc = new Scanner(System.in);
		System.out.println("#첫번째 항목입력#");
		System.out.print("날짜를 입력:"); date01=sc.nextLine();
		System.out.print("내용를 입력:"); cont01=sc.nextLine();
		System.out.print("입금액 입력:"); incom01=Integer.parseInt(sc.nextLine());//숫자형변환
		System.out.print("출금액 입력:"); spend01=Integer.parseInt(sc.nextLine());
		System.out.println("#두번째 항목입력#");
		System.out.print("날짜를 입력:"); date02=sc.nextLine();
		System.out.print("내용를 입력:"); cont02=sc.nextLine();
		System.out.print("입금액 입력:"); incom02=Integer.parseInt(sc.nextLine());
		System.out.print("출금액 입력:"); spend02=Integer.parseInt(sc.nextLine());
		System.out.println("날짜\t내용\t입금액\t출금액\t잔액");
		System.out.print(date01+"\t");
		System.out.print(cont01+"\t");
		System.out.print(incom01+"\t");
		System.out.print(spend01+"\t");
		rest+=incom01-spend01;
		// 누적 변수는 해당 프로세스에서 처리학에 라인에서 연산처리
		System.out.print(rest+"\n");
		System.out.print(date02+"\t");
		System.out.print(cont02+"\t");
		System.out.print(incom02+"\t");
		System.out.print(spend02+"\t");
		rest+=incom02-spend02;
		System.out.print(rest+"\n");
/*
[2단계:코드] 9.구매하는 김밥의 갯수를 선언하고, 1씩 증가하여 김밥의 단가(2500) 아래와 같이 출력
      	  김밥 1개 구매  2500 
	      김밥 2개 구매  5000
	      김밥 3개 구매  10000

		int cnt = 0; //카운트 변수
		int tot = 0; //누적금액
		int foodPrice = 2500; //김밥의 개당 가격
		System.out.println("김밥 "+(++cnt)+"개 구매  "+(tot+=foodPrice));
		System.out.println("김밥 "+(++cnt)+"개 구매  "+(tot+=foodPrice));
		System.out.println("김밥 "+(++cnt)+"개 구매  "+(tot+=foodPrice));
		System.out.println("김밥 "+(++cnt)+"개 구매  "+(tot+=foodPrice));
		System.out.println("김밥 "+(++cnt)+"개 구매  "+(tot+=foodPrice));

[1단계:개념] 10. 비교연산자의 종류를 예시와 함께 기술하세요.	
		==, !=, >=, <=, >, <
		instanceOf : 객체의 참조변수인지 여부
		
		point>=80 점수가 80이상일 때, true 처리
		*/
		

//		0831과제 - 신아령
//		[1단계:개념] 1. Scanner객체의 사용방법을 예제를 통하여 기술하세요.
		/*
		# 외부데이터입력 (Scanner)
		1. 내장된 객체를 사용하는 방법
			1) import를 통해서 선언
				import java.util.Scanner;
				클래스명 위에 선언.
		2. 객체의 생성
			1) 객체유형  참조변수 = new 객체유형();
			2) 객체유형에 생성되는 생성자의 매개변수로
				기본 입력 Srteam인 System.in
				로 전달한다.
				ps)
				Syste.out : 기본출력 객체
				Syste.in : 기본입력 객체
		3. 객체의 메서드를 활용하여 데이터를 입력받기 처리
			1) 문자열형 데이터
				입력후, enter를 입력시(줄이바뀌기)전까지 입력 처리
				메서드 .nextLine()
			2) 숫자형 데이터
				.nextInt() : 정수형데이터 입력
				.nextDouble() : 실수형데이터 입력
		*/
		/*
package javaexp.a01_begin;

import java.util.Scanner;

public class A11_InputScanner {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		System.out.println("좋아하는 과일명 입력하세요");
		String favFruit = sc.nextLine();
		System.out.println("과일명:"+favFruit);
	}

}
		*/
		
//		[1단계:코드] 2. Scanner객체를 활용하여 타율계산방법을 확인(검색)하고, 선수명과 함께 입력데이터를 입력 받아 해당 타자의 타율을 출력하세요.
		/*
		타율 계산 방법 : 안타/타수
		안타:100, 타수:258 일때, 타율=0.38
		 
		int shoot01=100; int shoot02=258;
		System.out.println("류현진선수 타율:"+(double)shoot01/(double)shoot02);
		*/
//		[1단계:개념] 3. 숫자형 문자열의 숫자 변환 형식을 예제를 통하여 기술하세요.
		/*
		# 숫자형 문자열 데이터에 대한 숫자형 처리
		1.  문자열 ==> 숫자
			1) 정수형
				"25" ==> 25
				Integer.parseInt("25")
				==> 정수형 25로 변환이 된다.
				int에 할당도 하고, 숫자형과 계산이 가능하다.
			2) 실수형
				"3.14" ==> 
				Double.parseDouble("3.14")
		
		String numStr = "25";
		System.out.println(30 + Integer.parseInt(numStr));
		int num01 = Integer.parseInt(numStr);
		System.out.println(25 + num01);
		System.out.println(25 + numStr);
		String num02Str = "3.14";
		System.out.println(50.15 + Double.parseDouble(num02Str));
		double num02 = Double.parseDouble(num02Str);
		System.out.println(50.15 + num02);
		System.out.println(50.15 + num02Str);
		
//		[1단계:코드] 4. args로 물건1 가격1 갯수1 물건2 가격2 갯수2로 입력받아 계산서를 출력하세요.
		System.out.println(args[0]+"\t"+args[1]+"\t"+args[2]);
		System.out.println(args[3]+"\t"+args[4]+"\t"+args[5]);
		
//		[1단계:개념] 5. 연산자와 피연산자, 연산식의 개념을 예제와 함께 기술하세요.
		/*
		1) 연산자(operations) : 연산에 사용되는 표시나 기호(+,-,*,/,%,=,!=, ...)
		2) 피연산자(operand) : 연산대상이 되는 데이터(리터럴, 변수)
		3) 연산식(expressions) : 연산자와 피연산자를 이용하여 연산의 과정을 기술한 것
			ex) 25 + 2, num01 + num 02
		*/
		
//		[2단계:코드] 6. 방어율 계산 방법을 찾아보고, 해당 항목을 입력받아 방어율을 출력하세요.
		/*
		방어율 계산법 : 자책점*9/이닝 = 방어율
		자책점:55, 이닝:160.2 일때, 방어율=3.08
		 
		int nom01=55; double nom02=160.2;
		System.out.println("방어율:"+(double)nom01*9/nom02);
		
//		[1단계:개념] 7. 연산자의 종류를 기본 예제와 함께 기술해보세요
//		연산자의 종류 : +, -, *, /, %, =, ++, --
		int no1=10;int no2=5;
		System.out.println("+:"+(no1+no2));
		System.out.println("-:"+(no1-no2));
		System.out.println("*:"+(no1*no2));
		System.out.println("/:"+(no1/no2));
		System.out.println("%:"+(no1%no2));
		System.out.println("++:"+no1++);
		System.out.println("++:"+no1++);
		System.out.println("--:"+--no1);
		System.out.println("--:"+--no1);
				
//		[2단계:코드] 8. 아래와 같은 일일 가계부를 처리할려고 한다. 초기 잔액 10000
//              Scanner를 통해 입력에 필요한 연산식을 만들고 아래 형식으로 출력하세요
//      날짜   내용   입금액    출금액     잔액
//      8/31  용돈   30000    0        40000
//      9/1   식사       0    5000     35000
		/*
		String date01 = "8/31"; String date02 = "9/1";
		String con01 = "용돈"; String con02 = "식사";
		int saving01 = 30000; int saving02 = 0;
		int spend01 = 0; int spend02 = 5000;
		int rest = 10000;
		System.out.print("날짜\t");
		System.out.print("내용\t");
		System.out.print("입금액\t");
		System.out.print("출금액\t");
		System.out.print("잔액\n");
		System.out.print(date01+"\t");
		System.out.print(con01+"\t");
		System.out.print(saving01+"\t");
		System.out.print(spend01+"\t");
		rest+=(-spend01+saving01);
		System.out.print(rest+"\n");
		System.out.print(date02+"\t");
		System.out.print(con02+"\t");
		System.out.print(saving02+"\t");
		System.out.print(spend02+"\t");
		rest+=(-spend02+saving02);
		System.out.print(rest+"\n");		
		
//		[2단계:코드] 9.구매하는 김밥의 갯수를 선언하고, 1씩 증가하여 김밥의 단가(2500) 아래와 같이 출력
//      김밥 1개 구매  2500 
//      김밥 2개 구매  5000
//      김밥 3개 구매  7500
		int price = 0;
		System.out.println("김밥 1개 구매:"+(price+=2500));
		System.out.println("김밥 2개 구매:"+(price+=2500));
		System.out.println("김밥 3개 구매:"+(price+=2500));
		
//		[1단계:개념] 10. 비교연산자의 종류를 예시와 함께 기술하세요.
//		비교연산자의 종류 : ==, !=, >=, <=, >, <
		int num11 = 25;
		int num12 = 5;
		System.out.println("#비교 연산 결과#");
		System.out.println(num11+" == "+num12+" = "+(num11==num12));
		System.out.println(num11+" != "+num12+" = "+(num11!=num12));
		System.out.println(num11+" >= "+num12+" = "+(num11>=num12));
		System.out.println(num11+" <= "+num12+" = "+(num11<=num12));
		System.out.println(num11+" > "+num12+" = "+(num11>num12));
		System.out.println(num11+" < "+num12+" = "+(num11<num12));
		*/


	}

}

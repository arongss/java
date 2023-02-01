package javaexp.z01_homework;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

public class A17_0920 {

	private static final boolean String = false;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0920과제 - 신아령

[1단계:개념] 1. String 문자열 byte데이터부터 만들어지는 과정을 기술해보자.
		0, 1 : 데이터 최소단위 bit
		01000112 ==> 8개 byte ==> 정수형의 가장 기본 데이터
		==> 숫자들에 코드를 대입해서 'A', 'B' 문자를 설정하여 생성되었다.
		문자들이 배열로 만들어서 일상에 문자열을 사용하게 되었음.
		{'H','e','l','l','o'}
		==> {25,34,72,43,22} : 코드값으로 bytes배열은 문자가 모인 문자열로
		사용할 수 있다.
		==> 객체 지향 프로그램에서 char[]배열에서 한단계 더 나아가 String
		문자열 객체를 만들게 되었다.
[1단계:코드] 2. 한글 무지개 색상 첫자를 코드값을 확인하여 임의의 색상 5가지를 문자열로 만들어 출력하세요.
//		char[] arr = {'빨','주','노','초','파','남','보'};
//		for(int idx=0;idx<arr.length;idx++) {
//			System.out.println((int)arr[idx]);
//		}
		int[] ranbow = {48744,51452,45432,52488,54028,45224,48372};
		for(int cnt=0;cnt<5;cnt++) {
			int ranbow1 = (int)(Math.random()*ranbow.length);
			char ranbow2 = (char)ranbow[ranbow1];
			System.out.print(ranbow2);
		}
[1단계:코드] 3. Hello! 자바!를 한글 encoding방식 euc-kr와 utf-8로 설정하여 문자열로 출력하세요.
		String java = "Hello! 자바!";
		try {
			byte[] byte1 = java.getBytes("EUC-KR");
			byte[] byte2 = java.getBytes("UTF-8");
			String str1 = new String(byte1);
			String str2 = new String(byte2);
			System.out.println("euc-kr:"+str1);
			System.out.println("utf-8:"+str2);
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
[1단계:개념] 4. 오늘 진행한 문자열 관련 기능메서드의 기능을 기본예제와 함께 정리하세요.
		1) charAt(int idx) : 특정위치에 문자 리턴
		2) getBytes() : 문자열의 byte배열을 가져온다. 이 때, 매개변수값을 EUC-KR이나
			UTF-8호 한글 encoding 형식을 지정할 수 있다.
		3) indexOf("찾을문자열")
			해당 문자열 안에서 찾을 문자열의 시작 위치를 inde로 리턴 해준다.
			해당 문자열을 포함하지 않으면 -1을 리턴한다.
		4) length() : 문자열의 크기를 나타낸다.
		5) replace("찾는문자열","변경할문자열")
		6) substring("추출할시작위치(0~), 추출할마지막위치(1~)
		 특정한 문자열에서 문자열을 추출하여 문자를 만들 때 사용한다.
		7) split("구분자") : 특정문자열을 구분자에 의해 구분해서 구분된 데이터를 배열로 할당 처리
[1단계:코드] 5. switch case문을 활용하여 주문할 메뉴 짜장면, 짬뽕, 탕수육 입니다. indexOf를 사용하여 해당 메뉴가 있으면, @@번 메뉴 주문하였습니다.
             없으면 없는 메뉴입니다로 표시하세요.
		String menuIntr = "주문할 메뉴는 짜장면,짬뽕,탕수육 입니다.";
//		System.out.println(menuIntr.indexOf("짜장면"));
//		System.out.println(menuIntr.indexOf("짬뽕"));
//		System.out.println(menuIntr.indexOf("탕수육"));
		// 8, 12, 15
		System.out.println(menuIntr);
		System.out.println("선택할 메뉴를 입력하세요:");
		Scanner sc = new Scanner(System.in);
		String food = sc.nextLine();
		int findIdx = menuIntr.indexOf(food);
		switch(findIdx) {
			case -1 : System.out.println("없는 메뉴입니다"); break;
			case 8 : System.out.println("1번메뉴 "+food+"주문하였습니다"); break;
			case 12 : System.out.println("2번메뉴 "+food+"주문하였습니다"); break;
			case 15 : System.out.println("3번메뉴 "+food+"주문하였습니다"); break;
			default : System.out.println("입력범위 초과 등 기타 유효성 문제"); 
		}
		System.out.println("주문 종료!!");
[1단계:코드] 6. 다음과 같은 고등학교 학번을 아래 형식을 기준으로 입력받아 @@고등학교 @@학년 @@반 @@@로 출력하세요
              형식  "세화030523홍길동" ==> 세화고등학교 03학년 05반 23번 홍길동
		Scanner sc = new Scanner(System.in);
		System.out.println("입력하세요(ex)세화030523홍길동):");
		String student = sc.nextLine();
		if(student.length()==11) {
			String schName = student.substring(0,2);
			String grade = student.substring(2,4);
			String group = student.substring(4,6);
			String num = student.substring(6,8);
			String name = student.substring(8);
			System.out.println(schName+"고등학교 "+grade+"학년 "+group+"반 "+num+"번 "+name);
		}else {
			System.out.println("입력형식이 틀렸습니다.");
		}
[1단계:코드] 7. 사과&3000&2-딸기&12000&3-오렌지&3000&3를 split을 이용해서 단위별로 출력(이중 for문 활용)하세요
		String str = "사과&3000&2-딸기&12000&3-오렌지&3000&3";
		String[]fruit = str.split("-");
		for(String fruits:fruit) {
			String[] fruit2 = fruits.split("&");
			for(String fruits2:fruit2) {
				System.out.print(fruits2+"\t");
			}
			System.out.println();
		}
[1단계:개념] 8. StringTokenizer의 기능 메서드를 기술하세요
		# StringTokenizer("문자열","구분자") 객체 활용
		1. 기능 메서드
			countTokens() : 구분자를 통해 나온 데이터의 건수
			nextToken() : 구분자를 통해서 나온 각 데이터 하나씩, 호출시마다 하나씩 데이터를 가져온다.
			hasMoreTokens() : 해당 데이터가 있을 때 True
[1단계:개념] 9. StringBuffer를 문자열 추가시, 사용하는 이유와 주요 기능 메서드를 기술하세요.
		# StringBuffer, StringBuilder
		1. 버퍼(buffer:데이터를 임시로 저장하는 메모리)에 문자열 저장
		2. 버퍼 내부에서 추가, 수정, 삭제 작업 가능
		3. 멀티 쓰레드 환경 : StringBuffer사용
		4. 단일 쓰레드 환경 : StringBuilder 사용
		5. 주요 메서드
			1) append(...)
			2) insert(int offset,..)
			3) delete(int start, int end) : 범위를 정해서 삭제
			4) deleteCharAt(int index) : 특정한 위치 문자 삭제
			5) replace(int start, int end, String str) : 특정한 문자 위치를 대체
			6) reverse() : 문자열을 뒤집어 사용
			7) setCharAt(int index, char ch) : 특정한 위치에, 문자 대체 
[1단계:코드] 10. StringBuffer로 두 팀의 임의의 주사위 던지기 10회 내용과 결과를 저장하고, 마지막에 출력하세요.
              no  홍  청  결과
              1   3   4  청승
              2   4   4  무
		StringBuffer game = new StringBuffer();
		System.out.println("no\t홍\t청\t결과");
		for(int cnt=1;cnt<=10;cnt++) {
			int rIdx1=(int)(Math.random()*6+1);
			int rIdx2=(int)(Math.random()*6+1);
			game.append(cnt+"\t"+rIdx1+"\t"+rIdx2+"\t");
			if(rIdx1==rIdx2) {
				game.append("무\n");
			}else if(rIdx1>rIdx2) {
				game.append("홍승\n");
			}else {
				game.append("청승\n");
			}		
		}
		System.out.println(game);
[1단계:개념] 11. Wrapper클래스란 무엇인가? 유형과 형식을 기술하세요
		# Wrapper class(포장 클래스)
			대부분은 기본유형타입에서 대문자로 시작하여 선언한다.
			byte ==> Byte, short ==> Short, double ==> Double
			단, 아래 두가지만 긴문자형식으로 Wrapper클래스를 선언한다.
			char ==> Character, int ==> Integer
[1단계:개념] 12. boxing과 auto boxing, unboxing, auto unboxing의 개념을 예제를 통해서 기술하세요
		1. 박싱(Boxing)과 언박싱(Unboxing)
			기본 데이터 <==> Wrapper
			1) 박싱 : 기본 타입의 값을 포장(Wrapper)객체로 만드는 과정을 말한다.
				Integer obj1 = Integer.valueOf(1000);
				Byte obj2 = Byte.valueOf(25);
			2) 언박싱 : 포장 객체에서 기본 타입의 값을 얻어내는 과정
				byte value01 = obj2.byteValue();
				int value02 = obj1.intVale();
		2. autoBoxing, autoUnboxing
			기본 데이터 <==> Wrapper
			위 기본 박싱과 언박싱을 거치지 않고, 바로 할당하는 것을 jvm에서
			내부적으로 지원한다.
			1) autoBoxing
				Integer obj1 = 30;
				Double obj2 = 30.25;
			2) autoUnboxing
				int num01 = obj1;
				double obj2 = obj2;
[1단계:코드] 13. Scanner nextLine()으로 문자열로 두개의 수를 입력 받아서 Boxing으로 Wrapper객체를 만든 후, 다시 Unboxing으로 합산된 결과를 출력하세요.
		
[1단계:코드] 14. ArrayList로 임의의 수학점수(0~100) 정수형데이터 반복문에 의해 5개 데이터를 나오게 한후, autoBoxing에 의해 할당처리하세요.
		ArrayList arr = new ArrayList();
		for(int cnt=0;cnt<5;cnt++) {
			int point = (int)(Math.random()*101);
			System.out.println(point);
			arr.add(point);
		}
[1단계:코드] 15. Random 클래스를 이용해서 3과목의 점수를 임의로 출력하세요.
		Random kor = new Random();
		Random eng = new Random();
		Random math = new Random();
		System.out.println(kor.nextInt(101)+"점, "+eng.nextInt(101)+"점, "+math.nextInt(101)+"점");
		 * */
		/*
		0920과제 - 정답
[1단계:코드] 2. 한글 무지개 색상 첫자를 코드값을 확인하여 임의의 색상 5가지를 문자열로 만들어 출력하세요.
		# 처리 순서
		1. 색상 문자열 선언
		2. getBytes byte배열로 확인,
			새로 생성할 임의 색상 배열선언.
		3. for 5번 호출 및 랜덤 호출
			임의 색상 코드값 배열에 할당.
		4. new String(newByte) 할당 후 출력.
		*/
		
		String rbColor = "빨주노초파남보";
		// # char[] <==> String
		// .toCharArray() : String ==> char[]
		// String s = new String(char[]) : char[] ==> String
		char [] arr = rbColor.toCharArray();
		// 배열로 위 색상의 한글 코드값을 저장.
		char [] ranChar = new char[5];
		for(int cnt=1;cnt<=5;cnt++) {
			int rCIdx = (int)(Math.random()*arr.length);
			// "빨주노초파남보"를 char 배열로 만든 내용 중에 한개 임의 추출
			char charVal = arr[rCIdx];
			System.out.println(cnt+"번째 색:"+charVal);
			// 새로만든 ranChar에 하나씩 할당..
			ranChar[cnt-1] = charVal;
		}
		String ranColor = new String(ranChar);
		System.out.println("임의의 5가지 색상:"+ranColor);
		/*
[1단계:코드] 7. 사과&3000&2-딸기&12000&3-오렌지&3000&3를 split을 이용해서 단위별로 출력(이중 for문 활용)하세요
		1) - 구분자로 데이터 split처리
		2) for문을 통해서 &구분자로 split처리
		3) 출력 형식을 처리
		*/
		String data = "사과&3000&2-딸기&12000&3-오렌지&3000&3";
		String []lev1 = data.split("-");
		for(String str1:lev1) {
			//System.out.println(str1);
			String []lev2 = str1.split("&");
			for(String str2:lev2){
				System.out.print(str2+"\t");
			}
			System.out.println();
		}
		/*
[1단계:코드] 10. StringBuffer로 두 팀의 임의의 주사위 던지기 10회 내용과 결과를 저장하고, 마지막에 출력하세요.
              no  홍  청  결과
              1   3   4  청승
              2   4   4  무
		1) StringBuffer sbf초기 선언.
		2) 반복문 for 1~10 
		3) 홍팀과 청팀 점수 임의(1~6)
			int red = (int)(Math.random()*6+1);
			int blue = (int)(Math.random()*6+1);
			String rs = red>blue?"홍승":(blue>red?"청승":"무승부");
			sbf.append(cnt+"\t"+red+"\t"+blue+"\t"+rs+"\n");
		4) 반복문 후, 출력
			sbf.toString();
		*/
		String tlt = "no\t홍\t청\t결과\n";
		StringBuffer sbf = new StringBuffer(tlt);
		for(int cnt=1;cnt<=10;cnt++) {
			int red = (int)(Math.random()*6+1);
			int blue = (int)(Math.random()*6+1);
			String rs = red>blue?"홍승":(blue>red?"청승":"무승부");
			sbf.append(cnt+"\t"+red+"\t"+blue+"\t"+rs+"\n");
		}
		System.out.println(sbf.toString());
		/*
[1단계:코드] 13. Scanner nextLine()으로 문자열로 두개의 수를 입력 받아서 Boxing으로 Wrapper객체를 만든 후, 다시 Unboxing으로 합산된 결과를 출력하세요.
		1) Scanner 객체 생성
		2) 입력문자열1, 입력문자열2
		3) Wrapper Integer num01Obj, num02Obj 할당
			(Boxing처리) 숫자형문자열 ==> Wrapper객체
		4) AutoUnboxing
			int num01 = num01Obj;
			int num02 = num02Obj;
		5) 합산 출력
			num01 + num02;
		*/
//		Scanner sc = new Scanner(System.in);
//		System.out.print("첫번째 수를 입력:");
//		String str1 = sc.nextLine();
//		System.out.print("두번째 수를 입력:");
//		String str2 = sc.nextLine();
//		// boxing으로 데이터 할당.
//		Integer num01Obj = Integer.valueOf(str1);
//		Integer num02Obj = Integer.valueOf(str2);
//		// autoUnboxing
//		int num01 = num01Obj;
//		int num02 = num02Obj;
//		System.out.println("합산값:"+(num01+num02));
		/*
[1단계:코드] 14. ArrayList로 임의의 수학점수(0~100) 정수형데이터 반복문에 의해 5개 데이터를 나오게 한후, autoBoxing에 의해 할당처리하세요.
		*/
		// 기본 정수 ==> autoboxing에 의해 Wrapper할당.
		Integer numObj = (int)(Math.random()*101);
		System.out.println("Auto Boxing:"+numObj);
		
		ArrayList<Integer> iList = new ArrayList<Integer>();
		
		// Integer형태의 객체가 ArrayList로 만들어진 구조
		// int num01 = (int)(Math.random()*101); 정수
		// iList.add(new Integer(num01)); Boxing
		//
		for(int cnt=1;cnt<=5;cnt++) {
			iList.add((int)(Math.random()*101));
			System.out.println(iList);
		}
		/*
		 * */
		
	}
}

package javaexp.z01_homework;

public class A02_0830 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//      0830과제 - 신아령
//      [1단계:개념] 1. 기본 출력형식과 특수문자에 대하여 예제를 통해 기술하세요
//		1) 기본 출력 형식
		System.out.println("안녕하세요"); // 출력할 내용을 ""(문자열)로 처리할 때, 사용한다
		System.out.print("안녕하세요"); // 줄바꿈을 포함하지 않을 때 사용한다
		System.out.println("안녕하세요"); // 줄바꿈 기능을 포함할 때 사용한다
//		2) 자바의 출력 메서드에서 사용하는 특수문자
		System.out.println("1\n2\n3\n4\n5"); // \n : 줄바꿈
		System.out.println("1\t2\t3\t4\t5"); // \t : 탭간격
		
//      [1단계:개념] 2. 변수명의 선언 규칙을 예제를 통하여 기술하세요.
		/* 
		변수명의 선언 규칙
		1) 첫번째 글자는 문자이거나 $,_여야 하고 숫자로 시작할 수 없다(필수)
			ex) int num = 10; // 사용가능
				int $num = 10; // 사용가능
				int _num = 10; // 사용가능
				int 10num = 10; // 에러발생
		2) 영어 대소문자가 구분된다(필수)
			ex) int num = 10;, int NUM = 10; // 둘은 다른 변수로 처리된다
		3) 첫문자는 영어 소문자로 시작하되, 다른 단어가 붙을 경우 첫자를 대문자로 한다.
			ex) int maxSpeed = 170;
		4) 문자 수는 제한이 없다.
			ex) int studentName;
		5) 자바의 예약어는 사용할 수 없다.(필수)
			ex) this, int, class, if 등 사용할 수 없다.
				String if = "홍길동"; // 예약어는 에러발생
				String if01; // 변수 선언시 예약어를 벗어나기위한 방법으로 뒤에 숫자를 붙여준다.
		*/
				
//      [1단계:코드] 3. 21억, 15억 데이터를 int에 할당하고, 합산결과를 변수를 선언하여 할당 출력하세요
		long data01 = 2100000000L;
		int data02 = 1500000000;
		System.out.println(data01+(long)data02);
				
//      [1단계:개념] 4. 150라는 데이터는 기본데이터유형 중에 어디에 할당이 가능한가를 기술하고 그 이유에 대하여 설명하세요
//		byte타입 값의 범위는 -127~128이므로 150라는 데이터가 속할 수 없다.
//		따라서 byte타입보다 크기가 큰 short, int, long타입에 할당이 가능하다.		
		
//      [2단계:코드] 5. 알파벳의 코드값 범위와 문자 0부터 9까지 범위의 코드값 범위를 확인하고 출력하세요.
		int code01 = 0;
		char ch01= (char)code01;
		char ch02 = (char)(code01+1);
		System.out.println(ch01);
		System.out.println(ch02);

//      [1단계:개념] 6. 형변환 두가지 유형을 예제를 통해서 기술하고 설명하세요..
//		1) 자동(묵시적) 타입 변환 : promotion
		int  intVal1 = 87;
		double dblVal1 = intVal1;
		System.out.println(dblVal1);
//		2) 강제(명시적) 타입 변환 : casting
		double dblVal2 = 87.1;
		int intVal2 = (int)dblVal2;
		System.out.println(intVal2);
		 
//      [1단계:코드] 7. 500cc의 오렌지쥬스를 3잔에 나누어 할당할려고 한다. 소숫점 이하가 처리된 경우와
//            소숫점 이하가 처리되지 않는 경우를 나누어 코딩하세요
		int juice = 500;
		int div = 3;
		System.out.println("소숫점 이하가 처리된 경우:"+juice/div);
		System.out.println("소숫점 이하가 처리되지 않은 경우:"+juice/(double)div);
		
		
//		0830과제 - 정답		
//      [1단계:개념] 1. 기본 출력형식과 특수문자에 대하여 예제를 통해 기술하세요
/*			1) 메서드
 * 				System.out.println(); //줄바꿈
 * 				System.out.print(); //줄변경없이
 * 			2) 출력처리 내용
 * 				\n : 문자열로 줄바꿈 기능 포함
 * 				\t : 문자열로 탭간격 처리
 * 				\"
 * 				System.out.print("사과\t바나나\t")
 */
//      [1단계:개념] 2. 변수명의 선언 규칙을 예제를 통하여 기술하세요.
/*			1) 숫자는 첫자로 사용하지 않아야 한다.
 * 				int 10num;(X) int num01;(O)
 * 			2) 변수명에 특수문자는 허용되지 않는다. 단, _,$는 허용
 * 				int $name;(O), String #alis;(X)
 * 			3) 대소문자는 구분하여 다른 변수명으로 인식한다.
 * 				int num01;
 * 				int nuM01;
 * 			4) 예약어 - 명령어(내장 keyword)는 변수명으로 사용하지 못한다.
 * 				int if;(X)
 * 			5) 합성어 대문자로 시작하여 구분하여 사용한다.(가독성)
 * 				String setName;
 */
//      [1단계:코드] 3. 21억, 15억 데이터를 int에 할당하고, 합산결과를 변수를 선언하여 할당 출력하세요
		int num01 = 2100000000;
		int num02 = 1500000000;
		int sum = num01+num02;
		long sum2 = (long)num01+(long)num02;
		System.out.println("합산결과:"+sum);
		System.out.println("합산결과:"+sum2);
		
//      [1단계:개념] 4. 150라는 데이터는 기본데이터유형 중에 어디에 할당이 가능한가를 기술하고 그 이유에 대하여 설명하세요
/*		150은 byte범위은 1byte초과하여 할당이 불가능하여 에러가 발생
 * 		그외 2byte이상의 데이터유형에는 할당이 가능하다.
 * 		byte
 */
//		byte num11 = 150;
		short num12 = 150;
		int num13 = 150;
		long num14 = 150;
		System.out.println(num12);
		System.out.println(num13);
		System.out.println(num14);
				
//      [2단계:코드] 5. 알파벳의 코드값 범위와 문자 0부터 9까지 범위의 코드값 범위를 확인하고 출력하세요.
		// A~Z, a~z
		int code13 = 'A';
		int code14 = 'Z';
		int code15 = 'a';
		int code16 = 'z';
		System.out.println("알파벳");
		System.out.println("A:"+code13);
		System.out.println("Z:"+code14);
		System.out.println("a:"+code15);
		System.out.println("z:"+code16);
		// 65~90, 97~122
		int code11 = '0';
		int code12 = '9';
		System.out.println("코드값:"+code11);
		System.out.println("코드값:"+code12);
		// 48~57
		for(int cnt = 48;cnt<=57;cnt++) {
			System.out.println(cnt+":"+(char)cnt);
		}
		
//      [1단계:개념] 6. 형변환 두가지 유형을 예제를 통해서 기술하고 설명하세요..
//			형변환은 데이터유형(타입)이 변경되는 것을 말한다.	
//			크게 promote(자동형변환)과 casting(강제형변환)이 있다.
//			promote는 보통 작은데이터유형의 테이터를 큰데이터유형에 할당할 때,
//			주로 발생하는데, 별다른 처리없이 데이터를 할당하여 변경되는 것을 말한다.
			int num30 = 10;
			double num31 = num30;
			System.out.println(num30);
		
//      [1단계:코드] 7. 500cc의 오렌지쥬스를 3잔에 나누어 할당할려고 한다. 소숫점 이하가 처리된 경우와
//            소숫점 이하가 처리되지 않는 경우를 나누어 코딩하세요
			int juicy = 500;
			int glasses = 3;
			System.out.println("한잔당용량(int):"+(juicy/glasses));
			System.out.println("한잔당용량(double):"+(double)juicy/glasses);
			
		
	}

}

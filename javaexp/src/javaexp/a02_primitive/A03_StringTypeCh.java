package javaexp.a02_primitive;

public class A03_StringTypeCh {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 숫자형 문자열 데이터에 대한 숫자형 처리
		1.  문자열 ==> 숫자
			1) 정수형
				"25" ==> 25
				Integer.parseInt("25")
				==> 정수형 25로 변환이 된다.
				int에 할당도 하고, 숫자형과 여산이 가능하다.
			2) 실수형
				"3.14" ==> 
				Double.parseDouble("3.14")
		2. 숫자 ==> 문자열
			5 ==> ""+25 ==> "25"
			integer.toString(25); Wrapper 클래스에 의해서
			 숫자형을 문자열로 변환 처리..
			3.14 ==> ""+3.14 ==> "3.14"
			Double.toString(3.14);
			
		* */
		
		String numStr = "25"; //숫자형 문자열
		// 전제조건으로 숫자형인 문자열이어야 처리가 가능하다.
		// "이십오" ==> 에러 발생
		System.out.println(30 + Integer.parseInt(numStr));
		int num01 = Integer.parseInt(numStr);
		System.out.println(25 + num01);
		System.out.println(25 + numStr);
		String num02Str = "3.14";
		System.out.println(50.15 + Double.parseDouble(num02Str));
		double num02 = Double.parseDouble(num02Str);
		System.out.println(50.15 + num02);
		System.out.println(50.15 + num02Str);
		String noNumStr = "이십오";
		//System.out.println(Integer.parseInt(noNumStr));
		// 숫자형이 아닌 문자열은 에러발생한다.
		// ex) args A04_StringTypeExp.java
		//  args로 물건명 가격 갯수를 매개변수로 입력 받아.
		//  가격 갯수를 형변환 처리하여 총비용을 출력하세요.
		
		

	}

}

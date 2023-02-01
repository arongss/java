package javaexp.a12_io;

import java.io.IOException;
import java.io.InputStream;

public class A02_InputStreamExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		1. 숫자
		2. 문자 : 숫자의 코드값 생성
		3. 입력 받는 데이터는 코드값과 매핑된 문자로 받을 수 있다.
		 * */
		System.out.print("정답을 입력하세요(1~4):");
		InputStream is = System.in;
		try {
			int code = is.read(); // reae()에서 가져오는 것은code
			char inData = (char)code; // code를 문자로 변환
			System.out.println("입력받은 번호:"+inData);
			// 문자(char)를 숫자로 변환하기 위해 문자열로 바꾸고,
			// Integer.parseInt()등의 함수를 이용해서 처리하여야 한다.
			// 문자 ==> 문자열	""+'안'
			// 1) ""+'안'
			// 2) Character.valueOf('안').toString()
			char corNum = '3'; // 정답인 문자 '3'과 비교
			if(inData == corNum) {
				System.out.println("정답입니다.");
			}else {
				System.out.println("오답입니다.");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}

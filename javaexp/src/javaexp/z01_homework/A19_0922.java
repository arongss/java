package javaexp.z01_homework;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class A19_0922 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0922과제 - 신아령
[1단계:개념] 1. Stream이 무엇인지 기술하고, 자바의 대표적인 입출력 객체를 선언하세요.
		# 데이터의 전송을 처리하는 Stream
		1. 자바에서는 Stream이라는 api 객체를 통해서, 데이터를
		입력하거나 출력을 하는 등 처리를 하고 있다.
			- 파일의 데이터를 입/출력 또는 파일 자체를 전송
		2. System.out.println()은 기본적인 자바의 OutputStream의
		한 형태로 console 창을 통해 출력을 하게 한다.
		3. System.in : 자바에서 InputStream의 한 형태로 console창에
		데이터를 입력할 때, 사용되는 객체이다.
[1단계:코드] 2. InputStream을 이용하여, 70점 이상인지 여부를 확인하여 출력하세요.(byte ==> char ==> String ==> int 변환 필요) 
		InputStream is = System.in;
		byte [] brr = new byte[2];
		System.out.print("점수를 입력하세요:");
		try {
			int n = is.read(brr);
			String str = new String(brr);
			int point = Integer.parseInt(str);
			if(point>=70) {
				System.out.println("70이상!");
			}else {
				System.out.println("70이하!");
			}
			is.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
[1단계:개념] 3. byte 기반 stream과  문자기반 stream의 내용과 차이점을 기술하세요.
		- 바이트 기반 스트림은 그림, 멀티미디어, 문자 등 모든 종류의 데이터를 받고 보내는 것 가능
		- 문자 기반 스트림은 문자만 받고 보낼 수 있도록 특화
[1단계:코드] 4. read(byte[])를 활용하여 웹기반 자바프로그램은 무엇인가?라은 질문에 jsp이면 정답 그렇지 않으면 오답으로 처리하세요.
		InputStream is = System.in;
		byte[] inArr = new byte[3];
		System.out.print("웹기반 자바프로그램은 무엇인가?");
		try {
			is.read(inArr);
			String inputQa = new String(inArr);
			if(inputQa.equals("jsp")) {
				System.out.println("정답");
			}else {
				System.out.println("오답");
			}
			is.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
[1단계:코드] 5. InputStreamReader를 이용하여 물건명, 가격, 갯수를 입력받고, 총계까지 출력하세요.
		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.print("물건명 입력:");
			String product = bf.readLine();
			System.out.print("가격 입력:");
			String price = bf.readLine();
			System.out.print("갯수 입력:");
			String cnt = bf.readLine();
			int tot = Integer.parseInt(price)*Integer.parseInt(cnt);
			System.out.println("물건명:"+product);	
			System.out.println("가격:"+price+"원");	
			System.out.println("갯수:"+cnt+"개");
			System.out.println("총계:"+tot+"원");
			bf.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
[1단계:개념] 6. File객체/물리적파일의 생성방법을 기술하세요.
		파일 객체 생성 방법
		File file = new File("c:\\aa\aa.txt");
		File fil2 =  new File("c:/aa/aa.txt");
[1단계:코드] 7. homework 패키지 하위에 z01_home,z02_home,z02_home 폴드를 만들고 그 하위에 각각 menual1.txt~menual10.txt 파일을 생성하세요
		

== 평가대비(자바) 객관식 문제 ==344
1.  바이트 단위 입출력을 위한 최상위 입력 스트림 클래스는?
1) File 2) OutputStream 3) InputStream 4) Reader
==> InputStream : 바이트 기반 입력 스트림의 최상위 클래스로 추상 클래스
2.  아래 내용 중에 한글을 입력 처리해주는 Stream은 무엇인가?
1) InputStream 2) OutputStream 3) Writer 4) Reader
==> Reader : 문자 기반 입력 스트림의 최상위 클래스로 추상 클래스
3. Reader객체의 하위 객체가 아닌 것은 무엇인가?
1) FileReader 2) BufferedReader 3) InputStreamReader 4) InputStream
==> Reader하위객체 : FileReader,BufferedReader,InputStreamReader
4. 디렉토리에 포함되 파일 및 서브디렉토리 목록 배열로 리턴 File객체 하위의 기능메서드는?
1) list() 2) listFiles() 3) canRead() 4) getParentFile()


정답 : 3 4 4 1

		 * */
		/*
		0922과제 - 정답
[1단계:개념] 1. Stream이 무엇인지 기술하고, 자바의 대표적인 입출력 객체를 선언하세요.
		Stream이란 물결이라는 뜻으로 프로그래밍에서는 데이터의 흐름을
		처리할 때, 사용하는 객체이다.
		주로 콘솔창에 입력되는 데이터, 파일을 통해서 입력된 데이터,
		네트워크를 통해서 전송해오는 데이터를 읽고 쓸 때, 중간에 객체로
		이동하거나 전송할 때, 활용된다.
		InputStream, OutputStream객체를 상위 객체로 하여,
		하위에 여러가지 기능을 추가하는 객체들이 있다.
		 * */

	}

}

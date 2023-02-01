package javaexp.a12_io;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

public class A07_BufferReader {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ex) BufferedReader 객체를 활용하여 좋아하는 음악과 가수명을 입력받아 출력하세요
//		Reader rd = new InputStreamReader(System.in);
		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		try {
			System.out.print("좋아하는 음악명 입력:");
			String music = bf.readLine();
			System.out.print("좋아하는 가수명 입력:");
			String singer = bf.readLine();
			System.out.println("입력한 음악:"+music);	
			System.out.println("입력한 음악:"+singer);	
			bf.close();
//			rd.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

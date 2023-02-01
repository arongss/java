package javaexp.a12_io;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

public class A14_FileWriter {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String fName = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\a12_io\\Z02_Test.txt";
		try {
			Writer writer = new FileWriter(fName);
			writer.write(65);
			writer.append('안');
			writer.append('녕');
			writer.append('\n');
			char [] ar = {'좋','은',' ','날','\n'};
			writer.write(ar);
			writer.write("안녕하세요(String)\n");
			writer.flush();
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("IO에러:"+e.getMessage());
		} catch ( Exception e) {
			System.out.println("일반에러:"+e.getMessage());
		}
		

	}

}

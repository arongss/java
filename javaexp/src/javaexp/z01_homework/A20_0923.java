package javaexp.z01_homework;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Scanner;

public class A20_0923 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0923과제 - 신아령
[1단계:코드] 1. File객체를 통해 현재 경로 기준으로 room1~3만들고, Person1.txt~Person10.txt를 생성하세요.
		String path = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework";
		try {
			for(int cnt=1;cnt<=3;cnt++) {
				String subPath = path+"\\room"+cnt;
				File fold01 = new File(subPath);
				if(!fold01.exists()) {
					fold01.mkdir();
				}	
				for(int no=1;no<=10;no++) {
					File file01 = new File(subPath,"Person"+no+".txt");
					if(!file01.exists()) {
						file01.createNewFile();
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
[1단계:개념] 2. OutputStream 객체란 무엇인가? 기능메서드와 함께 설명하세요.
		# OutputStream
		1. 바이트기반 출력 스트림의 최상위 클래스로 추상 클래스
			OutputStream
			# 하위 객체들
			FileOutputStream
			PrintStream
			BufferOutputStream
			DataOutputStream
		2. 주요 기능 메서드
			write(int b) 출력 스트림으로 1바이트를 보낸다.
			write(byte[]b) 출력 스트림으로 매개값으로 주어진
				바이트 배열 b의 모든 바이트를 보낸다.
			write(byte[]b, int off, int len)
			flush() : 버퍼에 잔류하는 모든 바이트를 출력한다.
			close() : 사용한 시스템을 반납하고 출력 스트림을 닫는다.
[1단계:코드] 3. 기본 OutputStream객체를 생성해서 System.out을 할당하여, byte, byte[]로 데이터를 출력하세요.
		OutputStream os = System.out;
		try {
			byte []b = {66,67,68,69,70};
			os.write(b);
			os.flush();
			os.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
[1단계:코드] 4. 기본 Writer객체 활용하여 char[], String을 write()로 출력하세요.
		Writer out = new OutputStreamWriter(System.out);
		try {
			char []arr = {'안','녕','하','세','요'};
			out.write(arr);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
[1단계:코드] 5. Reader객체를 통해서 입력된 데이터를 FileWriter를 활용하여 파일에 내용을 기록하세요.
      ex) 회원정보(아이디/패스워드/이름/포인트) 탭간격처리.
		String path = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework\\Member.txt";
		Reader reader = new InputStreamReader(System.in); 
		BufferedReader bfr = new BufferedReader(reader); 
		try {
			Writer writer = new FileWriter(path);
			System.out.print("아이디:");
			String inputId = bfr.readLine();
			System.out.print("패스워드:");
			String inputPw = bfr.readLine();
			System.out.print("이름:");
			String inputName = bfr.readLine();
			System.out.print("포인트:");
			String inputPoint = bfr.readLine();
			writer.write("아이디\t패스워드\t이름\t포인트\n");
			writer.write(inputId+"\t"+inputPw+"\t"+inputName+"\t"+inputPoint);
			writer.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
[2단계:코드] 6. Path 객체를 활용하여 새파일 등록/파일내용 기록/파일 삭제를 처리하세요.
		String path = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework";
		Path newPath = Paths.get(path + "\\newFile.txt"); //파일등록
		File f = newPath.toFile();
		try {
			if (!f.exists()) f.createNewFile();
			Files.delete(newPath); //파일삭제
		} catch (IOException e) {
			e.printStackTrace();
		}
[1단계:코드] 7. Files와 Path를 활용하여 경로2개를 만들고, 경로1의 파일을 5개 임의로 만들어, 경로2에 1~5번이 numbering된 파일을 만드세요.
		
[2단계:코드] 8. 일기장 시스템 만들기. Scanner를 이용해서 오늘날짜를 입력하면 @@@@년@@월@@일.txt 파일이 생성되고
      날짜를 포함하여 오늘의 일기를 기록하고 Q!를 입력시 입력이 종료되면 해당 파일에 기록이 되게 처리하세요.
		
== 평가대비(자바) 객관식 문제 ==
1. 바이트 기반 출력 스트림의 최상위 클래스로 추상 클래스는 무엇인가?
1) InputStream 2) OutputStream 3) Reader 4) Writer
==> InputStream : 바이트 기반 입력 스트림의 최상위 클래스로 추상 클래스 
	OutputStream : 바이트기반 출력 스트림의 최상위 클래스로 추상 클래스 
	Reader : 문자 기반 입력 스트림의 최상위 클래스로 추상 클래스
	Writer : 문자 기반 출력 스트림의 최상위 클래스로 추상 클래스
정답:2
2. 바이트 기반 출력 스트림의 최상위 클래스로 추상 클래스는 무엇인가?
1) InputStream 2) OutputStream 3) Reader 4) Writer
정답:2
		 * */
		/*
		0923과제 - 정답
[1단계:코드] 1. File객체를 통해 현재 경로 기준으로 room1~3만들고, Person1.txt~Person10.txt를 생성하세요.
		1) File 생성할 기준 경로(최상위 경로)
		2) File(경로) room1의 경로 객체 생성
		
		3) File(파일) Person1.txt 파일 객체 생성.
		4) 위 경로 객체 for 처리
		5) 위 파일 객체 for 처리..
	
		String sPath = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework";

		try {
			for(int rcnt=1;rcnt<=3;rcnt++) {
				String roomPath = sPath+"\\room"+rcnt; // 기준경로 + 추가경로
				File room = new File(roomPath);
				if(!room.exists()) 
					room.mkdir();
				for(int fcnt=1;fcnt<=10;fcnt++) {
					String fName = roomPath + "\\Person"+fcnt+".txt";
					File file = new File(fName);
			
					if(!file.exists())
						file.createNewFile();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
[2단계:코드] 6. Path 객체를 활용하여 새파일 등록/파일내용 기록/파일 삭제를 처리하세요.
		1) File객체 만들기
		2) FileWriter를 활용하여 파일 내용 쓰기 처리..
		3) Path를 전환 후, 파일 삭제 처리하기. 
		
		String sPath2 = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework";
		String fname2 = "z01_show99.txt";
		File f = new File(sPath2, fname2);
		
		try {
			if(!f.exists()) f.createNewFile();
			// 파일명 ==> File ==> FileWriter ==> PrintWriter
			// 생성자로 담기
			FileWriter fw = new FileWriter(f);
			// 파일 내용에 쓰기 처리
			PrintWriter out = new PrintWriter(fw);
			out.print("문자열을 파일에 입력 처리합니다!!");
			out.close();
			fw.close();
			Path delFile = Paths.get(sPath2+"\\"+fname2);
			Files.delete(delFile);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
[1단계:코드] 7. Files와 Path를 활용하여 경로2개를 만들고, 경로1의 파일을 5개 임의로 만들어, 경로2에 1~5번이 numbering된 파일을 만드세요.
		room3 에 잇는 파일을
		newRoom4에 복사하면서
		 Person1.txt ~ Person5.txt
		 ==> 1001File.txt ~ 1005File.txt로 만들기 처리
		*/
		/*
		client1	 ==>show.txt==>	 sever
									DB - 1001.txt show.txt	상세정보
									File서버 - 1001.txt(저장될파일명)
		client2	 ==>show.txt==>	 sever
									DB - 1002.txt show.txt	상세정보
									File서버 - 1002.txt(저장될파일명)
		client3  <==show.txt==>  	DB - 1002.txt show.txt
								 	File서버 - 1002.txt(저장될파일명)
		 * */
		try {
			for(int fcnt=1;fcnt<=5;fcnt++) {
				String path1 = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework\\room3";
				String org1 = path1+"\\Person"+fcnt+".txt";
				String path2 = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework\\newRoom4";
				String tar1 = path2+"\\100"+fcnt+"File.txt";
				Path orgFile = Paths.get(org1);
				Path tarFile = Paths.get(tar1);
				Files.copy(orgFile, tarFile, StandardCopyOption.REPLACE_EXISTING);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
[2단계:코드] 8. 일기장 시스템 만들기. Scanner를 이용해서 오늘날짜를 입력하면 @@@@년@@월@@일.txt 파일이 생성되고
      날짜를 포함하여 오늘의 일기를 기록하고 Q!를 입력시 입력이 종료되면 해당 파일에 기록이 되게 처리하세요.
		1) 파일생성
			파일명을 입력받아서, File 객체에 파일을 생성하기
			- 기준 경로
			- 입력된 내용을 파일명 만들기..
		2) 입력된 내용으로 파일 쓰기
			- File ==> PrintWriter
			- 반복문을 통해서 계속 내용 입력 후,
			- Q! 통해서 파일 쓰기 종료 처리..
		*/
		Scanner sc = new Scanner(System.in);
		System.out.print("일기장 등록할 날짜입력(YYYYMMDD):");
		String date = sc.next(); // \n를 빼고 입력
		System.out.println("입력할 파일명:"+date+".txt");
		String dPath = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\z01_homework\\z01_diary\\";
		File df = new File(dPath+date+".txt");
		try {
			if(!df.exists()) df.createNewFile();
			System.out.println("내용을 입력하세요!");
			
			// 파일명 ==> File() ==> FileWriter() ==> PrintWriter()
			FileWriter fw = new FileWriter(df);
			PrintWriter out = new PrintWriter(fw);
			out.write("날짜:"+date+"\n");
			StringBuffer sbf = new StringBuffer();
			while(true) {
				// 라인별로 문자열을 받아서
				String data = sc.nextLine();
				// 마지막 라인에서 Q!를 입력시..
				if(data.equals("Q!")) {
					break;
				}
				sbf.append(data+"\n");				
			}
			// 최종적을 입력받은 문자열을 쓰기 처리..
			out.write(sbf.toString());
			System.out.println("일기 쓰기 종료");
			out.flush();
			// 자원해제..
			out.close();
			fw.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * */
		
	}

}

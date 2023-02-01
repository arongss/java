package javaexp.a12_io;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class A17_PathCopy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// ex)
		// A18_PathCopy.java
		// a02_fold/cpyFile01.txt
		// ==> a03_fold/showcpcpy.txt
		
		String orFile = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\a12_io\\a02_fold\\cpyFile01.txt";
		String tgFile = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\a12_io\\a03_fold\\showcpcpy.txt";
		Path orPath = Paths.get(orFile);
		Path tgPath = Paths.get(tgFile);
		
		try {
			Files.copy(orPath, tgPath, StandardCopyOption.REPLACE_EXISTING);
			System.out.println("복사 완료");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
//		String path = "C:\\a01_javaexp\\workspace\\javaexp\\src\\javaexp\\a12_io";
//		File fold01 = new File(path + "\\a03_fold");
//		if (!fold01.exists())
//			fold01.mkdir();
//		File file01 = new File(path + "\\a01_fold", "showcpcpy.txt");
//
//		try {
//			if (!file01.exists())
//				file01.createNewFile();
//			String orgFile = path + " a02_fold/cpyFile01.txt";
//			String tarFile = path + "a03_fold/showcpcpy.txt";
//			Path oriPath = Paths.get(orgFile);
//			Path copPath = Paths.get(tarFile);
//			Files.copy(oriPath, copPath, StandardCopyOption.REPLACE_EXISTING);
//			System.out.println("복사완료");
//
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

	}

}

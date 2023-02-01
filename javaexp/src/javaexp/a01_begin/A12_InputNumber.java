package javaexp.a01_begin;

import java.util.Scanner;

public class A12_InputNumber {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.print("사과의 갯수:");
		int appleCnt = sc.nextInt();
		System.out.print("바나나의 갯수:");
		int bananaCnt = sc.nextInt();
		int tot = appleCnt+bananaCnt;
		System.out.println("과일의 총계:"+tot);

	}

}

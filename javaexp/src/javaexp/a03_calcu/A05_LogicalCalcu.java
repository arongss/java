package javaexp.a03_calcu;

import java.util.Scanner;

public class A05_LogicalCalcu {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 논리 연산자
		1. 종류
			논리곱(&&), 논리합(||), 배타적 논리합(^),
			논리부정(!)연산을 수행하는 것을 말한다.
		2. 피연산자는 boolean타입(true/false)만 사용 가능하다.
		* */
		// 논리곱 처리 : 두 비교연산자가 모두 true일 때, true
		// 그 외는 false 처리.
		int age = 17;
		System.out.println("나이:"+age);
		System.out.println("청소년요금제 적용 유무:"+(age>=14 && age<18));
		// ex) 획득한 점수를 입력 받아서, 60~100사이인 경우만
		//    유효한 점수이면 합격 여부가 true이게 처리하세요.
		int score = 70;
		System.out.println("획득한 점수:"+score);
		System.out.println("합격여부:"+(score>=60 && score<=100));
		// ex1) 획듣한 국어, 영어, 수학 점수를 입력받아서
		// 		모두가 80점이상이면 선물 획득여부 true 그외는
		//		false
		/*
		int kor,eng,math;
		Scanner sc = new Scanner(System.in);
		System.out.println("국어점수:");kor = sc.nextInt();
		System.out.println("영어점수:");eng = sc.nextInt();
		System.out.println("수학점수:");math = sc.nextInt();
		System.out.println("선물 획득 여부:"+(kor>=80 && eng>=80 && math>=80));
		*/
		// 논리합(||)
		// 비교연산자1 || 비교연산자2
		// 두개의 비교연산식 중 하나만 true일 때, true이고,
		// 모두다 false일 때, false처리
		// ex) 국어, 영어, 수학 점수 중, 하나만 80점 이상인
		//	   경우 상을 준다고 할때 논리합을 이용해서
		//     kor>=80 || eng>=80 || math>=80
		//     로 처리할 수 있다.
		// ex) 물건 2개의 가격 갯수를 할당하여, 이중 물품의
		//     구매 단위 계
		//     10000이상이 하나라도 잇으면 할인 대상 여부가 true
		//     로 처리되게 하세요.
		int appPrice = 2000,appCnt = 2;
		int banPrice = 4000,banCnt = 3;
		boolean isDis = (appPrice*appCnt>=10000) || (banPrice*banCnt>=10000);
		System.out.println("할인대상여부:"+isDis);
		// !(비교/논리) : 논리 부정 연산자
		//   true ==> false, false ==> ture
		int age1 = 17;
		boolean isAdo = age1>=14 && age1<18;
		System.out.println("청소년 아닌지 여부:"+!isAdo);

	}

}

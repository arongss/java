package javaexp.a03_calcu;

public class A02_restoreCal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 대입연산자
		1. = : 데이터를 오른쪽에서 왼쪽으로 대입하여 할당하는 연산자
		 */
		int num01 = 25;
		int num02, num03, num04;
		// 한번에 정수형 데이터를 3개 선언
		num02 = num03 = num04 = 5;
		int num05=6;double num06=1.4;float num07=4.7F;
		System.out.println("# 대입연산자 #");
		System.out.println("num02:"+num02);
		System.out.println("num03:"+num03);
		System.out.println("num04:"+num04);
		System.out.println("num05:"+num05);
		System.out.println("num06:"+num06);
		System.out.println("num07:"+num07);
		// ex) 회원의 id를 3개만들고, 해당 아이디를 각각 할당하고,
		//	   회원 id의 pt를 3개변수로 만들고, 초기에 10000을
		//     할당하여 id와 pt를 출력하세요.
		String id01,id02,id03;
		id01="himan";id02="goodMan";id03="higirl";
		int pt01,pt02,pt03;
		pt01 = pt02 = pt03 = 10000;
		System.out.println("아이디\t포인트");
		System.out.println(id01+"\t"+pt01);
		System.out.println(id02+"\t"+pt02);
		System.out.println(id03+"\t"+pt03);
		// ex) 학생2명의 이름과 국어, 영어, 수학점수를 할당하여
		//	   아래와 같이 추력하세요
		// 이름	국어	영어 수학	평균
		// @@@	@@@	@@@	@@@	@@@
		// @@@	@@@	@@@	@@@	@@@
		String name01,name02;
		name01="홍길동";name02="김길동";
		int kor1,kor2,eng1,eng2,mat1,mat2;
		kor1=70;kor2=80;eng1=80;eng2=85;mat1=90;mat2=100;
		System.out.print("이름\t");
		System.out.print("국어\t");
		System.out.print("영어\t");
		System.out.print("수학\t");
		System.out.print("평균\n");
		double avg1 = (kor1+eng1+mat1)/3.0;
		double avg2 = (kor2+eng2+mat2)/3.0;
		System.out.println(name01+"\t"+kor1+"\t"+eng1+"\t"+mat1+"\t"+avg1);
		System.out.println(name02+"\t"+kor2+"\t"+eng2+"\t"+mat2+"\t"+avg2);
		
	}

}

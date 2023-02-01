package javaexp.z01_homework;

import java.util.Scanner;

public class A10_0909 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0909과제 - 신아령
[1단계:코드] 1. 짜장면(5000), 짬뽕(6000)의 가격으로 되었을 때, 증감 연산자를 활용해서
            1~3, 1~5까지의 총비용을 출력하세요.
		int jj = 5000; 
		int jb = 6000;
		int cnt1 = 1; int cnt2 = 1;
		int tot1 = 0; int tot2 = 0;
		System.out.println("짜장면"+cnt1+++"그릇:"+(tot1+=jj));
		System.out.println("짜장면"+cnt1+++"그릇:"+(tot1+=jj));
		System.out.println("짜장면"+cnt1+++"그릇:"+(tot1+=jj));
		System.out.println("짬뽕"+cnt2+++"그릇:"+(tot2+=jb));
		System.out.println("짬뽕"+cnt2+++"그릇:"+(tot2+=jb));
		System.out.println("짬뽕"+cnt2+++"그릇:"+(tot2+=jb));
		System.out.println("짬뽕"+cnt2+++"그릇:"+(tot2+=jb));
		System.out.println("짬뽕"+cnt2+++"그릇:"+(tot2+=jb));
		System.out.println("총 비용:"+(tot1+tot2));
[1단계:개념] 2. 단항연산자, 이항연산자, 삼항 연산자의 차이점을 개념과 예제를 통해 기술하세요.
		연산자의 갯수에 따른 구분을 말한다.
		단항연산자 : +25, -25, -num01
				  ++cnt, cnt--, cnt+=2
		이항연산자 : 25 + 3, num01 + num02
		삼항연산자 : 조건?true일때:false일때
				  point>=60?"합격":"불합격"
[1단계:코드] 3. 100에서 1/4로  4회 누적해서 나눈 값을 아래의 형식으로 출력 하세요
                 초기데이터 100
                 1회  25 
                 2회  6.2..
                 3회  1.54...
                   4회  0.38..
		double num01 = 100;
		int cnt = 1;
		System.out.println("초기데이터 "+num01);
		System.out.println(cnt+++"회 "+(num01*=0.25));
		System.out.println(cnt+++"회 "+(num01*=0.25));
		System.out.println(cnt+++"회 "+(num01*=0.25));
		System.out.println(cnt+++"회 "+(num01*=0.25));
[2단계:코드] 4. [continue 활용]1~12월까지 마지막일수*10으로 월급여 산정하되,
            31일만 있는 월만 산정해서 출력하고 나머지 월(30일, 28일까지 있는 달)은 산정 처리하지 않고 총 급여을 아래와 같이 출력하세요
                      월  일수   월급여 누적연봉      
                      1월 31일  310만 310만원
                      3월 31일  310만 620만원
                      5월 31일  310만 930만원
                      ..
                      12 31일  ..
		int day = 31;
		int money = day*10;
		int tot = 0;
		System.out.println("월\t"+"일수\t"+"월급여\t"+"누적연봉");
		for(int cnt=1;cnt<=12;cnt++) {
			if(cnt==2) continue;
			if(cnt==4) continue;
			if(cnt==6) continue;
			if(cnt==9) continue;
			if(cnt==11) continue;
			System.out.println(cnt+"월\t"+day+"일\t"+money+"만\t"+(tot+=money)+"만원");
		}
[2단계:응용] 5. 두명(컴퓨터vs컴퓨터)의 구슬 홀짝게임 : 한명이 구슬 10개를 가지고 임의의로 쥐게 하여, 
          다른 한명이 이것을 맞추었는지 여부에 따라 승/패로 출력하게 하세요.
		int com1 = (int)(Math.random()*10+1);
		int com2 = (int)(Math.random()*2);
		System.out.println("com1의 구슬:"+com1+"개");
		if(com2==0) {
			System.out.println("com2의 선택:홀");
		}else {
			System.out.println("com2의 선택:짝");
		}
		if(com1%2==com2) {
			System.out.println("com2패");
		}else{
			System.out.println("com2승");
		}
[1단계:응용] 6. 두 팀(홍/청-컴퓨터vs컴퓨터)이 주사위를 던져 홍팀의 결과를 출력하세요(승/무/패)
		int redTeam = (int)(Math.random()*6+1);
		int blueTeam = (int)(Math.random()*6+1);
		System.out.println("홍팀:"+redTeam);
		System.out.println("청팀:"+blueTeam);
		if(redTeam>blueTeam) {
			System.out.println("홍팀의 결과: 승");
		}else if(redTeam==blueTeam){
			System.out.println("홍팀의 결과: 무");
		}else {
			System.out.println("홍팀의 결과: 패");
		}
[2단계:응용] 7. while문 숫자 맞추기 게임, 컴퓨터가 임의로 1~100범위의 숫자를 저장하면,
         while문을 통해서 해당 숫자를 입력한다. 비교해서 동일하면 종료,
		System.out.println("# while문 숫자맞추기 게임 #");
		int myNum = 0;
		int ranNum = (int)(Math.random()*100+1);
		while(ranNum!=myNum) {
			System.out.print("숫자를 입력하세요:");
			Scanner sc = new Scanner(System.in);
			myNum = sc.nextInt();
			if(myNum>ranNum) {
				System.out.println("Down");
			}else if(myNum<ranNum) {
				System.out.println("Up");
			}else {
				System.out.println(ranNum+" 맞았어요!");
				break;
			}
		}
[1단계:개념] 8. 참조변수가 무엇인지? 메모리 영역을 기본 데이터유형과 비교하여
      기본 예제를 통해서 설명하세요.
		1. 기본 타입 변수 - 실제 값을 변수안에 저장
			cf) stack영역에 선언하고 실제 데이터를 할당
		2. 참조 타입 변수 - 주소를 통해 객체 참조
			cf) heap영역에 저장하고 이 heap영역의 주소값을 stack영역에 저장한다.
[1단계:확인] 9. Music 클래스를 선언하고, 해당 m01, m02 참조변수를 선언하고, 비교하세요.
		Music m01 = new Music();
		Music m02 = new Music();
		System.out.println(m01);
		System.out.println(m02);
class Music{}

		*/
		/*
		0910과제 - 신아령
[1단계:개념] 1. 배열과 반복문의 관계를 기술하고, 학생 30명을 임의의 점수(0~100)로 배열에 할당/출력하세요.
		배열 : 같은 타입의 데이터를 같은 이름으로 연속된 공간에 저장하는 자료 구조를 말한다.
		반복문 : 중괄호 블럭 내용을 반복적으로 실행할 때 사용한다.(for문, while문, do-while문)
		for(int cnt=1;cnt<=30;cnt++) {
			System.out.print(cnt+"번학생점수:");
			int score = (int)(Math.random()*100+1);
			System.out.println(score);
		}
[1단계:응용] 2. 무지개 색상을 배열로 선언하고, 이 중에서 임의의 색상 3개를 출력하세요
		String ranbow[] = {"빨","주","노","초","파","남","보"};
		for(int idx=0;idx<ranbow.length;idx++) {
			System.out.print(ranbow[idx]+" ");
		}
		System.out.println();
		System.out.println("# 임의의 색상 #");
		for(int cnt=1;cnt<=3;cnt++) {
			int rIdx = (int)(Math.random()*ranbow.length);
			System.out.print(ranbow[rIdx]+" ");
		}
[1단계:개념] 3. 클래스와 객체의 관계를 메모리를 활용하여 설명하고, 주소값을 출력하세요..
		# 객체와 클래스
		1) 클래스 : 설계도, 객체 : 구체적인 사물/객체
		2) 클래스에는 객체를 생성하기 위한 필드와 메소드가 정의
		3) 클래스로부터 만들어진 객체를 해당 클래스의 인스턴스(instance)
		4) 하나의 클래스로부터 여러개의 인스턴스를 만들수 있다.
[1단계:개념] 4. 클래스를 통해 만들어진 객체와 일반 primitive 데이터와 어떠한 차이점이 있는지 기술하세요.
		자바에서는 기본 stack영역에서 선언 및 호출, 할당되는 기본 데이터 타입으로 정수, 실수, 문자, 논리형이 있다.
[1단계:확인] 5. 아래와 같이 여러가지 생성자를 초기화하고 출력하세요.
          1) Singer 클래스를 선언하고 매개변수로 이름, 소속사, 메인곡을 선언하고, 생성자를 통해서 초기화 하고 출력하세요.
          2) Game 클래스를 선언하고 출시회사, 비용, 인기순
		Singer s1 = new Singer("V","bts","butter");
		System.out.println("이름:"+s1.name);
		System.out.println("소속사:"+s1.team);
		System.out.println("메인곡:"+s1.musicName);
		
		Gamer g1 = new Gamer("블리자드",50000,"오버워치");
		System.out.println("출시회사:"+g1.company);
		System.out.println("비용:"+g1.price);
		System.out.println("인기순:"+g1.favList);
	}

}
class Singer{
	String name;
	String team;
	String musicName;
	Singer (String name,String team,String musicName){
		this.name = name;
		this.team = team;
		this.musicName = musicName;
	}
}
		
class Gamer{
	String company;
	int price;
	String favList;
	Gamer(String company,int price,String favList){
		this.company = company;
		this.price = price;
		this.favList = favList;
	}
}
		*/
		/*
		0911과제 - 신아령
[1단계:확인] 1. [리턴유형연습] 쇼핑몰에서 구매한 물건, 가격, 갯수, 배송지를 리턴값으로 선언하는 메서드와, 
            리턴값이 없이 위 정보를 출력하는 메서드를 선언하세요
		Shopping s1 = new Shopping("사과",2000,5,"서울");
		System.out.println("# 구매목록 #");
		System.out.println("물건:"+s1.name);
		System.out.println("가격:"+s1.price);
		System.out.println("갯수:"+s1.cnt);
		System.out.println("배송지:"+s1.address);
		Shopping s2 = new Shopping("바나나",1000,5,"부산");
		System.out.println("총계:"+s2.buyProd());
	}
}
class Shopping{
	String name;
	int price;
	int cnt;
	String address;
	Shopping (String name, int price, int cnt, String address){
		this.name = name;
		this.price = price;
		this.cnt = cnt;
		this.address =address;
	}
	int buyProd(){
		System.out.println("# 리턴값 구매목록 #");
		System.out.println("물건:"+this.name);
		System.out.println("가격:"+this.price);
		System.out.println("갯수:"+this.cnt);
		System.out.println("배송지:"+this.address);
		return this.price*cnt;
	}
}
[1단계:확인] 2. [매개변수연습] driving메서드에 매개변수로 1~3개를 각각 선언하되,
            차량명, 목적지, 거리를 선언하여 출력하되 오버로딩 규칙에 따라 처리하세요.
		Driving d1 = new Driving();
		d1.getDrive("벤츠", "대구", "100km");
	}
}
class Driving{
	void getDrive(String name, String loc, String dist){
		System.out.println("차량명:"+name);
		System.out.println("목적지:"+loc);
		System.out.println("거리:"+dist);
	}
}
[1단계:확인] 3. [매개변수+리턴] Student 클래스
            tot() 매개변수:국어,영어,수학점수 리턴값:총점수(정수)
            avg() 매개변수:국어,영어,수학점수 리턴값:평균값(실수)
            reg() 매개변수:번호,이름  리턴값:@@번 @@@(문자열)
            show() 매개변수:이름,국어,영어,수학  리턴값:없음, 출력:매개변수값
		Student st1 = new Student();
		System.out.println("총점수:"+st1.tot(90, 80, 70));
		System.out.println("평균값:"+st1.avg(80, 70, 90));
		System.out.println(st1.reg("01","홍길동"));
		st1.show("홍길동",50,70,60);
	}
}
class Student{
	int tot(int kor,int eng,int math) {
		System.out.println("# 총점수 #");
		System.out.println("국어:"+kor);
		System.out.println("영어:"+eng);
		System.out.println("수학:"+math);
		return kor+eng+math;
	}
	double avg(int kor,int eng,int math) {
		System.out.println("# 평균값 #");
		System.out.println("국어:"+kor);
		System.out.println("영어:"+eng);
		System.out.println("수학:"+math);
		return (kor+eng+math)/3;
	}
	String reg(String num, String name) {
		System.out.println("# @@번 @@@ #");
		System.out.println("번호:"+num);
		System.out.println("이름:"+name);
		return num+"번 "+name;
	}
	void show(String name,int kor,int eng,int math) {
		System.out.println("# 리턴값없음 #");
		System.out.println("이름:"+name);
		System.out.println("국어:"+kor);
		System.out.println("영어:"+eng);
		System.out.println("수학:"+math);
	}
}
[1단계:확인] 4. [매개변수+리턴] Member 클래스 선언하고, regdate()메서드로
            회원명, 아이디, 패스워드 매개변수로 입력과 String으로 등록 내용을 리턴
            usePoint()메서드로 사용한 포인트를 입력받아 10%적립포인트 리턴(실수)
            addPoint()메서드로 추가할포인트를 입력받아 지역변수로 있는 point=1000
            에 추가하여 리턴처리하세요.
		Member m1 = new Member();
		m1.regdate("김길동", "gdkim", "7777");
		m1.usePoint(500);
		m1.addPoint(550);
	}
}
class Member{
	int point = 1000;
	String regdate(String name,String id,String pass) {
		System.out.println("회원명:"+name);
		System.out.println("아이디:"+id);
		System.out.println("패스워드:"+pass);
		return name+id+pass;
	}
	double usePoint(int point) {
		System.out.println("사용한포인트:"+point);
		System.out.println("적립한포인트:"+point*0.1);
		return point*0.1;
	}
	int addPoint(int add) {
		System.out.println(point+add);
		return point+add;
	}
}
		*/
		/*
		0912과제 - 신아령
[1단계:확인] 1. [매개변수+필드] Caffee 클래스 선언, 
         필드 : 주문커피종류, 주문 가격, 주문 갯수
         메서드 : orderName - 주문커피종류 저장
                orderCoffee - 주문커피종류, 가격, 갯수 저장
                getPay - 총비용(가격*갯수) 리턴
                getName() - 주문커피종류 리턴
                showAll() - 저장된 주문커피종류,가격,갯수,총액 문자열리턴
		Caffee cf1 = new Caffee();
		cf1.orderName("아메리카노");
		Caffee cf2 = new Caffee();
		cf2.orderCoffee("라떼", 5000, 3);
		System.out.println("총비용:"+cf2.getPay());
		cf1.getName();
		cf2.getName();
		System.out.println("주문커피종류1:"+cf1.getName());
		System.out.println("주문커피종류2:"+cf2.getName());
		System.out.println("총주문:"+cf2.showAll()+"원");
	}
}
class Caffee{
	String coffee;
	int price;
	int cnt;
	void orderName(String coffee) {
		this.coffee = coffee;
	}
	void orderCoffee(String coffee,int price,int cnt) {
		this.coffee = coffee;
		this.price = price;
		this.cnt = cnt;
	}
	int getPay() {
		return this.price*this.cnt;
	}
	String getName() {
		return coffee;
	}
	String showAll() {
		this.coffee=coffee;
		this.price=price;
		this.cnt=cnt;
		return coffee+(int)price*(int)cnt;
	}
}
[1단계:확인] 2. [필드+로직처리] Gugu 클래스 선언
          필드 : 단수, 시작단수, 마지막단수
      메서드 : schGrade - 단수지정
          showResult - 해당 단수의 1~9까지 연산 출력
                             setFromTo - 시작단수,마지막단수 지정
          showResult2 - 범위가 있는 단수 출력
		Gugu g1 = new Gugu();
		g1.showResult(3);
		g1.showResult(5);
		g1.showResult(7);
		Gugu g2 = new Gugu();
		g2.showResult2(2, 6);
	}
}
class Gugu{
	int schGrade;
	int start;
	int end;
	void showResult(int schGrade) {
		System.out.println(" # "+schGrade+"단 #");
		for(int cnt=1;cnt<=9;cnt++) {
			System.out.println(schGrade+" X "+cnt+" = "+schGrade*cnt);
		}
	}
	void showResult2(int start, int end) {
		for(int cnt1=start;cnt1<=end;cnt1++) {
			System.out.println(cnt1+"단");
			for(int cnt2=1;cnt2<=9;cnt2++) {
				System.out.println(cnt1+" X "+cnt2+" = "+cnt1*cnt2);
			}
		}
	}
}
[1단계:확인] 3. [필드+로직처리] Bus 클래스 선언
         필드 : 버스번호, 구간, 비용
         메서드 : basicInfo - 입력 버스번호, 구간, 비용
            takeBus - 입력 : 인원수 리턴:비용*인원수
                    화면 출력 : 구간 @@ 인  @@번 @@명 탑승
		Bus b1 = new Bus();
		b1.basicInfo("마포1004", "마포-신촌", 1500);
		System.out.println("버스번호:"+b1.busNum);
		System.out.println("버스구간:"+b1.busLoc);
		System.out.println("버스비용:"+b1.price);
		System.out.println("총계:"+b1.takeBus(30));
	}
}
class Bus{
	String busNum;
	String busLoc;
	int price;
	void basicInfo(String busNum,String busLoc,int price) {
		this.busNum=busNum;
		this.busLoc=busLoc;
		this.price=price;
	}
	int takeBus(int cnt) {
		System.out.println(busLoc+"구간 "+cnt+"인 "+busNum+"명 탑승");
		return price*cnt;
	}
}
		 * */
		
	}

}

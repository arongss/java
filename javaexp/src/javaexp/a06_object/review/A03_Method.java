package javaexp.a06_object.review;

public class A03_Method {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 메서드
		1) 필드와 상호관계 속에서 데이터 처리.
			ex) 물건구매시, 구매물건의 갯수를 저장 및 전체 계 호출.
				
		2) 주요 기능 처리
			- 리턴타입/실제리턴값
				메서드는 리턴타입을 먼저하고 그 리턴타입에 맞는
				데이터를 마지막에 return으로 처리하여야 한다.
				리턴값이 없으면 void를 선언한다.
			- 매개변수 처리
				이 객체를 호출하는 외부 객체나 main(0에서 데이터를
				넘겨서 처리할 때, 필요로 한다.
			- {}(중괄호블럭안)에 처리할 프로세스 처리.
		 * */
		Person2 p01 = new Person2();
		System.out.println(p01.getStr());
		String ret = p01.getStr();
		System.out.println("리턴문자:"+ret);
		System.out.println("필드 리턴:"+p01.getName());
	
	// ex) 클래스로 Computer를 선언하고, 필드로 컴퓨터명선언,
	//		매서드1 : 컴퓨터의이름, 메서드2 : 컴퓨터의 수량리턴(임의로 지정)
	//		해당 메서드를 호출하여 변수에 할당 또는 출력하세요.
		Computer com = new Computer();
		System.out.println(com.getName());
		String nam01 = com.getName();
		System.out.println("이름:"+nam01);
		int cnt01 = com.getCnt();
		System.out.println("리턴값과 + 10:"+(cnt01+10));
		com.showInfo();
		System.out.println("컴퓨터 현재 상태:"+com.curOnOff());
		com.pushBtn(true);
		System.out.println("컴퓨터 현재 상태:"+com.curOnOff());
		// ex) Mart 클래스선언 필드 pcnt(구매한물건의 갯수),
		//		기능메서드 buyProd(int cnt) 매개변수로 한번에 구매한 물건의 갯수를 누적 처리
		//		getProdCnt()는 리턴값 pcnt로 처리하여 현재 구매한 물건갯수를 확인할 수 있도록 처리.
		Mart m1 = new Mart();
		m1.buyProd(5);
		m1.buyProd(3);
		m1.buyProd(4);
		System.out.println("현재 구매한 물건의 누적 갯수:"+m1.getProdCnt());
		m1.buyProdName("사과");
		m1.buyProdName("바나나");
		m1.buyProdName("딸기");
		System.out.println("현재 구매한 물건 리스트:"+m1.buyList());
		m1.buyProd("컴퓨터");
		m1.buyProd("냉장고");
		m1.buyProd("세탁기");
		m1.buyProd("비누");
		m1.buyProd("치약");
		m1.buyProd("과자");
		m1.showList();
	}
}
class Mart{
	// 초기에 데이터 할당하는 부분은 생성자를 통해서 처리
	// 계속 변경이 하고 호출하는 부분은 메서드를 통해서 처리.
	int pcnt;
	String pnames;
	String[] buylist;
	int buyIdx;
	Mart(){
		this.pnames = "";
		buylist = new String[5];
	}
	void buyProd(String pname) {
		if(buyIdx<5) {
			buylist[buyIdx++] = pname;
		}else {
			System.out.println("물건은 5개까지 구매가능합니다.");
		}
	}
	void showList() {
		for(int idx=0;idx<buylist.length;idx++) {
			System.out.println(idx+1+")"+buylist[idx]);
		}
	}
	
	void buyProd(int cnt) {
		System.out.println("이번에 구매한 물건 갯수:"+cnt);
		this.pcnt+=cnt;
	}
	// 구매한 물건을 매개변수로 누적 처리 하는 메서드..	사과, 바나나, ....
	void buyProdName(String pname) {
		System.out.println("이번에 구매한 과일 종류:"+pname);
		this.pnames+=pname+",";
	}
	// 현재 구매된 물건 리스트를 리턴
	String buyList() {
		return this.pnames;
	}
	
	int getProdCnt() {
		return this.pcnt;
	}
}

class Computer{
	String name;
	boolean isOper; // boolean은 설정하지 않으면 default false
	Computer(){
		this.name = "보통컴퓨터";
	}
	Computer(String name){
		this.name = name;
	}
	void pushBtn(boolean on_or_off) {
		isOper = on_or_off;
	}
	String curOnOff() {
		return isOper?"가동중":"중지중";
	}
	
	void showInfo() {
		System.out.println("컴퓨터의 이름:"+this.name);
	}
	String getName() {
		return this.name;
	}
	int getCnt() {
		return 25;
	}
	int getCnt1() {
		int cnt = 5;
		return cnt;
	}
}

class Person2{
	String name;
	Person2(){
		this.name = "무명";
	}
	// 문자열 리턴하는 경우
	String getStr() {
		return "안녕하세요"; // 바로 리턴
	}
	int getInt() {
		int num01 = 25;
		return num01; // 선언된 데이터를 할당 후 리턴
	}
	String getName() {
		return this.name; // 필드값을 리턴
	}
	void show() {
		// 리턴값이 없는 경우는 void
		System.out.println("이름을 출력:"+this.name);
	}
}
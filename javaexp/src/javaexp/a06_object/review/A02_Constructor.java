package javaexp.a06_object.review;

public class A02_Constructor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BasePlayer b1 = new BasePlayer();
		System.out.println("# 입력없는 초기값 #");
		System.out.println("팀명:"+b1.tname);
		System.out.println("이름:"+b1.name);
		System.out.println("타욜:"+b1.hitRatio);
		BasePlayer b2 = new BasePlayer("두산","홍길동");
		System.out.println("# 매개변수가 있는 초기값 #");
		System.out.println("팀명:"+b2.tname);
		System.out.println("이름:"+b2.name);
		System.out.println("타율:"+b2.hitRatio);
	}
	// ex) BasePlayer 클래스를 선언하고 팀명, 이름, 타율을 필드로
	//		선언하고, 생성자를 통해서 팀명과 이름을 초기화하고 출력하세요.
}
class BasePlayer{
	String tname;
	String name;
	double hitRatio;
	/*
	# 생성자 overloading
	1. 생성자를 선언할 수 있는 규칙을 말한다 - 메서드 오버로딩 규칙과 동일
	2. 규칙
		1) 매개변수의 *갯수가 다를 때
		2) 매개변수의 갯수가 같더라도 *타입이 다를 때
		3) 매개변수이 갯수와 같고 타입이 같더라도 타입이 선언된 *순서가 다를 때.
	 * */
	BasePlayer(){
		// 외부 입력 없이 초기화
		this.tname=""; // String은 default 초기값 null
		this.name="";		
	}
	BasePlayer(String tname, String name){
		this.tname = tname;
		this.name = name;		
	}
	BasePlayer(String tname, double hitRatio){
		this.tname = tname;
		this.hitRatio = hitRatio;		
	}
	BasePlayer(double hitRatio, String tname){
		this.tname = tname;
		this.hitRatio = hitRatio;		
	}
	// 클래스 내에는 오버로딩 규칙에 의해 여러 생성자를 선언할 수 있고
	// 객체를 생성할 때는 이 중에 하나만 사용하여 처리할 수 있다.
	// BasePlayer b1 = new BasePlayer("해태",0.275);
	// BasePlayer b1 = new BasePlayer(0.301,"LG");
}
// ex) 물건클래스에 필드로 물건명 가격 갯수를 선언하되,
//		오버로딩 규칙에 의해서 생성자를 선언해 보세요..
class Product{
	String name;
	int price;
	int cnt;
	Product(){
		this.name="";
	}
	// 갯수가 다른
	Product(String name, int price){
		this.name = name;
		this.price = price;
	}
	// 타입이 다른
	Product( int price, int cnt){
		this(); // 정의된 생성자를 호출할 때 사용..
		this.price = price;
		this.cnt = cnt;
	}
	// 순서가 다른(타입이 다를 때만 가능)
	Product(int price, String name){
		this.name = name;
		this.price = price;
	}
}
package javaexp.a06_object;

public class A06_ContructorExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Fruit f1 = new Fruit("딸기", 3);
		Book99 b1 = new Book99("자바기초","자바맨");
		Mouse m1 = new Mouse("휘마우스","삼성");
		Taxi t1 = new Taxi("서울경기","그랜저");
	}

}
/*
# 아래의 필드값을 초기화하는 생성자를 선언하고,
  필드값을 출력하는 클래스를 정의 및 호출하세요
	과일(종류,갯수), 도서99(도서명, 출판사),
	마우스(이름, 제조사), 택시(지역,차종)
 */
class Fruit{
	String kind;
	int cnt;
	Fruit(String kind,int cnt){
		this.kind = kind;
		this.cnt = cnt;
		System.out.println("# 과일 객체 생성 #");
		System.out.println("종류:"+kind);
		System.out.println("갯수:"+cnt);
	}
}
class Book99{
	String title;
	String publisher;
	Book99(String title, String publisher) {
		this.title = title;
		this.publisher = publisher;
		System.out.println("# 도서 객체 생성 #");
		System.out.println("도서명:"+title);
		System.out.println("출판사:"+publisher);
	}
}
class Mouse{
	String name;
	String comp;
	Mouse(String name, String comp){
		this.name = name;
		this.comp = comp;
		System.out.println("# 마우스 객체 생성 #");
		System.out.println("마우스 종류:"+name);
		System.out.println("제조사:"+comp);
	}
}
class Taxi{
	String loc;
	String kind;
	Taxi(String loc, String kind){
		this.loc = loc;
		this.kind = kind;
		System.out.println("# 택시 객체 생성 #");
		System.out.println("운행지역:"+loc);
		System.out.println("차종:"+kind);
	}
}
package javaexp.a06_object;

public class A04_Contructor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 다른 생성자 호출(this())
		1. 생성자 오버로딩되면 생성자 간의 중복된 코드 발생
		2. 초기화 내용이 비슷한 생성자들에서 이러한 현상을
			많이 볼 수 있음
			1) 초기화 내용을 한 생성자에 몰아 작성
			2) 다른 생성자는 초기화 내용을 작성한 생성자를
				this(..)로 호출..
		 * */
		Player p01 = new Player("홍길동","LG트윈스",0.304);
		System.out.println(p01.tname);
		System.out.println(p01.name);
		System.out.println(p01.record);
		// ex) Music클래스를 선언하고 필드로 음악명, 가수, 앨범
		//		속성으로 처리하되, 매개변수없는 것부터 3개까지
		//		생성자로 선언하고 각 생성자에 선언된 생성자를 호출하여
		//		처리하고, 속성을 출력하세요.
		Music m1 = new Music();
		Music m2 = new Music("After LIKE");
		Music m3 = new Music("Attention","NewJeans");
		Music m4 = new Music("Pink Venom","BLACKPINK","BORN PINK");
		System.out.println(m1);
		System.out.println(m1.title);
		System.out.println(m1.singer);
		System.out.println(m1.elbum);
		System.out.println(m2);
		System.out.println(m2.title);
		System.out.println(m2.singer);
		System.out.println(m2.elbum);
		System.out.println(m3);
		System.out.println(m3.title);
		System.out.println(m3.singer);
		System.out.println(m3.elbum);
		System.out.println(m4);
		System.out.println(m4.title);
		System.out.println(m4.singer);
		System.out.println(m4.elbum);
	}

}
class Music{
	String title;
	String singer;
	String elbum;
	Music(){
		this.title = "없음";
		this.singer = "무명";
		this.elbum = "없음";
	}
	Music(String title){
		this();
		this.title = title;
	}
	Music(String title, String singer){
		this(title);
		this.singer = singer;
	}
	Music(String title, String singer, String elbum){
		this(title, singer);
		this.elbum = elbum;
	}
}

class Player{
	String name;
	String tname;
	double record;
	Player(){
		this.name = "무명";
		tname = "팀할당 안됨"; // 자바에선 허용
		this.record=0.0;
	}
	Player(String name){
		this(); // 선언된 생성자를 호출해서 아래 default 자동 설정
		this.name = name;
//		tname = "팀할당 안됨"; // 위 this()로 생략가능
//		this.record=0.0;
	}
	Player(String name, String tname){
		this(name); // 매개변수가 있는 생성자 호출.
		this.tname = tname;
	}
	Player(String name, String tname, double record){
		this(name, tname);
		this.record = record;
//		this(name, tname); 에러 발생. 반드시 첫라인에 선언하여야 한다
	}
}
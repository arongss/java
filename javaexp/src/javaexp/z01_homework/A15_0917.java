package javaexp.z01_homework;

import java.util.ArrayList;

public class A15_0917 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0917과제 - 신아령
[1단계:개념] 1. 일반 배열과 동적배열(ArrayList)의 차이점을 예제를 통해서 기술하세요.
		# 객체형 배열
		1. 고정된 배열안에 객체를 담는 처리
		2. 크기가 고정되어서 추가나 삭제가 불가능
		# 객체형 동적배열
		1. 데이터타입이 List, ArrayList선형 형식으로 선언된다.
		2. 크기가 동적으로 변경이 가능하다.
[1단계:개념] 2. 동적배열 ArrayList의 활용 방법과 주요 기능 메서드를 기본 예제를 통하여 기술하세요.
		# 동적배열(ArrayList)
		1. 유형의 선언.
			ArrayList list;  : 기본 Object형 데이터 선언.
		2. 특정한 객체의 유형의 데이터 처리.
			ArrayList<클래스명> list = new
				ArrayList<클래스명>();
			<> : generic
				해당 유형의 동적배열을 선언한다는 의미이다.
[2단계:확인] 3. ArrayList<Product>를 활용하여 구매할 물건 정보 3개를 추가하여 출력처리하세요.
      int tot()메서드로 내용 출력과 물건가격*물건단가를 리턴하게 하여, 물건 3개의 총비용을 누적 처리되게 하세요.
		ArrayList<Product01> pList = new ArrayList<Product01>();
		pList.add(new Product01("볼펜",5000,2));
		pList.add(new Product01("샤프",7000,3));
		pList.add(new Product01("지우개",2000,2));
		System.out.println("# 구매한 물건 #");
		int tot = 0;
		for(int idx=0;idx<pList.size();idx++) {
			Product01 pd = pList.get(idx);
			System.out.print(pd.getName()+"\t");
			System.out.print(pd.getCnt()+"개\t");
			System.out.print(pd.getPrice()+"원\t");
			System.out.println(pd.totPrice()+"원");
			tot += pd.totPrice();
		}
		System.out.println("총비용:"+tot);
	}
}
class Product01{
	private String name;
	private int price;
	private int cnt;
	public Product01(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	int totPrice() {
		return this.cnt*this.price;
	}
}
[1단계:개념] 4. static 멤버와 instance 멤버의 차이점을 예제를 통해 기술하세요.
		# 인스턴스 멤버란?
		1. 객체(인스턴스)마다 가지고 있는 필드와 메소드
			이들은 각각 인스턴스 필드, 인스턴스 메소드라고 부른다.
			객체가 생성된 후에 사용할 수 있는 객체 소속 멤버
		2. 인스턴스 멤버는 객체 소속된 멤버이기 때문에 객체가 없이 사용불가능하다.
		3. this
			객체(인스턴스) 자신의 참조(번지)를 가지는 키워드
			객체 내부에서 인스턴스 멤버임을 명확히 하기 위해 this.사용
			매개변수와 필드명이 동일할 때, 인스턴스 필드임을 명확인 하기 위해 사용
		# 정적 멤버와 static
		1. 정적(static) 멤버란?
			1) 클래스에 고정된 필드와 메서드 - 정적 필드, 정적 메서드
				객체의 공유메모리, 클래스 소속 멤버,
				객체생성없이 사용가능 ex) 클래스명.멤버 = 데이터;
			2) 정적 멤버는 클래스에 소속된 멤버
				- 객체 내부에 존재하지 않고, 메소드 영역에 존재
				- 정적 멤버는 객체를 생성하지 않고 클래스로 바로 접근해 사용
		2. 정적 멤버 선언
			1) 필드 또는 메소드 선언할 때, static 키워드 붙은
				class 클래스{
					static 타입 필드;
					static 리턴타입 메소드명(매개변수){}
				}
[1단계:개념] 5. static final 상수와 static 변수의 차이점을 기술하세요.
		# final 필드
		1. 최종적인 값을 갖고 있는 필드 = 값을 변경할 수 없는 필드
		2. final 필드는 딱 한번 초기값을 지정하면 해당 값을 변경할 수 없다.
			- 필드 생성시
				final String nation = "한국";
			- 생성자
				Person(String nation){
					this.name = nation;
				}
		# static final 필드
		1. 상수 = 정적 final 필드
			- final 필드 : 객체마다 가지는 불변의 인스턴스 필드
			- static final 
				- 객체마다 가지고 있지 않음
				- 메소드 영역에 클래스 별로 관리되는 불변의 정적 필드
				- 공용 데이터로서 사용
				ex) 클래스단위로 변겨아지 못하는 상수 설정		
		2. 상수 이름은 전부 대문자로 작성
		3. 다른 단어가 결합되면 _로 연결
[1단계:개념] 6. package란 무엇이고 클래스/접근제어자/import와 함께 설명하세요.
		# 패키지
		1. 클래스를 기능별로 묶어서 그룹 이름을 붙여 놓은 것을 말한다.
			1) 파일들을 관리하기 위해 사용하는 폴드(디렉토리)와 비슷한 개념이다.
			2) 패키지의 물리적인 형태는 파일 시스템의 폴드와 같다.
		2. 클래스 이름의 일부이다
			1) 클래스를 유일하게 만들어주는 식별자이다.
			2) 전체 클래스 이름 : 상위패키지.하위패키지.클래스
			3) 클래스명이 같아도 패키지명이 다르면 다른 클래스로 취급한다.
		# import문
		1. 패기지 내에 같이 포함된 클래스간 클래스 이름으로 사용 가능
		2. 패키지가 다른 클래스를 사용해야 할 경우
			1) 패키지명 포함된 전체 클래스 이름으로 사용
			2) import문으로 패키지를 지정하고 사용.
		# 접근제한자(Access Modifier)
		1. 클래스 및 클래스의 구성 멤버에 대한 접근을 제한하는 역할을 한다.
			- 다른 패키지에서 클래스를 사용하지 못하도록 (클래스 제한)
			- 클래스로부터 객체를 생성하지 못하도록(생성자 제한)
			- 특정 필드와 메소드를 숨기 처리(필드와 메소드 제한)
		2. 접근 제한자의 종류
			- public : 패키지가 다르더라도 접근이 가능
			- protected : 상속 관계에 있을 때, 외부 패키지까지 접근 가능
			- default(X) : 같은 패키지에서만 접근 가능
			- private : 다른 클래스에서는 접근이 불가능
		# 패키지에 따른 클래스와 생성자의 접근 제한
		1. 호출하는 클래스가 같은 패키지인 경우 접근제어자가 public, X(default)경우 자유롭게
			클래스 선언과 생성자 선언이 가능하다.
		2. 호출하는 클래스가 다른 패키지인 경우 접근제어자가 public 인 경우에 class 선언이 가능하고,
			생성자도 public인 경우에 생성이 가능하다.
		3. 같은 패키지이더라도 접근제어자가 private인 경우에는 외부 클래스에서
			접근이 불가능하다.
[1단계:확인] 7. 아래의 여러가지 1:다 관계 클래스를 선언하고 출력하세요.
      1) 담당교수, 수강 학생
		Teacher t = new Teacher("교수님 수강생 리스트");
		t.setSlist(new Student1("컴퓨터공학과","홍길동"));
		t.setSlist(new Student1("화학공학과","김길동"));
		t.setSlist(new Student1("전자공학과","마길동"));
		t.showList();
	}
}
class Teacher{
	private String tname;
	private ArrayList<Student1> slist;
	public Teacher(String tname) {
		this.tname = tname;
		this.slist = new ArrayList<Student1>();
	}
	public void setSlist(Student1 student) {
		this.slist.add(student);
		System.out.println(student.getName()+" 수강 등록!!");
	}
	public void showList() {
		System.out.println(this.tname);
		if(this.slist.size()>0) {
			System.out.println("전공\t이름");
			for(Student1 s:slist) {
				s.studentInfo();
			}
		}else {
			System.out.println("수강생이 없습니다.");
		}
	}
}
class Student1{
	private String subject;
	private String name;
	public Student1(String subject, String name) {
		this.subject = subject;
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void studentInfo() {
		System.out.print(this.subject+"\t");
		System.out.print(this.name+"\n");
	}
}
      2) 기차, 기차 좌석정보
		Train t = new Train("KTX 예매 리스트");
		t.setSlist(new Seat("서울-부산","6호차12A"));
		t.setSlist(new Seat("대구-부산","9호차1D"));
		t.setSlist(new Seat("서울-대전","3호차8C"));
		t.showList();
	}
}
class Train{
	private String kind;
	private ArrayList<Seat> slist;
	public Train(String kind) {
		this.kind = kind;
		this.slist = new ArrayList<Seat>();
	}
	public void setSlist(Seat seat) {
		this.slist.add(seat);
		System.out.println(seat.getSeatNum()+"번 좌석 예매!!");
	}
	public void showList() {
		System.out.println(this.kind);
		if(this.slist.size()>0) {
			System.out.println("구간\t좌석번호");
			for(Seat s:slist) {
				s.seatInfo();
			}
		}else {
			System.out.println("좌석이 없습니다.");
		}
	}
}
class Seat{
	private String fromTo;
	private String seatNum;
	public Seat(String fromTo, String seatNum) {
		this.fromTo = fromTo;
		this.seatNum = seatNum;
	}
	public String getFromTo() {
		return fromTo;
	}
	public void setFromTo(String fromTo) {
		this.fromTo = fromTo;
	}
	public String getSeatNum() {
		return seatNum;
	}
	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}
	public void seatInfo() {
		System.out.print(this.fromTo+"\t");
		System.out.print(this.seatNum+"\n");
	}
}
[1단계:개념] 8. 상속 관계에서 super() 생성자관계에서 사용하는 규칙을 기본 예제를 통해서 기술하세요.
		# super()
			1) 상속관계에서 상위/하위 클래스 동일한 멤버를 사용할 때, 구분하기위하여 활용된다.
			2) 생성자 - 하위 객체는 상위객체의 생성자를 생성하면서 처리가된다. default 생성자에 의해서 기본적으로 호출된다.
				class Father{
					//public Father(){super();} // default 생성자 포함
					Father(String s){}
					Father(String name, int age){
						this(name); // 첫라인에서만 선언..
					}
				}
				class Son extends Father{
				public Son(){
						super(); // default 상위 생성자를 호출..
					}
					// 객체 생성자를 통해서 상위에 잇는 매개변수가 있는 생성자를 
					// 반드시 호출하여야 하기 때문에 기본 선언으로 에러가 발생.
					// 
					public Son(){
						super("홍길동"); // super()생성자는 첫라인에 선언
					}
					// 상속관계로 인하여 객체를 사용할려면 상위에 있는
					// 필드와 메서드를 활용하여야 하는데, 상위에 있는 선언된
					// 생성자를 호출하지 않고는 사용할 수 없기 때문에
					// 반드시 선언된 생성자 개라도 호출하여야 한다.
[1단계:확인] 9. 상위로 추상 클래스 Robot 추상 메서드(attack())을 생성자로 로봇의 종류를 할당하게 하고, Dagan, Gundam을
   상속하여 해당 생성자를 통해서  호출하여 처리하고 출력되게 하세요.
		Robot r1 = new Dagan("다간");
		Robot r2 = new Gundam("건담");
		r1.move();r1.attack();
		r2.move();r2.attack();
	}
}
abstract class Robot{
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Robot(String name) {
		this.name = name;
	}
	public void move() {
		System.out.println(this.name+"이 움직입니다");
	}
	public abstract void attack();
}
class Dagan extends Robot{
	public Dagan(String name) {
		super(name);
	}
	@Override
	public void attack() {
		System.out.println("발차기 공격!");
	}
}
class Gundam extends Robot{
	public Gundam(String name) {
		super(name);
	}
	@Override
	public void attack() {
		System.out.println("펀치 공격!");
	}
}
[1단계:개념] 10. protected의 접근 범위에 대하여 예제를 통하여 기술하세요
		# 상속 대상 제한
			1) 부모 클래스의 private 접근 갖는 필드와 메소드 제외
			2) 부모 클래스가 다른 패키지에 있을 경우, default 접근 갖는 필드와 메소드도 제외
			ps) super()생성자나 public 기능 메서드를 통해서 간접적으로
				필드의 값을 할당하거나 호출할 수 있다.
			3) protected : 상속관계에 있으면 해당 접근제어자로 선언되어 있으면 접근이 가능하다(필드/메서드)
		
		 * */
		/*
		0917과제 - 정답
		[2단계:확인] 3. ArrayList<Product>를 활용하여 구매할 물건 정보 3개를 추가하여 출력처리하세요.
		int tot()메서드로 내용 출력과 물건가격*물건단가를 리턴하게 하여, 물건 3개의 총비용을 누적 처리되게 하세요.
		
		 * 
		 * */
		ArrayList<Prod> buyList = new ArrayList<Prod>();
		buyList.add(new Prod("사과",3000,2));
		buyList.add(new Prod("바나나",4000,3));
		buyList.add(new Prod("딸기",12000,4));
		int sum=0;// 누적할 변수는 상단에 전역변수
		for(int idx=0;idx<buyList.size();idx++) {
			Prod p = buyList.get(idx);
			System.out.print(p.getName()+"\t");
			System.out.print(p.getPrice()+"\t");
			System.out.print(p.getCnt()+"\t");
			int tot = p.getPrice()*p.getCnt();
			sum+=tot; // 각 단위 계를 누적해서 전체 총계 처리.
			System.out.println(tot+"\n");
		}
		System.out.print("전체 총계:"+sum);
	}
}
class Prod{
	private String name;
	private int price;
	private int cnt;
	public Prod(String name, int price, int cnt) {
		this.name = name;
		this.price = price;
		this.cnt = cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
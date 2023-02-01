package javaexp.z01_homework;

import java.util.ArrayList;

public class A13_0915 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0915과제 - 신아령
[1단계:개념] 1. (연습이 필요한 분)1:다관계 설정 연습 - 버스/승객, 영화/배우들, 회사/종업원  
[1단계:개념] 2. this/super의 사용을 생성자와 메서드를 나누어 기본예제를 통해 설명하세요.
		1. this.
			1) 인스턴스 필드/메서드를 호출할 때 사용	ex) this.필드명
			2) this() 다른 생성자를 호출할 때 사용	ex) this(), this(name)
		2. super
			1) 상속관계에서 상위/하위 클래스 동일한 멤버를 사용할 때,
				구분하기위하여 활용된다.
				ex) 주로 생성자와 메서드에서 사용된다.
			2) 생성자
				- 하위 객체는 상위객체으 생성자를 생성하면서 처리가된다.
					default 생성자에 의해서 기본적으로 호출된다.
					class Father{
						public Father(){} // default 생성자 포함
						Father(String s){}
					}
					class Son extends Father{
						public Son(){
							super(); // default 상위 생성자를 호출..
						}
						// 객체 생성자를 통해서 상위에 잇는 매개변수가 있는 생성자를 
						// 반드시 호출하여야 하기 때문에 기본 선언으로 에러가 발생.
						public Son(){
							super("홍길동");
						}
					}
[1단계:코드] 3. 상위클래스 School 학교의 분류 , 하위클래스 EleSchool/MiddleSchool/HighSchool을 선언하여 상위 생성자를 통해 하위객체를 할당처리하세요.
		EleSchool es = new EleSchool();
		es.level();
		MiddleSchool ms = new MiddleSchool();
		ms.level();
		HighSchool hs = new HighSchool();
		hs.level();
	}
}
class School{
	private String kind;
	public School(String kind) {
		this.kind = kind;
	}
	public void level() {
		System.out.println(this.kind+"학생입니다");
	}
}
class EleSchool extends School{
	public EleSchool() {
		super("초등학교");
	}
}
class MiddleSchool extends School{
	public MiddleSchool() {
		super("중학교");
	}
}
class HighSchool extends School{
	public HighSchool() {
		super("고등학교");
	}
}
[1단계:개념] 4. 메서드 overriding이란 무엇인가? overloading과 차이점과 함께 기본예제를 통해 기술하세요.
		- overloading : 하나의 클래스 내에 동일한 이름의 메소드가 여러 개 존재하는 것. 이때 메소드 이름은 동일하지만 반드시 매개변수의 개수가 다르거나 타입이 달라야 한다.
		- overriding : 반드시 상속이라는 것이 전제되어야 한다. 상속구조에서 부모의 메소드와 동일한 시그니처를 가진 메소드가 자식 클래스에 정의되는 것.
[1단계:코드] 5. 상위클래스 ComPart 컴퓨터 부품, partFunction()부품의 기능,  하위클래스 Cpu, Ram, Ssd를 선언하여 오버라이딩을 처리하여 구현하세요.
		1:다관계로 다형성 처리 활용..
		Cpu c = new Cpu();
		c.partFunction();
		Ram r = new Ram();
		r.partFunction();
		Ssd s = new Ssd();
		s.partFunction();
	}
}
class ComPart{
	private String part;
	public ComPart(String part) {
		this.part = part;
	}
	public void partFunction() {
		System.out.println(this.part+"의 기능");
	}
}
class Cpu extends ComPart{
	public Cpu() {
		super("Cpu");
	}
	public void partFunction() {
		super.partFunction();
		System.out.println("중앙처리장치");
	}
}
class Ram extends ComPart{
	public Ram() {
		super("Ram");
	}
	public void partFunction() {
		super.partFunction();
		System.out.println("주기억장치");
	}
}
class Ssd extends ComPart{
	public Ssd() {
		super("Ssd");
	}
	public void partFunction() {
		super.partFunction();
		System.out.println("보조기억장치");
	}
}
[1단계:개념] 6. 다형성이란 무엇인가? 개념을 기술하세요.
		다형성이란 같은 타입이지만 실행 결과가 다양한 객체 대입(이용)이 가능한 성질을 의미한다.
[1단계:코드] 7. 상위클래스 Blabar 나비애벌래로 다양한 나비(호랑나비, 노랑나비, 파랑나비)가 나오게 다형성 처리하고 showColor()메서드를 통해서 재정의 하세요
		ArrayList<Blabar> blist = new ArrayList<Blabar>();
		blist.add(new Tigerbf());
		blist.add(new Yellowbf());
		blist.add(new Bluebf());
		for(Blabar an:blist) {
			an.showColor();
		}
	}
}
class Blabar{
	private String kind;
	public Blabar(String kind) {
		this.kind = kind;
	}
	public void showColor() {
		System.out.println("나비 색깔:");
	}
	public String getKind() {
		return this.kind;
	}
}
class Tigerbf extends Blabar{
	public Tigerbf() {
		super("호랑나비");
	}
	public void showColor() {
		System.out.println("호랑무늬");
	}
}
class Yellowbf extends Blabar{
	public Yellowbf() {
		super("노랑나비");
	}
	public void showColor() {
		System.out.println("노란색");
	}
}
class Bluebf extends Blabar{
	public Bluebf() {
		super("파랑나비");
	}
	public void showColor() {
		System.out.println("파란색");
	}
}
		 * */
		/*
		플러스활용문제
[1단계:코드] 5. 상위클래스 ComPart 컴퓨터 부품, partFunction()부품의 기능,  하위클래스 Cpu, Ram, Ssd를 선언하여 오버라이딩을 처리하여 구현하세요.
		1:다관계로 다형성 처리 활용..
		 * */
		Computer02 com = new Computer02("맥 프로 노트북");
		com.setParts(new Cpu());
		com.setParts(new Ram());
		com.setParts(new Ram());
		com.setParts(new Ssd());
		com.setParts(new Ssd());
		com.showPartList();
	}
}
class Computer02{
	private String kind;
	private ArrayList<Compart> parts;
	public Computer02(String kind) {
		this.kind = kind;
		this.parts = new ArrayList<Compart>();
	}
	public void setParts(Compart part) {
		// 1. 다형성 : 상위 = 하위
		//		Compart part1 = new Cpu();
		//		Compart part2 = new Ram();
		//		Compart part3 = new Ssd();
		// 2. ArrayList 데이터 할당
		//		ArrayList<Cpu> list = new ArrayList<Cpu>();
		//		list.add(new Cpu());
		//		list.add(new Cpu());
		//		list.add(new Cpu());
		//		list.add(new Cpu());
		//		ArrayList<Compart> list2 = new ArrayList<Compart>();
		//		list2.add(new Cpu());
		//		list2.add(new Ram());
		//		list2.add(new Ssd());
		this.parts.add(part);
	}
	public void showPartList() {
		System.out.println("컴퓨터 종류:"+kind);
		// 추상클래스 객체를 자체로 생성하지 못할 뿐이지
		// 종속된 하위클래스를 할당해서 사용하는 것은 가능하다.
		for(Compart cp:this.parts) {
			// 각 객체에서 재정의된 내용을 호출..
			cp.partFunction();
		}
	}
}

abstract class Compart{
	private String kind;
	public Compart(String kind) {
		this.kind = kind;
	}
	// 공통 메서드
	public String getKind() {
		return this.kind;
	}
	// 다양하게 처리할 메서드
	public abstract void partFunction();
}
class Cpu extends Compart{
	public Cpu() {
		super("CPU");
	}
	@Override
	public void partFunction() {
		System.out.println(getKind()+" 컴퓨터의 핵심 중앙처리 장치이다.");
	}
}
class Ram extends Compart{
	public Ram() {
		super("RAM");
	}
	@Override
	public void partFunction() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+" 컴퓨터의 핵심 휘발성 메모리를 처리한다.");
	}
}
class Ssd extends Compart{
	public Ssd() {
		super("SSD");
	}
	@Override
	public void partFunction() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+" 컴퓨터의 하드웨어적 저장을 처리한다.");
	}
}
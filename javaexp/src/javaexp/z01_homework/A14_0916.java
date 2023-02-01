package javaexp.z01_homework;

import java.util.ArrayList;

public class A14_0916 {
	
	static void call01() throws ArrayIndexOutOfBoundsException{
		int[] arry = new int[3]; // 0, 1, 2
		System.out.println(arry[3]);
	}
	static void call02() throws ArrayIndexOutOfBoundsException{
		int[] arry = new int[3]; // 0, 1, 2
		System.out.println(arry[4]);
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		# 위임 예외 처리 순서
		1. 해당 예외 내용 파악과 실제 나타날 상황 코드 생성 및 예외 copy
			배열의 범위를 벗어났을 때
			System.out.println(args[1]);
			ArrayIndexOutOfBoundsException
		2. 위임할 기능메서드 선언.
			해당 예외와 비슷하게 발생할 내용을 구현..
		3. 위임할 예외 내용 throws 위임 예외
		4. 호출하는 곳에서 try{}catch문으로 예외 처리.
		 * */
		//System.out.println(args[1]);
		try{
			call01();
			call02();
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("배열 범위를 벗어남:");
			System.out.println(e.getMessage());
		}
		/*
		0916과제 - 신아령
[1단계:개념] 1. 추상클래스 사용의 기본 형식을 기본 예제와 함께 설명하세요.
abstract class Larva{
	private String kind;
	public Larva(String kind) {
		this.kind = kind;
	}
	public abstract void attack(); // 추상메서드
}
[1단계:코드] 2. 다각형이라는 추상클래스(필드-종류,실제메서드 도화지를 가져오다(), 추상메서드 drawing() @@을 그리다)를 생성하고 
      상속받은 실제 클래스(삼각형,사각형,오각형)을 처리하세요.
		Polygon p01 = new Triangle();
		Polygon p02 = new Square();
		Polygon p03 = new Pentagon();
		p01.drawing();p01.draw();
		p02.drawing();p02.draw();
		p03.drawing();p03.draw();
	}
}
abstract class Polygon{
	private String kind;
	public Polygon(String kind) {
		this.kind = kind;
	}
	public void drawing() {
		System.out.println("도화지를 가져오다");
	}
	public abstract void draw();
	public String getKind() {
		return kind;
	}
}
class Triangle extends Polygon{
	public Triangle() {
		super("삼각형");
	}
	@Override
	public void draw() {
		System.out.println(getKind()+"을 그리다");
	}
}
class Square extends Polygon{
	public Square() {
		super("사각형");
	}
	@Override
	public void draw() {
		System.out.println(getKind()+"을 그리다");
	}
}
class Pentagon extends Polygon{
	public Pentagon() {
		super("오각형");
	}
	@Override
	public void draw() {
		System.out.println(getKind()+"을 그리다");
	}
}
[1단계:개념] 3. 추상클래스와 인터페이스의 차이점을 개념과 함께 정리해보세요.
# 추상클래스 
1. 하위 클래스의 메서드 통일(기능적 선언 통일)을 위해 상위에
추상 메서드를 선언하여 상속받은 하위 클래스는 반드시 상위
추상 메서드를 재정의하도록 강제화하는 클래스를 말한다.
추상이란 개념에서도 나타나듯이 실제 객체를 생성할 수 없다.
- 추상메서드(다양형태의 기능 구현), 
구상(실제)메서드(공통적인 기능 활용)
# 인터페이스
1. 개발 코드와 객체가 서로 통신하는 접점
	- 개발 코드는 인터페이스의 메소드만 알고 있으면 OK
2. 인터페이스의 역할
	- 개발 코드가 객체에 종속되지 않게 ==> 객체 교체할 수 있도록 하는 역할
	- 개발 코드 변경 없이 리턴값 또는 실행 내용이 다양해 질 수 있음(다형성)
[1단계:코드] 4. 인터페이스 PaintWay를 선언(추상메서드 paint() @@ 색칠을 하다) 상속받은 실제
      클래스(빨강색, 파랑색, 노랑색)을 처리하세요.
		PaintColor pc = new PaintColor();
		pc.paint();
		pc.setPaintWay(new Red());
		pc.paint();
		pc.setPaintWay(new Blue());
		pc.paint();
		pc.setPaintWay(new Yellow());
		pc.paint();
	}
}
class PaintColor{
	private PaintWay paintWay;
	public void setPaintWay(PaintWay paintWay) {
		this.paintWay = paintWay;
	}
	public void paint() {
		if(this.paintWay!=null) {
			this.paintWay.paint();
		}else {
			System.out.println("페인트가 없습니다");
		}
	}
}
interface PaintWay{
	void paint();
}
class Red implements PaintWay{
	@Override
	public void paint() {
		System.out.println("빨간색 색칠을 하다");
	}
}
class Blue implements PaintWay{
	@Override
	public void paint() {
		System.out.println("파란색 색칠을 하다");
	}
}
class Yellow implements PaintWay{
	@Override
	public void paint() {
		System.out.println("노란색 색칠을 하다");
	}
}
[1단계:개념] 5. 예외 처리의 기본 형식과 처리 순서를 기본 예제에 의해 기술하세요.
		# 예외 처리 기본 형식
		try{
			// 예외 발생 가능 코드
		
		}catch(예클래스 선언 e){
			예외 처리
		
		}finally{
			예외 상관없이 처리.
		}
		# 예외 처리 순서
		1. 기본 코드 내용 실행
		2. 예외가 발생했을 때, 예외 처리 복사.
		3. try{}catch(예외 클래스 내용 선언){}finally{}
			catch 매개변수에 발생한 예외 처리 내용 선언.
			하위 {} 블럭에 예외 발생시 내용 기술
			finally{] 예외 발생 상관 없이 처리할 내용 처리
			기타 이후 처리할 내용 기술..
[1단계:확인] 6. args를 통해서 나올 수 있는 예외를 아래에 하나씩 처리하세요
      1) args값을 입력 하지 않았을 때. 
		try {
			System.out.println(args[0]);	
			}catch(ArrayIndexOutOfBoundsException e){
				System.out.println("예외 발생:"+e.getMessage());
			}finally {
				System.out.println("예외 상관없이 처리 내용");
			}
      2) Integer.parseInt(args[0]) 첫번째 매개문자가 숫자형이아닐 때 발생 에러 확인 후 처리
		try {
			System.out.println(Integer.parseInt(args[0]));	
			}catch(ArrayIndexOutOfBoundsException e){
				System.out.println("예외 발생:"+e.getMessage());
			}finally {
				System.out.println("예외 상관없이 처리 내용");
			}
[1단계:개념] 7. 예외 처리의 계층별 처리란 무엇인지 기술하세요.
		# 다중의 예외 처리
		1. 예외는 여러가지 예외를 catch을 block으로 처리를 할 수 있다.
		2. 단, 계층적으로 하위 예외부터 처리하고, 상위 예외를 처리한다.
[1단계:개념] 8. 예외의 위임처리하는 내용을 예제를 통해서 기술하세요.
		# 예외 위임(throws)
		1. 메서드별로 현재 예외 처리를 이 메서드를 호출하는 곳에서 처리하게끔 위임 시키는 것을 말한다.
		2. 예외를 각 메서드별로 처리하기 보다 호출되는 곳에서 한꺼번에 처리할 때, 활용된다.
		3. 위임 형식 ==> public void 메서드명() throws 위임할 예외1, 위임한 예외2{}
		static void call01() throws ArithmeticException {
		System.out.println(1/0);
		}
[1단계:확인] 9.  call01(), call02()에 배열의 범위를 벗어났을 때, 예외를 위임하는 예제를 처리해보세요.
		static void call01() throws ArithmeticException {
		System.out.println("메서드1 ");
		System.out.println(1/0);
	}
	static void call02() throws ArithmeticException {
		System.out.println("메서드2 ");
		System.out.println(1/0);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			call01();
		}catch(ArithmeticException e) {
			System.out.println("예외:"+e.getMessage());
		}
		try {
			call02();
		}catch(ArithmeticException e) {
			System.out.println("예외:"+e.getMessage());
		}
	}
}
		 * */
		/*
		0916과제 - 정답
		[1단계:확인] 9.  call01(), call02()에 배열의 범위를 벗어났을 때, 예외를 위임하는 예제를 처리해보세요.
		 * 
		 * */
	}
}
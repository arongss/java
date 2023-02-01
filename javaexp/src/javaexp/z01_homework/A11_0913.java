package javaexp.z01_homework;

public class A11_0913 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0913과제 - 신아령
[1단계:개념] 1. 자바의 접근제어자 4가지 범위를 예제를 통하여 설명하세요.
		- public : 패키지가 다르더라도 접근이 가능
		- protected : 상속 관계에 있을 때, 외부 패키지까지 접근 가능
		- default(X) : 같은 패키지에서만 접근 가능
		- private : 다른 클래스에서는 접근이 불가능
[1단계:코드] 2. playroom패키지 선언과 내부적으로 친구1, 친구2 클래스 선언, studyroom패키지선언 학생1, 학생2 클래스 선언, 
             친구1, 학생1에서 private, X(default), public에 적절한 필드값을 선언하고, 상호간에 호출하세요.
		package javaexp.playroom;
		public class Playroom{
			private String friend1;
			private String friend2;
		}
		package javaexp.studyroom;
		public class Studyroom{
			private String student1;
			private String student2;
		}
[1단계:개념] 3. 인스턴스변수와 스태틱변수의 차이점을 기술하세요.
		- 인스턴스변수 : 객체 마다 가지고 있는 필드와 메소드
		- 스태틱변수 : 클래스에 고정된 필드와 메소드
[1단계:코드] 4. ScoccerPlayer에 팀명, 팀성적, 이름, 개인성적에서 팀명과 팀성적은 static, 이름과 개인성적으로 instance변수를 선언하여 데이터를 할당하세요.
		ScoccerPlayer sp01 = new ScoccerPlayer("홍길동",90);
		ScoccerPlayer.tname = "삼성";
		ScoccerPlayer.trecord = 80;
		ScoccerPlayer sp02 = new ScoccerPlayer("김길동",80);
		sp01.showInfo();
		sp02.showInfo();
		ScoccerPlayer.tname = "두산";
		ScoccerPlayer.trecord = 70;
		sp01.showInfo();
		sp02.showInfo();
	}

}
class ScoccerPlayer{
	static String tname;
	static int trecord; 
	String name;
	int record;
	public ScoccerPlayer(String name, int record) {
		this.name = name;
		this.record = record;
	}
	void showInfo() {
		System.out.println("팀이름:"+tname);
		System.out.println("팀성적:"+trecord);
		System.out.println("이름:"+name);
		System.out.println("개인성적:"+record);
	}
}
[1단계:개념] 5. final와 static final의 필드 차이점을 예제를 통해 기술하세요.
		- final : 최종적인 값을 갖고 있는 필드, 값을 변경할 수 없는 필드
		- static final : 객체마다 가지고 있지 않고, 메소드 영역에 클래스 별로 관리되는 불변의 정적필드.
[1단계:코드] 6. 컴퓨터의 종류, 사양내용(cpu,ram,hdd)을 static final, static)을 이용하여 초기화 호출하여 출력하세요.
		Computer c01 = new Computer("intel core i5","64비트");
		Computer c02 = new Computer("intel core i7","64비트");
		Computer c03 = new Computer("intel core i3","32비트");
		c01.comhdd("O");
		c02.comhdd("X");
		c03.comhdd("O");
		c01.showInfo();
		c02.showInfo();
		c03.showInfo();
	}
}
class Computer{
	String hdd; 
	final String cpu; 
	final String ram;
	static final String KIND="노트북";
	public Computer(String cpu, String ram) {
		this.cpu = cpu;
		this.ram = ram;
	}
	public void comhdd(String hdd) {
		this.hdd=hdd;
	}
	public void showInfo() {
		System.out.println("# 컴퓨터 정보 #");
		System.out.println("종류:"+KIND);
		System.out.println("cpu:"+cpu);
		System.out.println("ram:"+ram);
		System.out.println("hdd:"+hdd);
	}
}
[1단계:개념] 7. 1:1관계 객체의 선언 순서를 기술하세요.
		- 1:1 관계에 있는 현실의 요구사항에서 많이 있을 뿐아니라 실제 프로그래밍에서도 많이 발생하여 처리하여야 한다.
		- 선언 방식 : 1) 종속될 클래스 선언, 2) 포함할 클래스 선언
[1단계:코드] 8. 아래의 1:1관계 객체를을 선언해보세요.
            1) 자동차(차종,최고속도,배기량)와 자동차의소유주(이름,자동차, takeCar(자동차) driving() ) 를 선언
            2) 학생과 성적표
            3) 결혼할 커플(신랑, 신부)
		
            
		 * */
		/*
		0913과제 - 정답
[1단계:개념] 1. 자바의 접근제어자 4가지 범위를 예제를 통하여 설명하세요.
[1단계:코드]* 2. playroom패키지 선언과 내부적으로 친구1, 친구2 클래스 선언, studyroom패키지선언 학생1, 학생2 클래스 선언, 
             친구1, 학생1에서 private, X(default), public에 적절한 필드값을 선언하고, 상호간에 호출하세요.
		
[1단계:개념] 3. 인스턴스변수와 스태틱변수의 차이점을 기술하세요.
[1단계:코드] 4. ScoccerPlayer에 팀명, 팀성적, 이름, 개인성적에서 팀명과 팀성적은 static, 이름과 개인성적으로 instance변수를 선언하여 데이터를 할당하세요.
[1단계:개념] 5. final와 static final의 필드 차이점을 예제를 통해 기술하세요.
[1단계:코드]* 6. 컴퓨터의 종류, 사양내용(cpu,ram,hdd)을 static final, static)을 이용하여 초기화 호출하여 출력하세요.
		
[1단계:개념] 7. 1:1관계 객체의 선언 순서를 기술하세요.
[1단계:코드]* 8. 아래의 1:1관계 객체를을 선언해보세요.
            1) 자동차(차종,최고속도,배기량)와 자동차의소유주(이름,자동차, takeCar(자동차) driving() ) 를 선언
            2) 학생과 성적표
            3) 결혼할 커플(신랑, 신부)
            
            # 코드순서
            1. 종속될 클래스 선언
            	- 속성값(필드, 메서드) 구분
            	- 출력할 기능 메서드 선언.
            2. 포함할 클래스 선언
            	- 기본 속성-필드 선언
            	- 종속될 클래스 선언
            	- 생성자(기본 속성-필드)
            	- 종속될 클래스를 할당할 메서드 선언
            	- 전체 데이터 출력 메서드 선언.
		 * */
		Computer c01 = new Computer("조립식",1500000);
		c01.show();
		c01.kind="노트북";
		Computer.comp="삼성컴퓨터";
		c01.show();
		CarOwner co01 = new CarOwner("홍길동");
		co01.driving();
		// public void takeCar(Car car)
		co01.takeCar(new Car("BMW",280,3500));
		co01.driving();
		Record r1 = new Record("영어",90);
		System.out.println(r1.toString());
		System.out.println(r1);
		// toString()의 내용을 참조변수만 호출했을 때,
		// 처리할 내용을 기술.
		Student st = new Student("홍길동");
		st.setR1(r1);
		st.show();
		st.setR1(new Record("수학",85));
		st.show();
		Bride b1 = new Bride("홍영희");
		b1.coupleInfo();
		b1.setWedding(new Groom("홍길동",27));
		b1.coupleInfo();
	}
}
//3) 결혼할 커플(신랑, 신부)
class Groom{
	private String name;
	private int age;
	public Groom(String name, int age) {
		this.name = name;
		this.age = age;
	}
	@Override
	public String toString() {
		return "신랑정보 [신랑이름=" + name + ", 나이=" + age + "]";
	}
	public String getName() {
		return name;
	}
}
class Bride{
	private String name;
	private Groom groom;
	public Bride(String name) {
		this.name = name;
	}
	public void setWedding(Groom groom) {
		this.groom = groom;
		System.out.println("신랑 "+groom.getName()+"와 결혼하다");
	}
	public void coupleInfo() {
		System.out.println("신부 "+name+"");
		if(this.groom!=null) {
			System.out.println(this.groom);
		}else {
			System.out.println("아직 결혼전 입니다.");
		}
	}
}

// 2) 학생과 성적표
class Student{
	private String name;
	private Record r1;
	public Student(String name) {
		this.name = name;
	}
	public void setR1(Record r1) {
		this.r1 = r1;
	}
	public void show() {
		System.out.println("# "+name+"학생 성적표 #");
		if(r1!=null) {
			System.out.println(r1);
		}else {
			System.out.println("성적표가 없네요!!");
		}
	}
}
class Record{
	private String subject;
	private int point;
	public Record(String subject, int point) {
		this.subject = subject;
		this.point = point;
	}
	
	// toString()은 참조변수를 호출했을 때, 리턴할 내용을 기술
	// 객체의 참조 : 패키지명.클래스명@heap영역의 주소값
	
	@Override
	public String toString() {
		return "Record [과목=" + subject + ", 점수=" + point + "]";
	}
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}



// 자동차(차종,최고속도,배기량)
class Car{
	private String kind;
	private int maxSpeed;
	private int cc;
	public Car() {}
	public Car(String kind, int maxSpeed, int cc) {
		this.kind = kind;
		this.maxSpeed = maxSpeed;
		this.cc = cc;
	}
	public void showCarInfo() {
		System.out.println("차종:"+this.kind);
		System.out.println("최고속도:"+this.maxSpeed+"km/h");
		System.out.println("배기량:"+this.cc+"cc");
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getMaxSpeed() {
		return maxSpeed;
	}
	public void setMaxSpeed(int maxSpeed) {
		this.maxSpeed = maxSpeed;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	
}
// 자동차의소유주(이름,자동차, takeCar(자동차) driving() )
class CarOwner{
	private String name;
	private Car car;
	public CarOwner(String name) {
		this.name = name;
	}
	public void takeCar(Car car) {
		System.out.println("# 차를 타다 #");
		this.car = car;
	}
	public void driving() {
		System.out.println(this.name+" 차를 운행할려고 합니다.");
		if(this.car!=null) { // 객체가 할당되어 있을 때..
			System.out.println("차를 운행합니다!!");
			this.car.showCarInfo();
		}else {
			System.out.println("차가 없네요!!");
		}
	}
}



class Computer{
	// 인스턴스변수 : 객체별, 변경가능
	String kind;
	// final 변수 : 객체별, 객체단위로는 변경 불가
	final int cost;
	// static 변수 : 클래스 단위 변수설정, 클래스 단위로는 변경 가능
	static String comp;
	// static final 상수 : 클래스 단위로 상수설정, 변경 불가
	static final String NATION="KOR";
	public Computer(String kind, int cost) {
		this.kind = kind;
		this.cost = cost;
	}
	public void show() {
		System.out.println("#### 컴퓨터 정보 ####");
		System.out.println("컴퓨터종류(인스턴스):"+this.kind);
		System.out.println("구매비용(인스턴스단위상수):"+this.cost);
		System.out.println("제조사(static변수):"+comp);
		System.out.println("(클래스상수):made in "+NATION);
	}
}
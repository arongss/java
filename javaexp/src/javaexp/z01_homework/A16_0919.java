package javaexp.z01_homework;

public class A16_0919 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0919과제 - 신아령
[1단계:개념] 1. 사용자 정의 예외 클래스의 기본 형식과 Exception 클래스의 기본 생성자2개, 주요메서드2개를 기술하세요
		# 사용자 정의 예외
		1. 자바 표준 api에서 제공하지 않는 예외를 선언하여 사용
		2. 애플리케이션 서비스와 관련된 예외
		ex) 잔고 부족 예외, 계좌 이체 실패 예외, 회원 가입 실패 예외
		# 사용자 정의 예외 클래스 기본 형식
		public class XXXException extends [Exception|RuntimeException]{
			public XXXException(){}
			public XXXException(String message){
				super(message);
			}
		}
[1단계:코드] 2. User03Exception을 통해 생성자를 매개변수로 문자열을 넘기고, getMessage()를 재정의하여 [사용자정의]라는 문자열을
         포함하여, 이 사용자 정의 예외가 11~20 반복문에서 짝수일 때, 처리되게 하세요
		for(int cnt=11;cnt<=20;cnt++) {
			try {
				if(cnt%2==0) {
					throw new User03Exception(cnt+"짝수 예외 발생!");
				}
			}catch(User03Exception e) {
				System.out.println("# 예외 발생 #");
				System.out.println(e.getMessage());
			}
		}
	}
}
class User03Exception extends Exception{
	public User03Exception(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
	@Override
	public String getMessage() {
		// TODO Auto-generated method stub
		return "[사용자정의]"+super.getMessage();
	}
}
[1단계:개념] 3. Object클래스가 기본적으로 가지고 있는 메서드(equals(), toString(), hashCode())를 기술하세요.
		# equals() 
			- 재정의하여 논리적 동등 비교할 때 이용
		# toString()
		1. 클래스의 패키지와 클래스명 + 16진수 주소를 리턴
		2. 참조변수만 호출 했을 때, 나타나는 데이터와 동일하다.
		3. toString() 재정의하면 참조변수도 동일한 값으로 변경이 된다.
		# hashCode()
		1) 객체 해시코드란?
			- 객체 식별할 하나의 정수값
			- 객체의 메모리 번지 이용해 해시코드 만들어 리턴
			개별 객체는 해시코드가 모두 다른
		2) 논리적 동등 비교시 hashCode() 오버라이딩의 필요성
			컬렉션 프레임워크의 HashSet, HashMap,Hashtable과 같은 클래스는 두 객체가 동등한 객체인지 판단할 때 사용된다.
[1단계:코드] 4. 같은 클래스의 두개 객체의 속성값이 같으면 hashCode가 동일하게 처리할려고 한다.  Bus(번호,행선지)를 기준으로 처리하세요.
		Bus1 b1 = new Bus1(106,"마포구청");
		Bus1 b2 = new Bus1(106,"마포구청");
		System.out.println(b1.hashCode());
		System.out.println(b2.hashCode());
		System.out.println(b1.hashCode()==b2.hashCode());
	}
}
class Bus1{
	private int no;
	private String loc;
	public Bus1(int no, String loc) {
		this.no = no;
		this.loc = loc;
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		int hashCode = no + loc.hashCode();
		return hashCode;
	}
}
[1단계:코드] 5. 특정 프로그램의 실행 시간을 확인할려고 한다. 해당 코드의 메서드와 결과를 설명하세요.
		long start = System.currentTimeMillis();
		System.out.println("시작:"+start);
		long sum = 0;
		for(long cnt=1;cnt<(long)100000;cnt++) {
			sum+=cnt;
			System.out.println(cnt+":"+sum);
		}
		long end = System.currentTimeMillis();
		System.out.println("종료:"+end);
		long time = end-start;
		System.out.println("결과:"+sum);
		System.out.println(time);
		System.out.println(time/1000+"초");
		System.out.println(time/1000/60+"분");
		System.out.println(time/1000/60/60+"시");
[1단계:코드] 6. 문자열로 대문자/소문자/특수문자를 선언하고, 이 중에서 8자를 추출하여 비번호를 처리할려고 한다.
      charAt를 활용하여 처리하세요.
		String str = "ABCDEFGHIJabcdefghij~!@#$%^&*()";
      String pass = "";
      int size = str.length();
      for(int i=0;i<=7;i++) {
         int idx = (int)(Math.random()*size);
         pass += str.charAt(idx);
      }
      System.out.println(pass);
		 * */
		/*
[1단계:코드] 2. User03Exception을 통해 생성자를 매개변수로 문자열을 넘기고, getMessage()를 재정의하여 [사용자정의]라는 문자열을
         포함하여, 이 사용자 정의 예외가 11~20 반복문에서 짝수일 때, 처리되게 하세요
		for(int cnt=11;cnt<=20;cnt++) {
			try {
				if(cnt%2==0) {
					throw new User03Exception(cnt+"번 예외발생");
				}
			}catch(User03Exception e) {
				System.out.println("예외처리 block:"+e.getMessage());
			}finally {
				System.out.println("예외 처리(상관없이)");
			}
		}
	}
}
class User03Exception extends Exception{
	// 매개변수로 getMessage()를 통해서 나타나는 문자열 전달 가능하게 처리.
	public User03Exception(String message) {
		super(message);
	}
	@Override
	public String getMessage() {
		return "[재정의된 메서드]"+ super.getMessage();
	}
}
[1단계:코드] 5. 특정 프로그램의 실행 시간을 확인할려고 한다. 해당 코드의 메서드와 결과를 설명하세요.
	1) 시작시간을 check해서 가져오고
	2) 프로그램 수행
	3) 마지막시간을 check
	4) 시작시간과 마지막시간 차이 확인
		 * */
		long start = System.currentTimeMillis();
		long end = System.currentTimeMillis();
		long time = end -start;
		System.out.println("걸린 시간:"+(time/1000.0)+"초");
	}
}

/*
# 사용자 정의 클래스
1. extends Exception
2. 생성자 매개변수 처리
3. 재정의 메서드 선언.
4. 상황에 맞게 해당 객체 강제 예외 처리 throw new 사용자정의 예외클래스 생성자();
	try{
		throw new User03Exception("예외메시지내용");
	}catch(User03Exception e){
		System.out.println("예외 메시지:"+e.getMessage());
	}catch(Exception e){
		System.out.println("최상위 예외");
	}finally{
		System.out.println("예외 상관없이 처리할 내용");
	}
 * */

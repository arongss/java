package javaexp.z01_homework;

public class A09_0908 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		0908과제 - 신아령
[1단계:개념] 1. 메서드의 기본 구성요소들의 특징을 기본예제를 통해 기술하세요.
		3) 메서드 : 필드와 상호관계를 가지면서 기능을 처리해주는 함수
		- 매개변수(overloading)
		- 리턴유형
		- 프로세스 처리
		- 실제리턴값 처리
		- 위 구성요소의 혼합예제
[1단계:개념] 2. 생성자를 통한 필드값 저장과 메서드를 통한 필드값 저장의 차이점을 예제를 통해서 기술하세요.
		생성자 : 객체가 초기에 만들어질 때, 초기 속성을 설정
		메서드 : 외부에 데이터 받아서 저장기능, 외부로 기능을 나타내는 작용
[1단계:코드] 3. Counter 클래스를 만들고, 생성자를 통해 시작, 마지막변수를 입력하고,  메서드를 통해서 해담 범위 내용 출력하고, 누적합을 리턴 처리하게 하세요.
		Counter c1 = new Counter();
		int totAll = c1.totAll(1, 5);
		System.out.println("총계:"+totAll);
	}
}
class Counter{
	int totAll(int start, int end) {
		int tot=0;
		for(int cnt=start;cnt<=end;cnt++) {
			System.out.print(cnt+(cnt!=end?" + ":"\n"));
			tot += cnt;
		}
		return tot;
	}
}
[1단계:코드] 4. Car 클래스의 필드 차종,색상,현재속도를 선언하고, 이 중 생성자를 통한 초기값 설정과 메서드를 통한 설정을 분리하여
             생성자, 메서드(속도증가,속도감소,현재속도확인)를 구현하여 처리하세요.
		Car c1 = new Car();
		System.out.println("차종:"+c1.carName);
		System.out.println("색상:"+c1.color);
		System.out.println("현재속도:"+c1.speed);
		Car c2 = new Car();
		c2.speedUp(30);
		c2.speedUp(10);
		System.out.println("속도증가:"+c2.getSpeed1());
		Car c3 = new Car();
		c3.speedUp(10);
		System.out.println("속도감소:"+c3.getSpeed2());
	}
}
class Car{
	String carName;
	String color;
	int speed;
	Car(){
		this.carName = "볼보";
		this.color = "블랙";
		this.speed = 50;
	}
	void speedUp(int speeds){
		this.speed+=speeds; 
	}
	int getSpeed1(){
		return speed;
	}
	void speedDown(int speeds){
		this.speed-=speeds; 
	}
	int getSpeed2(){
		return speed;
	}
}
[1단계:코드] 5. 1차원 배열로 회원의 이름 5명을 선언하고 할당 출력하세요
              2차원 배열로 위 회원이름에 추가하여 나이와 사는 곳을 만들어 할당하고 출력하세요
		String[] names = {"홍길동","김길동","마길동","신길동","최길동"};
		String[][]mems = {
				{"21","서울"},
				{"30","대구"},
				{"28","부산"},
				{"24","대전"},
				{"25","인천"}
		};
		for(int idx=0;idx<names.length;idx++) {
			System.out.println("이름:"+names[idx]);
			for(int jdx=0;jdx<mems[idx].length;jdx++) {
				System.out.print(mems[idx][jdx]+", ");
			}
			System.out.println();
		}
[1단계:개념] 6. 패키지란 무엇이면, 외부패키지의 클래스를 객체로 사용할 때 전제조건과 방법 2가지를 기술하세요.
		패키지: 클래스를 기능별로 묶어서 그룹 이름을 붙여 놓은 것.
		1) 패키지명 포함된 전체 클래스 이름으로 사용
		2) import문으로 패키지를 지정하고 사용.
		 * */
	}

}


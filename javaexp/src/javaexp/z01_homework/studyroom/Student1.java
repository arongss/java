package javaexp.z01_homework.studyroom;

public class Student1 {
	private int myPoint=80;
	String studyName="우리는 자바스터디 모임";
	public String announce="스프링은 언제 배우나요?";
	public void student1Info() {
		Student1 st01 = new Student1();
		System.out.println("private:"+st01.myPoint);
		System.out.println("default:"+st01.studyName);
		System.out.println("public:"+st01.announce);
	}
}

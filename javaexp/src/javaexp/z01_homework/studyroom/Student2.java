package javaexp.z01_homework.studyroom;

import javaexp.z01_homework.playroom.Friend1;

public class Student2 {
	public void CallFriendInfo() {
		Friend1 f01 = new Friend1();
//		System.out.println("private:"+f01.myPriv);
//		System.out.println("default:"+f01.meetLoc);
		System.out.println("public:"+f01.outTName);
//		외부 패키지 소속 클래스는 public만 접근 가능
	}
	public void student1Info() {
		Student1 st01 = new Student1();
//		System.out.println("private:"+st01.myPoint);
		System.out.println("default:"+st01.studyName);
		System.out.println("public:"+st01.announce);
	}
}
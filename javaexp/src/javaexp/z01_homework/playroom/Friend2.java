package javaexp.z01_homework.playroom;

import javaexp.z01_homework.studyroom.Student1;

public class Friend2 {
	public void CallFriendInfo() {
		Friend1 f01 = new Friend1();
//		System.out.println("private:"+f01.myPriv);
//		private는 같은 패키지에서 접근 불가
		System.out.println("default:"+f01.meetLoc);
		System.out.println("public:"+f01.outTName);
	}
	public void student1Info() {
		Student1 st01 = new Student1();
//		System.out.println("private:"+st01.myPoint);
//		System.out.println("default:"+st01.studyName);
		System.out.println("public:"+st01.announce);
	}
}

package javaexp.z01_homework.playroom;

public class Friend1 {
	private String myPriv="친구1의 비밀";
	String meetLoc="친구들과 강남에서 모였다";
	public String outTName="우리는 고등학교 친구들이다";
	
	public void CallFriendInfo() {
		Friend1 f01 = new Friend1();
		System.out.println("private:"+f01.myPriv);
		System.out.println("default:"+f01.meetLoc);
		System.out.println("public:"+f01.outTName);
	}
}

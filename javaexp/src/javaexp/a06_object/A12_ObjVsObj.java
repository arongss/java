package javaexp.a06_object;

public class A12_ObjVsObj {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Student st1 = new Student("이철수");
		st1.showInfo();
		st1.setEleSchool(new ElementSch("홍대부속초등학교",2008));
		st1.showInfo();
	}

}
// ex1) 1:1관계연습  Student(이름,ElementSch),
//		ElementSch(학교명,졸업연도)
//		1) ElementSch - 필드와 기본 정보 출력
//		2) Student - 이름, ElementSch, 생성자, ElementSch추가메서드, 출력메서드
class ElementSch{
	private String sname;
	private int gradYear;
	public ElementSch(String sname, int gradYear) {
		this.sname = sname;
		this.gradYear = gradYear;
	}
	@Override
	public String toString() {
		return "초등학교 [학교명=" + sname + ", 졸업연도=" + gradYear + "년]";
	}
}
class Student{
	private String name;
	private ElementSch eleSchool;
	public Student(String name) {
		this.name = name;
	}
	public void setEleSchool(ElementSch eleSchool) {
		this.eleSchool = eleSchool;
	}
	public void showInfo() {
		System.out.println("## "+name+"의 초등학교 ##");
		if(this.eleSchool==null) {
			System.out.println("초등학교 정보가 없습니다.");
		}else {
			System.out.println(this.eleSchool);
		}
	}
}
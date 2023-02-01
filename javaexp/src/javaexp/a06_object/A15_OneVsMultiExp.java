package javaexp.a06_object;

import java.util.ArrayList;

public class A15_OneVsMultiExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SchClass sc = new SchClass("1~1");
		sc.addStudent(new SchStudent(0,"홍길동"));
		sc.addStudent(new SchStudent(0,"김길동"));
		sc.addStudent(new SchStudent(0,"신길동"));
		ArrayList<SchStudent> list = new ArrayList<SchStudent>();
		list.add(new SchStudent(0,"진길동"));
		list.add(new SchStudent(0,"박길동"));
		list.add(new SchStudent(0,"소길동"));
		sc.addStudentAll(list);
		sc.showAllList();
	}

}
// ex) SchClass(반/ArrayList<SchStudent>)
//		SchStudent(번호,이름) 1:다 관계를 설정하여 출력 처리하세요
class SchClass{
	private String cname;
	private ArrayList<SchStudent> slist;
	public SchClass(String cname) {
		this.cname = cname;
		this.slist = new ArrayList<SchStudent>();
	}
	public void addStudent(SchStudent st) {
		// 현재 데이터 크기에서 하나씩 증가 시켜 번호로 등록
		st.setNo(slist.size()+1);
		this.slist.add(st);
		System.out.println(st.getName()+" 등록!!");
		
	}
	public void addStudentAll(ArrayList<SchStudent> alist) {
//		this.slist.addAll(alist);
		for(SchStudent st:alist) {
			st.setNo(slist.size()+1);
			this.addStudent(st);// 기존에 선언한 기능 메서드 활용.
		}
		
		System.out.println(slist.size()+"명 등록!!");
	}
	public void showAllList() {
		System.out.println(cname+"반의 학생 리스트");
		if(this.slist.size()>0) {
			for(SchStudent ss:this.slist) {
				System.out.print(ss.getNo()+"\t");
				System.out.println(ss.getName());
			}
		}else {
			System.out.println("등록된 학생이 없습니다.");
		}
	}
}

class SchStudent{
	private int no;
	private String name;
	public SchStudent(int no, String name) {
		this.no = no;
		this.name = name;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
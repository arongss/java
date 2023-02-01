package jspexp.a01_mvc;

import java.util.List;

import jspexp.a13_database.A06_PareparedDao;
import jspexp.vo.Dept;

public class A10_DeptService {
	private A06_PareparedDao dao;
	public A10_DeptService(){
		dao = new A06_PareparedDao();
	}
	public List<Dept> getDeptList(Dept sch){
		// 알고리즘, 로직 처리... 초기값 설정
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		return dao.getDeptList(sch);
	}
}
